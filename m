Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7600524645
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 08:59:48 +0200 (CEST)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np2nb-0007fD-Aj
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 02:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1np2kE-0006V0-FB
 for qemu-devel@nongnu.org; Thu, 12 May 2022 02:56:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1np2kB-0000Xt-3f
 for qemu-devel@nongnu.org; Thu, 12 May 2022 02:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652338574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zdfI2eol0flFOImP2CGnFTHR+uwwJHIQoC6mTFCfZg4=;
 b=bF0D3lwCCwY0TPvxeZ7pQIhz3csntehkqUNfCDUTnRadn4/iQLJEPB2IK0kRSk5MEWsa32
 H+dFi3udp7yqvn26WfyiS9OH6N2ZUMzbJ5zdm4C8Z5enLHX1pvFS9VoP4VEnNMPxxdkTa6
 Heb6wUs1DHezMFd8i/TC6LPHeQh616Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-RYZX5UXuMn6BIYWtWnjOwQ-1; Thu, 12 May 2022 02:56:12 -0400
X-MC-Unique: RYZX5UXuMn6BIYWtWnjOwQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so2580906edr.9
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 23:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zdfI2eol0flFOImP2CGnFTHR+uwwJHIQoC6mTFCfZg4=;
 b=nXCDOs2UJbBZDui0940gUrQu2hKMfxWwvhYnK518fRbR1eN9ZxZbPgt9djMOs+NiWJ
 nmQNfX4u8VDWZLY2GZt7FHBNDikjzpauaB4QBMfo4Ar6Ed+Zra00vqHr5XLVOjaceUOi
 QRsMHp2aWyR3V4PGsyyjUqH7viFyJgbULE5hC88QwiAWiuNMf9usT7tV45NVHM2c4pOu
 2yxViPgPOz9UGqJVywUMTXs4Ux8kt7R4CAuIvBT4hf1M1w8OLH2jKUQZx6qIBOc7ax8t
 +fAjCTQjiyXMBQQfFH/E6O+aMNzYx60Cua2z12AY6QI7GU7dUcfUQXqmUW0Qslv2VYnE
 lH4Q==
X-Gm-Message-State: AOAM532scVj9Q199utgwCmmyLfZFsyON30GVDjM4ZjUn7zRyf4+dIk3z
 QbMwR/49lWusfa8VhIHglO+lBL6g9PB1ct8QbaVkZEYxwdFjj+yQeoCeMDEVLqxPJmoQ3mHkU12
 DugWils1zfGknS1Q=
X-Received: by 2002:a17:907:2cc7:b0:6fa:88cf:c31a with SMTP id
 hg7-20020a1709072cc700b006fa88cfc31amr16018129ejc.471.1652338571517; 
 Wed, 11 May 2022 23:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC98CSKy1bASh0zqH4fM5HvbQlVZf64J1w32udqxc6Tecx6K7wKjLR3Ubrz/bBXmJFUj1TmA==
X-Received: by 2002:a17:907:2cc7:b0:6fa:88cf:c31a with SMTP id
 hg7-20020a1709072cc700b006fa88cfc31amr16018102ejc.471.1652338571221; 
 Wed, 11 May 2022 23:56:11 -0700 (PDT)
Received: from redhat.com ([2.55.42.2]) by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0042617ba63d4sm2130764edb.94.2022.05.11.23.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 23:56:10 -0700 (PDT)
Date: Thu, 12 May 2022 02:56:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/4] virtio: get class_id and pci device id by the
 virtio id
Message-ID: <20220512025113-mutt-send-email-mst@kernel.org>
References: <20220512062103.1875-1-longpeng2@huawei.com>
 <20220512062103.1875-3-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512062103.1875-3-longpeng2@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, May 12, 2022 at 02:21:01PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> Add helpers to get the "Transitional PCI Device ID" and "class_id"
> of the device specified by the "Virtio Device ID".
> 
> These helpers will be used to build the generic vDPA device later.
> 
> Signed-off-by: Longpeng <longpeng2@huawei.com>


Except, the IDs in the current header a broken. I just fixed them
and they will be hopefully OK in the next version.

> ---
>  hw/virtio/virtio-pci.c | 77 ++++++++++++++++++++++++++++++++++++++++++
>  hw/virtio/virtio-pci.h |  5 +++
>  2 files changed, 82 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 7cf1231c1c..fdfa205cee 100644
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
> @@ -212,6 +213,79 @@ static int virtio_pci_load_queue(DeviceState *d, int n, QEMUFile *f)
>      return 0;
>  }
>  
> +typedef struct VirtIOPCIIDInfo {
> +    /* virtio id */
> +    uint16_t vdev_id;
> +    /* pci device id for the transitional device */
> +    uint16_t trans_devid;
> +    uint16_t class_id;
> +} VirtIOPCIIDInfo;
> +
> +#define VIRTIO_TRANS_DEV_ID_INFO(name, class)       \
> +    {                                               \
> +        .vdev_id = VIRTIO_ID_##name,                \
> +        .trans_devid = PCI_DEVICE_ID_VIRTIO_##name, \
> +        .class_id = class,                          \
> +    }
> +
> +#define VIRTIO_MODERN_DEV_ID_NFO(name, class)       \
> +    {                                               \
> +        .vdev_id = VIRTIO_ID_##name,                \
> +        .class_id = class,                          \
> +    }
> +

No, I think I liked the original approach in the RFC better, even though
it duplicates a tiny bit of code.
This trick does not save a lot of typing and obscures the ID
use in case it's wrong (as was the case just recently).


> +static const VirtIOPCIIDInfo virtio_pci_id_info[] = {
> +    /* Non-transitional devices */
> +    VIRTIO_MODERN_DEV_ID_NFO(CRYPTO,    PCI_CLASS_OTHERS),
> +    VIRTIO_MODERN_DEV_ID_NFO(FS,        PCI_CLASS_STORAGE_OTHER),
> +    /* Transitional devices */
> +    VIRTIO_TRANS_DEV_ID_INFO(NET,       PCI_CLASS_NETWORK_ETHERNET),
> +    VIRTIO_TRANS_DEV_ID_INFO(BLOCK,     PCI_CLASS_STORAGE_SCSI),
> +    VIRTIO_TRANS_DEV_ID_INFO(CONSOLE,   PCI_CLASS_COMMUNICATION_OTHER),
> +    VIRTIO_TRANS_DEV_ID_INFO(SCSI,      PCI_CLASS_STORAGE_SCSI),
> +    VIRTIO_TRANS_DEV_ID_INFO(9P,        PCI_BASE_CLASS_NETWORK),
> +    VIRTIO_TRANS_DEV_ID_INFO(BALLOON,   PCI_CLASS_OTHERS),
> +    VIRTIO_TRANS_DEV_ID_INFO(RNG,       PCI_CLASS_OTHERS),
> +};
> +
> +static const VirtIOPCIIDInfo *virtio_pci_get_id_info(uint16_t vdev_id)
> +{
> +    const VirtIOPCIIDInfo *info = NULL;
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
> +        if (virtio_pci_id_info[i].vdev_id == vdev_id) {
> +            info = &virtio_pci_id_info[i];
> +            break;
> +        }
> +    }
> +
> +    if (!info) {
> +        /* The device id is invalid or not added to the id_info yet. */
> +        error_report("Invalid virtio device(id %u)", vdev_id);
> +        abort();
> +    }
> +
> +    return info;
> +}
> +
> +/*
> + * Get the Transitional Device ID for the specific device, return
> + * zero if the device is non-transitional.
> + */
> +uint16_t virtio_pci_get_trans_devid(uint16_t device_id)
> +{
> +    return virtio_pci_get_id_info(device_id)->trans_devid;
> +}
> +
> +/*
> + * Get the Class ID for the specific device.
> + */
> +uint16_t virtio_pci_get_class_id(uint16_t device_id)
> +{
> +    return virtio_pci_get_id_info(device_id)->class_id;
> +}
> +
>  static bool virtio_pci_ioeventfd_enabled(DeviceState *d)
>  {
>      VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
> @@ -1675,6 +1749,9 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
>           * is set to PCI_SUBVENDOR_ID_REDHAT_QUMRANET by default.
>           */
>          pci_set_word(config + PCI_SUBSYSTEM_ID, virtio_bus_get_vdev_id(bus));
> +        if (proxy->trans_devid) {
> +            pci_config_set_device_id(config, proxy->trans_devid);
> +        }
>      } else {
>          /* pure virtio-1.0 */
>          pci_set_word(config + PCI_VENDOR_ID,
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index 2446dcd9ae..f08665cd1b 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -146,6 +146,8 @@ struct VirtIOPCIProxy {
>      bool disable_modern;
>      bool ignore_backend_features;
>      OnOffAuto disable_legacy;
> +    /* Transitional device id */
> +    uint16_t trans_devid;
>      uint32_t class_code;
>      uint32_t nvectors;
>      uint32_t dfselect;
> @@ -158,6 +160,9 @@ struct VirtIOPCIProxy {
>      VirtioBusState bus;
>  };
>  
> +uint16_t virtio_pci_get_trans_devid(uint16_t device_id);
> +uint16_t virtio_pci_get_class_id(uint16_t device_id);
> +
>  static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
>  {
>      return !proxy->disable_modern;
> -- 
> 2.23.0


