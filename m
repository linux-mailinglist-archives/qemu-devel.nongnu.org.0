Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A62765CE89
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCzMo-0005h8-4g; Wed, 04 Jan 2023 03:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCzMh-0005gW-DI
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 03:43:15 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCzMd-00070g-ME
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 03:43:15 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3F74F2C571;
 Wed,  4 Jan 2023 08:43:05 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 4 Jan
 2023 09:43:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004fa5bfd41-2a41-48e3-a63a-2f8c20832989,
 D3BA3AA4B26B30A68CB1784D167544CB159DE1DE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8fa1d7b7-babc-eca8-bbd9-4707ada2f49f@kaod.org>
Date: Wed, 4 Jan 2023 09:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/6] hw/arm/aspeed: Fix smpboot[] on big-endian hosts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>, Igor Mitsyanko
 <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>, Havard Skinnemoen
 <hskinnemoen@google.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, <qemu-arm@nongnu.org>,
 Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
 <20221222215549.86872-2-philmd@linaro.org>
 <CAFEAcA9KD8WwPTKVQQUfAZxaqA=ASweZtJ=sAV0Vd8TkpqDBOw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA9KD8WwPTKVQQUfAZxaqA=ASweZtJ=sAV0Vd8TkpqDBOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 882cf067-d16a-45a0-b033-600a4e247b0b
X-Ovh-Tracer-Id: 4330211044971744245
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjeehgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhirdhmihhtshihrghnkhhosehgmhgrihhlrdgtohhmpdhjohgvlhesjhhmshdrihgurdgruhdphhhskhhinhhnvghmohgvnhesghhoohhglhgvrdgtohhmpdgvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprghlihhsthgrihhrsegrlhhishhtrg
 hirhdvfedrmhgvpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhkfhhtihhnghesnhhuvhhothhonhdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.103,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 1/3/23 18:33, Peter Maydell wrote:
> On Thu, 22 Dec 2022 at 21:56, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> ARM CPUs fetch instructions in little-endian.
>>
>> smpboot[] encoded instructions are written in little-endian.
>> This is fine on little-endian host, but on big-endian ones
>> the smpboot[] array ends swapped. Use the const_le32()
>> macro so the instructions are always in little-endian in the
>> smpboot[] array.
>>
>> Fixes: 9bb6d14081 ("aspeed: Add boot stub for smp booting")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/aspeed.c | 28 ++++++++++++++--------------
>>   1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 55f114ef72..adff9a0d73 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -194,22 +194,22 @@ static void aspeed_write_smpboot(ARMCPU *cpu,
>>            * r1 = AST_SMP_MBOX_FIELD_ENTRY
>>            * r0 = AST_SMP_MBOX_FIELD_GOSIGN
>>            */
>> -        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
>> -        0xe21000ff,  /* ands    r0, r0, #255          */
>> -        0xe59f201c,  /* ldr     r2, [pc, #28]         */
>> -        0xe1822000,  /* orr     r2, r2, r0            */
>> +        const_le32(0xee100fb0),     /* mrc     p15, 0, r0, c0, c0, 5 */
>> +        const_le32(0xe21000ff),     /* ands    r0, r0, #255          */
>> +        const_le32(0xe59f201c),     /* ldr     r2, [pc, #28]         */
>> +        const_le32(0xe1822000),     /* orr     r2, r2, r0            */
>>
>> -        0xe59f1018,  /* ldr     r1, [pc, #24]         */
>> -        0xe59f0018,  /* ldr     r0, [pc, #24]         */
>> +        const_le32(0xe59f1018),     /* ldr     r1, [pc, #24]         */
>> +        const_le32(0xe59f0018),     /* ldr     r0, [pc, #24]         */
>>
>> -        0xe320f002,  /* wfe                           */
>> -        0xe5904000,  /* ldr     r4, [r0]              */
>> -        0xe1520004,  /* cmp     r2, r4                */
>> -        0x1afffffb,  /* bne     <wfe>                 */
>> -        0xe591f000,  /* ldr     pc, [r1]              */
>> -        AST_SMP_MBOX_GOSIGN,
>> -        AST_SMP_MBOX_FIELD_ENTRY,
>> -        AST_SMP_MBOX_FIELD_GOSIGN,
>> +        const_le32(0xe320f002),     /* wfe                           */
>> +        const_le32(0xe5904000),     /* ldr     r4, [r0]              */
>> +        const_le32(0xe1520004),     /* cmp     r2, r4                */
>> +        const_le32(0x1afffffb),     /* bne     <wfe>                 */
>> +        const_le32(0xe591f000),     /* ldr     pc, [r1]              */
>> +        const_le32(AST_SMP_MBOX_GOSIGN),
>> +        const_le32(AST_SMP_MBOX_FIELD_ENTRY),
>> +        const_le32(AST_SMP_MBOX_FIELD_GOSIGN)
>>       };
>>
>>       rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,
> 
> Can we use the write_bootloader() function, which handles the
> endianness question correctly and is how other boards do the
> "put a little lump of code into the guest" job ?

Yes. See below.

May be we could change write_bootloader a little to handle an empty
fixupcontext.

Thanks,

C.

 From 671d43faa7e14b896855403feb0afd777350cb0a Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Wed, 4 Jan 2023 09:30:28 +0100
Subject: [PATCH] hw/arm/boot: Export write_bootloader for Aspeed machines
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

AST2600 Aspeed machines have an home made boot loader for secondaries.
Instead, use the internal ARM boot loader.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
  include/hw/arm/boot.h | 24 ++++++++++++++++++++++++
  hw/arm/aspeed.c       | 42 ++++++++++++++++++++++--------------------
  hw/arm/boot.c         | 34 +++++++---------------------------
  3 files changed, 53 insertions(+), 47 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index f18cc3064f..23edd0d31b 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -183,4 +183,28 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                              const struct arm_boot_info *info,
                                              hwaddr mvbar_addr);
  
+typedef enum {
+    FIXUP_NONE = 0,     /* do nothing */
+    FIXUP_TERMINATOR,   /* end of insns */
+    FIXUP_BOARDID,      /* overwrite with board ID number */
+    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
+    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
+    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high half) */
+    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
+    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half) */
+    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
+    FIXUP_BOOTREG,      /* overwrite with boot register address */
+    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
+    FIXUP_MAX,
+} FixupType;
+
+typedef struct ARMInsnFixup {
+    uint32_t insn;
+    FixupType fixup;
+} ARMInsnFixup;
+
+void arm_write_bootloader(const char *name, hwaddr addr,
+                          const ARMInsnFixup *insns, uint32_t *fixupcontext,
+                          AddressSpace *as);
+
  #endif /* HW_ARM_BOOT_H */
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9c60575cb8..311c0091ca 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -201,33 +201,35 @@ struct AspeedMachineState {
  static void aspeed_write_smpboot(ARMCPU *cpu,
                                   const struct arm_boot_info *info)
  {
-    static const uint32_t poll_mailbox_ready[] = {
+    AddressSpace *as = arm_boot_address_space(cpu, info);
+    static const ARMInsnFixup poll_mailbox_ready[] = {
          /*
           * r2 = per-cpu go sign value
           * r1 = AST_SMP_MBOX_FIELD_ENTRY
           * r0 = AST_SMP_MBOX_FIELD_GOSIGN
           */
-        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
-        0xe21000ff,  /* ands    r0, r0, #255          */
-        0xe59f201c,  /* ldr     r2, [pc, #28]         */
-        0xe1822000,  /* orr     r2, r2, r0            */
-
-        0xe59f1018,  /* ldr     r1, [pc, #24]         */
-        0xe59f0018,  /* ldr     r0, [pc, #24]         */
-
-        0xe320f002,  /* wfe                           */
-        0xe5904000,  /* ldr     r4, [r0]              */
-        0xe1520004,  /* cmp     r2, r4                */
-        0x1afffffb,  /* bne     <wfe>                 */
-        0xe591f000,  /* ldr     pc, [r1]              */
-        AST_SMP_MBOX_GOSIGN,
-        AST_SMP_MBOX_FIELD_ENTRY,
-        AST_SMP_MBOX_FIELD_GOSIGN,
+        { 0xee100fb0 },  /* mrc     p15, 0, r0, c0, c0, 5 */
+        { 0xe21000ff },  /* ands    r0, r0, #255          */
+        { 0xe59f201c },  /* ldr     r2, [pc, #28]         */
+        { 0xe1822000 },  /* orr     r2, r2, r0            */
+
+        { 0xe59f1018 },  /* ldr     r1, [pc, #24]         */
+        { 0xe59f0018 },  /* ldr     r0, [pc, #24]         */
+
+        { 0xe320f002 },  /* wfe                           */
+        { 0xe5904000 },  /* ldr     r4, [r0]              */
+        { 0xe1520004 },  /* cmp     r2, r4                */
+        { 0x1afffffb },  /* bne     <wfe>                 */
+        { 0xe591f000 },  /* ldr     pc, [r1]              */
+        { AST_SMP_MBOX_GOSIGN },
+        { AST_SMP_MBOX_FIELD_ENTRY },
+        { AST_SMP_MBOX_FIELD_GOSIGN },
+        { 0, FIXUP_TERMINATOR }
      };
+    uint32_t fixupcontext[FIXUP_MAX] = { 0 };
  
-    rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,
-                       sizeof(poll_mailbox_ready),
-                       info->smp_loader_start);
+    arm_write_bootloader("aspeed.smpboot", info->smp_loader_start,
+                         poll_mailbox_ready, fixupcontext, as);
  }
  
  static void aspeed_reset_secondary(ARMCPU *cpu,
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782..ed6fd7c77f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -59,26 +59,6 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
      return cpu_get_address_space(cs, asidx);
  }
  
-typedef enum {
-    FIXUP_NONE = 0,     /* do nothing */
-    FIXUP_TERMINATOR,   /* end of insns */
-    FIXUP_BOARDID,      /* overwrite with board ID number */
-    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
-    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
-    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high half) */
-    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
-    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half) */
-    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
-    FIXUP_BOOTREG,      /* overwrite with boot register address */
-    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
-    FIXUP_MAX,
-} FixupType;
-
-typedef struct ARMInsnFixup {
-    uint32_t insn;
-    FixupType fixup;
-} ARMInsnFixup;
-
  static const ARMInsnFixup bootloader_aarch64[] = {
      { 0x580000c0 }, /* ldr x0, arg ; Load the lower 32-bits of DTB */
      { 0xaa1f03e1 }, /* mov x1, xzr */
@@ -149,9 +129,9 @@ static const ARMInsnFixup smpboot[] = {
      { 0, FIXUP_TERMINATOR }
  };
  
-static void write_bootloader(const char *name, hwaddr addr,
-                             const ARMInsnFixup *insns, uint32_t *fixupcontext,
-                             AddressSpace *as)
+void arm_write_bootloader(const char *name, hwaddr addr,
+                          const ARMInsnFixup *insns, uint32_t *fixupcontext,
+                          AddressSpace *as)
  {
      /* Fix up the specified bootloader fragment and write it into
       * guest memory using rom_add_blob_fixed(). fixupcontext is
@@ -213,8 +193,8 @@ static void default_write_secondary(ARMCPU *cpu,
          fixupcontext[FIXUP_DSB] = CP15_DSB_INSN;
      }
  
-    write_bootloader("smpboot", info->smp_loader_start,
-                     smpboot, fixupcontext, as);
+    arm_write_bootloader("smpboot", info->smp_loader_start,
+                         smpboot, fixupcontext, as);
  }
  
  void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
@@ -1173,8 +1153,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
          fixupcontext[FIXUP_ENTRYPOINT_LO] = entry;
          fixupcontext[FIXUP_ENTRYPOINT_HI] = entry >> 32;
  
-        write_bootloader("bootloader", info->loader_start,
-                         primary_loader, fixupcontext, as);
+        arm_write_bootloader("bootloader", info->loader_start,
+                             primary_loader, fixupcontext, as);
  
          if (info->write_board_setup) {
              info->write_board_setup(cpu, info);
-- 
2.38.1



