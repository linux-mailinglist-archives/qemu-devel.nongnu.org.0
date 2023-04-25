Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCB16EE019
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 12:20:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prFky-0008Mi-3K; Tue, 25 Apr 2023 06:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1prFkw-0008MY-5S
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:18:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1prFku-0006rS-1J
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682417917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PinR+wdFDYdQhNVKSdPMP/vc/Ir7J1psoVnCyqrU+I=;
 b=LqNuF12tIM/uscABf8B8AwzQVHpTS/86cIU7HEhcwwaCcm0EedodcBvN0vfuZ8KKgs7Dnt
 nkszerDEN4RQWwQ36e2v5eRXAPkj7BmE4H6ToB35i1WS7MJ6DRrf1DeLnRc2uf2YQq/1FG
 MWLVPZXGpzGddFtCns4gcpntJMKmFqU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-3L9XtnpWMia86Rrx2_wrsA-1; Tue, 25 Apr 2023 06:18:36 -0400
X-MC-Unique: 3L9XtnpWMia86Rrx2_wrsA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB481884EC9;
 Tue, 25 Apr 2023 10:18:35 +0000 (UTC)
Received: from [10.39.192.74] (unknown [10.39.192.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E77AA492C13;
 Tue, 25 Apr 2023 10:18:33 +0000 (UTC)
Message-ID: <9da2e70a-82b1-8654-d537-8a0a8953e1a5@redhat.com>
Date: Tue, 25 Apr 2023 12:18:32 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] pci: make ROM memory resizable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 den-plotnikov@yandex-team.ru, Gerd Hoffmann <kraxel@redhat.com>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230425031348-mutt-send-email-mst@kernel.org>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230425031348-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/25/23 09:26, Michael S. Tsirkin wrote:
> On Mon, Apr 24, 2023 at 11:36:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On migration, on target we load local ROM file. But actual ROM content
>> migrates through migration channel. Original ROM content from local
>> file doesn't matter. But when size mismatch - we have an error like
>>
>>  Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
> 
> 
> Oh, this is this old bug then:
> https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1713490
> 
> People seem to be "fixing" this by downgrading ROMs.
> 
> Actually, I think the fix is different: we need to build
> versions of ROMs for old machine types that can fit
> in the old BAR size.

My working memory has been that we'd build the ROM, such as SeaBIOS, in
multiple configs (resulting in different sizes -- a smaller size for the
old machine type, and a larger size for the new machine type). The new
(large) build would stay "bios.bin", and the old (small) binary would
get a new name. Then the old machine type's compat knobs would include a
setting for loading the old (= small) ROM. This would cause the
destination QEMU to size the ROM area as "small", which would
accommodate the incoming stream just fine.

However, my memory has not been (entirely) correct. Commit bcf2b7d2af7c
("pc: switch 2.0 machine types to large seabios binary", 2013-12-06)
indicates that the *new* (large) binary gets the new name. That confuses
me; it does not seem consistent with how compat knobs usually tie down
old machine types.

It does not change the mechanism, I think, but naming the ROM files (on
host distros) gets more complicated, perhaps. I think Gerd will know
more history.

Laszlo

> 
> Gerd, Laszlo what's your take on all this?
> 
> 
> 
>> Let's just allow resizing of ROM memory. This way migration is not
>> relate on local ROM file on target node which is loaded by default but
>> is not actually needed.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>  hw/pci/pci.c          |  7 +++++--
>>  include/exec/memory.h | 26 ++++++++++++++++++++++++++
>>  softmmu/memory.c      | 39 +++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 70 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index def5000e7b..72ee8f6aea 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -59,6 +59,8 @@
>>  # define PCI_DPRINTF(format, ...)       do { } while (0)
>>  #endif
>>  
>> +#define MAX_ROM_SIZE (2 * GiB)
>> +
>>  bool pci_available = true;
>>  
>>  static char *pcibus_get_dev_path(DeviceState *dev);
>> @@ -2341,7 +2343,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>          error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
>>          g_free(path);
>>          return;
>> -    } else if (size > 2 * GiB) {
>> +    } else if (size > MAX_ROM_SIZE) {
>>          error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
>>                     pdev->romfile);
>>          g_free(path);
>> @@ -2366,7 +2368,8 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>          snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
>>      }
>>      pdev->has_rom = true;
>> -    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
>> +    memory_region_init_rom_resizable(&pdev->rom, OBJECT(pdev), name,
>> +                                     pdev->romsize, MAX_ROM_SIZE, &error_fatal);
>>      ptr = memory_region_get_ram_ptr(&pdev->rom);
>>      if (load_image_size(path, ptr, size) < 0) {
>>          error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 15ade918ba..ed1e5d9126 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -1453,6 +1453,19 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
>>                                        uint64_t size,
>>                                        Error **errp);
>>  
>> +/*
>> + * memory_region_init_rom_nomigrate_resizable: same as
>> + * memory_region_init_rom_nomigrate(), but initialize resizable memory region.
>> + *
>> + * @max_size maximum allowed size.
>> + */
>> +void memory_region_init_rom_nomigrate_resizable(MemoryRegion *mr,
>> +                                                struct Object *owner,
>> +                                                const char *name,
>> +                                                uint64_t size,
>> +                                                uint64_t max_size,
>> +                                                Error **errp);
>> +
>>  /**
>>   * memory_region_init_rom_device_nomigrate:  Initialize a ROM memory region.
>>   *                                 Writes are handled via callbacks.
>> @@ -1562,6 +1575,19 @@ void memory_region_init_rom(MemoryRegion *mr,
>>                              uint64_t size,
>>                              Error **errp);
>>  
>> +/*
>> + * memory_region_init_rom_resizable: same as memory_region_init_rom(),
>> + * but initialize resizable memory region.
>> + *
>> + * @max_size maximum allowed size.
>> + */
>> +void memory_region_init_rom_resizable(MemoryRegion *mr,
>> +                                      struct Object *owner,
>> +                                      const char *name,
>> +                                      uint64_t size,
>> +                                      uint64_t max_size,
>> +                                      Error **errp);
>> +
>>  /**
>>   * memory_region_init_rom_device:  Initialize a ROM memory region.
>>   *                                 Writes are handled via callbacks.
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index b1a6cae6f5..744d03bc02 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1701,6 +1701,18 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
>>      mr->readonly = true;
>>  }
>>  
>> +void memory_region_init_rom_nomigrate_resizable(MemoryRegion *mr,
>> +                                                struct Object *owner,
>> +                                                const char *name,
>> +                                                uint64_t size,
>> +                                                uint64_t max_size,
>> +                                                Error **errp)
>> +{
>> +    memory_region_init_resizeable_ram(mr, owner, name, size, max_size, NULL,
>> +                                      errp);
>> +    mr->readonly = true;
>> +}
>> +
>>  void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
>>                                               Object *owner,
>>                                               const MemoryRegionOps *ops,
>> @@ -3580,6 +3592,33 @@ void memory_region_init_rom(MemoryRegion *mr,
>>      vmstate_register_ram(mr, owner_dev);
>>  }
>>  
>> +void memory_region_init_rom_resizable(MemoryRegion *mr,
>> +                                      struct Object *owner,
>> +                                      const char *name,
>> +                                      uint64_t size,
>> +                                      uint64_t max_size,
>> +                                      Error **errp)
>> +{
>> +    DeviceState *owner_dev;
>> +    Error *err = NULL;
>> +
>> +    memory_region_init_rom_nomigrate_resizable(mr, owner, name, size, max_size,
>> +                                               &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    /*
>> +     * This will assert if owner is neither NULL nor a DeviceState.
>> +     * We only want the owner here for the purposes of defining a
>> +     * unique name for migration. TODO: Ideally we should implement
>> +     * a naming scheme for Objects which are not DeviceStates, in
>> +     * which case we can relax this restriction.
>> +     */
>> +    owner_dev = DEVICE(owner);
>> +    vmstate_register_ram(mr, owner_dev);
>> +}
>> +
>>  void memory_region_init_rom_device(MemoryRegion *mr,
>>                                     Object *owner,
>>                                     const MemoryRegionOps *ops,
>> -- 
>> 2.34.1
> 


