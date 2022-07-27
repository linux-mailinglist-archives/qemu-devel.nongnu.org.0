Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F9581F56
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 06:56:08 +0200 (CEST)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGZ5b-0004Em-DM
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 00:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZ3E-0002E4-4K
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 00:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZ3C-0000QC-8U
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 00:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658897616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMlM9HtrK6sgqmCMnJsb/uagRHZR/eofDBx2ZRublZo=;
 b=YZeqygyMOmIzfm6wfq50I6NhXQGRF4PDSvGF1YHupjCEWOFuBhhSv3u48VeOq6DScmXR+C
 PUrUX/F/1iaQFe+aSEcWcZ5d5ASALlXByHJk1NLo8DmXAg87bEi4cYiEV0f7ykPiuFxmka
 qf+e27aA7woRKotZSKOo5VrdbYlW/Ug=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-GJ5uJpgCOIy9x2XALfOE-w-1; Wed, 27 Jul 2022 00:53:35 -0400
X-MC-Unique: GJ5uJpgCOIy9x2XALfOE-w-1
Received: by mail-lf1-f69.google.com with SMTP id
 k25-20020a195619000000b00489e6a6527eso4894434lfb.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 21:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SMlM9HtrK6sgqmCMnJsb/uagRHZR/eofDBx2ZRublZo=;
 b=GxywbH4UilwWyAaYzZtNlalyvxakIZG1YfKb58rj8sbwXBcxmwhQLszomeo/yj+gm4
 iBm8Pus5ijJZa6gFblOj9FtHZbTtjK556Q9WNbZXeih3uRhQo05YU9576wO9cGhqWONS
 ++0U2UelDrnAXiEfUelz94VSghjQpVJlDH3419kqm8pSJlyrGAvHYHXYsnq28cpzdA3i
 OFMvI87eWlvERj+R8XO02Zg7s1BI2TWMfcgiU7DDKklg4zcrYRKvtUjUZSaiO7p6qpud
 lIz+LdBVYUbAm9UlC91oxI7epk2Qpe6AXHSq0B9tdRhszDotqw7CNIm6hYxRusbtLv0/
 8xPQ==
X-Gm-Message-State: AJIora+4/EFLBshwYg+LN3vDeO7nHXASYKpTeQxwrMg3GD0r59OgI7vW
 SUX4RuxCO+c5jIABqAoqOaZ6Riws7GXxdYmyz1BB3MY3sKTjp2pF/7kaTSFdC/7Ql1J5NUIlRzP
 K3STMwu3MO5BArtWzdeORq2NA2H9uYa4=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr7130554lfa.124.1658897613715; 
 Tue, 26 Jul 2022 21:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1slxe+fidKRo8rmNEFmwb9sDzrnfDr1WDfFXLNi74tjKKoVYADrywpW4c7L6MSNVXYHXBsqjMhJQ+CQmIg7LA0=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr7130549lfa.124.1658897613419; Tue, 26
 Jul 2022 21:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <229f4bc4d6ba7e85a09d6f35d2d06f3cc6a46a6a.1658141552.git.kangjie.xu@linux.alibaba.com>
 <e443d984-d4ae-084a-060c-70f802830014@redhat.com>
 <1dee6c9f-aeee-cd72-7141-dd95eed811c0@linux.alibaba.com>
In-Reply-To: <1dee6c9f-aeee-cd72-7141-dd95eed811c0@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Jul 2022 12:53:22 +0800
Message-ID: <CACGkMEtm33BR3r9cUJCRnPDvOa7fck2goZKKqk4S3Y0+3FAqOA@mail.gmail.com>
Subject: Re: [PATCH 16/16] vhost-net: vq reset feature bit support
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: mst <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 hengqi@linux.alibaba.com, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Jul 26, 2022 at 2:24 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> w=
rote:
>
>
> =E5=9C=A8 2022/7/26 12:28, Jason Wang =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2022/7/18 19:17, Kangjie Xu =E5=86=99=E9=81=93:
> >> Add support for negotation of vq reset feature bit.
> >>
> >> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> >> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >
> >
> > I'd suggest to add support for vhost-net kernel as well. It looks much
> > more easier than vhost-user (I guess a stop/start would do the trick).
> >
> > Thanks
> >
> >
> Yeah, we've planned to support it in the future.

If it's possible, I suggest to implement in this series. It would be
easier since it current kernel support it already (via SET_BACKEND).

Thanks

>
> Thanks
>
> >> ---
> >>   hw/net/vhost_net.c  | 1 +
> >>   hw/net/virtio-net.c | 3 ++-
> >>   2 files changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> >> index 4f5f034c11..de910f6466 100644
> >> --- a/hw/net/vhost_net.c
> >> +++ b/hw/net/vhost_net.c
> >> @@ -73,6 +73,7 @@ static const int user_feature_bits[] =3D {
> >>       VIRTIO_NET_F_MTU,
> >>       VIRTIO_F_IOMMU_PLATFORM,
> >>       VIRTIO_F_RING_PACKED,
> >> +    VIRTIO_F_RING_RESET,
> >>       VIRTIO_NET_F_RSS,
> >>       VIRTIO_NET_F_HASH_REPORT,
> >>   diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index 0747ffe71c..a8b299067a 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -757,6 +757,8 @@ static uint64_t
> >> virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
> >>         virtio_add_feature(&features, VIRTIO_NET_F_MAC);
> >>   +    virtio_add_feature(&features, VIRTIO_F_RING_RESET);
> >> +
> >>       if (!peer_has_vnet_hdr(n)) {
> >>           virtio_clear_feature(&features, VIRTIO_NET_F_CSUM);
> >>           virtio_clear_feature(&features, VIRTIO_NET_F_HOST_TSO4);
> >> @@ -777,7 +779,6 @@ static uint64_t
> >> virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
> >>       }
> >>         if (!get_vhost_net(nc->peer)) {
> >> -        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
> >>           return features;
> >>       }
>


