Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6D8273C2A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 09:40:08 +0200 (CEST)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKcuF-0001Yn-Uv
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 03:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kKctV-00017j-Ut
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 03:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kKctT-0000it-RC
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 03:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600760359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/RkEFmhZowoAFBkJsJCbhXPEOqeZ6jINhZewoMwmb04=;
 b=cALZzQQpME9axZ2bQXCbRiU1N/MJwcrHFRKoi+JGvUaC9obn6KEUkpoF/J055BFwiYbcAi
 +EVefKULXUcaxp7TqGS6WQyufeADXna6k1ZhwHW5fMtSKzz3cLIkFpHl1Zh9oHqqpc4Bdz
 cS4HEGo74oeJMyPFvSz1pwcb/mXJWlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-8CncJM9YOuCfT2KJ-zgDiQ-1; Tue, 22 Sep 2020 03:39:17 -0400
X-MC-Unique: 8CncJM9YOuCfT2KJ-zgDiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BF981074655;
 Tue, 22 Sep 2020 07:39:16 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-3.ams2.redhat.com
 [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFEF55DA30;
 Tue, 22 Sep 2020 07:39:11 +0000 (UTC)
Subject: Re: [PATCH 2/2] add maximum combined fw size as machine configuration
 option
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 Erich Mcmillan <erich.mcmillan@hp.com>
References: <20200918042339.3477-1-erich.mcmillan@hp.com>
 <20200918083132.GC1628512@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e57a55da-5737-b53d-db6e-bf5f3d23118c@redhat.com>
Date: Tue, 22 Sep 2020 09:39:10 +0200
MIME-Version: 1.0
In-Reply-To: <20200918083132.GC1628512@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, dgilbert@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/18/20 10:31, Daniel P. Berrangé wrote:
> On Fri, Sep 18, 2020 at 04:23:39AM +0000, Erich Mcmillan wrote:
>> From: Erich McMillan <erich.mcmillan@hp.com>
>>
>> Signed-off-by: Erich McMillan <erich.mcmillan@hp.com>
>> ---
>>  hw/i386/pc.c         | 40 ++++++++++++++++++++++++++++++++++++++++
>>  hw/i386/pc_sysfw.c   | 13 ++-----------
>>  include/hw/i386/pc.h | 22 ++++++++++++----------
>>  3 files changed, 54 insertions(+), 21 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index d11daac..b304988 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1869,6 +1869,39 @@ static void pc_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
>>      pcms->max_ram_below_4g = value;
>>  }
>>  
>> +static void pc_machine_get_max_fw_size(Object *obj, Visitor *v,
>> +                                             const char *name, void *opaque,
>> +                                             Error **errp)
>> +{
>> +    PCMachineState *pcms = PC_MACHINE(obj);
>> +    uint64_t value = pcms->max_fw_size;
>> +
>> +    visit_type_size(v, name, &value, errp);
>> +}
>> +
>> +static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
>> +                                             const char *name, void *opaque,
>> +                                             Error **errp)
>> +{
>> +    PCMachineState *pcms = PC_MACHINE(obj);
>> +    Error *error = NULL;
>> +    uint64_t value;
>> +
>> +    visit_type_size(v, name, &value, &error);
>> +    if (error) {
>> +        error_propagate(errp, error);
>> +        return;
>> +    }
>> +
> 
> Just here we should have a comment explaining why we pick this max limit.
> The comment you removed later can be transplanted to here...
> 
>> +    if (value > 16 * MiB) {
>> +        warn_report("User specifed max allowed firmware size %" PRIu64 " is greater than 16MiB,"
>> +                    "if combined firwmare size exceeds 16MiB system may not boot,"
>> +                    "or experience intermittent stability issues.", value);
>> +    }
>> +
>> +    pcms->max_fw_size = value;
>> +}
>> +
>>  static void pc_machine_initfn(Object *obj)
>>  {
>>      PCMachineState *pcms = PC_MACHINE(obj);
>> @@ -1884,6 +1917,7 @@ static void pc_machine_initfn(Object *obj)
>>      pcms->smbus_enabled = true;
>>      pcms->sata_enabled = true;
>>      pcms->pit_enabled = true;
>> +    pcms->max_fw_size = 8 * MiB;
>>  
>>      pc_system_flash_create(pcms);
>>      pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
>> @@ -2004,6 +2038,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>>  
>>      object_class_property_add_bool(oc, PC_MACHINE_PIT,
>>          pc_machine_get_pit, pc_machine_set_pit);
>> +
>> +    object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
>> +        pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
>> +        NULL, NULL);
>> +    object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
>> +        "Maximum combined firmware size");
>>  }
>>  
>>  static const TypeInfo pc_machine_info = {
>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>> index b6c0822..22450ba 100644
>> --- a/hw/i386/pc_sysfw.c
>> +++ b/hw/i386/pc_sysfw.c
>> @@ -39,15 +39,6 @@
>>  #include "hw/block/flash.h"
>>  #include "sysemu/kvm.h"
>>  
>> -/*
>> - * We don't have a theoretically justifiable exact lower bound on the base
>> - * address of any flash mapping. In practice, the IO-APIC MMIO range is
>> - * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving free
>> - * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to 8MB in
>> - * size.
>> - */
> 
> ....this comment should be transplanted above^^
> 
>> -#define FLASH_SIZE_LIMIT (8 * MiB)
>> -
>>  #define FLASH_SECTOR_SIZE 4096
>>  
>>  static void pc_isa_bios_init(MemoryRegion *rom_memory,
>> @@ -182,10 +173,10 @@ static void pc_system_flash_map(PCMachineState *pcms,
>>          }
>>          if ((hwaddr)size != size
>>              || total_size > HWADDR_MAX - size
>> -            || total_size + size > FLASH_SIZE_LIMIT) {
>> +            || total_size + size > pcms->max_fw_size) {
>>              error_report("combined size of system firmware exceeds "
>>                           "%" PRIu64 " bytes",
>> -                         FLASH_SIZE_LIMIT);
>> +                         pcms->max_fw_size);
>>              exit(1);
>>          }
>>  
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index fe52e16..cae213d 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -39,10 +39,11 @@ struct PCMachineState {
>>      uint64_t max_ram_below_4g;
>>      OnOffAuto vmport;
>>  
>> -    bool acpi_build_enabled;
>> -    bool smbus_enabled;
>> -    bool sata_enabled;
>> -    bool pit_enabled;
>> +    bool     acpi_build_enabled;
>> +    bool     smbus_enabled;
>> +    bool     sata_enabled;
>> +    bool     pit_enabled;
>> +    uint64_t max_fw_size;
> 
> Don't change whitespace in the existing fields - trying to
> horizontally align fields has no benefit and needlessly
> creates bigger diffs.
> 
>>  
>>      /* NUMA information: */
>>      uint64_t numa_nodes;
>> @@ -52,13 +53,14 @@ struct PCMachineState {
>>      hwaddr memhp_io_base;
>>  };
>>  
>> -#define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
>> -#define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
>> +#define PC_MACHINE_ACPI_DEVICE_PROP   "acpi-device"
>> +#define PC_MACHINE_MAX_RAM_BELOW_4G   "max-ram-below-4g"
>>  #define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
>> -#define PC_MACHINE_VMPORT           "vmport"
>> -#define PC_MACHINE_SMBUS            "smbus"
>> -#define PC_MACHINE_SATA             "sata"
>> -#define PC_MACHINE_PIT              "pit"
>> +#define PC_MACHINE_VMPORT             "vmport"
>> +#define PC_MACHINE_SMBUS              "smbus"
>> +#define PC_MACHINE_SATA               "sata"
>> +#define PC_MACHINE_PIT                "pit"
>> +#define PC_MACHINE_MAX_FW_SIZE        "max-fw-size"
> 
> Same here, just don't change whitespace alignment please.

On a total tangent: I'm generally OK with changing whitespace for lining
up stuff visually, but whenever that's done, IMO it should be the *only*
thing done in a patch. First add the amount of whitespace that you know
you're going to need, to the existent fields / macros, and then
introduce the new fields / macros.

But, I understand that some maintainers dislike even that approach,
because it makes "git-blame" a bit more cumbersome to use. (The first
git-blame invocation gives you the whitespace-changing commit, and you
have to rerun git-blame at the *parent* of that commit, to get what you
actually want.)

Tangent ends, anyway...

Thanks
Laszlo


