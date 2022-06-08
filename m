Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85770543DCC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 22:50:45 +0200 (CEST)
Received: from localhost ([::1]:44266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2dY-00081Y-1n
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 16:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nz2bm-0007C0-GQ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nz2bj-0001tY-6s
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654721330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VoykUVyassFujcqErgh6J1fUij4lLHn00ERUIzuvA3Y=;
 b=EC84RYF8QZGMSXlVgCh0vziJrqG9ZWBEVkMGtqBIk5eCHMBClvoS4vKkqZ2yUCbQB2mEZs
 AmPKqYu7EMTHBE1eMBuZLdMOUEuO3bwi2h+OHVvYVMCnBbBALVUHWCu86sbomClOQIoxKT
 pt+osxRvvytHBkOMNa+bXxswVQv/nZI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-92r2lDgXNwa0GFCg9YO0TA-1; Wed, 08 Jun 2022 16:48:48 -0400
X-MC-Unique: 92r2lDgXNwa0GFCg9YO0TA-1
Received: by mail-ej1-f69.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so9990489eje.23
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 13:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VoykUVyassFujcqErgh6J1fUij4lLHn00ERUIzuvA3Y=;
 b=M4/gxPX5j0gQlpUUjDNCYZeI5zCf58W0zi+kCloTbuT4mLJm7VNTaPVaBJrLtEK5+p
 fqbItY1RsGYgRo+oqy0A8aozp6jKhKwQG2S+3oq1lGmxruUIHuV+kh/KiZnctLqIISm1
 G117sxme9aKljPtKfdDu6H++IT1F2ctDiAlZpbvlUy7vyhC0HcNutrJyMCoiN2eLeAC1
 gBN/QSQHEcJk247xYq08hLSSj8aHrs8630TYYXs/w23gw7ndhxp3t4YnREXnqhw31e6R
 1ORtedMgXM6LtaT0h4WPXimBQzkPwC3qfzFk0o248oXy+SCkpiPXNkeG1RAvvSS1Xgfj
 rdOw==
X-Gm-Message-State: AOAM530UNrzAmfSB9BqnPCEvwyisvdUX6t5JGbQOqzXLQQs6RKgmNiEn
 B/iiRC93W7T11G6DcYfQaipIaHiNBfCvFD42TsU9gi0TjGfN5bR1uTckPWgc/49fHgTBWlVDeeS
 2Gy0bjfN6dT83kba/jzvYJvRfANyDWSM=
X-Received: by 2002:aa7:d895:0:b0:42e:985:40f7 with SMTP id
 u21-20020aa7d895000000b0042e098540f7mr40803111edq.351.1654721327703; 
 Wed, 08 Jun 2022 13:48:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBaeDXjBK6Vv+DfknDPJQH3+wi6GvtTik1ez+F3leAnmXkqgZ5B5rW/hGPlEU0TwuhRykTm1hMxo5z1qkErj0=
X-Received: by 2002:aa7:d895:0:b0:42e:985:40f7 with SMTP id
 u21-20020aa7d895000000b0042e098540f7mr40803094edq.351.1654721327430; Wed, 08
 Jun 2022 13:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220608181808.79364-1-leobras@redhat.com>
 <YqDuk+ZCwMdXRXBH@redhat.com>
In-Reply-To: <YqDuk+ZCwMdXRXBH@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 8 Jun 2022 17:48:36 -0300
Message-ID: <CAJ6HWG5Cb934xeDkkAx8wQG3vp4wz9gcCSjiPU=McfxpfzZzFw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] QIOChannelSocket: Fix zero-copy send so socket
 flush works
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, 
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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

Hello Daniel,

On Wed, Jun 8, 2022 at 3:46 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Wed, Jun 08, 2022 at 03:18:09PM -0300, Leonardo Bras wrote:
> > Somewhere between v6 and v7 the of the zero-copy-send patchset a crucia=
l
> > part of the flushing mechanism got missing: incrementing zero_copy_queu=
ed.
> >
> > Without that, the flushing interface becomes a no-op, and there is no
> > garantee the buffer is really sent.
> >
> > This can go as bad as causing a corruption in RAM during migration.
> >
> > Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy f=
lag & io_flush for CONFIG_LINUX")
> > Reported-by: =E5=BE=90=E9=97=AF <xuchuangxclwt@bytedance.com>
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  io/channel-socket.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > index dc9c165de1..ca4cae930f 100644
> > --- a/io/channel-socket.c
> > +++ b/io/channel-socket.c
> > @@ -554,6 +554,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel=
 *ioc,
> >      size_t fdsize =3D sizeof(int) * nfds;
> >      struct cmsghdr *cmsg;
> >      int sflags =3D 0;
> > +    bool zero_copy_enabled =3D false;
> >
> >      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> >
> > @@ -581,6 +582,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel=
 *ioc,
> >  #ifdef QEMU_MSG_ZEROCOPY
> >      if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> >          sflags =3D MSG_ZEROCOPY;
> > +        zero_copy_enabled =3D true;
> >      }
> >  #endif
> >
> > @@ -592,21 +594,24 @@ static ssize_t qio_channel_socket_writev(QIOChann=
el *ioc,
> >              return QIO_CHANNEL_ERR_BLOCK;
> >          case EINTR:
> >              goto retry;
> > -#ifdef QEMU_MSG_ZEROCOPY
>
> Removing this ifdef appears incidental to the change. If this is
> redundant just remove it in its own patch.

The idea is to reduce the amount of #ifdefs as Peter suggested,
because adding another ifdef here
would introduce extra noise. But sure, I see no problem adding this
change as a previous patch.

>
> >          case ENOBUFS:
> > -            if (sflags & MSG_ZEROCOPY) {
> > +            if (zero_copy_enabled) {
> >                  error_setg_errno(errp, errno,
> >                                   "Process can't lock enough memory for=
 using MSG_ZEROCOPY");
> >                  return -1;
> >              }
> >              break;
> > -#endif
> >          }
> >
> >          error_setg_errno(errp, errno,
> >                           "Unable to write to socket");
> >          return -1;
> >      }
> > +
> > +    if (zero_copy_enabled) {
>
> What's wrong with
>
>    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
>         sioc->zero_copy_queued++;
>     }

There is nothing wrong with it, but using zero_copy_enabled as
presented here will
compile-out this 'if()'  block if the user does not support MSG_ZEROCOPY.

Best regards,
Leo

>
>
> Introducing another local variable doesn't really add value IMHO.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


