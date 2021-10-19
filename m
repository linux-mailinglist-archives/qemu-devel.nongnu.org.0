Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1B43403D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 23:12:44 +0200 (CEST)
Received: from localhost ([::1]:37564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcwPb-0006Fl-Aj
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 17:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcwO8-0005Vq-Op
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 17:11:12 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcwO6-000105-LD
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 17:11:12 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so933130pjb.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1/+vEKP2Ydmmgoy/Y658yF4AjsXqK6S0XIknQKpKmk8=;
 b=fbikLcy2j5IzT7d4fECKAnF3eBRWWyeGaGqyfGWjyG/9wf6OA6ApXCTJswmRWn9Tms
 cXK8IzipxwgG8JMOooKpzF2CZhxEkrU7msl3UEeq4DEuebivVuNrVgoZL/+7psv8X7uP
 iywlQb/rDM+yIMz7Lc2Bf7Lbvc0fw47Qo81EHFhs95WrGZl4qbmevyQRkLLSS3oF+tfT
 iScYv+yZYWxOji9yIDIxJlqv1sz/CtWKZwEZB9vE15N/X3dIVy3Tep8gKIS23IlI9bwB
 nzzlD1mL79afNMloIesLsaudYdsgr+xvSA8vfJGQicXCi36FAUiFOw5O6BZH+CW0Al10
 X3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1/+vEKP2Ydmmgoy/Y658yF4AjsXqK6S0XIknQKpKmk8=;
 b=qQmLQEVcIVa1Fp+fYnfGU1RJCFQb23tOvCWH6ygfp+0g12be8CIBN1b74rBJd/fleT
 PRC+r0/B6CAM4w+LRLpDub+y+zyjmIBczEG1KmnPr/Itcv06aYgg84X/p3ZaXFakXvRN
 fcmKAtqJTMyyKGA7mAvhFJu862xmd2ayVNTMC1/JI6abLERuR5ZIm9LUcay0RBJoQUmh
 yLGLsVukc9kEbJpgTVdbHIuis2bI4thVCaonj/P+YHfS54YiL5JFkzRe86vNcabB4Zo6
 rfI0uEyTi3yhRH7Dn6bE333rU6JGeHecrxGZLFQYOHqnRe2WqtqoTS2/qQi46qOUor9X
 aJDA==
X-Gm-Message-State: AOAM533jnbMR0smmgSLYl1rV8hmoJuiPLY1p6UIxV/69MqcNc8loaYmi
 sdswE5trBtAIgvCPvEiuyM3a6Q==
X-Google-Smtp-Source: ABdhPJyFaoWX3tEB/o42nNYbEfjCOTGNjMK3ECxtHlUnfpnNEYYsQywtblcdZwDgAh7ufcb48feGoA==
X-Received: by 2002:a17:90b:3e87:: with SMTP id
 rj7mr2618797pjb.88.1634677868894; 
 Tue, 19 Oct 2021 14:11:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm132020pga.65.2021.10.19.14.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 14:11:08 -0700 (PDT)
Subject: Re: [PATCH 06/31] target/loongarch: Add mmu support for Loongarch CPU.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-7-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <538a03ec-a1cf-3b1d-e0c6-4bec54aad94c@linaro.org>
Date: Tue, 19 Oct 2021 14:11:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-7-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> @@ -272,6 +288,7 @@ static const struct SysemuCPUOps loongarch_sysemu_ops = {
>   #ifdef CONFIG_TCG
>   #include "hw/core/tcg-cpu-ops.h"
>   
> +#ifdef CONFIG_USER_ONLY
>   static bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr)
> @@ -280,9 +297,14 @@ static bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       CPULoongArchState *env = &cpu->env;
>   
>       env->badaddr = address;
> -    cs->exception_index = EXCP_ADE;
> +    if (access_type == MMU_DATA_STORE) {
> +        cs->exception_index = EXCP_ADES;
> +    } else {
> +        cs->exception_index = EXCP_ADEL;
> +    }
>       do_raise_exception(env, cs->exception_index, retaddr);
>   }
> +#endif

It's too early to add this ifdef.  With what's upstream at the moment, you've broken 
loongarch-linux-user build by removing loongarch_cpu_tlb_fill.

There are patches out for review that would require tlb_fill be a system-only hook, but 
they have not landed yet.

> +#define LOONGARCH_HFLAG_KU     0x00003 /* kernel/user mode mask   */
> +#define LOONGARCH_HFLAG_UM     0x00003 /* user mode flag                     */
> +#define LOONGARCH_HFLAG_KM     0x00000 /* kernel mode flag                   */

I think you might as well represent all 3 priv levels: it's not a "kernel/user" mask.

> +#define EXCP_TLB_NOMATCH   0x1
> +#define EXCP_INST_NOTAVAIL 0x2 /* No valid instruction word for BadInstr */

These should be with the other EXCP values in the enum.
At the moment you're overlapping EXCP_ADES and EXCP_SYSCALL.

> @@ -130,7 +139,11 @@ void loongarch_cpu_list(void);
>   
>   static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
>   {
> +#ifdef CONFIG_USER_ONLY
>       return MMU_USER_IDX;
> +#else
> +    return env->CSR_CRMD & LOONGARCH_HFLAG_KU;

Better would be

     return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);

since that's the field you're extracting from CRMD.

> +typedef struct ls3a5k_tlb_t ls3a5k_tlb_t;

Types should be in CamelCase, without _t suffix.

> +struct ls3a5k_tlb_t {
> +    target_ulong VPN;
> +    uint64_t PageMask;
> +    uint32_t PageSize;
> +    uint16_t ASID;
> +    unsigned int V0:1;     /* CSR_TLBLO[0] */
> +    unsigned int V1:1;
> +
> +    unsigned int D0:1;     /* CSR_TLBLO[1] */
> +    unsigned int D1:1;
> +
> +    unsigned int PLV0:2;   /* CSR_TLBLO[3:2] */
> +    unsigned int PLV1:2;
> +
> +    unsigned int MAT0:3;   /* CSR_TLBLO[5:4] */
> +    unsigned int MAT1:3;
> +
> +    unsigned int G:1;      /* CSR_TLBLO[6] */
> +
> +    uint64_t PPN0;         /* CSR_TLBLO[47:12] */
> +    uint64_t PPN1;
> +
> +    unsigned int NR0:1;    /* CSR_TLBLO[61] */
> +    unsigned int NR1:1;
> +
> +    unsigned int NX0:1;    /* CSR_TLBLO[62] */
> +    unsigned int NX1:1;
> +
> +    unsigned int NE:1;     /* CSR_TLBIDX[31] */
> +
> +    unsigned int RPLV0:1;
> +    unsigned int RPLV1:1;  /* CSR_TLBLO[63] */
> +};

It would be much better if you didn't use bitfields at all.  This was a bad idea when mips 
did it; let us not compound the error.

Just use the format defined by the architecture for the CSRs: a couple of uint64_t.  Use 
FIELD definitions to give the parts intelligible names.

> +typedef struct ls3a5k_tlb_t ls3a5k_tlb_t;
> +
> +struct CPULoongArchTLBContext {
> +    uint32_t nb_tlb;
> +    int (*map_address)(struct CPULoongArchState *env, hwaddr *physical,
> +                       int *prot, target_ulong address,
> +                       MMUAccessType access_type);
> +    struct {
> +        uint64_t     stlb_mask;
> +        uint32_t     stlb_size; /* at most : 8 * 256 = 2048 */
> +        uint32_t     mtlb_size; /* at most : 64 */
> +        ls3a5k_tlb_t tlb[LOONGARCH_TLB_MAX];
> +    } ls3a5k;
> +};

There's probably no point in using an indirect function call until you've got more than 
one mmu implementation.  You're copying too much from mips.

> +/* TLB state */
> +static int get_tlb(QEMUFile *f, void *pv, size_t size,
> +                   const VMStateField *field)
> +{
> +    ls3a5k_tlb_t *v = pv;
> +    uint32_t flags;
> +
> +    qemu_get_betls(f, &v->VPN);
> +    qemu_get_be64s(f, &v->PageMask);
> +    qemu_get_be32s(f, &v->PageSize);
> +    qemu_get_be16s(f, &v->ASID);
> +    qemu_get_be32s(f, &flags);
> +    v->RPLV1 = (flags >> 21) & 1;
> +    v->RPLV0 = (flags >> 20) & 1;
> +    v->PLV1 = (flags >> 18) & 3;
> +    v->PLV0 = (flags >> 16) & 3;
> +    v->NE = (flags >> 15) & 1;
> +    v->NR1 = (flags >> 14) & 1;
> +    v->NR0 = (flags >> 13) & 1;
> +    v->NX1 = (flags >> 12) & 1;
> +    v->NX0 = (flags >> 11) & 1;
> +    v->D1 = (flags >> 10) & 1;
> +    v->D0 = (flags >> 9) & 1;
> +    v->V1 = (flags >> 8) & 1;
> +    v->V0 = (flags >> 7) & 1;
> +    v->MAT1 = (flags >> 4) & 7;
> +    v->MAT0 = (flags >> 1) & 7;
> +    v->G = (flags >> 0) & 1;
> +    qemu_get_be64s(f, &v->PPN0);
> +    qemu_get_be64s(f, &v->PPN1);

Some of the ugly things that go away if you don't use bitfields.

> +const VMStateDescription vmstate_tlb = {
> +    .name = "cpu/tlb",
> +    .version_id = 2,
> +    .minimum_version_id = 2,

Too much copying again: version numbers do not start at 2.

> +void ls3a5k_mmu_init(CPULoongArchState *env)
> +{
> +    env->tlb = g_malloc0(sizeof(CPULoongArchTLBContext));

I think you should not make this a separate structure, and instead allocate this with 
CPULoongArchState.

> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
> index bea290df66..0be29994f9 100644
> --- a/target/loongarch/translate.c
> +++ b/target/loongarch/translate.c
> @@ -61,9 +61,10 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
>   {
>       int64_t bound;
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +    CPULoongArchState *env = cs->env_ptr;
>   
>       ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
> -    ctx->mem_idx = MMU_USER_IDX;
> +    ctx->mem_idx = cpu_mmu_index(env, false);

This is incorrect.  You want

     tb_flags = ctx->base.tb->flags;
     mem_idx = tb_flags & LOONGARCH_HFLAG_PRIV.

It is almost always incorrect to dereference env at this point.  Everything should have 
been encoded into tb_flags so that when we do the hashing of the TranslationBlocks we find 
the one that has been compiled for the correct privilege level, etc.


r~

