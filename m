Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3BE4890A8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:20:42 +0100 (CET)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6oyv-0000AB-ND
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:20:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6otA-0006iW-AO
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:14:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ot6-0001Rz-LK
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dl3H5tOiY46oS4iViAeJhjvSVfcauyPznXPiVEyJuQM=;
 b=S4nLZ32q9npwd8jWj6M+Kcu+54tg/xv+9zrCKRvYNRrEz2OVihs6otg/X7++f01/yyrZf+
 d6vHo7MfdmWSzTX4Fh0Ua2g0LdxxE54+1yYORTDwR7ywg/q0cFxK8yenk75jWWYir6wQb9
 ezfPeaQonnq4HbUvQUW7DLlVwjrT4PQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-f0wjy8YjNAqxO_4MV1avXA-1; Mon, 10 Jan 2022 02:14:37 -0500
X-MC-Unique: f0wjy8YjNAqxO_4MV1avXA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so8450887wmq.0
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dl3H5tOiY46oS4iViAeJhjvSVfcauyPznXPiVEyJuQM=;
 b=eKiplGYbtW90R/vaotA9Yzpl5puMqJ9WiyJ0bZvkIfJFzT0pgApFY7bJ+FqHU1dKZF
 yG7YY77GFA12PHkpsgSLeNgyqMsIOC0TUJksp88PaIVIJw9qgMqMIkdr50Z3U8Y04tsM
 Qk0/BiA4M5tqNYiZWvYyKYbgIaSZ4XQYZs5IpTpCk5og5jNPh59+yfis9urtyrvtGzZA
 haCsFrkbN+31+OrbmtKNVhvRwa+dxMTLSbbXLYDXIfDhm5kxOrm+HM7NfGx87hgcGeyL
 lq0843/a/QK5VYvYtODdHUz05kQf8GYwzs/p8xOZrViIO8W2aUB3HHyAYDNJWsK1bZ+X
 77eQ==
X-Gm-Message-State: AOAM530s2JQCWf+2oTCNhGR4EEu5l4CwLJlrpKr6eAO9qbFbtB62GXm3
 z64nxEBVULSBe+7JUfaW1Alw7JXtxEHU1gIJLN11WYQhTjr7x+YmQ8mQnX91Hsg7zMgwKpyls8F
 iSK0QS6aO/RWamYE=
X-Received: by 2002:adf:f4c8:: with SMTP id h8mr12997097wrp.196.1641798876606; 
 Sun, 09 Jan 2022 23:14:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLp2lHGtCp/0ifsvxhRCEfvwT49S15u2bfWZtyJJeNyXQZn1TEdGRjlM8GXgUlnOKDPYxyHg==
X-Received: by 2002:adf:f4c8:: with SMTP id h8mr12997085wrp.196.1641798876432; 
 Sun, 09 Jan 2022 23:14:36 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id f5sm2904893wmf.47.2022.01.09.23.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:14:35 -0800 (PST)
Date: Mon, 10 Jan 2022 02:14:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC 01/10] virtio: get class_id and pci device id by the virtio
 id
Message-ID: <20220110021349-mutt-send-email-mst@kernel.org>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-2-longpeng2@huawei.com>
 <20220110003243-mutt-send-email-mst@kernel.org>
 <df00e559133e45319fc9779916578975@huawei.com>
MIME-Version: 1.0
In-Reply-To: <df00e559133e45319fc9779916578975@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 06:27:05AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> 
> 
> > -----Original Message-----
> > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > Sent: Monday, January 10, 2022 1:43 PM
> > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>
> > Cc: stefanha@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> > cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> > <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> > <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> > Subject: Re: [RFC 01/10] virtio: get class_id and pci device id by the virtio
> > id
> > 
> > On Wed, Jan 05, 2022 at 08:58:51AM +0800, Longpeng(Mike) wrote:
> > > From: Longpeng <longpeng2@huawei.com>
> > >
> > > Add helpers to get the "Transitional PCI Device ID" and "class_id" of the
> > > deivce which is specificed by the "Virtio Device ID".
> > 
> > ton of typos here.
> > 
> 
> Will fix all in the V2.
> 
> > > These helpers will be used to build the generic vDPA device later.
> > >
> > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > ---
> > >  hw/virtio/virtio-pci.c | 93 ++++++++++++++++++++++++++++++++++++++++++
> > >  hw/virtio/virtio-pci.h |  4 ++
> > >  2 files changed, 97 insertions(+)
> > >
> > > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > > index 750aa47ec1..843085c4ea 100644
> > > --- a/hw/virtio/virtio-pci.c
> > > +++ b/hw/virtio/virtio-pci.c
> > > @@ -19,6 +19,7 @@
> > >
> > >  #include "exec/memop.h"
> > >  #include "standard-headers/linux/virtio_pci.h"
> > > +#include "standard-headers/linux/virtio_ids.h"
> > >  #include "hw/boards.h"
> > >  #include "hw/virtio/virtio.h"
> > >  #include "migration/qemu-file-types.h"
> > > @@ -213,6 +214,95 @@ static int virtio_pci_load_queue(DeviceState *d, int n,
> > QEMUFile *f)
> > >      return 0;
> > >  }
> > >
> > > +typedef struct VirtIOPCIIDInfo {
> > > +    uint16_t vdev_id; /* virtio id */
> > > +    uint16_t pdev_id; /* pci device id */
> > > +    uint16_t class_id;
> > > +} VirtIOPCIIDInfo;
> > 
> > 
> > if this is transitional as comment says make it explicit
> > in the names and comments.
> > 
> 
> OK.
> 
> > > +
> > > +static const VirtIOPCIIDInfo virtio_pci_id_info[] = {
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_NET,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_NET,
> > > +        .class_id = PCI_CLASS_NETWORK_ETHERNET,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_BLOCK,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_BLOCK,
> > > +        .class_id = PCI_CLASS_STORAGE_SCSI,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_CONSOLE,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_CONSOLE,
> > > +        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_SCSI,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_SCSI,
> > > +        .class_id = PCI_CLASS_STORAGE_SCSI,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_9P,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_9P,
> > > +        .class_id = PCI_BASE_CLASS_NETWORK,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_VSOCK,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_VSOCK,
> > > +        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_IOMMU,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_IOMMU,
> > > +        .class_id = PCI_CLASS_OTHERS,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_MEM,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_MEM,
> > > +        .class_id = PCI_CLASS_OTHERS,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_PMEM,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_PMEM,
> > > +        .class_id = PCI_CLASS_OTHERS,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_RNG,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_RNG,
> > > +        .class_id = PCI_CLASS_OTHERS,
> > > +    },
> > > +    {
> > > +        .vdev_id = VIRTIO_ID_BALLOON,
> > > +        .pdev_id = PCI_DEVICE_ID_VIRTIO_BALLOON,
> > > +        .class_id = PCI_CLASS_OTHERS,
> > > +    },
> > > +};
> > > +
> > 
> > 
> > this is the list from the spec:
> > 
> > 
> > So this is the list from the spec:
> > 
> > 0x1000 network card
> > 0x1001 block device
> > 0x1002 memory ballooning (traditional)
> > 0x1003 console
> > 0x1004 SCSI host
> > 0x1005 entropy source
> > 0x1009 9P transport
> > 
> 
> Why the following device IDs are introduced? They are non
> transitional devices.
> 
> #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
> #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
> #define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
> #define PCI_DEVICE_ID_VIRTIO_MEM         0x1015

Just a single place to put these things.
E.g. vsock id is used in more than 1 place.

> > 
> > I'd drop all the rest, use the algorithm for non transitional.
> > And when class is other I'd just not include it in the array,
> > make this the default.
> > 
> > 
> > 
> > > +static VirtIOPCIIDInfo virtio_pci_get_id_info(uint16_t vdev_id)
> > > +{
> > > +    VirtIOPCIIDInfo info = {};
> > > +    int i;
> > > +
> > > +    for (i = 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
> > > +        if (virtio_pci_id_info[i].vdev_id == vdev_id) {
> > > +            info = virtio_pci_id_info[i];
> > > +            break;
> > > +        }
> > > +    }
> > > +
> > > +    return info;
> > > +}
> > > +
> > > +uint16_t virtio_pci_get_pci_devid(uint16_t device_id)
> > > +{
> > > +    return virtio_pci_get_id_info(device_id).pdev_id;
> > > +}
> > > +
> > > +uint16_t virtio_pci_get_class_id(uint16_t device_id)
> > > +{
> > > +    return virtio_pci_get_id_info(device_id).class_id;
> > > +}
> > > +
> > >  static bool virtio_pci_ioeventfd_enabled(DeviceState *d)
> > >  {
> > >      VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
> > > @@ -1674,6 +1764,9 @@ static void virtio_pci_device_plugged(DeviceState *d,
> > Error **errp)
> > >           * is set to PCI_SUBVENDOR_ID_REDHAT_QUMRANET by default.
> > >           */
> > >          pci_set_word(config + PCI_SUBSYSTEM_ID,
> > virtio_bus_get_vdev_id(bus));
> > > +        if (proxy->pdev_id) {
> > > +            pci_config_set_device_id(config, proxy->pdev_id);
> > > +        }
> > >      } else {
> > >          /* pure virtio-1.0 */
> > >          pci_set_word(config + PCI_VENDOR_ID,
> > > diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> > > index 2446dcd9ae..06aa59436e 100644
> > > --- a/hw/virtio/virtio-pci.h
> > > +++ b/hw/virtio/virtio-pci.h
> > > @@ -146,6 +146,7 @@ struct VirtIOPCIProxy {
> > >      bool disable_modern;
> > >      bool ignore_backend_features;
> > >      OnOffAuto disable_legacy;
> > > +    uint16_t pdev_id;
> > >      uint32_t class_code;
> > >      uint32_t nvectors;
> > >      uint32_t dfselect;
> > > @@ -158,6 +159,9 @@ struct VirtIOPCIProxy {
> > >      VirtioBusState bus;
> > >  };
> > >
> > > +uint16_t virtio_pci_get_pci_devid(uint16_t device_id);
> > > +uint16_t virtio_pci_get_class_id(uint16_t device_id);
> > > +
> > >  static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
> > >  {
> > >      return !proxy->disable_modern;
> > > --
> > > 2.23.0


