Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E09589F99
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:57:52 +0200 (CEST)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeAR-0003e0-6s
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJe6o-0007i4-R9
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:54:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJe6m-0004S7-Lu
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:54:06 -0400
Received: by mail-wr1-x436.google.com with SMTP id l22so408849wrz.7
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 09:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=auqKq1BT6RDFQ7RZTCzTfFZRMVu2hlYLtOn8j7h0FSo=;
 b=ORLMej34il5AyI3iftbTLw4ZqfcOFv9l/oe+2OzxbLd+TvSYqFb5faUGBqYT4MdNiv
 4DPalRYLB67K4RTc45ir7+0tq9DiP7ouq6XUVnrmbUlXQ6uyor9e8n74hxierZF/iXPw
 /BJ+Fqa1TSYnyHTWItpp7ubP/BbMkWRGDMhFladPa2lE50YKRcS7JO37ujBYGsA0UpGc
 c85PBDONy0ZRI2x3UF1t3GJnVt1D1Phl14Wl6240dCoYaVGc+DJZWRWKk2CVSyb0rtio
 Yrtttp0o7XJQa4LvA8BdvDR9E3GCXCv7yxfHyGuJUcPdN20yyiLS2jKdl7+aJ8dnzS39
 0KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=auqKq1BT6RDFQ7RZTCzTfFZRMVu2hlYLtOn8j7h0FSo=;
 b=SXsxHmSKAxX9X0lVlazZ/ZAA126s3ib5eKWiVc4L0wZWX1a+FkMfW+6yaFY4qbak8I
 RqPYiyisk0gAse/PjQqDG/ttBlmPv1sLqTkuUtweEPSxsVZAA3Zzux8f71mEWmIFErp5
 qYYDJtkgWaRzVpSmq5a6y32kCp/hc7G/TGE1UYGpxjrV69c3v+IlekG+vQ7RIwX9Qxok
 4W1v9XEXc35lnjWHXWyagsKxvpXlL+RZyF7T/PfupmU6WZYKHAK4gbIVjRkwUHHYKS5O
 1Mf800pxVUDY0VVHOAFyTioh8FXu78ZknHG3crLuaGTsxBp14t+iOprtl2l6Bdaf0z08
 qKRw==
X-Gm-Message-State: ACgBeo3MTlbUTBnX4S1Uf1t9D7K+6ftsX+uweJlTZ8dZxcB+W0sf7Z+j
 PGBrxtiRTkZTMZLJsOrt9IrYuA==
X-Google-Smtp-Source: AA6agR7UO+R58qrHnVBCOdcVLt25SR7hjKY8dRf9bW7o+f3zIwzzVJGlYG5xA0tGdZpEdHiTQB1FIQ==
X-Received: by 2002:adf:f68f:0:b0:220:5b78:6aab with SMTP id
 v15-20020adff68f000000b002205b786aabmr1971121wrp.362.1659632042502; 
 Thu, 04 Aug 2022 09:54:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d6b82000000b0021e43b4edf0sm1550501wrx.20.2022.08.04.09.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 09:54:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C91021FFB7;
 Thu,  4 Aug 2022 17:54:00 +0100 (BST)
References: <20220804092044.2101093-1-alex.bennee@linaro.org>
 <f83417f2-e7b6-d8da-e33d-7e06efaa21b7@kaod.org>
User-agent: mu4e 1.7.27; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis
 <alistair@alistair23.me>, Eduardo  Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <f4bug@amsat.org>, Yanan Wang <wangyanan55@huawei.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH] cputlb and ssi: cache class to avoid expensive
 object_dynamic_cast_assert (HACK!!!)
Date: Thu, 04 Aug 2022 17:51:27 +0100
In-reply-to: <f83417f2-e7b6-d8da-e33d-7e06efaa21b7@kaod.org>
Message-ID: <87fsicne53.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Hello Alex,
>
> Thanks for putting some time into this problem,
>
> On 8/4/22 11:20, Alex Benn=C3=A9e wrote:
>> Investigating why some BMC models are so slow compared to a plain ARM
>> virt machines I did some profiling of:
>>    ./qemu-system-arm -M romulus-bmc -nic user \
>>      -drive
>>      file=3Dobmc-phosphor-image-romulus.static.mtd,format=3Draw,if=3Dmtd=
 \
>>      -nographic -serial mon:stdio
>> And saw that object_dynamic_cast was dominating the profile times.
>> We
>> have a number of cases in the CPU hot path and more importantly for
>> this model in the SSI bus. As the class is static once the object is
>> created we just cache it and use it instead of the dynamic case
>> macros.
>> [AJB: I suspect a proper fix for this is for QOM to support a cached
>> class lookup, abortive macro attempt #if 0'd in this patch].
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
>
>
> Here are some results,
>
> * romulus-bmc, OpenBmc login prompt
>
>   without : 82s
>   with    : 56s

Looks like I lucked out picking the lowest hanging fruit.

>
> * ast2500-evb,execute-in-place=3Dtrue, U-boot 2019.04 prompt
>
>   without : 30s
>   with    : 22s
>
> * witherspoon-bmc,execute-in-place=3Dtrue, U-boot 2016.07 prompt
>
>   without : 5.5s
>   with    : 4.1s
>
> There is definitely an improvement in all scenarios.
>
> Applying a similar technique on AspeedSMCClass, I could gain
> another ~10% and boot the ast2500-evb,execute-in-place=3Dtrue
> machine, up to the U-boot 2019.04 prompt, in less then 20s.

There are some fundamentals to XIP which means they will be slower if
each instruction is being sucked through io_readx/device emulation
although I'm not sure what the exact mechanism is because surely a ROM
can just be mapped into the address space and run from there?

> However, newer u-boot are still quite slow to boot when executing
> from the flash device.

For any of those machines? Whats the next command line for me to dig
into?

>
> Thanks,
>
> C.
>
>> ---
>>   include/hw/core/cpu.h |  2 ++
>>   include/hw/ssi/ssi.h  |  3 +++
>>   include/qom/object.h  | 29 +++++++++++++++++++++++++++++
>>   accel/tcg/cputlb.c    | 12 ++++++++----
>>   hw/ssi/ssi.c          | 10 +++++++---
>>   5 files changed, 49 insertions(+), 7 deletions(-)
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 500503da13..70027a772e 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -317,6 +317,8 @@ struct qemu_work_item;
>>   struct CPUState {
>>       /*< private >*/
>>       DeviceState parent_obj;
>> +    /* cache to avoid expensive CPU_GET_CLASS */
>> +    CPUClass *cc;
>>       /*< public >*/
>>         int nr_cores;
>> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
>> index f411858ab0..6950f86810 100644
>> --- a/include/hw/ssi/ssi.h
>> +++ b/include/hw/ssi/ssi.h
>> @@ -59,6 +59,9 @@ struct SSIPeripheralClass {
>>   struct SSIPeripheral {
>>       DeviceState parent_obj;
>>   +    /* cache the class */
>> +    SSIPeripheralClass *spc;
>> +
>>       /* Chip select state */
>>       bool cs;
>>   };
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index ef7258a5e1..2202dbfa43 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -198,6 +198,35 @@ struct Object
>>       OBJ_NAME##_CLASS(const void *klass) \
>>       { return OBJECT_CLASS_CHECK(ClassType, klass, TYPENAME); }
>>   +#if 0
>> +/**
>> + * DECLARE_CACHED_CLASS_CHECKER:
>> + * @InstanceType: instance struct name
>> + * @ClassType: class struct name
>> + * @OBJ_NAME: the object name in uppercase with underscore separators
>> + * @TYPENAME: type name
>> + *
>> + * This variant of DECLARE_CLASS_CHECKERS allows for the caching of
>> + * class in the parent object instance. This is useful for very hot
>> + * path code at the expense of an extra indirection and check. As per
>> + * the original direct usage of this macro should be avoided if the
>> + * complete OBJECT_DECLARE_TYPE macro has been used.
>> + *
>> + * This macro will provide the class type cast functions for a
>> + * QOM type.
>> + */
>> +#define DECLARE_CACHED_CLASS_CHECKERS(InstanceType, ClassType, OBJ_NAME=
, TYPENAME) \
>> +    DECLARE_CLASS_CHECKERS(ClassType, OBJ_NAME, TYPENAME) \
>> +    static inline G_GNUC_UNUSED ClassType * \
>> +    OBJ_NAME##_GET_CACHED_CLASS(const void *obj) \
>> +    { \
>> +        InstanceType *p =3D (InstanceType *) obj; \
>> +        p->cc =3D p->cc ? p->cc : OBJECT_GET_CLASS(ClassType, obj, TYPE=
NAME);\
>> +        return p->cc;                                                  =
 \
>> +    }
>> +
>> +#endif
>> +
>>   /**
>>    * DECLARE_OBJ_CHECKERS:
>>    * @InstanceType: instance struct name
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index a46f3a654d..882315f7dd 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1303,8 +1303,9 @@ static inline ram_addr_t qemu_ram_addr_from_host_n=
ofail(void *ptr)
>>   static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
>>                        MMUAccessType access_type, int mmu_idx, uintptr_t=
 retaddr)
>>   {
>> -    CPUClass *cc =3D CPU_GET_CLASS(cpu);
>> +    CPUClass *cc =3D cpu->cc ? cpu->cc : CPU_GET_CLASS(cpu);
>>       bool ok;
>> +    cpu->cc =3D cc;
>>         /*
>>        * This is not a probe, so only valid return is success; failure
>> @@ -1319,7 +1320,8 @@ static inline void cpu_unaligned_access(CPUState *=
cpu, vaddr addr,
>>                                           MMUAccessType access_type,
>>                                           int mmu_idx, uintptr_t retaddr)
>>   {
>> -    CPUClass *cc =3D CPU_GET_CLASS(cpu);
>> +    CPUClass *cc =3D cpu->cc ? cpu->cc : CPU_GET_CLASS(cpu);
>> +    cpu->cc =3D cc;
>>         cc->tcg_ops->do_unaligned_access(cpu, addr, access_type,
>> mmu_idx, retaddr);
>>   }
>> @@ -1331,7 +1333,8 @@ static inline void cpu_transaction_failed(CPUState=
 *cpu, hwaddr physaddr,
>>                                             MemTxResult response,
>>                                             uintptr_t retaddr)
>>   {
>> -    CPUClass *cc =3D CPU_GET_CLASS(cpu);
>> +    CPUClass *cc =3D cpu->cc ? cpu->cc : CPU_GET_CLASS(cpu);
>> +    cpu->cc =3D cc;
>>         if (!cpu->ignore_memory_transaction_failures &&
>>           cc->tcg_ops->do_transaction_failed) {
>> @@ -1606,7 +1609,8 @@ static int probe_access_internal(CPUArchState *env=
, target_ulong addr,
>>       if (!tlb_hit_page(tlb_addr, page_addr)) {
>>           if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
>>               CPUState *cs =3D env_cpu(env);
>> -            CPUClass *cc =3D CPU_GET_CLASS(cs);
>> +            CPUClass *cc =3D cs->cc ? cs->cc : CPU_GET_CLASS(cs);
>> +            cs->cc =3D cc;
>>                 if (!cc->tcg_ops->tlb_fill(cs, addr, fault_size,
>> access_type,
>>                                          mmu_idx, nonfault, retaddr)) {
>> diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
>> index 003931fb50..f749feb6e3 100644
>> --- a/hw/ssi/ssi.c
>> +++ b/hw/ssi/ssi.c
>> @@ -38,7 +38,8 @@ static void ssi_cs_default(void *opaque, int n, int le=
vel)
>>       bool cs =3D !!level;
>>       assert(n =3D=3D 0);
>>       if (s->cs !=3D cs) {
>> -        SSIPeripheralClass *ssc =3D SSI_PERIPHERAL_GET_CLASS(s);
>> +        /* SSIPeripheralClass *ssc =3D SSI_PERIPHERAL_GET_CLASS(s); */
>> +        SSIPeripheralClass *ssc =3D s->spc;
>>           if (ssc->set_cs) {
>>               ssc->set_cs(s, cs);
>>           }
>> @@ -48,7 +49,8 @@ static void ssi_cs_default(void *opaque, int n, int le=
vel)
>>     static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev,
>> uint32_t val)
>>   {
>> -    SSIPeripheralClass *ssc =3D SSI_PERIPHERAL_GET_CLASS(dev);
>> +    /* SSIPeripheralClass *ssc =3D SSI_PERIPHERAL_GET_CLASS(dev); */
>> +    SSIPeripheralClass *ssc =3D dev->spc;
>>         if ((dev->cs && ssc->cs_polarity =3D=3D SSI_CS_HIGH) ||
>>               (!dev->cs && ssc->cs_polarity =3D=3D SSI_CS_LOW) ||
>> @@ -67,6 +69,7 @@ static void ssi_peripheral_realize(DeviceState *dev, E=
rror **errp)
>>               ssc->cs_polarity !=3D SSI_CS_NONE) {
>>           qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
>>       }
>> +    s->spc =3D ssc;
>>         ssc->realize(s, errp);
>>   }
>> @@ -120,7 +123,8 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
>>         QTAILQ_FOREACH(kid, &b->children, sibling) {
>>           SSIPeripheral *peripheral =3D SSI_PERIPHERAL(kid->child);
>> -        ssc =3D SSI_PERIPHERAL_GET_CLASS(peripheral);
>> +        /* ssc =3D SSI_PERIPHERAL_GET_CLASS(peripheral); */
>> +        ssc =3D peripheral->spc;
>>           r |=3D ssc->transfer_raw(peripheral, val);
>>       }
>>=20=20=20


--=20
Alex Benn=C3=A9e

