Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417A656AC42
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:55:12 +0200 (CEST)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Xah-0003Um-9i
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9XYK-0000lY-En
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9XYI-0002qX-Hb
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657223561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XAvuOlDGCv7fnvUGHe8dtUoV8Qn+IHLhvfAXUFZfdsU=;
 b=LQZO5Bk9OQsmQpe6BhYSx6fjd4i7sltl6EbxabA5feLmPdwNnDpwNkovWT6u+aeAta+jzt
 48esgJzdHQ0bSe+LNVjMWoyNoMURVhTWzAiugZaWAdJQ1UpqVGTxpuO5Sy00AwYdaJAj8r
 yudx0KgdMqqkLGutlVO7DnUoBe22IaY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-IGChKj7DOzuftjE5gkAB7A-1; Thu, 07 Jul 2022 15:52:40 -0400
X-MC-Unique: IGChKj7DOzuftjE5gkAB7A-1
Received: by mail-qk1-f197.google.com with SMTP id
 bp10-20020a05620a458a00b006b265587a17so17011403qkb.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 12:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XAvuOlDGCv7fnvUGHe8dtUoV8Qn+IHLhvfAXUFZfdsU=;
 b=osxwlqMDVe7LZf3H7hTr/m4E9Hxd09lkY2KL6sHDQTjr+iaeGg/SgTfn9TQRzadxFg
 Q4kgZt7I/YMtYa07KCtIdlX1YJqA9vt2icbEPYm8PGEu+WBg0NVHpaDSA/+g5rKmenb6
 C5R0kbbkKSLphqXsebilggsSt8wMSc/icSj5gvLxWSErBcfLcDxdTNscHkdR2lykU0/6
 o3LdIy8aa+ATKNnR9FgIaSYHBcimlFLzvt8bPMZBNiZsRxWUC8SKaVufsl5DVCPMHiSR
 RoTmNfcEVL6EBTTv01V+O+nmXT70ITvqFAipigXnt2t/meGqYEDsOcoDJhVdx1E1/W1K
 MQLw==
X-Gm-Message-State: AJIora8dIGFKySY/g9kIWYaj4fjSwN5t/+77xZuJ4OS6x8GXQAuHiLPO
 wJLgkdiUH7fo0WUBOwqgKHA9bj4KmNbqTB7US3boiWmEL/E9NWOVWCfsEpp8KH1Y2DxX559ONiZ
 pB4GBxIpdgaK8rls=
X-Received: by 2002:ad4:5e8b:0:b0:470:2e7f:ac1e with SMTP id
 jl11-20020ad45e8b000000b004702e7fac1emr41725145qvb.3.1657223560136; 
 Thu, 07 Jul 2022 12:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRS14B+Xt8pZpfy8rLsBOmUe4K1RjXoITog2NZ0EFQ1tIJ4SNgO9xdkSVJx0m9/qnHsuYjjw==
X-Received: by 2002:ad4:5e8b:0:b0:470:2e7f:ac1e with SMTP id
 jl11-20020ad45e8b000000b004702e7fac1emr41725133qvb.3.1657223559886; 
 Thu, 07 Jul 2022 12:52:39 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 bw20-20020a05622a099400b00304bc2acc25sm27006812qtb.6.2022.07.07.12.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:52:39 -0700 (PDT)
Date: Thu, 7 Jul 2022 15:52:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 1/3] QIOChannelSocket: Fix zero-copy flush returning
 code 1 when nothing sent
Message-ID: <Ysc5hpnTb3k96Ubo@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-2-leobras@redhat.com>
 <YsccDel9oiTPqvHW@xz-m1.local>
 <CAJ6HWG5YbABGpacT9hD1dx0-o3Ey8sN++=MxhEaGML62jzQ=xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG5YbABGpacT9hD1dx0-o3Ey8sN++=MxhEaGML62jzQ=xQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 07, 2022 at 04:44:21PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Peter,
> 
> On Thu, Jul 7, 2022 at 2:47 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > Hi, Leo,
> >
> > On Mon, Jul 04, 2022 at 05:23:13PM -0300, Leonardo Bras wrote:
> > > If flush is called when no buffer was sent with MSG_ZEROCOPY, it currently
> > > returns 1. This return code should be used only when Linux fails to use
> > > MSG_ZEROCOPY on a lot of sendmsg().
> > >
> > > Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
> > > was attempted.
> > >
> > > Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > ---
> > >  io/channel-socket.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > > index 4466bb1cd4..698c086b70 100644
> > > --- a/io/channel-socket.c
> > > +++ b/io/channel-socket.c
> > > @@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
> > >      struct cmsghdr *cm;
> > >      char control[CMSG_SPACE(sizeof(*serr))];
> > >      int received;
> > > -    int ret = 1;
> > > +    int ret;
> > > +
> > > +    if (!sioc->zero_copy_queued) {
> >
> > I think I asked this in the downstream review but didn't get a
> > response.. shouldn't this check be "queued == sent"?
> 
> This is just supposed to skip flush if nothing was queued for sending.
> queued == sent is tested bellow in the while part.
> 
> Without this, the function could return 1 if nothing was sent with zero-copy,
> and it would be confusing, because the QIOChannel API says 1 should be
> returned only if all zero-copy sends fell back to copying.

I know it won't happen in practise, but.. what if we call flush() without
sending anything zero-copy-wise at all (so zero_copy_sent > 0,
zero_copy_queued > 0, meanwhile zero_copy_sent == zero_copy_queued)?  Then
IIUC we'll return 1 even if we didn't do any fallback, or am I wrong?

> 
> Best regards,
> Leo
> 
> >
> > > +        return 0;
> > > +    }
> > >
> > >      msg.msg_control = control;
> > >      msg.msg_controllen = sizeof(control);
> > >      memset(control, 0, sizeof(control));
> > >
> > > +    ret = 1;
> > > +
> > >      while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
> > >          received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> > >          if (received < 0) {
> > > --
> > > 2.36.1
> > >
> >
> > --
> > Peter Xu
> >
> 

-- 
Peter Xu


