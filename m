Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC84B3DF0C7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:51:12 +0200 (CEST)
Received: from localhost ([::1]:36560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvl9-0003mt-J6
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mAvjw-0002IT-A1
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mAvju-0001Uz-JK
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628002192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kY6rZCi8mk/iNrtpnbCqnwWrcXYSGIhAU0iabxUm4I0=;
 b=GwoN23cZtiUIjChSBmsV9blwXcT6LiJv/5dvzjyTBL5dcsbDMWMrEQLCaxxax/J5uhez8i
 5iIJh+z0D+4HG189QPVlBZ/JqFCHHlPKojhP71g0Y7GVmEfhQ2ZU3uxXdGoVxoYqBS/kjg
 iUTbQmuLf1HxRHU7DjRzXhBmrLgHiIQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-a5OfwQcSPiiNa6Nf_j0ZdQ-1; Tue, 03 Aug 2021 10:49:52 -0400
X-MC-Unique: a5OfwQcSPiiNa6Nf_j0ZdQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m37-20020a05600c3b25b02902b5a02478adso42815wms.0
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 07:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kY6rZCi8mk/iNrtpnbCqnwWrcXYSGIhAU0iabxUm4I0=;
 b=KC66aG8v8U7XSHb6pjXyP7Z8/L4X0ycCOyIAr8b6wYoXu3Nq6GZeoEClwWltn7DePA
 CnVc6MldoJoeLLAVDlb7v+fhDxQEcwZ/97m0+35MjaKFqRvG37N2N5Lw3YWKBLnp48ZK
 mFJRJzoY6+L2b4KoF/3gMyhHn37wLf0cwZZkWSoepzFQ/YeutAfGx82HIZwkxtFCPYQV
 38V9K+oKpY1UQQg1ZwcHuGIMb+9c/R/qbs8Afb2AAVkrwwTDTTpbn/nEG2ZwE8DZ8h4l
 jsR+AiUFUcRLmGugLqKufnBRsKjM2e7tc8Av25qB1KMPSh+vhlRWwBqVnVvGHNApGQyI
 WuXw==
X-Gm-Message-State: AOAM5305m5IZCiDlpOYdexcQJcQD268BLaWbBHynXeSTWuh3fGHzD0ST
 /1DCrZDXDjOOAry5fEYnDBXNQROaO1jhy3kLW+yJCqPvDzEjVEYA3gFGBJ+G47/IAz0FzpCcrhf
 LiPV6Xn//IpEcuvM=
X-Received: by 2002:adf:fe44:: with SMTP id m4mr15749098wrs.133.1628002189942; 
 Tue, 03 Aug 2021 07:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRcQ/LoLI3K1sJONz4vOQ5cgVVw9w/BhUXqQAfmCDbBre1ctanHEVIyibjsNa4O/Bbr00dOg==
X-Received: by 2002:adf:fe44:: with SMTP id m4mr15749068wrs.133.1628002189649; 
 Tue, 03 Aug 2021 07:49:49 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.182])
 by smtp.gmail.com with ESMTPSA id u13sm15810780wmj.14.2021.08.03.07.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 07:49:49 -0700 (PDT)
Subject: Re: [PATCH v4] failover: unregister ROM on unplug
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210721160905.234915-1-lvivier@redhat.com>
 <20210803100031-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <9da7b1c8-6d33-b91d-808f-7635154a8a0d@redhat.com>
Date: Tue, 3 Aug 2021 16:49:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803100031-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/08/2021 16:04, Michael S. Tsirkin wrote:
> On Wed, Jul 21, 2021 at 06:09:05PM +0200, Laurent Vivier wrote:
>> The intend of failover is to allow to migrate a VM with a VFIO
>> networking card without disrupting the network operation by switching
>> to a virtio-net device during the migration.
>>
>> This simple change allows to test failover with a simulated device
>> like e1000e rather than a vfio device, even if it's useless in real
>> life it can help to debug failover.
>>
>> This is interesting to developers that want to test failover on
>> a system with no vfio device. Moreover it simplifies host networking
>> configuration as we can use the same bridge for virtio-net and
>> the other failover networking device.
>>
>> Without this change the migration of a system configured with failover
>> fails with:
>>
>>   ...
>>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>>   -device e1000,failover_pair_id=virtionet0,... \
>>   ...
>>
>>   (qemu) migrate ...
>>
>>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>>   error while loading state for instance 0x0 of device 'ram'
>>   load of migration failed: Invalid argument
>>
>> This happens because QEMU correctly unregisters the interface vmstate but
>> not the ROM one. This patch fixes that.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> 
> Build fails on qemu-system-m68k:
> 
> /usr/bin/ld: libqemu-m68k-softmmu.fa.p/hw_net_virtio-net.c.o: in function `virtio_net_handle_migration_primary':
> /scm/qemu/build/../hw/net/virtio-net.c:3259: undefined reference to `pci_del_option_rom'
> collect2: error: ld returned 1 exit status
> ninja: build stopped: subcommand failed.
> make[1]: *** [Makefile:154: run-ninja] Error 1
> 
> It's not pretty to poke at pci from generic virtio.

I agree with you. The problem is failover is implemented in virtio-net while it relies on
virtio-pci hotplug capability.

> Should we maybe wrap vmstate_unregister and pci_del_option_rom
> to allow removing all migrateable things related to the device
> in one go somehow?

I'm going to have a look to see how to do.

I have already a patch that moves all the failover PCI unplug/hotplug functions into the
PCI device implementation (and removes all this stuff from virtio-net). Perhaps we can
rely on that. The bonus with this moves is it allows to automatically unplug/hotplug any
PCI device during a migration without the failover environment (but failover uses it).

Thanks,
Laurent

> 
>> ---
>>
>> Notes:
>>     v4:
>>       export and use pci_del_option_rom()
>>     
>>     v3:
>>       remove useless space before comma
>>     
>>     v2:
>>       reset has_rom to false
>>       update commit log message
>>
>>  include/hw/pci/pci.h | 2 ++
>>  hw/net/virtio-net.c  | 1 +
>>  hw/pci/pci.c         | 3 +--
>>  3 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index d0f4266e3725..84707034cbf8 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -369,6 +369,8 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
>>  void pci_unregister_vga(PCIDevice *pci_dev);
>>  pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
>>  
>> +void pci_del_option_rom(PCIDevice *pdev);
>> +
>>  int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>>                         uint8_t offset, uint8_t size,
>>                         Error **errp);
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 16d20cdee52a..d6f03633f1b3 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -3256,6 +3256,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
>>      if (migration_in_setup(s) && !should_be_hidden) {
>>          if (failover_unplug_primary(n, dev)) {
>>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
>> +            pci_del_option_rom(PCI_DEVICE(dev));
>>              qapi_event_send_unplug_primary(dev->id);
>>              qatomic_set(&n->failover_primary_hidden, true);
>>          } else {
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 23d2ae2ab232..c210d92b5ba7 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -228,7 +228,6 @@ static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
>>  static void pci_update_mappings(PCIDevice *d);
>>  static void pci_irq_handler(void *opaque, int irq_num, int level);
>>  static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
>> -static void pci_del_option_rom(PCIDevice *pdev);
>>  
>>  static uint16_t pci_default_sub_vendor_id = PCI_SUBVENDOR_ID_REDHAT_QUMRANET;
>>  static uint16_t pci_default_sub_device_id = PCI_SUBDEVICE_ID_QEMU;
>> @@ -2429,7 +2428,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>      pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
>>  }
>>  
>> -static void pci_del_option_rom(PCIDevice *pdev)
>> +void pci_del_option_rom(PCIDevice *pdev)
>>  {
>>      if (!pdev->has_rom)
>>          return;
>> -- 
>> 2.31.1
> 


