Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69F768B2FD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 01:07:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOp2f-0004ZQ-9p; Sun, 05 Feb 2023 19:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOp2e-0004XN-6e; Sun, 05 Feb 2023 19:07:28 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOp2c-0006DX-6H; Sun, 05 Feb 2023 19:07:27 -0500
Received: by mail-ed1-x536.google.com with SMTP id ee13so3511526edb.5;
 Sun, 05 Feb 2023 16:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXKrd7bIP1MS71BlLkPwEP2NjhHvqXPdKGT+FAxIlCQ=;
 b=FUdlgmE5fB4nZYePGJKHf01M52UMN9VhMxXwQj42pJq5dDO2hztPSNeR/T1oiqXjN0
 jRZye1ADdMMnpKP03ADZG4yEzezBmckD/8c0wNncYiI98ZTTuuHRfxn36LhxQXRNI3Wj
 xY2CBEQAA57Av79En1o57goEFx3y13GHOeOfT0xCZg7Y1stbX8WCBZFCeFTejfldZ2tH
 6lTi7pe4ExQIWnWpdibt2tjxNKx8X6IetSSRaxV4wtkx3+omlGMrcTZ0xYho/mS0wvEM
 NuyBjUgwQWgIwLZ4ZSfxi3QSHpNdGAuvaOAm4Qu8sydAV/yW8ZkPr6K1GQ1PmXTa2Ltn
 OCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXKrd7bIP1MS71BlLkPwEP2NjhHvqXPdKGT+FAxIlCQ=;
 b=I4nt1Jcidh+eqiyXyx1RJi4hXcck/JoJ7qUyri0H40Z1b5xrN1GiHbzbw5YHIXjUbk
 11j+PrM1PiEa7YekD5Us3Ai51RjhrfR9XbPnIe3rrJ+s/Vn5YU2/4AipiYhnyayQQBgB
 Om13OQn5rTpA1K0ng/y0GIRBeYS0XxnNBq+WIwaun0C7gFwdxskx7z7BCVACfLa3j9J7
 +W6A7dgTVWNNMRK4cID/8eIld+bnFjXSsj0+l+YaU3wg9Ed9u2colc6oZnnx6zMcHOzW
 ljuC3BNihy5k/VdBEh1NvYUkJCgK4UzuV2bKlF97weNxrsbE4DYS5Wg7EoiwNHhoalL9
 2Zpg==
X-Gm-Message-State: AO0yUKV6J1IqlggWybgh2OL3PA84eov4ulybgfZzC1I8A5bm6c9QDwpz
 pGwF0F98bHu5rNDLQvTjius=
X-Google-Smtp-Source: AK7set/0t0Ic3GWUQe7igirK6hRFpD63lI6B9rq1/NzzFWmGBvx+d5Mu1LVmOIykpVKo2Q2MfFk6zQ==
X-Received: by 2002:a05:6402:1a46:b0:491:3a5c:6e2 with SMTP id
 bf6-20020a0564021a4600b004913a5c06e2mr19272427edb.5.1675642042655; 
 Sun, 05 Feb 2023 16:07:22 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-009-140.77.13.pool.telefonica.de.
 [77.13.9.140]) by smtp.gmail.com with ESMTPSA id
 p21-20020a50cd95000000b004aaa6bdb445sm1620005edi.93.2023.02.05.16.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 16:07:22 -0800 (PST)
Date: Mon, 06 Feb 2023 00:07:18 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_6/9=5D_hw/i386/pc=3A_Init?=
 =?US-ASCII?Q?ialize_ram=5Fmemory_variable_directly?=
In-Reply-To: <d8ada3a2-c77a-bf77-89e8-c763efdb9b2c@eik.bme.hu>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-7-shentey@gmail.com>
 <d8ada3a2-c77a-bf77-89e8-c763efdb9b2c@eik.bme.hu>
Message-ID: <8DBEEE56-A06D-4A93-BF5F-F254F85A28FB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 4=2E Februar 2023 15:26:13 UTC schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Sat, 4 Feb 2023, Bernhard Beschow wrote:
>> Going through pc_memory_init() seems quite complicated for a simple
>> assignment=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> ---
>> include/hw/i386/pc=2Eh | 1 -
>> hw/i386/pc=2Ec         | 2 --
>> hw/i386/pc_piix=2Ec    | 4 ++--
>> hw/i386/pc_q35=2Ec     | 5 ++---
>> 4 files changed, 4 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/include/hw/i386/pc=2Eh b/include/hw/i386/pc=2Eh
>> index 66e3d059ef=2E=2Eb60b95921b 100644
>> --- a/include/hw/i386/pc=2Eh
>> +++ b/include/hw/i386/pc=2Eh
>> @@ -162,7 +162,6 @@ void xen_load_linux(PCMachineState *pcms);
>> void pc_memory_init(PCMachineState *pcms,
>>                     MemoryRegion *system_memory,
>>                     MemoryRegion *rom_memory,
>> -                    MemoryRegion **ram_memory,
>>                     uint64_t pci_hole64_size);
>> uint64_t pc_pci_hole64_start(void);
>> DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
>> diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>> index 6e592bd969=2E=2E8898cc9961 100644
>> --- a/hw/i386/pc=2Ec
>> +++ b/hw/i386/pc=2Ec
>> @@ -936,7 +936,6 @@ static hwaddr pc_max_used_gpa(PCMachineState *pcms,=
 uint64_t pci_hole64_size)
>> void pc_memory_init(PCMachineState *pcms,
>>                     MemoryRegion *system_memory,
>>                     MemoryRegion *rom_memory,
>> -                    MemoryRegion **ram_memory,
>>                     uint64_t pci_hole64_size)
>> {
>>     int linux_boot, i;
>> @@ -994,7 +993,6 @@ void pc_memory_init(PCMachineState *pcms,
>>      * Split single memory region and use aliases to address portions o=
f it,
>>      * done for backwards compatibility with older qemus=2E
>>      */
>> -    *ram_memory =3D machine->ram;
>>     ram_below_4g =3D g_malloc(sizeof(*ram_below_4g));
>>     memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machin=
e->ram,
>>                              0, x86ms->below_4g_mem_size);
>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>> index 5bde4533cc=2E=2E00ba725656 100644
>> --- a/hw/i386/pc_piix=2Ec
>> +++ b/hw/i386/pc_piix=2Ec
>> @@ -143,6 +143,7 @@ static void pc_init1(MachineState *machine,
>>     if (xen_enabled()) {
>>         xen_hvm_init_pc(pcms, &ram_memory);
>>     } else {
>> +        ram_memory =3D machine->ram;
>
>Maybe you could just replace the few places it's used with machine->ram d=
irectly and get rid of the local variable=2E There seems to be no advantage=
 storing it in a local just to use it once (in q35 below) or twice in pc-pi=
ix=2E The local name is not even that much shorter so I don't see a reason =
to have it in the first place,

Possible with q35 but not with piix which needs to get the RAM from Xen if=
 running in this mode=2E I'll adjust q35 then=2E

Best regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
>>         if (!pcms->max_ram_below_4g) {
>>             pcms->max_ram_below_4g =3D 0xe0000000; /* default: 3=2E5G *=
/
>>         }
>> @@ -205,8 +206,7 @@ static void pc_init1(MachineState *machine,
>>=20
>>     /* allocate ram and load rom/bios */
>>     if (!xen_enabled()) {
>> -        pc_memory_init(pcms, system_memory,
>> -                       rom_memory, &ram_memory, hole64_size);
>> +        pc_memory_init(pcms, system_memory, rom_memory, hole64_size);
>>     } else {
>>         pc_system_flash_cleanup_unused(pcms);
>>         if (machine->kernel_filename !=3D NULL) {
>> diff --git a/hw/i386/pc_q35=2Ec b/hw/i386/pc_q35=2Ec
>> index 8253b49296=2E=2E88f0981f50 100644
>> --- a/hw/i386/pc_q35=2Ec
>> +++ b/hw/i386/pc_q35=2Ec
>> @@ -129,7 +129,7 @@ static void pc_q35_init(MachineState *machine)
>>     MemoryRegion *system_io =3D get_system_io();
>>     MemoryRegion *pci_memory;
>>     MemoryRegion *rom_memory;
>> -    MemoryRegion *ram_memory;
>> +    MemoryRegion *ram_memory =3D machine->ram;
>>     GSIState *gsi_state;
>>     ISABus *isa_bus;
>>     int i;
>> @@ -216,8 +216,7 @@ static void pc_q35_init(MachineState *machine)
>>     }
>>=20
>>     /* allocate ram and load rom/bios */
>> -    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
>> -                   pci_hole64_size);
>> +    pc_memory_init(pcms, system_memory, rom_memory, pci_hole64_size);
>>=20
>>     object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host))=
;
>>     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>> 

