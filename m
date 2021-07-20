Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09063D0418
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:54:13 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xgq-0002J7-W9
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5xfm-0001d0-Kn
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:53:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5xfk-0001yi-Hz
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:53:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id i94so27528863wri.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kifa98KMDEI+jYag/ED1H81Dgj/cA/KOMq3ylWUptxc=;
 b=IIhQtknvnsG2xdO4u56+xrU2FSOUwPGCM+uIIUST1UDgPkmjeYiJyzTaJiMx/xjojs
 Oo8iFQV6Hb4klNsVIUA1F/ApVqPQsXNqbnJbG9hGgxso6Ze9Q64vfFnFwNicgTtAA84m
 Rx+x6Tr6BIDdpLT2My96nkCpYZG4avd40D2E0MeWW6QcVx5Ad2jrifXgzEI2KFe9qbtm
 IQc4vm5LAL82P6RxEnGH9L9ViD2/Vz3/L4Hs0hkpvJDODlLqxEXaSzm7WqshgwrN+2Mi
 UYvTn2+CuMUDasw+fGKnhUR379o18qTMrFoF+wBHGMoLU2o5V9SgrS8b+CE+Ph5VWJoS
 m2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kifa98KMDEI+jYag/ED1H81Dgj/cA/KOMq3ylWUptxc=;
 b=r6eNmWBrRr7i9WTBOyxdUEWuIhqusL2JCUPL4cJo7asgrkfXh4vuImbjnEdfSLF4EN
 mvlp/7oX4l3I9E3nGNrqU5xLGdX9+Ggr2mvRBjnworPkehI3aDlm7NgQgVdsMChiqXMt
 yycurVK+ZpoUB7EtcN95qUycnmpoK5xAMPW0HgE00DwwVG65ZpgvtOJJOJMXKirJxaTR
 YoWH7WtkBiIY2sxs4SSBwWgIBaIFDQFwet6VjtYK4bNt47DrbMc4gL5Bm0Qdsr2Ythts
 OEYn3sYPF+F8ejUAh1q4PQd96fVmUzBbV4GTb9U/8B5dQrx7yrOx8bo2vKJM0V8R9Ce5
 wfQQ==
X-Gm-Message-State: AOAM533rx1sjMPAZSX9suZeVkAJosC9oTqjm2fkJei+/cmjhXcTrD8H3
 M0lx3FZDYxQdFCheD6VRje/xfW9A4ingUQ==
X-Google-Smtp-Source: ABdhPJxIV13W5DMOwrypCujTTMA6Yl6YOC3F97AfmBcDo7lTCMRwK/2vdwd33EoDEnbNsZFh8u8Liw==
X-Received: by 2002:a5d:4748:: with SMTP id o8mr31848224wrs.202.1626817982835; 
 Tue, 20 Jul 2021 14:53:02 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id o7sm17397953wrs.52.2021.07.20.14.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 14:53:02 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v6 11/17] hw/core: Introduce
 CPUClass.gdb_adjust_breakpoint
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-12-richard.henderson@linaro.org>
 <CAFEAcA93CkPxmWCnSDaaJ01iTZ2KbabFu_cBKp7O9+BDHHmKfw@mail.gmail.com>
 <6e101005-ce67-3179-b446-c9b963b6bda2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a1b3fb7-e701-f2a6-0777-caa90a9e3a51@amsat.org>
Date: Tue, 20 Jul 2021 23:53:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6e101005-ce67-3179-b446-c9b963b6bda2@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:08 PM, Richard Henderson wrote:
> On 7/20/21 10:56 AM, Peter Maydell wrote:
>> On Tue, 20 Jul 2021 at 20:54, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> This will allow a breakpoint hack to move out of AVR's translator.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>>> diff --git a/cpu.c b/cpu.c
>>> index 83059537d7..91d9e38acb 100644
>>> --- a/cpu.c
>>> +++ b/cpu.c
>>> @@ -267,8 +267,13 @@ static void breakpoint_invalidate(CPUState *cpu,
>>> target_ulong pc)
>>>   int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
>>>                             CPUBreakpoint **breakpoint)
>>>   {
>>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>>>       CPUBreakpoint *bp;
>>>
>>> +    if (cc->gdb_adjust_breakpoint) {
>>> +        pc = cc->gdb_adjust_breakpoint(cpu, pc);
>>> +    }
>>> +
>>>       bp = g_malloc(sizeof(*bp));
>>>
>>>       bp->pc = pc;
>>> @@ -294,8 +299,13 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr
>>> pc, int flags,
>>>   /* Remove a specific breakpoint.  */
>>>   int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
>>>   {
>>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>>>       CPUBreakpoint *bp;
>>>
>>> +    if (cc->gdb_adjust_breakpoint) {
>>> +        pc = cc->gdb_adjust_breakpoint(cpu, pc);
>>> +    }
>>> +
>>>       QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>>>           if (bp->pc == pc && bp->flags == flags) {
>>>               cpu_breakpoint_remove_by_ref(cpu, bp);
>>> -- 
>>
>> So previously for AVR we would have considered the bp at 0x100
>> and the one at 0x800100 as distinct (in the sense that the only way
>> the gdb remote protocol distinguishes breakpoints is by "what address",
>> and these have different addresses). After this change, they won't
>> be distinct, because if you set a bp at 0x100 and 0x800100 and then
>> try to remove the one at 0x100 we might remove the 0x800100 one,
>> because we're storing only the adjusted-address, not the one gdb used.
>>
>> This might not matter in practice...
> 
> I don't think it will matter.
> 
> Currently, if it sets both 0x100 and 0x800100, then we'll record two
> breakpoints, and with either we'll raise EXCP_DEBUG when pc == 0x100.
> 
> Afterward, we'll have two CPUBreakpoint structures that both contain
> 0x100, and when pc == 0x100 we'll raise EXCP_DEBUG.  If gdb removes the
> breakpoint at 0x800100, we'll remove one of the two CPUBreakpoint.  But
> we'll still stop at 0x100, as expected.  When it removes the breakpoint
> at 0x100, both CPUBreakpoint structures will be gone.
> 
> In principal, gdb could now add a breakpoint at 0x800100 and remove it
> with 0x100, where it could not before.  But I don't expect that to
> happen.  If we reported any kind of status to gdb re the breakpoint
> insertion or removal (e.g. bp not found), then it might matter, but we
> don't.
> 
> Practically, this is working around what I'd call a gdb bug wrt avr. 
> Which may even have been fixed -- I haven't looked.

This is not a bug but a feature to deal with the Harvard architecture.
QEMU AVR model is based on GCC sources so uses the same "feature".

The AVR core has 2 address spaces: "CODE" and "DATA". An address space
is always zero-based (so both are). To avoid having to deal with
relocation of symbols from different AS but having same address, the
DATA space is mapped at 0x800000 (bit 23 is "virtual" as inexistant
- masked - from the CODE AS).

The core can not execute from DATA, so CPUBreakpoint can only be
triggered from CODE.

I once implemented different AS but switched to smth else :/
It was working but for some reason I couldn't remove the
OFFSET_DATA / OFFSET_CODE definitions, I don't remember &
should respin... See
https://gitlab.com/philmd/qemu/-/compare/avr_gsoc_v1a...avr_gsoc_v1b

Extract of the patches to show the idea:

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
+/* Indexes used when registering address spaces with
cpu_address_space_init */
+typedef enum AVRASIdx {
+    AVRASIdx_CODE = 0,
+    AVRASIdx_DATA = 1,
+} AVRASIdx;

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
@@ -96,6 +98,13 @@ static void avr_cpu_realizefn(DeviceState *dev, Error
**errp)
         error_propagate(errp, local_err);
         return;
     }
+
+    cs->num_ases = 2;
+    cpu_address_space_init(cs, AVRASIdx_CODE, "cpu-program-bus",
+                           get_program_memory());
+    cpu_address_space_init(cs, AVRASIdx_DATA, "cpu-data-bus",
+                           get_data_memory());
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);

diff --git a/target/avr/helper.c b/target/avr/helper.c
-/*
- * This function implements IN instruction
- *
- * It does the following
- * a.  if an IO register belongs to CPU, its value is read and returned
- * b.  otherwise io address is translated to mem address and physical
memory
- *     is read.
- * c.  it caches the value for sake of SBI, SBIC, SBIS & CBI implementation
- *
- */
-target_ulong helper_inb(CPUAVRState *env, uint32_t port)
+static uint8_t data_read(CPUAVRState *env, uint32_t addr)
 {
-    target_ulong data = 0;
+    CPUState *cs;
+    AddressSpace *as;
+    uint8_t data = 0;

-    switch (port) {
+    switch (addr) {
+    case 0x00 ... 0x1f:
+        /* CPU registers */
+        data = env->r[addr];
+        break;
     case 0x38: /* RAMPD */
-        data = 0xff & (env->rampD >> 16);
+        /* FIXME check available feature? */
+        data = env->rampD >> 16;
         break;
     case 0x39: /* RAMPX */
-        data = 0xff & (env->rampX >> 16);
+        data = env->rampX >> 16;
         break;
     case 0x3a: /* RAMPY */
-        data = 0xff & (env->rampY >> 16);
+        data = env->rampY >> 16;
         break;
     case 0x3b: /* RAMPZ */
-        data = 0xff & (env->rampZ >> 16);
+        data = env->rampZ >> 16;
         break;
     case 0x3c: /* EIND */
-        data = 0xff & (env->eind >> 16);
+        data = env->eind >> 16;
         break;
     case 0x3d: /* SPL */
         data = env->sp & 0x00ff;
@@ -232,12 +230,30 @@ target_ulong helper_inb(CPUAVRState *env, uint32_t
port)
         break;
     default:
         /* not a special register, pass to normal memory access */
-        cpu_physical_memory_read(OFFSET_IO_REGISTERS + port, &data, 1);
+        cs = env_cpu(env);
+        as = cpu_get_address_space(cs, AVRASIdx_DATA);
+        data = address_space_ldub(as, addr, MEMTXATTRS_UNSPECIFIED, NULL);
     }
+    trace_avr_data_read(addr, data);

     return data;
 }

+/*
+ * This function implements IN instruction
+ *
+ * It does the following
+ * a.  if an IO register belongs to CPU, its value is read and returned
+ * b.  otherwise io address is translated to mem address and physical
memory
+ *     is read.
+ * c.  it caches the value for sake of SBI, SBIC, SBIS & CBI implementation
+ *
+ */
+target_ulong helper_inb(CPUAVRState *env, uint32_t port)
+{
+    return data_read(env, NUMBER_OF_CPU_REGISTERS + port);
+}

@@ -299,21 +315,9 @@ void helper_outb(CPUAVRState *env, uint32_t port,
uint32_t data)
  */
 target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
 {
-    uint8_t data;
-
     env->fullacc = false;

-    if (addr < NUMBER_OF_CPU_REGISTERS) {
-        /* CPU registers */
-        data = env->r[addr];
-    } else if (addr < NUMBER_OF_CPU_REGISTERS + NUMBER_OF_IO_REGISTERS) {
-        /* IO registers */
-        data = helper_inb(env, addr - NUMBER_OF_CPU_REGISTERS);
-    } else {
-        /* memory */
-        cpu_physical_memory_read(OFFSET_DATA + addr, &data, 1);
-    }
-    return data;
+    return data_read(env, addr);
 }

