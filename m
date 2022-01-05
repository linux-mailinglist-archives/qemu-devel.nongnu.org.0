Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34398485167
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:49:10 +0100 (CET)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53qv-0003HP-3u
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:49:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1n53oX-0001fW-ND
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1n53oU-0001mP-St
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641379597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VqcHLM5VTs9Do7SviOCqE3UBU+Qj+o+2sv0S9Z5D53s=;
 b=b8d8ZYZJLgp7onJdf3EQYA3e1D1hFS/rvc+XEUIXQ2falipvd3sD1bLZ6aaQbWyQlH+Mfw
 AD9u4JmNFfNT3MviAwD+VRwqsvh1QGz6HM7RAKo1n03cRLWHY19cW/FlYOm2LudibV8X/J
 wL1mo87cYEbJK4LDCqQktU7Ir8kTZ0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-jQOPB3qCONuZABmg_JrGsw-1; Wed, 05 Jan 2022 05:46:32 -0500
X-MC-Unique: jQOPB3qCONuZABmg_JrGsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4B248042DB;
 Wed,  5 Jan 2022 10:46:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1FE3752DA;
 Wed,  5 Jan 2022 10:46:06 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com
Subject: Re: [RFC 01/10] virtio: get class_id and pci device id by the
 virtio id
In-Reply-To: <20220105005900.860-2-longpeng2@huawei.com>
Organization: Red Hat GmbH
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-2-longpeng2@huawei.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 05 Jan 2022 11:46:04 +0100
Message-ID: <87h7aiwjdf.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: qemu-devel@nongnu.org, yechuan@huawei.com, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com, Longpeng <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05 2022, "Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> From: Longpeng <longpeng2@huawei.com>
>
> Add helpers to get the "Transitional PCI Device ID" and "class_id" of the
> deivce which is specificed by the "Virtio Device ID".
>
> These helpers will be used to build the generic vDPA device later.
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  hw/virtio/virtio-pci.c | 93 ++++++++++++++++++++++++++++++++++++++++++
>  hw/virtio/virtio-pci.h |  4 ++
>  2 files changed, 97 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 750aa47ec1..843085c4ea 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -19,6 +19,7 @@
>  
>  #include "exec/memop.h"
>  #include "standard-headers/linux/virtio_pci.h"
> +#include "standard-headers/linux/virtio_ids.h"
>  #include "hw/boards.h"
>  #include "hw/virtio/virtio.h"
>  #include "migration/qemu-file-types.h"
> @@ -213,6 +214,95 @@ static int virtio_pci_load_queue(DeviceState *d, int n, QEMUFile *f)
>      return 0;
>  }
>  
> +typedef struct VirtIOPCIIDInfo {
> +    uint16_t vdev_id; /* virtio id */
> +    uint16_t pdev_id; /* pci device id */
> +    uint16_t class_id;
> +} VirtIOPCIIDInfo;
> +
> +static const VirtIOPCIIDInfo virtio_pci_id_info[] = {
> +    {
> +        .vdev_id = VIRTIO_ID_NET,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_NET,
> +        .class_id = PCI_CLASS_NETWORK_ETHERNET,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_BLOCK,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_BLOCK,
> +        .class_id = PCI_CLASS_STORAGE_SCSI,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_CONSOLE,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_CONSOLE,
> +        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_SCSI,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_SCSI,
> +        .class_id = PCI_CLASS_STORAGE_SCSI,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_9P,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_9P,
> +        .class_id = PCI_BASE_CLASS_NETWORK,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_VSOCK,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_VSOCK,
> +        .class_id = PCI_CLASS_COMMUNICATION_OTHER,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_IOMMU,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_IOMMU,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_MEM,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_MEM,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_PMEM,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_PMEM,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_RNG,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_RNG,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +    {
> +        .vdev_id = VIRTIO_ID_BALLOON,
> +        .pdev_id = PCI_DEVICE_ID_VIRTIO_BALLOON,
> +        .class_id = PCI_CLASS_OTHERS,
> +    },
> +};
> +
> +static VirtIOPCIIDInfo virtio_pci_get_id_info(uint16_t vdev_id)
> +{
> +    VirtIOPCIIDInfo info = {};
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
> +        if (virtio_pci_id_info[i].vdev_id == vdev_id) {
> +            info = virtio_pci_id_info[i];
> +            break;
> +        }
> +    }
> +
> +    return info;
> +}
> +
> +uint16_t virtio_pci_get_pci_devid(uint16_t device_id)
> +{
> +    return virtio_pci_get_id_info(device_id).pdev_id;
> +}
> +
> +uint16_t virtio_pci_get_class_id(uint16_t device_id)
> +{
> +    return virtio_pci_get_id_info(device_id).class_id;
> +}

What happens if these functions are called for a device_id that is not
in the array, e.g. if we forgot to add a new id to the array?

Can the array be generated in some way?


