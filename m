Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08354634C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 12:14:21 +0200 (CEST)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzbem-0005IJ-2v
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 06:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzZxK-0008UW-QN
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 04:25:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzZxE-0001tV-EG
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 04:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654849509;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FK/Y69FYLB5T9GFrAukMm65/u8QkhNrNQRN/YJxj8U=;
 b=ft9AXCwGnvTbYaXP5j7x2xsJCEvbNf4Mmyp/YXRXdqiTKmJO1wDskk2XQLlYHiV+LdYags
 ZFpd7kClgy6vEWKVV+5F5oYnD3vLljmIDHU7G90zscM6GrBiuTPgUHDx/hDwWWxR0EuRyy
 mPifocQpOrIbW1Scs4dMNH735wPinac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-xIX9f7AaMvan57-lRtmGww-1; Fri, 10 Jun 2022 04:25:06 -0400
X-MC-Unique: xIX9f7AaMvan57-lRtmGww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 101C8101E988;
 Fri, 10 Jun 2022 08:25:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 106E62166B26;
 Fri, 10 Jun 2022 08:25:04 +0000 (UTC)
Date: Fri, 10 Jun 2022 09:25:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 1/2] QIOChannelSocket: Reduce ifdefs to improve
 readability
Message-ID: <YqL/3VTze/b9DKUL@redhat.com>
References: <20220608210403.84006-1-leobras@redhat.com>
 <YqGq0Bw7V26vaNoI@redhat.com>
 <CAJ6HWG41=Wwf5gMY=Q0G2VCKfdNsyDRGDXELwvgRBjXMNB9GKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ6HWG41=Wwf5gMY=Q0G2VCKfdNsyDRGDXELwvgRBjXMNB9GKw@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09, 2022 at 10:30:19PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel,
> 
> On Thu, Jun 9, 2022 at 5:10 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Jun 08, 2022 at 06:04:02PM -0300, Leonardo Bras wrote:
> > > During implementation of MSG_ZEROCOPY feature, a lot of #ifdefs were
> > > introduced, particularly at qio_channel_socket_writev().
> > >
> > > Rewrite some of those changes so it's easier to read.
> > >                                                                       ...
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > ---
> > >  io/channel-socket.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > > index dc9c165de1..ef7c7cfbac 100644
> > > --- a/io/channel-socket.c
> > > +++ b/io/channel-socket.c
> > > @@ -554,6 +554,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >      size_t fdsize = sizeof(int) * nfds;
> > >      struct cmsghdr *cmsg;
> > >      int sflags = 0;
> > > +    bool zero_copy_enabled = false;
> > >
> > >      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> > >
> > > @@ -581,6 +582,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >  #ifdef QEMU_MSG_ZEROCOPY
> > >      if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > >          sflags = MSG_ZEROCOPY;
> > > +        zero_copy_enabled = true;
> > >      }
> >
> > There should be a
> >
> >  #else
> >     error_setg(errp, "Zero copy not supported on this platform");
> >     return -1;
> >  #endif
> >
> 
> IIUC, if done as suggested, it will break every non-zero-copy call of
> qio_channel_socket_writev();
> 
> I think you are suggesting something like :
> 
>     if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> #ifdef QEMU_MSG_ZEROCOPY
>         sflags = MSG_ZEROCOPY;
>         zero_copy_enabled = true; // I know you suggested this out,
> just for example purposes
> #else
>         error_setg(errp, "Zero copy not supported on this platform");
>         return -1;
> #endif
>     }

Yes, that is what I mean.

> 
> Which is supposed to fail if QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is specified, but
> qemu does not support it at compile time.

Correct, the caller should have checked the ZERO_COPY feeature
when they first opened the channel, and if they none the less
pass ZERO_COPY when it isn't supported that is a programmer
error that needs reporting.

> If I get the part above correctly, it would not be necessary, as
> qio_channel_socket_writev() is
> called only by qio_channel_writev_full(), which tests:
> 
>     if ((flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) &&
>         !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
>         error_setg_errno(errp, EINVAL,
>                          "Requested Zero Copy feature is not available");
>         return -1;
>     }

Ok, so if it is checked earlier then we merely need an assert.

     if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
 #ifdef QEMU_MSG_ZEROCOPY
         sflags = MSG_ZEROCOPY;
         zero_copy_enabled = true;
 #else
         g_assert_unreachable();
 #endif
>     }



> > > @@ -592,15 +594,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >              return QIO_CHANNEL_ERR_BLOCK;
> > >          case EINTR:
> > >              goto retry;
> > > -#ifdef QEMU_MSG_ZEROCOPY
> > >          case ENOBUFS:
> > > -            if (sflags & MSG_ZEROCOPY) {
> > > +            if (zero_copy_enabled) {
> >
> > if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY)
> >
> > avoids the #ifdef without needing to add yet another
> > variable expressing what's already expressed in both
> > 'flags' and 'sflags'.
> 
> Yes, it does, but at the cost of not compiling-out the zero-copy part
> when it's not supported,
> since the QIO_CHANNEL_WRITE_FLAG_ZERO_COPY comes as a parameter. This ends up
> meaning there will be at least one extra test for every time this
> function is called (the one in the next patch).

The cost of a simple bit test is between negligible-and-non-existant
with branch prediction. I doubt it would be possible to even measure
it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


