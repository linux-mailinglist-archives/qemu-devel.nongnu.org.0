Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4361119E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:36:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOaw-0003f5-7D; Fri, 28 Oct 2022 08:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooOXE-0004rA-QE; Fri, 28 Oct 2022 08:32:32 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooOXC-0004K7-3E; Fri, 28 Oct 2022 08:32:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1E21F74638A;
 Fri, 28 Oct 2022 14:32:23 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CE42874633D; Fri, 28 Oct 2022 14:32:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CC97A74632B;
 Fri, 28 Oct 2022 14:32:22 +0200 (CEST)
Date: Fri, 28 Oct 2022 14:32:22 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v5 20/20] mac_{old, new}world: Pass MacOS VGA NDRV in
 card ROM instead of fw_cfg
In-Reply-To: <d3bdb406-70d3-d60d-b481-7d88736a2e4b@ilande.co.uk>
Message-ID: <24e4cba4-2f68-73a2-55d2-2dc5c0cba14e@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <915b28547446c1fad749fbab2943b13e3a0d856b.1666733213.git.balaton@eik.bme.hu>
 <d3bdb406-70d3-d60d-b481-7d88736a2e4b@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022, Mark Cave-Ayland wrote:
> On 25/10/2022 22:31, BALATON Zoltan wrote:
>> OpenBIOS cannot run FCode ROMs yet but it can detect NDRV in VGA card
>> ROM and add it to the device tree for MacOS. Pass the NDRV this way
>> instead of via fw_cfg. This solves the problem with OpenBIOS also
>> adding the NDRV to ati-vga which it does not work with. This does not
>> need any changes to OpenBIOS as this NDRV ROM handling is already
>> there but this patch also allows simplifying OpenBIOS later to remove
>> the fw_cfg ndrv handling from the vga FCode and also drop the
>> vga-ndrv? option which is not needed any more as users can disable the
>> ndrv with -device VGA,romfile="" (or override it with their own NDRV
>> or ROM). Once FCode support is implemented in OpenBIOS, the proper
>> FCode ROM can be set the same way so this paves the way to remove some
>> hacks.
>
> This is not correct though: in a real option ROM the NDRV is included as part 
> of the ROM payload and is not a standalone file. The IEEE-1275 PCI 
> specification gives the correct format for an option ROM which at minimum 
> contains a header, and likely some additional FCode.

As the commit message says that does not work with OpenBIOS at the moment 
but passing the NDRV does. That it's not how real hardware works is not an 
argument after all real hardware does not have fw_cfg either and this way 
is much simpler than fw_cfg, it fixes the problem with ati-vga and it can 
be changed later to pass the real FCode ROM the same way so I think it's a 
better way to handle this now as what we have currently.

> Isn't the immediate problem here that the NDRV handling in OpenBIOS needs to 
> be improved so that it can be disabled for particular VGA devices such as 
> ATI?

No change is needed to OpenBIOS (I've discussed it more in the reply to 
Howard on the list yesterday). With this patch only VGA device will have 
qemu_vga.ndrv so OpenBIOS won't add it for ati-vga. Also the fw_cfg and 
vga_ndrv? stuff can be removed from OpenBIOS after this patch as it's not 
nedeed any more thus simplifying the vga.fs FCode in OpenBIOS a lot.

Regards,
BALATON Zoltan

>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/mac_newworld.c | 18 ++++++------------
>>   hw/ppc/mac_oldworld.c | 18 ++++++------------
>>   2 files changed, 12 insertions(+), 24 deletions(-)
>> 
>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>> index de4a7bae12..1d12bd85ed 100644
>> --- a/hw/ppc/mac_newworld.c
>> +++ b/hw/ppc/mac_newworld.c
>> @@ -526,18 +526,6 @@ static void ppc_core99_init(MachineState *machine)
>>       fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_BUSFREQ, BUSFREQ);
>>       fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_NVRAM_ADDR, nvram_addr);
>>   -    /* MacOS NDRV VGA driver */
>> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, NDRV_VGA_FILENAME);
>> -    if (filename) {
>> -        gchar *ndrv_file;
>> -        gsize ndrv_size;
>> -
>> -        if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
>> -            fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, 
>> ndrv_size);
>> -        }
>> -        g_free(filename);
>> -    }
>> -
>>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>>   }
>>   @@ -581,6 +569,11 @@ static int core99_kvm_type(MachineState *machine, 
>> const char *arg)
>>       return 2;
>>   }
>>   +static GlobalProperty props[] = {
>> +    /* MacOS NDRV VGA driver */
>> +    { "VGA", "romfile", NDRV_VGA_FILENAME },
>> +};
>> +
>>   static void core99_machine_class_init(ObjectClass *oc, void *data)
>>   {
>>       MachineClass *mc = MACHINE_CLASS(oc);
>> @@ -601,6 +594,7 @@ static void core99_machine_class_init(ObjectClass *oc, 
>> void *data)
>>   #endif
>>       mc->default_ram_id = "ppc_core99.ram";
>>       mc->ignore_boot_device_suffixes = true;
>> +    compat_props_add(mc->compat_props, props, G_N_ELEMENTS(props));
>>       fwc->get_dev_path = core99_fw_dev_path;
>>   }
>>   diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>> index eecc54da59..e7d35135d6 100644
>> --- a/hw/ppc/mac_oldworld.c
>> +++ b/hw/ppc/mac_oldworld.c
>> @@ -344,18 +344,6 @@ static void ppc_heathrow_init(MachineState *machine)
>>       fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_CLOCKFREQ, CLOCKFREQ);
>>       fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_BUSFREQ, BUSFREQ);
>>   -    /* MacOS NDRV VGA driver */
>> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, NDRV_VGA_FILENAME);
>> -    if (filename) {
>> -        gchar *ndrv_file;
>> -        gsize ndrv_size;
>> -
>> -        if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
>> -            fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, 
>> ndrv_size);
>> -        }
>> -        g_free(filename);
>> -    }
>> -
>>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>>   }
>>   @@ -400,6 +388,11 @@ static int heathrow_kvm_type(MachineState *machine, 
>> const char *arg)
>>       return 2;
>>   }
>>   +static GlobalProperty props[] = {
>> +    /* MacOS NDRV VGA driver */
>> +    { "VGA", "romfile", NDRV_VGA_FILENAME },
>> +};
>> +
>>   static void heathrow_class_init(ObjectClass *oc, void *data)
>>   {
>>       MachineClass *mc = MACHINE_CLASS(oc);
>> @@ -420,6 +413,7 @@ static void heathrow_class_init(ObjectClass *oc, void 
>> *data)
>>       mc->default_display = "std";
>>       mc->ignore_boot_device_suffixes = true;
>>       mc->default_ram_id = "ppc_heathrow.ram";
>> +    compat_props_add(mc->compat_props, props, G_N_ELEMENTS(props));
>>       fwc->get_dev_path = heathrow_fw_dev_path;
>>   }
>> 
>
>
> ATB,
>
> Mark.
>
>

