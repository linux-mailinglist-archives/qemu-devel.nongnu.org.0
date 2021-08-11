Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08543E8A97
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:54:08 +0200 (CEST)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDi7r-0008IF-Ng
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mDi4C-0003a2-Ry
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:50:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mDi4A-0005Pd-1S
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628664616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YsjWiQKV02IRCkvVhkoSCI/AeQALM1qKNolVtX74vqc=;
 b=axUfpFU04XOwIhLZ+ViObv4yfCqVn4CSaPnby+53hT+KFwV7OjNRU5ljw4/74ir/ZTb5bf
 9D8nM7ybnk4X7gpPhnKCEVyIi9poAe2brDRLBNhJIUkDdBAWglMr4Mx3se2TaIxvoGOUS4
 smo1AEGLp8OJWV5MIJ4g/asRzQyR19Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-9ALPgPXLOLiY8qaMbo5qYw-1; Wed, 11 Aug 2021 02:50:15 -0400
X-MC-Unique: 9ALPgPXLOLiY8qaMbo5qYw-1
Received: by mail-ed1-f72.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso735724edh.6
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 23:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YsjWiQKV02IRCkvVhkoSCI/AeQALM1qKNolVtX74vqc=;
 b=oA4FfVfckiUqF2u3apKkiLUVVsIkc0HvOx9FnMbpSJMQTZ5PxbCwN9l2lBaPmRxlw7
 4K2PDEdYK8/WQseHVAZTsF2lDsPqIWk0y2jI4rQrZSHxAtY7xnoAhAQBfbI1t49X4gEh
 489W4xNLokEDuMkG8DirSJltBbZajnL9XBpKcMJQNuNlyyfcxNHytYw16zqRf1MKIOsV
 ejyAtF/7nEVVc7TJdek9rGTuNRO+cCQodqE1wSZwJykMIfztDkVTAp4zwPidj0kziklj
 78NVs6QhFBbymFiqsnB6C9duyl+rKSKgs9PFiqtXr3RKcCcyx7WXXXZMIDV1teEhPPqt
 rPVg==
X-Gm-Message-State: AOAM532bKTe1zXThpL5chdZmpin8glHAQgNGNHIklsA1YRqfYdJHpzPu
 TnLF186Fh8hJBlS/IEGT+k1QFdLR+YP91G1drxWxbEG0++G6mZk4Rz/5UXbqYDbyBGOJ/nUecXj
 mv7pjXWWiDmltFuo=
X-Received: by 2002:a05:6402:1514:: with SMTP id
 f20mr9695480edw.336.1628664612155; 
 Tue, 10 Aug 2021 23:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmBn+5aMAjKoaVAV5D9Q6Q1z57H97Ef6xHnxheHf9gXyHuuhS+dahBmDO2aU7QdCodNsSp7Q==
X-Received: by 2002:a05:6402:1514:: with SMTP id
 f20mr9695451edw.336.1628664611908; 
 Tue, 10 Aug 2021 23:50:11 -0700 (PDT)
Received: from redhat.com ([2.55.156.103])
 by smtp.gmail.com with ESMTPSA id f26sm10720013edu.4.2021.08.10.23.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 23:50:09 -0700 (PDT)
Date: Wed, 11 Aug 2021 02:50:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v4] failover: unregister ROM on unplug
Message-ID: <20210811024801-mutt-send-email-mst@kernel.org>
References: <20210721160905.234915-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721160905.234915-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 06:09:05PM +0200, Laurent Vivier wrote:
> The intend of failover is to allow to migrate a VM with a VFIO
> networking card without disrupting the network operation by switching
> to a virtio-net device during the migration.
> 
> This simple change allows to test failover with a simulated device
> like e1000e rather than a vfio device, even if it's useless in real
> life it can help to debug failover.
> 
> This is interesting to developers that want to test failover on
> a system with no vfio device. Moreover it simplifies host networking
> configuration as we can use the same bridge for virtio-net and
> the other failover networking device.
> 
> Without this change the migration of a system configured with failover
> fails with:
> 
>   ...
>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>   -device e1000,failover_pair_id=virtionet0,... \
>   ...
> 
>   (qemu) migrate ...
> 
>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>   error while loading state for instance 0x0 of device 'ram'
>   load of migration failed: Invalid argument
> 
> This happens because QEMU correctly unregisters the interface vmstate but
> not the ROM one. This patch fixes that.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

I began to wonder about this. Why are we sending the option ROM at all?
I think there's no need to do it for the primary ...

> ---
> 
> Notes:
>     v4:
>       export and use pci_del_option_rom()
>     
>     v3:
>       remove useless space before comma
>     
>     v2:
>       reset has_rom to false
>       update commit log message
> 
>  include/hw/pci/pci.h | 2 ++
>  hw/net/virtio-net.c  | 1 +
>  hw/pci/pci.c         | 3 +--
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d0f4266e3725..84707034cbf8 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -369,6 +369,8 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
>  void pci_unregister_vga(PCIDevice *pci_dev);
>  pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
>  
> +void pci_del_option_rom(PCIDevice *pdev);
> +
>  int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>                         uint8_t offset, uint8_t size,
>                         Error **errp);
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee52a..d6f03633f1b3 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3256,6 +3256,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
>      if (migration_in_setup(s) && !should_be_hidden) {
>          if (failover_unplug_primary(n, dev)) {
>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
> +            pci_del_option_rom(PCI_DEVICE(dev));
>              qapi_event_send_unplug_primary(dev->id);
>              qatomic_set(&n->failover_primary_hidden, true);
>          } else {
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 23d2ae2ab232..c210d92b5ba7 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -228,7 +228,6 @@ static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
>  static void pci_update_mappings(PCIDevice *d);
>  static void pci_irq_handler(void *opaque, int irq_num, int level);
>  static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
> -static void pci_del_option_rom(PCIDevice *pdev);
>  
>  static uint16_t pci_default_sub_vendor_id = PCI_SUBVENDOR_ID_REDHAT_QUMRANET;
>  static uint16_t pci_default_sub_device_id = PCI_SUBDEVICE_ID_QEMU;
> @@ -2429,7 +2428,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>      pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
>  }
>  
> -static void pci_del_option_rom(PCIDevice *pdev)
> +void pci_del_option_rom(PCIDevice *pdev)
>  {
>      if (!pdev->has_rom)
>          return;
> -- 
> 2.31.1


