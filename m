Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32434415E9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 10:15:02 +0100 (CET)
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhTPB-0006oI-9x
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 05:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhTMs-0004qJ-5E
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhTMo-0001K7-UT
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635757953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMiOWhfLQ94/ygMqX0BNGDdPwxht2vHD7lTVMiYq6tA=;
 b=h4hBbwtP5MCPCdHIwop0UQQYRxjcKRUk3zs10FR26EIJnicHl03FvLyb1eJIaDf+xrylZv
 n0n13tE8qcD96zabwX8tzHHjMaY1KmAUnr1GfIu68HixO9WN+z/PF0F3cIHRyWTVwb0EDK
 HwAPpik+CnfzJlCBsEDph7uwHmQ6WH8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-NlTS-6beOeeTz6f5Y-ZMpg-1; Mon, 01 Nov 2021 05:12:32 -0400
X-MC-Unique: NlTS-6beOeeTz6f5Y-ZMpg-1
Received: by mail-ed1-f70.google.com with SMTP id
 m16-20020a056402431000b003dd2005af01so14954919edc.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 02:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uMiOWhfLQ94/ygMqX0BNGDdPwxht2vHD7lTVMiYq6tA=;
 b=oerorOP96yQBJTPg5FNYCOjc5IJsnTbTcGDdq7LyeaiNZ6To8IXPSeI+BsOq/6sW+b
 +sBAjjUnBnYwn36evTs/GG8Nh9AxwqL0CT1IxmSq3Tjo6BnQiN79I904oOevVC1D9jL0
 VvzYWhZi6+nQ0H5kWRZtsNAmon/92YocQOthGacpNszjqV5Yd2hQipXlZ9KN8l9mEc+J
 GqgKOVmleqEFz/8gCnLaR/YxYUZQXIUBfm+UFO8QE6LEVdPR/lMkK4cvXdg2FjGE44QQ
 ZLsld+ZDWoqHxc9iGTy7ftYwtWCLMhn7yeARW0dLqnT5FMVsqpwbpOCYkHMtsulo0WoT
 Dwrw==
X-Gm-Message-State: AOAM531pZxQLSDXKs/KJ0+6d0CTeYZIgQmwUG5UKhEVpfEwrtKav4pNw
 rZol+dJsbY4gMqdz/8CtBbAliWuFTxRkP3JbFg+i3/yZAuvNUdYPGQljbityATT6aLpVUcdM7yn
 nWssytI/blRKnPbg=
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr35967150eje.341.1635757951611; 
 Mon, 01 Nov 2021 02:12:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxesjWSZRe14EUTuo/rkd51Fw+Pvq8zkID+1S/R991kOCKsa1O4b95d27llLlgvgQvAHG3B2Q==
X-Received: by 2002:a17:906:8cd:: with SMTP id
 o13mr35967128eje.341.1635757951428; 
 Mon, 01 Nov 2021 02:12:31 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:107f:7087:907d:ff12:1534:78b7])
 by smtp.gmail.com with ESMTPSA id i5sm2296775eje.15.2021.11.01.02.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 02:12:31 -0700 (PDT)
Date: Mon, 1 Nov 2021 05:12:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
Message-ID: <20211101051219-mutt-send-email-mst@kernel.org>
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <20211031174635-mutt-send-email-mst@kernel.org>
 <CAJaqyWcbTLXqgOgRkwVF6rgZrLhejfXh+GLePaBS61R4HYQWDg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcbTLXqgOgRkwVF6rgZrLhejfXh+GLePaBS61R4HYQWDg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 01, 2021 at 10:03:19AM +0100, Eugenio Perez Martin wrote:
> On Sun, Oct 31, 2021 at 10:47 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Oct 29, 2021 at 04:16:08PM +0200, Eugenio Pérez wrote:
> > > The -1 assumes that all devices with no cvq have an spare vq allocated
> > > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be the
> > > case, and the device may have a pair number of queues.
> > >
> > > To fix this, just resort to the lower even number of queues.
> > >
> > > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virtio device")
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > ---
> > >  hw/net/vhost_net.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > index 0d888f29a6..edf56a597f 100644
> > > --- a/hw/net/vhost_net.c
> > > +++ b/hw/net/vhost_net.c
> > > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> > >      NetClientState *peer;
> > >
> > >      if (!cvq) {
> > > -        last_index -= 1;
> > > +        last_index &= ~1ULL;
> > >      }
> > >
> > >      if (!k->set_guest_notifiers) {
> >
> > could this code be made clearer?
> >
> 
> I can expand both for sure, but do you mean clearer because the
> operation is obscure (to remove the last bit to make last_index even)
> or because the need of that operation is not clear enough?
> 
> Thanks!

I'm not sure ... both?

> > > --
> > > 2.27.0
> >


