Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731565A077F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 04:55:30 +0200 (CEST)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR31l-0005tD-5q
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 22:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR2yq-0002yI-71
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 22:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR2yn-00026u-8I
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 22:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661395943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rC3pA3P2+YOh2CPfurQWDcbSAV/shw4ws5j6VFbVnS4=;
 b=OQU56xYHzlQe5WL9SH+uGkXa04pF85wW6QWe5JBU2NONAnZUpg74kw6HhyHEXCD/V38NLy
 GXs32LU4W45RYa3F9atTk3AO98D9+f8r4ec7e4TjdT49cZ1zZjYCKATYcyBWCBxfJ81eOg
 fgyLMa79NdnSgAblGJzzWt4bvdlLBVw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-GqhcrjgIPpiki8H5ciZVxw-1; Wed, 24 Aug 2022 22:52:22 -0400
X-MC-Unique: GqhcrjgIPpiki8H5ciZVxw-1
Received: by mail-lj1-f197.google.com with SMTP id
 x10-20020a2ea98a000000b00261b06603cfso3680279ljq.17
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 19:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=rC3pA3P2+YOh2CPfurQWDcbSAV/shw4ws5j6VFbVnS4=;
 b=wfAw5au3d4P92lZ7Z9nfa59f9rOzoUcJQIvyttkTvb6NktVaCCdz+nWOcmFlyGtd3O
 1OKSbV/jdd4BJQ740yKh3Qx/0q3F2cv8TCf1tmb33FC83a5OwYGqsVALJiuYsaa3YaX+
 0dkVykR3i78c9Gk00AHEr7dwSPgUxK2degerIGOpYNJ/TT2b9qLncMwDL+J1TlAwrATW
 DAbGBSZPwy6EIeOfQJ3P4K+i4ceBptmWw4TV1QYTDeFUmEKAu6bBHjdWP83C1GanPknl
 QhpI6aIlX+6G962lQFB7Gsm/jM+CeLrgZkmcfvTaYCtB+LUfhWt5st4+6QwmyGiJlcCE
 /O3A==
X-Gm-Message-State: ACgBeo2SobF411X5E7BlNkmkYo1pJT0/bzG05ZfHk1/pfAoDeIVFj8+y
 Vi+JVeH9N8u4vnsSWQMwJCdbx0KfTOEiPHy/eht47IPSSC1G9ulwDcS2cu2p9KW1on+HYqV/C3G
 BcDGUjO352gmhjA0lD4oLp0X99L3B0Ps=
X-Received: by 2002:a05:6512:1518:b0:492:d08a:a360 with SMTP id
 bq24-20020a056512151800b00492d08aa360mr567485lfb.238.1661395940915; 
 Wed, 24 Aug 2022 19:52:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR68RbdzgqpdGUWSgUC/jUq8PKNphRkkSM4Ek9/Qz4EmecDSTSYVIvkfyATJ6AteUcU9pAMSO8qQi+Oz8jIGpoU=
X-Received: by 2002:a05:6512:1518:b0:492:d08a:a360 with SMTP id
 bq24-20020a056512151800b00492d08aa360mr567479lfb.238.1661395940655; Wed, 24
 Aug 2022 19:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <6dda660c634b2a35c3dea46a98e63fb2ef3a36c9.1660611460.git.kangjie.xu@linux.alibaba.com>
 <1824ba40-9460-4c5d-9a27-820a51355ba3@redhat.com>
 <9fb3e2b4-9f78-5da1-3ab6-0ec53f03b628@linux.alibaba.com>
 <5812b7ed-3983-6b39-0c44-e1701ca4ecf0@redhat.com>
 <a5cb0b2d-1a76-86eb-acd7-6421a5f6d3eb@linux.alibaba.com>
In-Reply-To: <a5cb0b2d-1a76-86eb-acd7-6421a5f6d3eb@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Aug 2022 10:52:09 +0800
Message-ID: <CACGkMEvrzc2asJfWVynh=Y=6mjrGLG5EOTDhfrDWV69SX7Yb1g@mail.gmail.com>
Subject: Re: [PATCH v2 07/24] virtio-pci: support queue enable
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Eduardo Habkost <eduardo@habkost.net>, wangyanan55@huawei.com, 
 Heng Qi <hengqi@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Aug 24, 2022 at 7:27 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> w=
rote:
>
>
> =E5=9C=A8 2022/8/24 16:59, Jason Wang =E5=86=99=E9=81=93:
>
>
> =E5=9C=A8 2022/8/23 16:20, Kangjie Xu =E5=86=99=E9=81=93:
>
>
> =E5=9C=A8 2022/8/23 15:44, Jason Wang =E5=86=99=E9=81=93:
>
>
> =E5=9C=A8 2022/8/16 09:06, Kangjie Xu =E5=86=99=E9=81=93:
>
> PCI devices support vq enable.
>
>
>
> Nit: it might be "support device specific vq enable"
>
>
> Get it.
>
>
> Based on this function, the driver can re-enable the virtqueue after the
> virtqueue is reset.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/virtio-pci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index ec8e92052f..3d560e45ad 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1335,6 +1335,7 @@ static void virtio_pci_common_write(void *opaque, h=
waddr addr,
> proxy->vqs[vdev->queue_sel].avail[0],
> ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
> proxy->vqs[vdev->queue_sel].used[0]);
> +            virtio_queue_enable(vdev, vdev->queue_sel);
>               proxy->vqs[vdev->queue_sel].enabled =3D 1;
>               proxy->vqs[vdev->queue_sel].reset =3D 0;
>
>
>
> Any reason we do it before the assignment of 1? It probably means the dev=
ice specific method can't depend on virtio_queue_enabled()?
>
> Thanks
>
> Sorry, I don't get why device specific method can't depend on virtio_queu=
e_enabled().
>
>
>
> I meant if the device specific method call virtio_queue_enabled() it will=
 return false in this case, is this intended?
>
> Yes, I intend it to behave in this way.
>
>
>
> Before virtio_queue_enable() is done, virtqueue should always be not read=
y and disabled.
>
> Otherwise, If we put it after the assignment of enabled to 1, the virtque=
ue may be accessed illegally and may cause panic, because the virtqueue is =
still being intialized and being configured.
>
>
>
> How? Shouldn't we make transport ready before making device virtqueue(dev=
ice) ready?
>
> Thanks
>
> I am not experienced in this field, could you tell me why we should make =
the transport ready first?

That's a must for the device to work.

E.g for PCI device, I can't image the device is ready to work before
PCI is ready.

>
> I make the transport ready later than making device ready for two aspects=
:
>
> 1. In QEMU, the virtio_queue_enabled() is used only when we start the dev=
ice/queue pair (vhost_dev_start_one), or reading VIRTIO_PCI_COMMON_Q_ENABLE=
. These two operations and resetting the queue will be synchronized using i=
othread lock, so we do not need to worry about the case currently.

Note that virtio_queue_enabled() is an exported helper, you can't
assume how it will be used in the future.

>
> 2. Suppose we use virtio_queue_enabled() or access the enabled status asy=
nchronously, and we make the transport ready first.
>
> After enabled set to true, and before virtio_queue_enable() is finished, =
somewhere  that call virtio_queue_enabled()  or access the enabled status o=
f VirtIOPCIQueue. Then the caller will consider the virtqueue as enabled(en=
abled =3D true in VirtIOPCIQueue). The caller might access the virtqueue(ac=
cess avail ring / desc table). But I think the access here is illegal becau=
se the virtqueue might still be unintialized status.
>

How can this happen, won't we call device specific method after we set
queue_enabled as true? It's the charge of the device specific method
to synchronize the necessary external I/O in this case.

Thanks

> Thus, from my perspective, to prevent illegal access, we need to make tra=
nsport ready after virtio_queue_enable().
>
> Thanks
>
>
>
> Thanks
>
>
>           } else {
>
>


