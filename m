Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A9518347
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 13:28:20 +0200 (CEST)
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlqhW-0000lo-Vu
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 07:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlqcY-0005S6-4L
 for qemu-devel@nongnu.org; Tue, 03 May 2022 07:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlqcU-0007K0-56
 for qemu-devel@nongnu.org; Tue, 03 May 2022 07:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651576981;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhgYKrpHnswEtRylZ43cQVnfSuaVLrgIwXNmgCnKWnU=;
 b=NDpkKbpcKDpkqGNE2wv9fOGqJyiFQsdSgz9upRchSDUyVQ5PzyuRaMWn99nFJRMBlATood
 eiyvMW6YXW3uOLw9c29iocQOEPdWk4asYRM7ss6oKXtC/bk3Lcoihks7tJr9GIzIqo81nN
 zO599J1z6DsxpGIohwV74AXVGSLdUg0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-U41aPUM1PJut_ttrSrSnYg-1; Tue, 03 May 2022 07:22:58 -0400
X-MC-Unique: U41aPUM1PJut_ttrSrSnYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49F383C025AC;
 Tue,  3 May 2022 11:22:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7866940CFD19;
 Tue,  3 May 2022 11:22:57 +0000 (UTC)
Date: Tue, 3 May 2022 12:22:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 12/26] qga: replace pipe() with
 g_unix_open_pipe(CLOEXEC)
Message-ID: <YnEQhSZeVsAVuR4R@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-13-marcandre.lureau@redhat.com>
 <50b57e00-b805-5868-1dff-f4ed67a77a03@linaro.org>
 <CAJ+F1CLE9GKZ5of1xVTGs3Khf6KSC+--FB9Z4-JWuVEVYZqDCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CLE9GKZ5of1xVTGs3Khf6KSC+--FB9Z4-JWuVEVYZqDCg@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 27, 2022 at 12:24:44PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Apr 27, 2022 at 5:08 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
> 
> > On 4/26/22 02:27, marcandre.lureau@redhat.com wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >   qga/commands-posix.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > > index 77f4672ca2c9..094487c2c395 100644
> > > --- a/qga/commands-posix.c
> > > +++ b/qga/commands-posix.c
> > > @@ -2529,7 +2529,7 @@ void qmp_guest_set_user_password(const char
> > *username,
> > >           goto out;
> > >       }
> > >
> > > -    if (pipe(datafd) < 0) {
> > > +    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
> > >           error_setg(errp, "cannot create pipe FDs");
> > >           goto out;
> > >       }
> >
> > This looks wrong, since the next thing that happens is fork+execl.
> >
> >
> Before exec(), it does
>         close(datafd[1]);
>         dup2(datafd[0], 0);
> 
> 0, the newfd, does not share file descriptor flags (the close-on-exec flag).
> 
> I did a quick test, and it seems to be fine.

The 'dup' man page says

       The  two  file  descriptors do not share file descriptor flags
       (the close-on-exec flag).  The close-on-exec flag (FD_CLOEXEC;
       see fcntl(2)) for the duplicate descriptor is off.

so we're fine in this respect. You could need to use dup3 to explicitly
turn on FD_CLOEXEC on the duplicate, so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


