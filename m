Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF5030BC89
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:06:35 +0100 (CET)
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tVy-0007Aq-6s
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l6tSw-0005cH-MW
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:03:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l6tSu-000354-TZ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612263804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RybwoWBbUlULibvi7OVGX9CCZWLVxD5tb0RcX2hm8c4=;
 b=NqU1QdFCB6Yn1CC3co3xOg2IWNFDR+NESIn3zS61KEi6spdaa/GMQUvkGfegxTl5P6kA0J
 yZd+jCP/924PlTASupsGdPXYslWyf6+hachr6PXLCqxHfnDqVF5n9D71vF1z0bwAXXcwiW
 QjwXGbMmfk9zjWMQGiEogtTmDl7hN+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-E3Ba7V-XMAKwRNnSVK1aZg-1; Tue, 02 Feb 2021 06:03:17 -0500
X-MC-Unique: E3Ba7V-XMAKwRNnSVK1aZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3EC10CE781;
 Tue,  2 Feb 2021 11:03:16 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-241.ams2.redhat.com
 [10.36.115.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E9775D9D5;
 Tue,  2 Feb 2021 11:03:08 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] pci: add romsize property
To: David Edmondson <dme@dme.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-3-pbonzini@redhat.com> <cunpn1ilr7e.fsf@dme.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <857aaca7-dce4-5ae6-d3b5-1c3bbf9e9b17@redhat.com>
Date: Tue, 2 Feb 2021 12:03:08 +0100
MIME-Version: 1.0
In-Reply-To: <cunpn1ilr7e.fsf@dme.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: dgilbert@redhat.com, peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/21 11:05, David Edmondson wrote:
> On Friday, 2021-01-29 at 20:28:38 +01, Paolo Bonzini wrote:
> 
>> This property can be useful for distros to set up known-good ROM sizes for
>> migration purposes.  The VM will fail to start if the ROM is too large,
>> and migration compatibility will not be broken if the ROM is too small.
>>
>> Note that even though romsize is a uint32_t, it has to be between 1
>> (because empty ROM files are not accepted, and romsize must be greater
>> than the file) and 2^31 (because values above are not powers of two and
>> are rejected).
>>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  hw/pci/pci.c             | 19 +++++++++++++++++--
>>  hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
>>  include/hw/pci/pci.h     |  1 +
>>  3 files changed, 30 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index bbce10050b..5b3fe3c294 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -68,6 +68,7 @@ static void pcibus_reset(BusState *qbus);
>>  static Property pci_props[] = {
>>      DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
>>      DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
>> +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
>>      DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
>>      DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
>>                      QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
>> @@ -2107,6 +2108,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>>      bool is_default_rom;
>>      uint16_t class_id;
>>  
>> +    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
>> +        error_setg(errp, "ROM size %d is not a power of two", pci_dev->romsize);
>> +        return;
> 
> It would be nice to be consistent with the format type when reporting
> errors - it's %d here...
> 
>> +    }
>> +
>>      /* initialize cap_present for pci_is_express() and pci_config_size(),
>>       * Note that hybrid PCIs are not set automatically and need to manage
>>       * QEMU_PCI_CAP_EXPRESS manually */
>> @@ -2372,7 +2378,16 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>          g_free(path);
>>          return;
>>      }
>> -    size = pow2ceil(size);
>> +    if (pdev->romsize != -1) {
>> +        if (size > pdev->romsize) {
>> +            error_setg(errp, "romfile \"%s\" (%u bytes) is too large for ROM size %u",
>> +                       pdev->romfile, (uint32_t)size, pdev->romsize);
> 
> %u here...
> 
>> +            g_free(path);
>> +            return;
>> +        }
>> +    } else {
>> +        pdev->romsize = pow2ceil(size);
>> +    }
>>  
>>      vmsd = qdev_get_vmsd(DEVICE(pdev));
>>  
>> @@ -2382,7 +2397,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>>          snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pdev)));
>>      }
>>      pdev->has_rom = true;
>> -    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, size, &error_fatal);
>> +    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &error_fatal);
>>      ptr = memory_region_get_ram_ptr(&pdev->rom);
>>      if (load_image_size(path, ptr, size) < 0) {
>>          error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
>> diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
>> index a50a80837e..153812f8cd 100644
>> --- a/hw/xen/xen_pt_load_rom.c
>> +++ b/hw/xen/xen_pt_load_rom.c
>> @@ -53,10 +53,20 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
>>      }
>>      fseek(fp, 0, SEEK_SET);
>>  
>> +    if (dev->romsize != -1) {
>> +        if (st.st_size > dev->romsize) {
>> +            error_report("ROM BAR \"%s\" (%ld bytes) is too large for ROM size %d",
> 
> %d here...
> 
>> +                         rom_file, (long) st.st_size, dev->romsize);
>> +            goto close_rom;
>> +        }
>> +    } else {
>> +        dev->romsize = st.st_size;
>> +    }
>> +
>>      snprintf(name, sizeof(name), "%s.rom", object_get_typename(owner));
>> -    memory_region_init_ram(&dev->rom, owner, name, st.st_size, &error_abort);
>> +    memory_region_init_ram(&dev->rom, owner, name, dev->romsize, &error_abort);
>>      ptr = memory_region_get_ram_ptr(&dev->rom);
>> -    memset(ptr, 0xff, st.st_size);
>> +    memset(ptr, 0xff, dev->romsize);
>>  
>>      if (!fread(ptr, 1, st.st_size, fp)) {
>>          error_report("pci-assign: Cannot read from host %s", rom_file);
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index 259f9c992d..b028245b62 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -343,6 +343,7 @@ struct PCIDevice {
>>  
>>      /* Location of option rom */
>>      char *romfile;
>> +    uint32_t romsize;
>>      bool has_rom;
>>      MemoryRegion rom;
>>      uint32_t rom_bar;
>> -- 
>> 2.29.2
> 
> dme.
> 

I believe this may be worth a v3; for that:

Acked-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo


