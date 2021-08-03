Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005A53DEFB7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:06:23 +0200 (CEST)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAv3m-0006Zh-3D
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mAv2Z-0005to-Dq
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:05:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mAv2X-0003rR-LZ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627999504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lQjpJBfe7ixCSIHdo3qfIvUJv6WlKpjL8sQhG9t8Uas=;
 b=JAxAtIedmcCAxpykWZUyxWWOgKa5BshwTauX39kaMcTKvscK62sEygtWMacDyJ24SSxtSu
 w3mIoBq/IgDZgOweEzB6CquCjf7dCxGsuGYdveoub4Z0xs4V14JTxk9fTFmFIxfCC+/a2k
 p37XwmCx2g5GUHUcTx3iQOCpg7ghfHE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-MeAytIG-PcCwGIz38vGQrg-1; Tue, 03 Aug 2021 10:05:03 -0400
X-MC-Unique: MeAytIG-PcCwGIz38vGQrg-1
Received: by mail-wr1-f70.google.com with SMTP id
 j16-20020a5d44900000b02901549fdfd4fcso556277wrq.6
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 07:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lQjpJBfe7ixCSIHdo3qfIvUJv6WlKpjL8sQhG9t8Uas=;
 b=jDWk90yY8MJgoInJ5P/Zz3/vgcL2CKjhudNKdA/cuhiPBMBsSmAcptC+AtQSs22rjv
 jEVuBSLkbDkqIpt8tr1b1dZXJu2zEgfURRlCpht7s4w+AGaoQQVa1eRcgobaO6fN6Pfw
 VacQxZPIEPZFcPIlgde5NdFAWfInvkYtsa/IOwcPVPuWG7ZP6Z3qBU3W+fe5fujAXZYI
 JxvrNVxwe3Dom0YLCZXBkENViCGRhTDgZU7BN9vbcH0t0Knz558jHv0kCn3feZzjbEvB
 bb9ixsaqWEr5vUe34GlGHPpv9ppcMchY0NJ0U5PInquFEo5O/yVUrr5lbKhiyM6gs/b8
 K9jA==
X-Gm-Message-State: AOAM5321CA2JKqNkYZ4x0bAB2nnCBY7sx7UvRQDsMOYLup1nXmhP0dbn
 I49o7cT8rWmTznkWnx/aJj/OP1UTcUjdl1EEkr+myTd+WWm0Rz8BCfACP7CdfIU62/gAvEC5eRv
 zzSvb6Y6kYABC9Co=
X-Received: by 2002:a5d:690e:: with SMTP id t14mr23126378wru.258.1627999500130; 
 Tue, 03 Aug 2021 07:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuqc3w1e8C2MGh14137rMmVMF8d9CObSFiqZfbPmghBAplERhbLyBwlJbwdHeTs0PiKALuYA==
X-Received: by 2002:a5d:690e:: with SMTP id t14mr23126342wru.258.1627999499896; 
 Tue, 03 Aug 2021 07:04:59 -0700 (PDT)
Received: from redhat.com ([2.55.25.136])
 by smtp.gmail.com with ESMTPSA id d15sm14443695wrn.28.2021.08.03.07.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:04:59 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:04:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v4] failover: unregister ROM on unplug
Message-ID: <20210803100031-mutt-send-email-mst@kernel.org>
References: <20210721160905.234915-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721160905.234915-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Build fails on qemu-system-m68k:

/usr/bin/ld: libqemu-m68k-softmmu.fa.p/hw_net_virtio-net.c.o: in function `virtio_net_handle_migration_primary':
/scm/qemu/build/../hw/net/virtio-net.c:3259: undefined reference to `pci_del_option_rom'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.
make[1]: *** [Makefile:154: run-ninja] Error 1

It's not pretty to poke at pci from generic virtio.
Should we maybe wrap vmstate_unregister and pci_del_option_rom
to allow removing all migrateable things related to the device
in one go somehow?


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


