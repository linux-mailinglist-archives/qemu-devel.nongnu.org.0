Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD965A7EB4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:26:42 +0200 (CEST)
Received: from localhost ([::1]:48002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNjt-0004VW-Bu
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oTNdO-0007vB-9Y
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oTNdM-00063m-Hc
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661951995;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcoR1v2Oy0G6BAz+VU013GPCqkYcQG9ELM6miiMGjoE=;
 b=h480aBQrOY96HtBBXj9C6lwgWWkvEChvZ5cW5Y4b0OiLwEM5Ws5ESJ/+upUORrJEZFJiOS
 +w+SgJJ5nWbknxwXM/fN8uYpd/x+fd3VWxsEtNI3ifB9teoIi58AtG8++iPJCOL66253sB
 4V8qxTYM5Vo2r4R1H3GcUYQVcaJY/C4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-f5ib_zRVNr-NvTq4P5nA9Q-1; Wed, 31 Aug 2022 09:19:50 -0400
X-MC-Unique: f5ib_zRVNr-NvTq4P5nA9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 256A1296A608;
 Wed, 31 Aug 2022 13:19:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64DF91121314;
 Wed, 31 Aug 2022 13:19:48 +0000 (UTC)
Date: Wed, 31 Aug 2022 14:19:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH 03/51] block: Unify the get_tmp_filename() implementation
Message-ID: <Yw9f8bjPrfg5OI6r@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-4-bmeng.cn@gmail.com>
 <CAJ+F1CJAb-jz8=4hwDhpUQbbtXj_SoW44TwOmuH8MQWagbrD5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CJAb-jz8=4hwDhpUQbbtXj_SoW44TwOmuH8MQWagbrD5Q@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 31, 2022 at 04:54:41PM +0400, Marc-André Lureau wrote:
> Hi Bin
> 
> On Wed, Aug 24, 2022 at 1:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present get_tmp_filename() has platform specific implementations
> > to get the directory to use for temporary files. Switch over to use
> > g_get_tmp_dir() which works on all supported platforms.
> >
> >
> It "works" quite differently though. Is this patch really necessary here?
> 
> If yes, please explain why.
> 
> If not, I suggest you drop optional / rfc / "nice to have" patches from the
> series. It will help to get it merged faster.
> 
> thanks
> 
> 
> 
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  block.c | 16 ++--------------
> >  1 file changed, 2 insertions(+), 14 deletions(-)
> >
> > diff --git a/block.c b/block.c
> > index bc85f46eed..d06df47f72 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -864,21 +864,10 @@ int bdrv_probe_geometry(BlockDriverState *bs,
> > HDGeometry *geo)
> >   */
> >  int get_tmp_filename(char *filename, int size)
> >  {
> > -#ifdef _WIN32
> > -    char temp_dir[MAX_PATH];
> > -    /* GetTempFileName requires that its output buffer (4th param)
> > -       have length MAX_PATH or greater.  */
> > -    assert(size >= MAX_PATH);
> > -    return (GetTempPath(MAX_PATH, temp_dir)
> > -            && GetTempFileName(temp_dir, "qem", 0, filename)
> > -            ? 0 : -GetLastError());
> > -#else
> >      int fd;
> >      const char *tmpdir;
> > -    tmpdir = getenv("TMPDIR");
> > -    if (!tmpdir) {
> > -        tmpdir = "/var/tmp";
> > -    }
> > +    tmpdir = g_get_tmp_dir();
> > +
> >      if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
> >          return -EOVERFLOW;
> >      }

I know this is pre-existing, but this use of snprintf is really
undesirable and should be culled while we're touching this code.

There are only two callers of get_tmp_filename and they're
inconsistent too

One does

    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
    char *tmp_filename = g_malloc0(PATH_MAX + 1);
    ...
    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);

while the other does

    s->qcow_filename = g_malloc(PATH_MAX);
    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);

either the comment is wrong and adding "+1" to PATH_MAX is not
required, or the second caller is wrong on Windows. This may even
be totally irrelevant with the switch to g_get_tmp_dir. Whatever
the answer is, at least 1 of the callers needs updating.

It would be way better if the method signature was

  char *get_tmp_filename(void);

and we uses g_strdup_printf() instead of snprintf so the corret
size is allocated right away, removing the question about whether
we need PATH_MAX or PATH_MAX + 1 entirely.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


