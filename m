Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FEE5EBB7A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:31:11 +0200 (CEST)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od53d-00044o-Vn
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od4wx-0006i1-0N
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:24:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od4wt-0000O2-Kj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664263449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gEnphimraGKq4qrYyzJWSgefRNBMafRUGtj51WSKjoc=;
 b=T26D4LqbFDkOYAC8RARGJemcHuJp1dCi97ArtMMJeRnc+MsytEQwT5Jloc7eJyeiaseI7r
 ApzaNSMTU+DoqHtFm8Ytdf7mJERMMmVf+n7SSnN95G3KSgGz78C0Czdj/CwDZHYhF3LsxR
 EC+xr/7PhcR0AIY1kaoRJwnSxYkYhb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-znvjWaTbNmmBafgPY_FOAw-1; Tue, 27 Sep 2022 03:24:05 -0400
X-MC-Unique: znvjWaTbNmmBafgPY_FOAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D092101A528;
 Tue, 27 Sep 2022 07:24:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8E612166B26;
 Tue, 27 Sep 2022 07:24:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7F0AB21E691D; Tue, 27 Sep 2022 09:24:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Bin Meng <bin.meng@windriver.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  Qemu-block
 <qemu-block@nongnu.org>,  "qemu-devel@nongnu.org Developers"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] block: Refactor get_tmp_filename()
References: <20220924114544.1906498-1-bmeng.cn@gmail.com>
 <87edvya1ez.fsf@pond.sub.org>
 <CAEUhbmX61MEXRv0XMXAVnuuVmq841i1_z2U5bR8hS39-cS7cKg@mail.gmail.com>
 <87o7v1mj4p.fsf@pond.sub.org>
 <CAEUhbmWk64pyujUDGFCJ=5MqwWSWy4XNb=M7QB5L1FiKHb2Q=g@mail.gmail.com>
Date: Tue, 27 Sep 2022 09:24:03 +0200
In-Reply-To: <CAEUhbmWk64pyujUDGFCJ=5MqwWSWy4XNb=M7QB5L1FiKHb2Q=g@mail.gmail.com>
 (Bin Meng's message of "Tue, 27 Sep 2022 14:29:55 +0800")
Message-ID: <87edvxmga4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin Meng <bmeng.cn@gmail.com> writes:

> Hi Markus,
>
> On Tue, Sep 27, 2022 at 2:22 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Bin Meng <bmeng.cn@gmail.com> writes:
>>
>> > On Mon, Sep 26, 2022 at 6:13 PM Markus Armbruster <armbru@redhat.com> wrote:
>> >>
>> >> Bin Meng <bmeng.cn@gmail.com> writes:
>> >>
>> >> > From: Bin Meng <bin.meng@windriver.com>
>> >> >
>> >> > At present there are two callers of get_tmp_filename() and they are
>> >> > inconsistent.
>> >> >
>> >> > One does:
>> >> >
>> >> >     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
>> >> >     char *tmp_filename = g_malloc0(PATH_MAX + 1);
>> >> >     ...
>> >> >     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
>> >> >
>> >> > while the other does:
>> >> >
>> >> >     s->qcow_filename = g_malloc(PATH_MAX);
>> >> >     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
>> >> >
>> >> > As we can see different 'size' arguments are passed. There are also
>> >> > platform specific implementations inside the function, and this use
>> >> > of snprintf is really undesirable.
>> >> >
>> >> > Refactor this routine by changing its signature to:
>> >> >
>> >> >     char *get_tmp_filename(void)
>> >> >
>> >> > and use g_file_open_tmp() for a consistent implementation.
>> >> >
>> >> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> >> > ---
>> >> >
>> >> > Changes in v2:
>> >> > - Use g_autofree and g_steal_pointer
>> >> >
>> >> >  include/block/block_int-common.h |  2 +-
>> >> >  block.c                          | 42 ++++++++++----------------------
>> >> >  block/vvfat.c                    |  8 +++---
>> >> >  3 files changed, 18 insertions(+), 34 deletions(-)
>> >> >
>> >> > diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
>> >> > index 8947abab76..ea69a9349c 100644
>> >> > --- a/include/block/block_int-common.h
>> >> > +++ b/include/block/block_int-common.h
>> >> > @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
>> >> >  }
>> >> >
>> >> >  int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
>> >> > -int get_tmp_filename(char *filename, int size);
>> >> > +char *get_tmp_filename(void);
>> >> >  void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
>> >> >                                        QDict *options);
>> >> >
>> >> > diff --git a/block.c b/block.c
>> >> > index bc85f46eed..4e7a795566 100644
>> >> > --- a/block.c
>> >> > +++ b/block.c
>> >> > @@ -860,38 +860,23 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
>> >> >
>> >> >  /*
>> >> >   * Create a uniquely-named empty temporary file.
>> >> > - * Return 0 upon success, otherwise a negative errno value.
>> >> > + * Return the actual name used upon success, otherwise NULL.
>> >> > + * The called function is responsible for freeing it.
>> >> >   */
>> >> > -int get_tmp_filename(char *filename, int size)
>> >> > +char *get_tmp_filename(void)
>> >> >  {
>> >> > -#ifdef _WIN32
>> >> > -    char temp_dir[MAX_PATH];
>> >> > -    /* GetTempFileName requires that its output buffer (4th param)
>> >> > -       have length MAX_PATH or greater.  */
>> >> > -    assert(size >= MAX_PATH);
>> >> > -    return (GetTempPath(MAX_PATH, temp_dir)
>> >> > -            && GetTempFileName(temp_dir, "qem", 0, filename)
>> >> > -            ? 0 : -GetLastError());
>> >> > -#else
>> >> > +    g_autofree char *filename = NULL;
>> >> >      int fd;
>> >> > -    const char *tmpdir;
>> >> > -    tmpdir = getenv("TMPDIR");
>> >> > -    if (!tmpdir) {
>> >> > -        tmpdir = "/var/tmp";
>> >> > -    }
>> >> > -    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
>> >> > -        return -EOVERFLOW;
>> >> > -    }
>> >> > -    fd = mkstemp(filename);
>> >> > +
>> >> > +    fd = g_file_open_tmp("vl.XXXXXX", &filename, NULL);
>> >> >      if (fd < 0) {
>> >> > -        return -errno;
>> >> > +        return NULL;
>> >> >      }
>> >> >      if (close(fd) != 0) {
>> >> >          unlink(filename);
>> >> > -        return -errno;
>> >> > +        return NULL;
>> >> >      }
>> >> > -    return 0;
>> >> > -#endif
>> >> > +    return g_steal_pointer(&filename);
>> >> >  }
>> >>
>> >> Oh my, what a lovely mess you're messing with!
>> >>
>> >> The function creates a temporary *file*, not just a filename.  Makes
>> >> sense, as creating a unique filename is inherently racy.  The contract
>> >> is clear enough ("Create a uniquely-named empty temporary file"), but
>> >> the function name is actively misleading.
>> >
>> > Agreed that the name is misleading.
>>
>> Care to fix that?
>
> How about create_tmp_file()?

Works for me!

[...]


