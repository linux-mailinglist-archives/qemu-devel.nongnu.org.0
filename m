Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745306FA189
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 09:51:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvvde-0005BH-ON; Mon, 08 May 2023 03:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pvvdZ-0005AQ-II
 for qemu-devel@nongnu.org; Mon, 08 May 2023 03:50:26 -0400
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pvvdU-0006T7-4E
 for qemu-devel@nongnu.org; Mon, 08 May 2023 03:50:23 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R301e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0Vi163DX_1683532204; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vi163DX_1683532204) by smtp.aliyun-inc.com;
 Mon, 08 May 2023 15:50:04 +0800
Message-ID: <1683532179.7475739-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
Date: Mon, 8 May 2023 15:49:39 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
 <20230507020037-mutt-send-email-mst@kernel.org>
 <CACGkMEubjEr_CSxdq86jZsYY8a78L50N03=vnYzgOhKBNH29ag@mail.gmail.com>
In-Reply-To: <CACGkMEubjEr_CSxdq86jZsYY8a78L50N03=vnYzgOhKBNH29ag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 8 May 2023 14:44:21 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Sun, May 7, 2023 at 2:01=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
> >
> > On Sat, May 06, 2023 at 10:13:36AM +0800, Xuan Zhuo wrote:
> > > On Thu,  4 May 2023 12:14:47 +0200, =3D?utf-8?q?Eugenio_P=3DC3=3DA9re=
z?=3D <eperezma@redhat.com> wrote:
> > > > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") ena=
bles
> > > > unconditionally vq reset feature as long as the device is emulated.
> > > > This makes impossible to actually disable the feature, and it causes
> > > > migration problems from qemu version previous than 7.2.
> > > >
> > > > The entire final commit is unneeded as device system already enable=
 or
> > > > disable the feature properly.
> > > >
> > > > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > > > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > >
> > > > ---
> > > > Tested by checking feature bit at  /sys/devices/pci.../virtio0/feat=
ures
> > > > enabling and disabling queue_reset virtio-net feature and vhost=3Do=
n/off
> > > > on net device backend.
> > >
> > > Do you mean that this feature cannot be closed?
> > >
> > > I tried to close in the guest, it was successful.
> > >
> > > In addition, in this case, could you try to repair the problem instea=
d of
> > > directly revert.
> > >
> > > Thanks.
> >
> > What does you patch accomplish though? If it's not needed
> > let's not do it.
>
> It looks to me the unconditional set of this feature breaks the
> migration of pre 7.2 machines.
>
> Also we probably need to make ring_reset as false by default, or
> compat it for pre 7.2 machines.
>
>     DEFINE_PROP_BIT64("queue_reset", _state, _field, \
>                       VIRTIO_F_RING_RESET, true)
>


Do you mean this?

Thanks


commit 69e1c14aa22284f933a6ea134b96d5cb5a88a94d
Author: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Date:   Mon Oct 17 17:25:47 2022 +0800

    virtio: core: vq reset feature negotation support

    A a new command line parameter "queue_reset" is added.

    Meanwhile, the vq reset feature is disabled for pre-7.2 machines.

    Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
    Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
    Acked-by: Jason Wang <jasowang@redhat.com>
    Message-Id: <20221017092558.111082-5-xuanzhuo@linux.alibaba.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

diff --git a/hw/core/machine.c b/hw/core/machine.c
index aa520e74a8..907fa78ff0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,7 +40,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"

-GlobalProperty hw_compat_7_1[] =3D {};
+GlobalProperty hw_compat_7_1[] =3D {
+    { "virtio-device", "queue_reset", "false" },
+};
 const size_t hw_compat_7_1_len =3D G_N_ELEMENTS(hw_compat_7_1);

 GlobalProperty hw_compat_7_0[] =3D {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b00b3fcf31..1423dba379 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -313,7 +313,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
     DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
                       VIRTIO_F_IOMMU_PLATFORM, false), \
     DEFINE_PROP_BIT64("packed", _state, _field, \
-                      VIRTIO_F_RING_PACKED, false)
+                      VIRTIO_F_RING_PACKED, false), \
+    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
+                      VIRTIO_F_RING_RESET, true)

 hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
 bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);


>
> Thanks
>
> >
> > > > ---
> > > >  hw/net/virtio-net.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > > index 53e1c32643..4ea33b6e2e 100644
> > > > --- a/hw/net/virtio-net.c
> > > > +++ b/hw/net/virtio-net.c
> > > > @@ -805,7 +805,6 @@ static uint64_t virtio_net_get_features(VirtIOD=
evice *vdev, uint64_t features,
> > > >      }
> > > >
> > > >      if (!get_vhost_net(nc->peer)) {
> > > > -        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
> > > >          return features;
> > > >      }
> > > >
> > > > --
> > > > 2.31.1
> > > >
> >
>

