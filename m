Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A502673CC0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWCr-0000Ra-Ft; Thu, 19 Jan 2023 09:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pIWCn-0000RB-Fw; Thu, 19 Jan 2023 09:47:53 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pIWCk-0001NY-MH; Thu, 19 Jan 2023 09:47:53 -0500
Received: by mail-ej1-x62a.google.com with SMTP id rl14so2937127ejb.2;
 Thu, 19 Jan 2023 06:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dToRSTWsNh58Cg+QGJN6WsalPZNjQp/1xDoT+c4Fyf0=;
 b=TRNdmHpKasloW02nKmq0E6OF3lIwd5OvLCQWAucjv7ya9sCbPXj2+o1IkTmbKqF7CM
 SF35L4hAYRBLey0jRD30wCn+43sA3rGyLCvmQAdXj41Vi5OfTJelHZYfmC26raUryGDY
 zFUnuqbfYc3jZ98+hr4G1DinebLzpnft6pMgdPVmM+MytaV199DTF1iDqvF+WkEF9deT
 I69i44D/STVFkFneUi7gbwxd6zYtM6KC6KNTOE+OI/Pl21Z438kyrahWmRhNspv4WB9s
 qSloSrcSxPjcSPoLIoqMM2FTt0HlEAFD8tWS/lZQmHw1Y5zxauCV/mxpYJXsmKPYwJka
 F/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dToRSTWsNh58Cg+QGJN6WsalPZNjQp/1xDoT+c4Fyf0=;
 b=okGR72tgu5YYM2zABDPW93eFr2z4YA6r5Wq/J6OncxnblNzyXdS7bMa1WKWlxFIv/E
 ks2HOIISqvPUkvr/imBeJf8ANlo5TiyIWZVMBLBQRAImx6dA6VYcz8iUc0UKA4eQrGsQ
 sfndHmpXZSSqU2wmwp292RHpcBEIDjXERfpQ5br2MPBqz30M+rUPHlZU9TCivXPKRbsm
 9KnwvtiWO2kNCJPjtT0opWXVdVz2FerLcKns1l6xH/+wg9xh7xFtphShl3R1+nucU7fi
 J8BXI0aSN1KbaiUVJMoL+rsBvntUkD0fdMXvohCmAcjitZQqpQZB952D55IChskYbEbJ
 3bOQ==
X-Gm-Message-State: AFqh2kreHuHDTjhqo0oMbQhycNSRRwHDpMpDW4iJ0negZIhV1bQuFY+9
 2lwKDV5tMMITZbM+bM1R1Qk=
X-Google-Smtp-Source: AMrXdXv0OVDcZtkilldpXt80Hs2RBLAoXlOb6kkrWWz8M55JwjDIfiinsKmF0keDeGGA0fJ+wSydeQ==
X-Received: by 2002:a17:906:175a:b0:877:6713:7e99 with SMTP id
 d26-20020a170906175a00b0087767137e99mr4217509eje.58.1674139668374; 
 Thu, 19 Jan 2023 06:47:48 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-002-044.77.183.pool.telefonica.de.
 [77.183.2.44]) by smtp.gmail.com with ESMTPSA id
 g13-20020a170906538d00b0085a958808c6sm11767785ejo.7.2023.01.19.06.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 06:47:47 -0800 (PST)
Date: Thu, 19 Jan 2023 14:47:41 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/7=5D_hw/acpi/acpi=5Fdev=5Finter?=
 =?US-ASCII?Q?face=3A_Resolve_AcpiDeviceIfClass=3A=3Amadt=5Fcpu?=
In-Reply-To: <20230118155905.0e1c4b21@imammedo.users.ipa.redhat.com>
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-3-shentey@gmail.com>
 <20230116172930.462a792d@imammedo.users.ipa.redhat.com>
 <C4C9B55E-6723-4143-8F5E-CE9F9FB0CCB6@gmail.com>
 <20230118155905.0e1c4b21@imammedo.users.ipa.redhat.com>
Message-ID: <A1470B22-AE20-44CE-98DA-742F529107D8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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



Am 18=2E Januar 2023 14:59:05 UTC schrieb Igor Mammedov <imammedo@redhat=
=2Ecom>:
>On Tue, 17 Jan 2023 00:30:23 +0000
>Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>
>> Am 16=2E Januar 2023 16:29:30 UTC schrieb Igor Mammedov <imammedo@redha=
t=2Ecom>:
>> >On Mon, 16 Jan 2023 16:29:03 +0100
>> >Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>> > =20
>> >> This class attribute was always set to pc_madt_cpu_entry()=2E
>> >> pc_madt_cpu_entry() is architecture dependent and was assigned to th=
e
>> >> attribute even in architecture agnostic code such as in hw/acpi/piix=
4=2Ec
>> >> and hw/isa/lpc_ich9=2E Not having to set madt_cpu there resolves the
>> >> assumption that these device models are only ever used with ACPI on =
x86
>> >> targets=2E
>> >>=20
>> >> The only target independent location where madt_cpu was called was h=
w/
>> >> acpi/cpu=2Ec=2E Here a function pointer can be passed via an argumen=
t
>> >> instead=2E The other locations where it was called was in x86-specif=
ic code
>> >> where pc_madt_cpu_entry() can be used directly=2E
>> >>
>> >> While at it, move pc_madt_cpu_entry() from the public include/hw/i38=
6/
>> >> pc=2Eh to the private hw/i386/acpi-common where it is also implement=
ed=2E =20
>> >
>> >I'm not sure about this approach,
>> >the callback is intend to be used not only by x86 but also in
>> >the end by ARM (it's just that arm/virt CPU hotplug patches are
>> >still work in progress and haven't been merged)=2E =20
>>=20
>> IIUC one would call the target-independent build_cpus_aml() from the AR=
M-specific build_madt()=2E There, one could pass a function pointer to an A=
RM-specific madt_cpu_fn=2E Shouldn't that get us covered?
>
>it will work in this case, but I don't like going back to random
>function pointer argument approach instead of using QOM and
>interfaces which is much better in describing expectations/contract=20
>for interfaces adn objects it's attached to=2E
>
>Howver that is not the reason why I'm against this approach, see bellow=
=2E
>
>> >So I'd prefer to keep AcpiDeviceIfClass::madt_cpu=2E
>> >
>> >What's the end goal you are trying to achieve by getting
>> >rid of this callback? =20
>>=20
>> ACPI controllers are in principle not x86-specific, yet our PIIX4 and I=
CH9 device models always assign an x86-specific function to AcpiDeviceIfCla=
ss::madt_cpu=2E That doesn't seem right because the device models make assu=
mptions about their usage contexts which they ideally shouldn't=2E
>>=20
>> In addition, it seems to me that ACPI controllers and AML generation sh=
ould not be mixed: An ACPI controller deals with (hardware) events while AM=
L generation is usually a BIOS task to inject code into an OS=2E Therefore,=
 ACPI controllers don't seem to be the right place to assign AML-generating=
 functions because that doesn't match how reality works=2E
>
>It would be nice to have pristine hardware-only device models
>and firmware composing ACPI tables like baremetal systems do
>(they have a luxury of fixed hardware which makes it way simpler),
>however it was not practical nor sustainable in mainstream virt case=2E
>That's the reason why ACPI tables (firmware) were moved into QEMU (hardwa=
re)=2E
>
>> To solve both issues, one could factor out e=2Eg=2E an AmlDeviceIf from=
 AcpiDeviceIf, so one would't force the device models to provide an madt_cp=
u=2E=20
>> Then one could assign a target-specific AmlDeviceIfClass::madt_cpu e=2E=
g=2E in board code=2E
>ACPI tables in QEMU started this way, It stopped being maintainable
>at certain point, see below for more=2E
>
>>At the moment I don't see a need for a new interface, however, since the=
 function pointer works just fine: It frees the device models from having t=
o provide it and it is used in code which already deals with AML generation=
=2E
>When the move happened, the bulk of ACPI code was as you suggest made
>as machine specific and it's still the case for the most of it=2E
>Then, with ease of adding new related features, it exploded into
>I would say hard to maintain mess=2E Hence before adding more and
>making it worse, I introduced  call_dev_aml_func()/AcpiDevAmlIf
>and started refactoring PCI AML code=2E That simplified main PCI bus
>enumeration quite a bit=2E
>
>The new interface however does exactly opposite of what you are doing,
>i=2Ee=2E it pushes device specific AML generation into corresponding devi=
ce
>model=2E It's not ideal as we have to provide stubs for targets where it'=
s
>not needed=2E But stubs for target independent code is typical and proven
>approach we use in QEMU for such cases and is relatively easy to maintain=
=2E
>So I'd call it a reasonable compromise=2E
>
>Recently posted series (that untangles generic PCI slots AML from
>ACPI PCI hotplug frankenstein) continues with AcpiDevAmlIf approach=20
>and pushes more AML into target in-depended device models=2E

I fully agree with the introduction of AcpiDevAmlIf=2E In fact I was follo=
wing your work closely since it helped me making the VT82xx south bridges w=
ork with the PC machine=2E In order to make your approach even more elegant=
 and efficient I'm following up with qbus_build_aml()=2E

This patch doesn't actually question the AcpiDevAmlIf=2E It rather questio=
ns the mixing of CPU-related AML concerns into the ACPI controllers which a=
re a priori CPU-agnostic=2E The only reason for dragging x86 concerns into =
these device models is that the AcpiDeviceIfClass requires madt_cpu to be a=
ssigned=2E Here we can apply the "interface segregation principle" which is=
 why I proposed factoring out a dedicated interface from the AcpiDeviceIfCl=
ass (and possibly have CPUs implement it)=2E I think that this would match =
your approach with AcpiDevAmlIf=2E

>And there is more coming on top of it (with the goal to make most
>of what we accumulated in PC/Q35 PCI ACPI code become generic enough
>to replace most of PCI related AML elsewhere (microvm, arm/virt,
>whatever else that is interested in ACPI tables support)=2E
>My ambition with this refactoring stops at making qdev device tree
>self-describable at PCI boundary but AcpiDevAmlIf can be applied
>to other devices described in DSDT, that hang off the board=2E

Sounds good!

>> My end goal is to make the VT82xx south bridges compatible with x86 and=
 to bring them to feature parity with PIIX=2E For this, I need to implement=
 the VIA ACPI controller proper, and since these south bridges are currentl=
y only used in MIPS and PowerPC contexts I'm feeling a bit uncomfortable ha=
ving to drag in x86 assumptions into these devices=2E
>
>basic ACPI hardware (GPE/PM registers) code is relatively isolated,
>so you probably can implement that without touching piix much=2E
>(with little to no stubs)=2E
>
>If you want to cleanup piix and free other targets from
>unfortunate ACPI/x86 specific dependencies, it would probably
>need another approach than presented here=2E
>
>ex:
>Isolating core(pristine) piix code in piix-basic class
>for PPC/MIPS use, and then branching/inheriting of it
>current piix class with all extra x86 'features' might
>work without breaking migration=2E (/me assuming cross
>version migration should work in this arrangement,=20
>though I won't bet on it)

It seems to me that extending the PIIX4 PM class hierarchy with piix-basic=
 is just a workaround for the root problem I mentioned above, which is the =
mixing of unrelated concerns into one interface=2E So let my try to factor =
out an AcpiCpuAmlIf from AcpiDeviceIfClass and see how it goes=2E

Best regards,
Bernhard

>
>> Best regards,
>> Bernhard
>>=20
>> > =20
>> >> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> >> ---
>> >>  hw/i386/acpi-common=2Eh                |  7 +++++--
>> >>  include/hw/acpi/acpi_dev_interface=2Eh |  2 --
>> >>  include/hw/acpi/cpu=2Eh                |  6 +++++-
>> >>  include/hw/i386/pc=2Eh                 |  4 ----
>> >>  hw/acpi/acpi-x86-stub=2Ec              |  6 ------
>> >>  hw/acpi/cpu=2Ec                        | 10 ++++------
>> >>  hw/acpi/piix4=2Ec                      |  2 --
>> >>  hw/i386/acpi-build=2Ec                 |  5 ++---
>> >>  hw/i386/acpi-common=2Ec                |  5 ++---
>> >>  hw/i386/acpi-microvm=2Ec               |  3 +--
>> >>  hw/i386/generic_event_device_x86=2Ec   |  9 ---------
>> >>  hw/isa/lpc_ich9=2Ec                    |  1 -
>> >>  12 files changed, 19 insertions(+), 41 deletions(-)
>> >>=20
>> >> diff --git a/hw/i386/acpi-common=2Eh b/hw/i386/acpi-common=2Eh
>> >> index a68825acf5=2E=2E968d625d88 100644
>> >> --- a/hw/i386/acpi-common=2Eh
>> >> +++ b/hw/i386/acpi-common=2Eh
>> >> @@ -1,15 +1,18 @@
>> >>  #ifndef HW_I386_ACPI_COMMON_H
>> >>  #define HW_I386_ACPI_COMMON_H
>> >> =20
>> >> -#include "hw/acpi/acpi_dev_interface=2Eh"
>> >>  #include "hw/acpi/bios-linker-loader=2Eh"
>> >>  #include "hw/i386/x86=2Eh"
>> >> +#include "hw/boards=2Eh"
>> >> =20
>> >>  /* Default IOAPIC ID */
>> >>  #define ACPI_BUILD_IOAPIC_ID 0x0
>> >> =20
>> >> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids, GArr=
ay *entry,
>> >> +                       bool force_enabled);
>> >> +
>> >>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>> >> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
>> >> +                     X86MachineState *x86ms,
>> >>                       const char *oem_id, const char *oem_table_id);
>> >> =20
>> >>  #endif
>> >> diff --git a/include/hw/acpi/acpi_dev_interface=2Eh b/include/hw/acp=
i/acpi_dev_interface=2Eh
>> >> index a1648220ff=2E=2Eca92928124 100644
>> >> --- a/include/hw/acpi/acpi_dev_interface=2Eh
>> >> +++ b/include/hw/acpi/acpi_dev_interface=2Eh
>> >> @@ -52,7 +52,5 @@ struct AcpiDeviceIfClass {
>> >>      /* <public> */
>> >>      void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list=
);
>> >>      void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
>> >> -    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray=
 *entry,
>> >> -                     bool force_enabled);
>> >>  };
>> >>  #endif
>> >> diff --git a/include/hw/acpi/cpu=2Eh b/include/hw/acpi/cpu=2Eh
>> >> index 999caaf510=2E=2E25b25bb594 100644
>> >> --- a/include/hw/acpi/cpu=2Eh
>> >> +++ b/include/hw/acpi/cpu=2Eh
>> >> @@ -15,6 +15,7 @@
>> >>  #include "hw/qdev-core=2Eh"
>> >>  #include "hw/acpi/acpi=2Eh"
>> >>  #include "hw/acpi/aml-build=2Eh"
>> >> +#include "hw/boards=2Eh"
>> >>  #include "hw/hotplug=2Eh"
>> >> =20
>> >>  typedef struct AcpiCpuStatus {
>> >> @@ -55,8 +56,11 @@ typedef struct CPUHotplugFeatures {
>> >>      const char *smi_path;
>> >>  } CPUHotplugFeatures;
>> >> =20
>> >> +typedef void (*madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
>> >> +                            GArray *entry, bool force_enabled);
>> >> +
>> >>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFe=
atures opts,
>> >> -                    hwaddr io_base,
>> >> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
>> >>                      const char *res_root,
>> >>                      const char *event_handler_method);
>> >> =20
>> >> diff --git a/include/hw/i386/pc=2Eh b/include/hw/i386/pc=2Eh
>> >> index a0647165d1=2E=2Ea5cce88653 100644
>> >> --- a/include/hw/i386/pc=2Eh
>> >> +++ b/include/hw/i386/pc=2Eh
>> >> @@ -191,10 +191,6 @@ bool pc_system_ovmf_table_find(const char *entr=
y, uint8_t **data,
>> >>                                 int *data_len);
>> >>  void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_si=
ze);
>> >> =20
>> >> -/* hw/i386/acpi-common=2Ec */
>> >> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>> >> -                       GArray *entry, bool force_enabled);
>> >> -
>> >>  /* sgx=2Ec */
>> >>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
>> >> =20
>> >> diff --git a/hw/acpi/acpi-x86-stub=2Ec b/hw/acpi/acpi-x86-stub=2Ec
>> >> index d0d399d26b=2E=2E9662a594ad 100644
>> >> --- a/hw/acpi/acpi-x86-stub=2Ec
>> >> +++ b/hw/acpi/acpi-x86-stub=2Ec
>> >> @@ -1,12 +1,6 @@
>> >>  #include "qemu/osdep=2Eh"
>> >> -#include "hw/i386/pc=2Eh"
>> >>  #include "hw/i386/acpi-build=2Eh"
>> >> =20
>> >> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>> >> -                       GArray *entry, bool force_enabled)
>> >> -{
>> >> -}
>> >> -
>> >>  Object *acpi_get_i386_pci_host(void)
>> >>  {
>> >>         return NULL;
>> >> diff --git a/hw/acpi/cpu=2Ec b/hw/acpi/cpu=2Ec
>> >> index 19c154d78f=2E=2Edb15f9278d 100644
>> >> --- a/hw/acpi/cpu=2Ec
>> >> +++ b/hw/acpi/cpu=2Ec
>> >> @@ -338,7 +338,7 @@ const VMStateDescription vmstate_cpu_hotplug =3D=
 {
>> >>  #define CPU_FW_EJECT_EVENT "CEJF"
>> >> =20
>> >>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFe=
atures opts,
>> >> -                    hwaddr io_base,
>> >> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
>> >>                      const char *res_root,
>> >>                      const char *event_handler_method)
>> >>  {
>> >> @@ -353,8 +353,8 @@ void build_cpus_aml(Aml *table, MachineState *ma=
chine, CPUHotplugFeatures opts,
>> >>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>> >>      const CPUArchIdList *arch_ids =3D mc->possible_cpu_arch_ids(mac=
hine);
>> >>      char *cphp_res_path =3D g_strdup_printf("%s=2E" CPUHP_RES_DEVIC=
E, res_root);
>> >> -    Object *obj =3D object_resolve_path_type("", TYPE_ACPI_DEVICE_I=
F, NULL);
>> >> -    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(obj);
>> >> +
>> >> +    assert(madt_cpu);
>> >> =20
>> >>      cpu_ctrl_dev =3D aml_device("%s", cphp_res_path);
>> >>      {
>> >> @@ -664,9 +664,7 @@ void build_cpus_aml(Aml *table, MachineState *ma=
chine, CPUHotplugFeatures opts,
>> >>              aml_append(dev, method);
>> >> =20
>> >>              /* build _MAT object */
>> >> -            assert(adevc && adevc->madt_cpu);
>> >> -            adevc->madt_cpu(i, arch_ids, madt_buf,
>> >> -                            true); /* set enabled flag */
>> >> +            madt_cpu(i, arch_ids, madt_buf, true /* set enabled fla=
g */);
>> >>              aml_append(dev, aml_name_decl("_MAT",
>> >>                  aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data=
)));
>> >>              g_array_free(madt_buf, true);
>> >> diff --git a/hw/acpi/piix4=2Ec b/hw/acpi/piix4=2Ec
>> >> index 0a81f1ad93=2E=2E4d0d4fdeeb 100644
>> >> --- a/hw/acpi/piix4=2Ec
>> >> +++ b/hw/acpi/piix4=2Ec
>> >> @@ -20,7 +20,6 @@
>> >>   */
>> >> =20
>> >>  #include "qemu/osdep=2Eh"
>> >> -#include "hw/i386/pc=2Eh"
>> >>  #include "hw/southbridge/piix=2Eh"
>> >>  #include "hw/irq=2Eh"
>> >>  #include "hw/isa/apm=2Eh"
>> >> @@ -643,7 +642,6 @@ static void piix4_pm_class_init(ObjectClass *kla=
ss, void *data)
>> >>      hc->unplug =3D piix4_device_unplug_cb;
>> >>      adevc->ospm_status =3D piix4_ospm_status;
>> >>      adevc->send_event =3D piix4_send_gpe;
>> >> -    adevc->madt_cpu =3D pc_madt_cpu_entry;
>> >>  }
>> >> =20
>> >>  static const TypeInfo piix4_pm_info =3D {
>> >> diff --git a/hw/i386/acpi-build=2Ec b/hw/i386/acpi-build=2Ec
>> >> index 127c4e2d50=2E=2E0be3960a37 100644
>> >> --- a/hw/i386/acpi-build=2Ec
>> >> +++ b/hw/i386/acpi-build=2Ec
>> >> @@ -1440,7 +1440,7 @@ build_dsdt(GArray *table_data, BIOSLinker *lin=
ker,
>> >>              =2Efw_unplugs_cpu =3D pm->smi_on_cpu_unplug,
>> >>          };
>> >>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>> >> -                       "\\_SB=2EPCI0", "\\_GPE=2E_E02");
>> >> +                       pc_madt_cpu_entry, "\\_SB=2EPCI0", "\\_GPE=
=2E_E02");
>> >>      }
>> >> =20
>> >>      if (pcms->memhp_io_base && nr_mem) {
>> >> @@ -2424,8 +2424,7 @@ void acpi_build(AcpiBuildTables *tables, Machi=
neState *machine)
>> >> =20
>> >>      acpi_add_table(table_offsets, tables_blob);
>> >>      acpi_build_madt(tables_blob, tables->linker, x86ms,
>> >> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>> >> -                    x86ms->oem_table_id);
>> >> +                    x86ms->oem_id, x86ms->oem_table_id);
>> >> =20
>> >>  #ifdef CONFIG_ACPI_ERST
>> >>      {
>> >> diff --git a/hw/i386/acpi-common=2Ec b/hw/i386/acpi-common=2Ec
>> >> index 52e5c1439a=2E=2Eaabf78092e 100644
>> >> --- a/hw/i386/acpi-common=2Ec
>> >> +++ b/hw/i386/acpi-common=2Ec
>> >> @@ -94,14 +94,13 @@ build_xrupt_override(GArray *entry, uint8_t src,=
 uint32_t gsi, uint16_t flags)
>> >>   * 5=2E2=2E8 Multiple APIC Description Table
>> >>   */
>> >>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>> >> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
>> >> +                     X86MachineState *x86ms,
>> >>                       const char *oem_id, const char *oem_table_id)
>> >>  {
>> >>      int i;
>> >>      bool x2apic_mode =3D false;
>> >>      MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
>> >>      const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MAC=
HINE(x86ms));
>> >> -    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(adev);
>> >>      AcpiTable table =3D { =2Esig =3D "APIC", =2Erev =3D 1, =2Eoem_i=
d =3D oem_id,
>> >>                          =2Eoem_table_id =3D oem_table_id };
>> >> =20
>> >> @@ -111,7 +110,7 @@ void acpi_build_madt(GArray *table_data, BIOSLin=
ker *linker,
>> >>      build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); =
/* Flags */
>> >> =20
>> >>      for (i =3D 0; i < apic_ids->len; i++) {
>> >> -        adevc->madt_cpu(i, apic_ids, table_data, false);
>> >> +        pc_madt_cpu_entry(i, apic_ids, table_data, false);
>> >>          if (apic_ids->cpus[i]=2Earch_id > 254) {
>> >>              x2apic_mode =3D true;
>> >>          }
>> >> diff --git a/hw/i386/acpi-microvm=2Ec b/hw/i386/acpi-microvm=2Ec
>> >> index fb09185cbd=2E=2Ed8a444d06c 100644
>> >> --- a/hw/i386/acpi-microvm=2Ec
>> >> +++ b/hw/i386/acpi-microvm=2Ec
>> >> @@ -213,8 +213,7 @@ static void acpi_build_microvm(AcpiBuildTables *=
tables,
>> >> =20
>> >>      acpi_add_table(table_offsets, tables_blob);
>> >>      acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machin=
e),
>> >> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>> >> -                    x86ms->oem_table_id);
>> >> +                    x86ms->oem_id, x86ms->oem_table_id);
>> >> =20
>> >>  #ifdef CONFIG_ACPI_ERST
>> >>      {
>> >> diff --git a/hw/i386/generic_event_device_x86=2Ec b/hw/i386/generic_=
event_device_x86=2Ec
>> >> index e26fb02a2e=2E=2E8fc233e1f1 100644
>> >> --- a/hw/i386/generic_event_device_x86=2Ec
>> >> +++ b/hw/i386/generic_event_device_x86=2Ec
>> >> @@ -8,19 +8,10 @@
>> >> =20
>> >>  #include "qemu/osdep=2Eh"
>> >>  #include "hw/acpi/generic_event_device=2Eh"
>> >> -#include "hw/i386/pc=2Eh"
>> >> -
>> >> -static void acpi_ged_x86_class_init(ObjectClass *class, void *data)
>> >> -{
>> >> -    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_CLASS(class);
>> >> -
>> >> -    adevc->madt_cpu =3D pc_madt_cpu_entry;
>> >> -}
>> >> =20
>> >>  static const TypeInfo acpi_ged_x86_info =3D {
>> >>      =2Ename          =3D TYPE_ACPI_GED_X86,
>> >>      =2Eparent        =3D TYPE_ACPI_GED,
>> >> -    =2Eclass_init    =3D acpi_ged_x86_class_init,
>> >>      =2Einterfaces =3D (InterfaceInfo[]) {
>> >>          { TYPE_HOTPLUG_HANDLER },
>> >>          { TYPE_ACPI_DEVICE_IF },
>> >> diff --git a/hw/isa/lpc_ich9=2Ec b/hw/isa/lpc_ich9=2Ec
>> >> index 8d541e2b54=2E=2E0ab0a341be 100644
>> >> --- a/hw/isa/lpc_ich9=2Ec
>> >> +++ b/hw/isa/lpc_ich9=2Ec
>> >> @@ -870,7 +870,6 @@ static void ich9_lpc_class_init(ObjectClass *kla=
ss, void *data)
>> >>      hc->unplug =3D ich9_pm_device_unplug_cb;
>> >>      adevc->ospm_status =3D ich9_pm_ospm_status;
>> >>      adevc->send_event =3D ich9_send_gpe;
>> >> -    adevc->madt_cpu =3D pc_madt_cpu_entry;
>> >>      amldevc->build_dev_aml =3D build_ich9_isa_aml;
>> >>  }
>> >>   =20
>> > =20
>>=20
>

