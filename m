Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD37489033
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 07:29:41 +0100 (CET)
Received: from localhost ([::1]:57240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6oBX-0003gv-Qf
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 01:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n6o9H-0001vr-8n
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 01:27:20 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n6o9C-0003LX-Tn
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 01:27:17 -0500
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JXP3s0ccnzccQV;
 Mon, 10 Jan 2022 14:26:33 +0800 (CST)
Received: from dggpeml100026.china.huawei.com (7.185.36.103) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 14:27:05 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml100026.china.huawei.com (7.185.36.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 14:27:05 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Mon, 10 Jan 2022 14:27:05 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan
 <yechuan@huawei.com>, Huangzhichao <huangzhichao@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC 01/10] virtio: get class_id and pci device id by the virtio
 id
Thread-Topic: [RFC 01/10] virtio: get class_id and pci device id by the virtio
 id
Thread-Index: AQHYAc9vCeFWPgdrrU+qsnWZQ04FAaxbQEAAgACRGNA=
Date: Mon, 10 Jan 2022 06:27:05 +0000
Message-ID: <df00e559133e45319fc9779916578975@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-2-longpeng2@huawei.com>
 <20220110003243-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220110003243-mutt-send-email-mst@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>



> -----Original Message-----
> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> Sent: Monday, January 10, 2022 1:43 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: stefanha@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> Subject: Re: [RFC 01/10] virtio: get class_id and pci device id by the vi=
rtio
> id
>=20
> On Wed, Jan 05, 2022 at 08:58:51AM +0800, Longpeng(Mike) wrote:
> > From: Longpeng <longpeng2@huawei.com>
> >
> > Add helpers to get the "Transitional PCI Device ID" and "class_id" of t=
he
> > deivce which is specificed by the "Virtio Device ID".
>=20
> ton of typos here.
>=20

Will fix all in the V2.

> > These helpers will be used to build the generic vDPA device later.
> >
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > ---
> >  hw/virtio/virtio-pci.c | 93 ++++++++++++++++++++++++++++++++++++++++++
> >  hw/virtio/virtio-pci.h |  4 ++
> >  2 files changed, 97 insertions(+)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 750aa47ec1..843085c4ea 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -19,6 +19,7 @@
> >
> >  #include "exec/memop.h"
> >  #include "standard-headers/linux/virtio_pci.h"
> > +#include "standard-headers/linux/virtio_ids.h"
> >  #include "hw/boards.h"
> >  #include "hw/virtio/virtio.h"
> >  #include "migration/qemu-file-types.h"
> > @@ -213,6 +214,95 @@ static int virtio_pci_load_queue(DeviceState *d, i=
nt n,
> QEMUFile *f)
> >      return 0;
> >  }
> >
> > +typedef struct VirtIOPCIIDInfo {
> > +    uint16_t vdev_id; /* virtio id */
> > +    uint16_t pdev_id; /* pci device id */
> > +    uint16_t class_id;
> > +} VirtIOPCIIDInfo;
>=20
>=20
> if this is transitional as comment says make it explicit
> in the names and comments.
>=20

OK.

> > +
> > +static const VirtIOPCIIDInfo virtio_pci_id_info[] =3D {
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_NET,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_NET,
> > +        .class_id =3D PCI_CLASS_NETWORK_ETHERNET,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_BLOCK,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_BLOCK,
> > +        .class_id =3D PCI_CLASS_STORAGE_SCSI,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_CONSOLE,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_CONSOLE,
> > +        .class_id =3D PCI_CLASS_COMMUNICATION_OTHER,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_SCSI,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_SCSI,
> > +        .class_id =3D PCI_CLASS_STORAGE_SCSI,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_9P,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_9P,
> > +        .class_id =3D PCI_BASE_CLASS_NETWORK,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_VSOCK,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_VSOCK,
> > +        .class_id =3D PCI_CLASS_COMMUNICATION_OTHER,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_IOMMU,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_IOMMU,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_MEM,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_MEM,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_PMEM,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_PMEM,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_RNG,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_RNG,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_BALLOON,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_BALLOON,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +};
> > +
>=20
>=20
> this is the list from the spec:
>=20
>=20
> So this is the list from the spec:
>=20
> 0x1000 network card
> 0x1001 block device
> 0x1002 memory ballooning (traditional)
> 0x1003 console
> 0x1004 SCSI host
> 0x1005 entropy source
> 0x1009 9P transport
>=20

Why the following device IDs are introduced? They are non
transitional devices.

#define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
#define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
#define PCI_DEVICE_ID_VIRTIO_MEM         0x1015

>=20
> I'd drop all the rest, use the algorithm for non transitional.
> And when class is other I'd just not include it in the array,
> make this the default.
>=20
>=20
>=20
> > +static VirtIOPCIIDInfo virtio_pci_get_id_info(uint16_t vdev_id)
> > +{
> > +    VirtIOPCIIDInfo info =3D {};
> > +    int i;
> > +
> > +    for (i =3D 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
> > +        if (virtio_pci_id_info[i].vdev_id =3D=3D vdev_id) {
> > +            info =3D virtio_pci_id_info[i];
> > +            break;
> > +        }
> > +    }
> > +
> > +    return info;
> > +}
> > +
> > +uint16_t virtio_pci_get_pci_devid(uint16_t device_id)
> > +{
> > +    return virtio_pci_get_id_info(device_id).pdev_id;
> > +}
> > +
> > +uint16_t virtio_pci_get_class_id(uint16_t device_id)
> > +{
> > +    return virtio_pci_get_id_info(device_id).class_id;
> > +}
> > +
> >  static bool virtio_pci_ioeventfd_enabled(DeviceState *d)
> >  {
> >      VirtIOPCIProxy *proxy =3D to_virtio_pci_proxy(d);
> > @@ -1674,6 +1764,9 @@ static void virtio_pci_device_plugged(DeviceState=
 *d,
> Error **errp)
> >           * is set to PCI_SUBVENDOR_ID_REDHAT_QUMRANET by default.
> >           */
> >          pci_set_word(config + PCI_SUBSYSTEM_ID,
> virtio_bus_get_vdev_id(bus));
> > +        if (proxy->pdev_id) {
> > +            pci_config_set_device_id(config, proxy->pdev_id);
> > +        }
> >      } else {
> >          /* pure virtio-1.0 */
> >          pci_set_word(config + PCI_VENDOR_ID,
> > diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> > index 2446dcd9ae..06aa59436e 100644
> > --- a/hw/virtio/virtio-pci.h
> > +++ b/hw/virtio/virtio-pci.h
> > @@ -146,6 +146,7 @@ struct VirtIOPCIProxy {
> >      bool disable_modern;
> >      bool ignore_backend_features;
> >      OnOffAuto disable_legacy;
> > +    uint16_t pdev_id;
> >      uint32_t class_code;
> >      uint32_t nvectors;
> >      uint32_t dfselect;
> > @@ -158,6 +159,9 @@ struct VirtIOPCIProxy {
> >      VirtioBusState bus;
> >  };
> >
> > +uint16_t virtio_pci_get_pci_devid(uint16_t device_id);
> > +uint16_t virtio_pci_get_class_id(uint16_t device_id);
> > +
> >  static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
> >  {
> >      return !proxy->disable_modern;
> > --
> > 2.23.0


