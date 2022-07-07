Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5B956AC14
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:48:48 +0200 (CEST)
Received: from localhost ([::1]:43134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9XUU-000240-So
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o9XQW-0008Ve-3f
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o9XQR-0004Wa-Pz
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657223074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARXkzrd3DHoGuyXE7d533Fpbk/omBor/EZGpu2PJJvA=;
 b=axDe8alTDzMNgs9zE5MbP1D98A6tbR0/QfXICS1dIGMHrwlH3sMkLiH3XdmDBer/Lcc0B1
 PWX35ayLlSI9Tf72e5tg4HkkiKhLFEiXf8fALtp++jzFA/oqwJZMMUwolgqHRVJVx6cUkT
 sZ0zY1ayZWjrzbDgQ6mFfnH3mYsBMoA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-IvXTYlYCOPSsn95XOSL4vQ-1; Thu, 07 Jul 2022 15:44:33 -0400
X-MC-Unique: IvXTYlYCOPSsn95XOSL4vQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 s1-20020a056402520100b00439658fad14so14826330edd.20
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 12:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ARXkzrd3DHoGuyXE7d533Fpbk/omBor/EZGpu2PJJvA=;
 b=6Oz9iVMOSnxu2DTYNXdLaG/DDwdg0Jg64Fklqy2XFM2fYmL+fQ3gFyl21PUsMvz2N4
 aWoMy3jeeky6yxWxtVeYL0aVBgnMQX+YPuO3LqP8SxggztUWn/JVsuDxwwSiynv4L7mL
 JUswFM2B8zULIdfniiPrlJiHOZkz7F8B1ab1ToU+9oMEEQoOPQa1K7P0BA7L/jndNyso
 x4yZJGmDGBSjkSY3wgaah9EJv/E9C+lJtbgP0jTwD6nDYqc4Y9P2iA9hbDbujWs21YYn
 R3kS6FLPAQejF9BCOSEMd7nnZF8us4dNzLoee9GSZtpsP1/66FOFOi+jWJJB0dS9K7If
 FxsA==
X-Gm-Message-State: AJIora+TyJf/fgRmfFradSYWlN4wd/8inbYeGS9e8I2SwQX+WzumW5kF
 MXnBqHSWajXzGVRGEJ2gOSQePT8gRBP1FKxJcSTeohRfjsbLIpLBJ/x271tF7tPYKbKgmQtUBe1
 xiRB+u3qa32OdUyTBemExy87b4nENovE=
X-Received: by 2002:a17:907:60c8:b0:726:d5c1:385c with SMTP id
 hv8-20020a17090760c800b00726d5c1385cmr44373457ejc.490.1657223072358; 
 Thu, 07 Jul 2022 12:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBkuHFRjGPUTi5OLlMR/bLsxpjw8vH5IkyMs53y0rIJLtBEPG621Hk2I0sYrZ/Stk6QQGMAGlTfkyMyp4R6nU=
X-Received: by 2002:a17:907:60c8:b0:726:d5c1:385c with SMTP id
 hv8-20020a17090760c800b00726d5c1385cmr44373437ejc.490.1657223072181; Thu, 07
 Jul 2022 12:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-2-leobras@redhat.com>
 <YsccDel9oiTPqvHW@xz-m1.local>
In-Reply-To: <YsccDel9oiTPqvHW@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 7 Jul 2022 16:44:21 -0300
Message-ID: <CAJ6HWG5YbABGpacT9hD1dx0-o3Ey8sN++=MxhEaGML62jzQ=xQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] QIOChannelSocket: Fix zero-copy flush returning
 code 1 when nothing sent
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Thu, Jul 7, 2022 at 2:47 PM Peter Xu <peterx@redhat.com> wrote:
>
> Hi, Leo,
>
> On Mon, Jul 04, 2022 at 05:23:13PM -0300, Leonardo Bras wrote:
> > If flush is called when no buffer was sent with MSG_ZEROCOPY, it currently
> > returns 1. This return code should be used only when Linux fails to use
> > MSG_ZEROCOPY on a lot of sendmsg().
> >
> > Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
> > was attempted.
> >
> > Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  io/channel-socket.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > index 4466bb1cd4..698c086b70 100644
> > --- a/io/channel-socket.c
> > +++ b/io/channel-socket.c
> > @@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
> >      struct cmsghdr *cm;
> >      char control[CMSG_SPACE(sizeof(*serr))];
> >      int received;
> > -    int ret = 1;
> > +    int ret;
> > +
> > +    if (!sioc->zero_copy_queued) {
>
> I think I asked this in the downstream review but didn't get a
> response.. shouldn't this check be "queued == sent"?

This is just supposed to skip flush if nothing was queued for sending.
queued == sent is tested bellow in the while part.

Without this, the function could return 1 if nothing was sent with zero-copy,
and it would be confusing, because the QIOChannel API says 1 should be
returned only if all zero-copy sends fell back to copying.

Best regards,
Leo

>
> > +        return 0;
> > +    }
> >
> >      msg.msg_control = control;
> >      msg.msg_controllen = sizeof(control);
> >      memset(control, 0, sizeof(control));
> >
> > +    ret = 1;
> > +
> >      while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
> >          received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> >          if (received < 0) {
> > --
> > 2.36.1
> >
>
> --
> Peter Xu
>


