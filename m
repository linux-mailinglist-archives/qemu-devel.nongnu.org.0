Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293E8589D3F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 16:09:04 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJbX5-0003QH-3T
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 10:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJbVI-0000nP-Qi
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:07:12 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:40431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJbVB-0002wx-Jo
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:07:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.98])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AD46224284;
 Thu,  4 Aug 2022 14:07:01 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 16:07:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002ebac5b47-9abb-45bc-bd1d-6002f1b2dc01,
 E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f83417f2-e7b6-d8da-e33d-7e06efaa21b7@kaod.org>
Date: Thu, 4 Aug 2022 16:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] cputlb and ssi: cache class to avoid expensive
 object_dynamic_cast_assert (HACK!!!)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220804092044.2101093-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220804092044.2101093-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 98c2c556-72fe-42d7-a945-869719172d53
X-Ovh-Tracer-Id: 15169530922459892658
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hello Alex,

Thanks for putting some time into this problem,

On 8/4/22 11:20, Alex Bennée wrote:
> Investigating why some BMC models are so slow compared to a plain ARM
> virt machines I did some profiling of:
> 
>    ./qemu-system-arm -M romulus-bmc -nic user \
>      -drive
>      file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
>      -nographic -serial mon:stdio
> 
> And saw that object_dynamic_cast was dominating the profile times. We
> have a number of cases in the CPU hot path and more importantly for
> this model in the SSI bus. As the class is static once the object is
> created we just cache it and use it instead of the dynamic case
> macros.
> 
> [AJB: I suspect a proper fix for this is for QOM to support a cached
> class lookup, abortive macro attempt #if 0'd in this patch].
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cédric Le Goater <clg@kaod.org>


Here are some results,

* romulus-bmc, OpenBmc login prompt

   without : 82s
   with    : 56s

* ast2500-evb,execute-in-place=true, U-boot 2019.04 prompt

   without : 30s
   with    : 22s

* witherspoon-bmc,execute-in-place=true, U-boot 2016.07 prompt

   without : 5.5s
   with    : 4.1s

There is definitely an improvement in all scenarios.

Applying a similar technique on AspeedSMCClass, I could gain
another ~10% and boot the ast2500-evb,execute-in-place=true
machine, up to the U-boot 2019.04 prompt, in less then 20s.

However, newer u-boot are still quite slow to boot when executing
from the flash device.

Thanks,

C.

> ---
>   include/hw/core/cpu.h |  2 ++
>   include/hw/ssi/ssi.h  |  3 +++
>   include/qom/object.h  | 29 +++++++++++++++++++++++++++++
>   accel/tcg/cputlb.c    | 12 ++++++++----
>   hw/ssi/ssi.c          | 10 +++++++---
>   5 files changed, 49 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 500503da13..70027a772e 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -317,6 +317,8 @@ struct qemu_work_item;
>   struct CPUState {
>       /*< private >*/
>       DeviceState parent_obj;
> +    /* cache to avoid expensive CPU_GET_CLASS */
> +    CPUClass *cc;
>       /*< public >*/
>   
>       int nr_cores;
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index f411858ab0..6950f86810 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -59,6 +59,9 @@ struct SSIPeripheralClass {
>   struct SSIPeripheral {
>       DeviceState parent_obj;
>   
> +    /* cache the class */
> +    SSIPeripheralClass *spc;
> +
>       /* Chip select state */
>       bool cs;
>   };
> diff --git a/include/qom/object.h b/include/qom/object.h
> index ef7258a5e1..2202dbfa43 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -198,6 +198,35 @@ struct Object
>       OBJ_NAME##_CLASS(const void *klass) \
>       { return OBJECT_CLASS_CHECK(ClassType, klass, TYPENAME); }
>   
> +#if 0
> +/**
> + * DECLARE_CACHED_CLASS_CHECKER:
> + * @InstanceType: instance struct name
> + * @ClassType: class struct name
> + * @OBJ_NAME: the object name in uppercase with underscore separators
> + * @TYPENAME: type name
> + *
> + * This variant of DECLARE_CLASS_CHECKERS allows for the caching of
> + * class in the parent object instance. This is useful for very hot
> + * path code at the expense of an extra indirection and check. As per
> + * the original direct usage of this macro should be avoided if the
> + * complete OBJECT_DECLARE_TYPE macro has been used.
> + *
> + * This macro will provide the class type cast functions for a
> + * QOM type.
> + */
> +#define DECLARE_CACHED_CLASS_CHECKERS(InstanceType, ClassType, OBJ_NAME, TYPENAME) \
> +    DECLARE_CLASS_CHECKERS(ClassType, OBJ_NAME, TYPENAME) \
> +    static inline G_GNUC_UNUSED ClassType * \
> +    OBJ_NAME##_GET_CACHED_CLASS(const void *obj) \
> +    { \
> +        InstanceType *p = (InstanceType *) obj; \
> +        p->cc = p->cc ? p->cc : OBJECT_GET_CLASS(ClassType, obj, TYPENAME);\
> +        return p->cc;                                                   \
> +    }
> +
> +#endif
> +
>   /**
>    * DECLARE_OBJ_CHECKERS:
>    * @InstanceType: instance struct name
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index a46f3a654d..882315f7dd 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1303,8 +1303,9 @@ static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
>   static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
>                        MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
>   {
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
> +    CPUClass *cc = cpu->cc ? cpu->cc : CPU_GET_CLASS(cpu);
>       bool ok;
> +    cpu->cc = cc;
>   
>       /*
>        * This is not a probe, so only valid return is success; failure
> @@ -1319,7 +1320,8 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>                                           MMUAccessType access_type,
>                                           int mmu_idx, uintptr_t retaddr)
>   {
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
> +    CPUClass *cc = cpu->cc ? cpu->cc : CPU_GET_CLASS(cpu);
> +    cpu->cc = cc;
>   
>       cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
>   }
> @@ -1331,7 +1333,8 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
>                                             MemTxResult response,
>                                             uintptr_t retaddr)
>   {
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
> +    CPUClass *cc = cpu->cc ? cpu->cc : CPU_GET_CLASS(cpu);
> +    cpu->cc = cc;
>   
>       if (!cpu->ignore_memory_transaction_failures &&
>           cc->tcg_ops->do_transaction_failed) {
> @@ -1606,7 +1609,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>       if (!tlb_hit_page(tlb_addr, page_addr)) {
>           if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
>               CPUState *cs = env_cpu(env);
> -            CPUClass *cc = CPU_GET_CLASS(cs);
> +            CPUClass *cc = cs->cc ? cs->cc : CPU_GET_CLASS(cs);
> +            cs->cc = cc;
>   
>               if (!cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
>                                          mmu_idx, nonfault, retaddr)) {
> diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
> index 003931fb50..f749feb6e3 100644
> --- a/hw/ssi/ssi.c
> +++ b/hw/ssi/ssi.c
> @@ -38,7 +38,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
>       bool cs = !!level;
>       assert(n == 0);
>       if (s->cs != cs) {
> -        SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s);
> +        /* SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s); */
> +        SSIPeripheralClass *ssc = s->spc;
>           if (ssc->set_cs) {
>               ssc->set_cs(s, cs);
>           }
> @@ -48,7 +49,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
>   
>   static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev, uint32_t val)
>   {
> -    SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev);
> +    /* SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev); */
> +    SSIPeripheralClass *ssc = dev->spc;
>   
>       if ((dev->cs && ssc->cs_polarity == SSI_CS_HIGH) ||
>               (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
> @@ -67,6 +69,7 @@ static void ssi_peripheral_realize(DeviceState *dev, Error **errp)
>               ssc->cs_polarity != SSI_CS_NONE) {
>           qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
>       }
> +    s->spc = ssc;
>   
>       ssc->realize(s, errp);
>   }
> @@ -120,7 +123,8 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
>   
>       QTAILQ_FOREACH(kid, &b->children, sibling) {
>           SSIPeripheral *peripheral = SSI_PERIPHERAL(kid->child);
> -        ssc = SSI_PERIPHERAL_GET_CLASS(peripheral);
> +        /* ssc = SSI_PERIPHERAL_GET_CLASS(peripheral); */
> +        ssc = peripheral->spc;
>           r |= ssc->transfer_raw(peripheral, val);
>       }
>   


