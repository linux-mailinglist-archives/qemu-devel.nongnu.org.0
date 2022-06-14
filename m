Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973054B650
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:35:57 +0200 (CEST)
Received: from localhost ([::1]:42550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19WG-0007uE-8p
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o19JD-0007UB-Q9
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:22:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o19JA-00076z-HE
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655223743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh3kjymOtjrYWipkOy6nzBXH8AzwbA4DM37Cw5cf0yw=;
 b=DkcNPAgWQQG8N7wMACrlXhnf2HT9zZDGKyfqE0epdHzhELXvC5yG+TR+jnMK/H4oRh5EnH
 ZJbq9CXk4PAoZRWJU4vF747GOjFr01P420Un4tu2qC7WFOoor1pW3NZM/uOuJpHgwRjkWy
 lPS41KfhbhPbD4N8vR4Du6JUJK21KEA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-N0BgIl8MN7OSl_0YSOOZOQ-1; Tue, 14 Jun 2022 12:22:21 -0400
X-MC-Unique: N0BgIl8MN7OSl_0YSOOZOQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m5-20020a056402430500b004319d8ba8afso6556771edc.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 09:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nh3kjymOtjrYWipkOy6nzBXH8AzwbA4DM37Cw5cf0yw=;
 b=zarZt2x+/KGtMCj/EFG9zq53no7WqeZ6SWfEIma8Y1otUaqPQFI2tRBklNDYLtcHtt
 p39OLvJfaZPZpL7bql4zDHwFx4acPyJssGfDzDRrngc3Z5DiL90KifxUPU5ImOn4Nv1s
 i1QY/1xIGPijp3OgRuvf8eae20+/cUrtmAJeDP3rLB1wRrNdF+6AmzJfMePc67qSKsuG
 eYv1S8aNc/fbf3gAS++LTi0d0FipiQGQuXlrHEtdz1YTdyEziJ5anZfmQVPKEoQn5tWF
 o15QFmmZ+4ucJE2hl/2Oci30L7PTpYrr9pjLB0wYZj95uX+eYoehiE2thvyr5VollQHS
 SGhg==
X-Gm-Message-State: AOAM531CoPmM5Kvpq+y1Jx64weJvJAZY7SdWnhAR8LATV+jTtax4Q5JG
 2MsFlaZiI4TUCtcn8mu4fOQ5K5lV5dSTS+gLPZejbTnl5axlt6jfSIERG8OvsG3ZoPWn+DGgYRk
 lYPZIvNu327+WCXW+mn9nqIb1dGBxo0c=
X-Received: by 2002:a05:6402:11d2:b0:42d:e68a:eae0 with SMTP id
 j18-20020a05640211d200b0042de68aeae0mr6972363edw.111.1655223740548; 
 Tue, 14 Jun 2022 09:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKOPifKpRlvzxNLdgmAGMKbShmAnrnqLCme8a4WWco7b0vGd2IVt2ayNXSxx6Pg4ksD9Npfdt6zgWCbzwqaVs=
X-Received: by 2002:a05:6402:11d2:b0:42d:e68a:eae0 with SMTP id
 j18-20020a05640211d200b0042de68aeae0mr6972337edw.111.1655223740320; Tue, 14
 Jun 2022 09:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220608210403.84006-1-leobras@redhat.com>
 <YqGq0Bw7V26vaNoI@redhat.com>
 <CAJ6HWG41=Wwf5gMY=Q0G2VCKfdNsyDRGDXELwvgRBjXMNB9GKw@mail.gmail.com>
 <YqL/3VTze/b9DKUL@redhat.com>
 <CAJ6HWG5kCiprhCB6578ZibRSWW9ie5kBhbh7DFW-=K1sEnSHWg@mail.gmail.com>
 <YqhIofy4h0hfHPPx@redhat.com>
In-Reply-To: <YqhIofy4h0hfHPPx@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 14 Jun 2022 13:22:10 -0300
Message-ID: <CAJ6HWG7rM7fC6uVTeUKDFGtwbSXYVGo4wwH-E9UgW6YSjS7O4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] QIOChannelSocket: Reduce ifdefs to improve
 readability
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, 
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
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

On Tue, Jun 14, 2022 at 5:36 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jun 13, 2022 at 06:21:18PM -0300, Leonardo Bras Soares Passos wro=
te:
> > On Fri, Jun 10, 2022 at 5:25 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> >
> > [...]
> >
> > > Ok, so if it is checked earlier then we merely need an assert.
> > >
> > >      if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > >  #ifdef QEMU_MSG_ZEROCOPY
> > >          sflags =3D MSG_ZEROCOPY;
> > >          zero_copy_enabled =3D true;
> > >  #else
> > >          g_assert_unreachable();
> > >  #endif
> > > >     }
> >
> > Ok, I will add that in the next version.
> >
> > >
> > >
> > >
> > > > > > @@ -592,15 +594,13 @@ static ssize_t qio_channel_socket_writev(=
QIOChannel *ioc,
> > > > > >              return QIO_CHANNEL_ERR_BLOCK;
> > > > > >          case EINTR:
> > > > > >              goto retry;
> > > > > > -#ifdef QEMU_MSG_ZEROCOPY
> > > > > >          case ENOBUFS:
> > > > > > -            if (sflags & MSG_ZEROCOPY) {
> > > > > > +            if (zero_copy_enabled) {
> > > > >
> > > > > if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY)
> > > > >
> > > > > avoids the #ifdef without needing to add yet another
> > > > > variable expressing what's already expressed in both
> > > > > 'flags' and 'sflags'.
> > > >
> > > > Yes, it does, but at the cost of not compiling-out the zero-copy pa=
rt
> > > > when it's not supported,
> > > > since the QIO_CHANNEL_WRITE_FLAG_ZERO_COPY comes as a parameter. Th=
is ends up
> > > > meaning there will be at least one extra test for every time this
> > > > function is called (the one in the next patch).
> > >
> > > The cost of a simple bit test is between negligible-and-non-existant
> > > with branch prediction. I doubt it would be possible to even measure
> > > it.
> >
> > Yeah, you are probably right on that.
> > So the main learning point here is that it's not worth creating a new
> > boolean for compiling-out
> > code that should not impact performance ?
>
> As ever "it depends" so there's no hard rule, and sometimes it can
> verge on bikeshed colouring :-)
>
> I didn't like the variable in this case, because it introduces a 3rd
> variable to the method for representing whether zero copy is need,
> which is excessive. I'm not a fan of redundancy as it can often then
> lead to inconsistency. So it would need a compelling reason why it is
> better, which is difficult for such a simple method. If the code was
> more complex, a variable might have benefit of clarity, but in this
> case IMHO it was just overkill.

I see. Thanks for the clarification!

Best regards,
Leo

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


