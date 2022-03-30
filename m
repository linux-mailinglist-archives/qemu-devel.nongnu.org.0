Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1722A4EBD36
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:07:13 +0200 (CEST)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUIK-0008G4-7H
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:07:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUCW-0003D2-6H
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:01:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUCT-0007w5-4t
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648630868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2os4aQO7nr5B8FyCoiHcFOc5R6L+Zd3W0PSCYVVM5jQ=;
 b=WIIcbES1CMKepx61GUTLw1kWqZ/YevRa4QTfbbsI/G4ddU3/fmE0iYSvM34S+olHwqAdXc
 hf7bnbb+VN45APRCQbu7WR5NaezXSrJ9NAtC33RDm3aZCMyUe8w7qX6igUWyhiof7ODjjL
 C3FtPdXfwlYk2HrpJhIwxwsemjcVGnY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-edlqu_gaP0-8sLrb9_NaOA-1; Wed, 30 Mar 2022 05:01:07 -0400
X-MC-Unique: edlqu_gaP0-8sLrb9_NaOA-1
Received: by mail-lj1-f197.google.com with SMTP id
 21-20020a2e1455000000b0024ace13ce62so4158196lju.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2os4aQO7nr5B8FyCoiHcFOc5R6L+Zd3W0PSCYVVM5jQ=;
 b=1LVDh8E+HRLda4WbMd1pV+G+kqs7t2X+MaKBpT2iQ6oFACMEmMFCtkNtk4oIV3k3ca
 H7FH/snuXiRmO2VU1ciAjrL7zpsymaEEcJNux/1q4uH0/xJAiRQiYhYoZ+0v3VjL/+XW
 52sslYhllN8W0rgE2rjja9OHEzR2rb0UHDrwAIx9xuoOQNvbm5jvpDesGZOZEJqFcAIp
 +cSJezQkqOSU1bL3enEwgmfcpotDbkLbWFTps1J2nYyUx2YNGwMH1wQIQLf3QJGCQm49
 N82xkIrNF0LrlH2ckt9+sPeGS1ttOV5Ca8/Iph9c3zxauFt9VxRT8RMpSYXkWbFvB0Qz
 /dmg==
X-Gm-Message-State: AOAM531U+MeOjwr52iO1RHiK6A7kaxskSvWdPsVV2sXkAnpz4m3vAa8j
 ZGLAAnTc+dOF8GdCzKuBTV28LFl8C9+29U0rjtU+OqLTxhNePdn+Llmy8FjfjJn+QjH7SL8/le+
 Onv3NUQoKzzP3Xps6bvbOQ1Ao9KKT33I=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr5985542ljq.300.1648630865017; 
 Wed, 30 Mar 2022 02:01:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEWzSJhk7aLcutdQ/OqOfFU5i+WrFQxaOAA7PsjVLd+Od0SYBHmrlGUWA3FpQNANCvhlS6rWfzek91t42KJrs=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr5985525ljq.300.1648630864686; Wed, 30
 Mar 2022 02:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-2-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1648621997-22416-2-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 17:00:53 +0800
Message-ID: <CACGkMEv=bhGFHqv=Mi7FSnwvDZU4GAvFw564piP6nr3CHD+-Wg@mail.gmail.com>
Subject: Re: [PATCH 1/7] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> With MQ enabled vdpa device and non-MQ supporting guest e.g.
> booting vdpa with mq=3Don over OVMF of single vqp, below assert
> failure is seen:
>
> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >=
=3D dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
>
> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=3D<optimized out>, =
idx=3D<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=3D<optimized out>, =
idx=3D<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=3D0x558f55c01800, vde=
v=3D0x558f568f91f0, n=3D2, mask=3D<optimized out>) at ../hw/virtio/vhost.c:=
1557
> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=3Dd@entry=3D0x5=
58f568f0f60, n=3Dn@entry=3D2, assign=3Dassign@entry=3Dtrue, with_irqfd=3Dwi=
th_irqfd@entry=3Dfalse)
>    at ../hw/virtio/virtio-pci.c:974
> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=3D0x558f568f0f=
60, nvqs=3D3, assign=3Dtrue) at ../hw/virtio/virtio-pci.c:1019
> 9  0x0000558f52bf091d in vhost_net_start (dev=3Ddev@entry=3D0x558f568f91f=
0, ncs=3D0x558f56937cd0, data_queue_pairs=3Ddata_queue_pairs@entry=3D1, cvq=
=3Dcvq@entry=3D1)
>    at ../hw/net/vhost_net.c:361
> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=3D<optimized out>,=
 n=3D0x558f568f91f0) at ../hw/net/virtio-net.c:289
> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=3D0x558f568f91f0, st=
atus=3D15 '\017') at ../hw/net/virtio-net.c:370
> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=3Dvdev@entry=3D0x558f568=
f91f0, val=3Dval@entry=3D15 '\017') at ../hw/virtio/virtio.c:1945
> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=3D0x558f568f0f60=
, addr=3D<optimized out>, val=3D<optimized out>, size=3D<optimized out>) at=
 ../hw/virtio/virtio-pci.c:1292
> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=3D0x558f568f19d=
0, addr=3D20, value=3D<optimized out>, size=3D1, shift=3D<optimized out>, m=
ask=3D<optimized out>, attrs=3D...)
>    at ../softmmu/memory.c:492
> 15 0x0000558f52d127de in access_with_adjusted_size (addr=3Daddr@entry=3D2=
0, value=3Dvalue@entry=3D0x7f8cdbffe748, size=3Dsize@entry=3D1, access_size=
_min=3D<optimized out>, access_size_max=3D<optimized out>, access_fn=3D0x55=
8f52d15cf0 <memory_region_write_accessor>, mr=3D0x558f568f19d0, attrs=3D...=
) at ../softmmu/memory.c:554
> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=3Dmr@entry=3D0x=
558f568f19d0, addr=3D20, data=3D<optimized out>, op=3D<optimized out>, attr=
s=3Dattrs@entry=3D...)
>    at ../softmmu/memory.c:1504
> 17 0x0000558f52d078e7 in flatview_write_continue (fv=3Dfv@entry=3D0x7f8ac=
cbc3b90, addr=3Daddr@entry=3D103079215124, attrs=3D..., ptr=3Dptr@entry=3D0=
x7f8ce6300028, len=3Dlen@entry=3D1, addr1=3D<optimized out>, l=3D<optimized=
 out>, mr=3D0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-ut=
ils.h:165
> 18 0x0000558f52d07b06 in flatview_write (fv=3D0x7f8accbc3b90, addr=3D1030=
79215124, attrs=3D..., buf=3D0x7f8ce6300028, len=3D1) at ../softmmu/physmem=
.c:2822
> 19 0x0000558f52d0b36b in address_space_write (as=3D<optimized out>, addr=
=3D<optimized out>, attrs=3D..., buf=3Dbuf@entry=3D0x7f8ce6300028, len=3D<o=
ptimized out>)
>    at ../softmmu/physmem.c:2914
> 20 0x0000558f52d0b3da in address_space_rw (as=3D<optimized out>, addr=3D<=
optimized out>, attrs=3D...,
>    attrs@entry=3D..., buf=3Dbuf@entry=3D0x7f8ce6300028, len=3D<optimized =
out>, is_write=3D<optimized out>) at ../softmmu/physmem.c:2924
> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x558f55c2da60) =
at ../accel/kvm/kvm-all.c:2903
> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=3Darg@entry=3D0x558f55c2=
da60) at ../accel/kvm/kvm-accel-ops.c:49
> 23 0x0000558f52f9f04a in qemu_thread_start (args=3D<optimized out>) at ..=
/util/qemu-thread-posix.c:556
> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>
> The cause for the assert failure is due to that the vhost_dev index
> for the ctrl vq was not aligned with actual one in use by the guest.
> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
> if guest doesn't support multiqueue, the guest vq layout would shrink
> to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
> This results in ctrl_vq taking a different vhost_dev group index than
> the default. We can map vq to the correct vhost_dev group by checking
> if MQ is supported by guest and successfully negotiated. Since the
> MQ feature is only present along with CTRL_VQ, we make sure the index
> 2 is only meant for the control vq while MQ is not supported by guest.
>
> Be noted if QEMU or guest doesn't support control vq, there's no bother
> exposing vhost_dev and guest notifier for the control vq. Since
> vhost_net_start/stop implies DRIVER_OK is set in device status, feature
> negotiation should be completed when reaching virtio_net_vhost_status().
>
> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> ---
>  hw/net/virtio-net.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1067e72..484b215 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uin=
t8_t status)
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(n);
>      NetClientState *nc =3D qemu_get_queue(n->nic);
>      int queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> -    int cvq =3D n->max_ncs - n->max_queue_pairs;
> +    int cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> +              n->max_ncs - n->max_queue_pairs : 0;

Let's use a separate patch for this.

>
>      if (!get_vhost_net(nc->peer)) {
>          return;
> @@ -3170,8 +3171,14 @@ static NetClientInfo net_virtio_info =3D {
>  static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int id=
x)
>  {
>      VirtIONet *n =3D VIRTIO_NET(vdev);
> -    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    NetClientState *nc;
>      assert(n->vhost_started);
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx =3D=3D 2)=
 {
> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));

This assert seems guest trigger-able. If yes, I would remove this or
replace it with log_guest_error.

> +        nc =3D qemu_get_subqueue(n->nic, n->max_queue_pairs);
> +    } else {
> +        nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    }
>      return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>  }
>
> @@ -3179,8 +3186,14 @@ static void virtio_net_guest_notifier_mask(VirtIOD=
evice *vdev, int idx,
>                                             bool mask)
>  {
>      VirtIONet *n =3D VIRTIO_NET(vdev);
> -    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    NetClientState *nc;
>      assert(n->vhost_started);
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx =3D=3D 2)=
 {
> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));

And this.

Thanks


> +        nc =3D qemu_get_subqueue(n->nic, n->max_queue_pairs);
> +    } else {
> +        nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    }
>      vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>                               vdev, idx, mask);
>  }
> --
> 1.8.3.1
>


