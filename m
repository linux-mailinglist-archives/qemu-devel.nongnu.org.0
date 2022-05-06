Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E184251D274
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:41:48 +0200 (CEST)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmsaw-0003jz-VZ
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nmsUz-0006fU-Ac
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:35:38 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:29112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nmsUw-0001Tt-EW
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651822533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Md93GVLKBSzbNEnkAlTWpscST5Juesa1w7bnUdW+uGs=;
 b=GsfHJEtwYFCSkANbT4jBBGdFXF32uaWpSZAaeaKXBaU52oUqvR77A35CJvy00hgNxig8JW
 qbOsy5ibmW1edsKYtcA4cphLHQW55f9h7pdXWqQyqK297l0X06fU3IBtBq/lXyAEoUo7kD
 u3GmW5kBz0COXnW+pS2R/T426WNbRcc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-t4NuEBKqOFqFZLuKYuRBnA-1; Fri, 06 May 2022 03:35:31 -0400
X-MC-Unique: t4NuEBKqOFqFZLuKYuRBnA-1
Received: by mail-lf1-f69.google.com with SMTP id
 q20-20020a194314000000b00473e5bc3752so980650lfa.16
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 00:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Md93GVLKBSzbNEnkAlTWpscST5Juesa1w7bnUdW+uGs=;
 b=WD85msaLyWkjulvvTeO+QOtSsaRki7qqpTBKCMKQYpi2x0e+1KcHFJDJ7q4J2JhFO+
 LVLToc4sgVGmSiO2Z46H56X1xTnllfiqA/zaTnv6a2KN8OlU1GJJ460S6k42StGmgE1t
 XuaOpna5AK3htaNoyKR0+sBxs6okEwT6TKVjZdz+YziIuNEEWM3MAehnaaAOaLlGQc9A
 U8dvRPYGlSLa/s6PP8g6ThWgy5GCaadJ5l4bhvpMvBS9OWSwBZm9ROH1JplGe61lxo43
 1ARtOUCyrBchyF8gk+hDPGx0siE9TtnWbPkW4qPFE2A/KDcgxo4amhqjdJty1mmT9AOS
 fYQA==
X-Gm-Message-State: AOAM53386k5iw58N/VzbsXir+169G21cek4d/6WO9tHOHPGzGPNqHNi/
 o117TsQk62buj92TjLij6/Mnk0AV8oSpxI4+NgR934pghE8KZwlPBwMdhxr6+bSfirghDEEVaH3
 F6QfsB+O6/pIBdTp90pMpYW3yIrszcC4=
X-Received: by 2002:a2e:9698:0:b0:24f:14da:6a59 with SMTP id
 q24-20020a2e9698000000b0024f14da6a59mr1302207lji.73.1651822530013; 
 Fri, 06 May 2022 00:35:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzulG5bWVwiLXp7cXtftfeQSm97ls0ZX91Q6eBv48ofngLNUcroRkRSAY5p7XqVsDeMqVzgdfPiLxyU0b4omcY=
X-Received: by 2002:a2e:9698:0:b0:24f:14da:6a59 with SMTP id
 q24-20020a2e9698000000b0024f14da6a59mr1302187lji.73.1651822529692; Fri, 06
 May 2022 00:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
 <1651812874-31967-3-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1651812874-31967-3-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 6 May 2022 15:35:18 +0800
Message-ID: <CACGkMEsasBFmPuJdnv14CjgYrZkjxFHwOxk6yxN7x7X0_P7UHA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] virtio-net: align ctrl_vq index for non-mq guest
 for vhost_vdpa
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>, 
 eperezma <eperezma@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eli Cohen <eli@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.74; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

On Fri, May 6, 2022 at 12:54 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
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
> MQ feature is only present along with CTRL_VQ, we ensure the index
> 2 is only meant for the control vq while MQ is not supported by guest.
>
> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/virtio-net.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index ffb3475..f0bb29c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -14,6 +14,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/atomic.h"
>  #include "qemu/iov.h"
> +#include "qemu/log.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
>  #include "hw/virtio/virtio.h"
> @@ -3171,8 +3172,22 @@ static NetClientInfo net_virtio_info =3D {
>  static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int id=
x)
>  {
>      VirtIONet *n =3D VIRTIO_NET(vdev);
> -    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    NetClientState *nc;
>      assert(n->vhost_started);
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx =3D=3D 2)=
 {
> +        /* Must guard against invalid features and bogus queue index
> +         * from being set by malicious guest, or penetrated through
> +         * buggy migration stream.
> +         */
> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: bogus vq index ignored\n", __func__);
> +            return false;
> +        }
> +        nc =3D qemu_get_subqueue(n->nic, n->max_queue_pairs);
> +    } else {
> +        nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    }
>      return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>  }
>
> @@ -3180,8 +3195,22 @@ static void virtio_net_guest_notifier_mask(VirtIOD=
evice *vdev, int idx,
>                                             bool mask)
>  {
>      VirtIONet *n =3D VIRTIO_NET(vdev);
> -    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> +    NetClientState *nc;
>      assert(n->vhost_started);
> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx =3D=3D 2)=
 {
> +        /* Must guard against invalid features and bogus queue index
> +         * from being set by malicious guest, or penetrated through
> +         * buggy migration stream.
> +         */
> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: bogus vq index ignored\n", __func__);
> +            return;
> +        }
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


