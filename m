Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE844DB7B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 19:16:43 +0100 (CET)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlEcs-00076z-8e
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 13:16:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlEbK-0005xz-5k
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:15:06 -0500
Received: from [2a00:1450:4864:20::32d] (port=33635
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlEbI-0005UB-3v
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:15:05 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso5984415wmh.0
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 10:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5o2QArGV+M02jDnobp3PoUb757l9HUJdpSRQ3A9O6BE=;
 b=nUVoJePiACb/K0XAqFUXO/ARDxqbXZzvZN+uOxG61gCHfymy8BBNcjjtcDdRQEHakm
 tqa+diG+DVpFQvnhXQaONPcELvW1xhOqObO2wpuc2hkTDh6CtS7M0RdkmCAbpZfoaTyZ
 0jTUUOydFTwjsx9X6HkmdxpFxD8lAnyf9V/AgN32FVYRQOVpKz1OW1HbInv8v4xpboFw
 N9BTPEeah+OOsZR32JZPE55zdx/Q18SaO6XtIHBPu5iIgBFBW/kU9+J4qCBBY5GrR1rH
 dwENf+UGFbImkgHq+vHImmoxhERM6N8YVP368ErzsMmDv7dCKeH1wa0Hz6pV1VEuboLz
 bDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5o2QArGV+M02jDnobp3PoUb757l9HUJdpSRQ3A9O6BE=;
 b=jmZO9BsVwez/So6c9/NEs79i4Wtz3zH5/ga8etBRmjjm6gWtAmBO7WgQgWWbcQdyr0
 xvQ4ZtMVSpS96FjY+fj/DunlWVsdt4uT7yRGCRMKp9oiDrqApmYyzJ6VLNdDa2dgO7g5
 oLJqEVABSULwlv+1rXZo3BPwGsle1Ni6r2CNUonk+FHjg0odqVHuSgeCYU286a8nuKU6
 HFcvC25Ioba1l0DFG0CGIwf3sja6oaqg8cTfEFmUlfzwEy0l4B5vFpjAX0im2AcHLrhX
 mbyrmo96XcJKvCmZ6VaIUQh5RODUc7FWJk10T5dHabh3UMo9UBZoW0StKYK8GSD9+2dI
 DjtQ==
X-Gm-Message-State: AOAM531yyVpKq//9Bsuu8cfq7H1c6gJFtcot1L3MLvuIuuGM3rIhQMy3
 +cCz9QEnfmh5AxdWo0R9dOOVtQ==
X-Google-Smtp-Source: ABdhPJxmmedvun+zwNSH3mys1riFjbACfXRllWdeJm7r0//JMKVbJJPuk+G/Y19JCekkUuyJHR63UA==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr10391725wmk.152.1636654502572; 
 Thu, 11 Nov 2021 10:15:02 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id h13sm3684803wrx.82.2021.11.11.10.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 10:15:02 -0800 (PST)
Subject: Re: [RFC PATCH v2 09/30] target/loongarch: Add TLB instruction support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-10-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1059243-06e9-d9d8-673a-55fc6e31b5cc@linaro.org>
Date: Thu, 11 Nov 2021 19:14:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-10-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
> +static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
> +{
> +    gen_helper_check_plv(cpu_env);
> +    gen_helper_tlbwr(cpu_env);
> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
> +    ctx->base.is_jmp = DISAS_EXIT;
> +    return true;
> +}

I think you can skip the EXIT if paging is disabled, which it usually will be in the 
software tlb handler.  You'd be able to tell with the mmu_idx being the one you use for 
paging disabled.

> +static void loongarch_invalidate_tlb_entry(CPULoongArchState *env,
> +                                           loongarch_tlb *tlb)
> +{
> +    CPUState *cs = env_cpu(env);
> +    target_ulong addr, end, mask;
> +    int tlb_v0, tlb_v1;
> +    uint64_t tlb_vppn;
> +    uint8_t tlb_ps;
> +
> +    tlb_v0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, V);
> +    tlb_v1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, V);
> +    tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
> +    tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
> +    mask = (1 << (1 + tlb_ps)) - 1;

MAKE_64BIT_MASK.

> +
> +    if (tlb_v0) {
> +        addr = tlb_vppn & ~mask;    /* xxx...xxx[0]000..0000 */
> +        end = addr | (mask >> 1);   /* xxx...xxx[0]111..1111 */
> +        while (addr < end) {
> +            tlb_flush_page(cs, addr);
> +            addr += TARGET_PAGE_SIZE;

tlb_flush_range_by_mmuidx.

> +    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, VPPN, csr_vppn);
> +    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 1);
> +    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
> +    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, ASID, csr_asid);
> +
> +    csr_g = FIELD_EX64(env->CSR_TLBELO0, CSR_TLBELO0, G) &
> +             FIELD_EX64(env->CSR_TLBELO1, CSR_TLBELO1, G);
> +    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, G, csr_g);
> +
> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, V,
> +                                 FIELD_EX64(lo0, CSR_TLBELO0, V));/* [0] */
> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, D,
> +                                 FIELD_EX64(lo0, CSR_TLBELO0, D));/* [1] */
> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, PLV,
> +                                 FIELD_EX64(lo0, CSR_TLBELO0, PLV));/* [3:2] */
> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, MAT,
> +                                 FIELD_EX64(lo0, CSR_TLBELO0, MAT));/* [5:4] */
> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, PPN,
> +                                 FIELD_EX64(lo0, CSR_TLBELO0, PPN));/* [47:12] */
> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, NR,
> +                                 FIELD_EX64(lo0, CSR_TLBELO0, NR));/* [61] */
> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, NX,
> +                                 FIELD_EX64(lo0, CSR_TLBELO0, NX));/* [62] */
> +    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, RPLV,
> +                                 FIELD_EX64(lo0, CSR_TLBELO0, RPLV));/* [63] */
> +
> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, V,
> +                                 FIELD_EX64(lo1, CSR_TLBELO1, V));/* [0] */
> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, D,
> +                                 FIELD_EX64(lo1, CSR_TLBELO1, D));/* [1] */
> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, PLV,
> +                                 FIELD_EX64(lo1, CSR_TLBELO1, PLV));/* [3:2] */
> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, MAT,
> +                                 FIELD_EX64(lo1, CSR_TLBELO1, MAT));/* [5:4] */
> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, PPN,
> +                                 FIELD_EX64(lo1, CSR_TLBELO1, PPN));/* [47:12] */
> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, NR,
> +                                 FIELD_EX64(lo1, CSR_TLBELO1, NR));/* [61] */
> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, NX,
> +                                 FIELD_EX64(lo1, CSR_TLBELO1, NX));/* [62] */
> +    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, RPLV,
> +                                 FIELD_EX64(lo1, CSR_TLBELO1, RPLV));/* [63] */

The point of making the two values have the same field layout is so that you can just 
assign the whole value across, not extract and re-deposit each field.

> +void helper_tlbsrch(CPULoongArchState *env)
> +{
> +    loongarch_tlb *tlb;
> +    uint64_t vpn, tlb_vppn;
> +    uint16_t csr_asid, tlb_asid, tlb_ps, tlb_e, tlb_g;
> +
> +    int stlb_size = env->stlb_size;
> +    int mtlb_size = env->mtlb_size;
> +    int i;
> +    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
> +
> +    /* Search MTLB + STLB */
> +    for (i = 0; i < stlb_size + mtlb_size; ++i) {
> +        tlb = &env->tlb[i];
> +        vpn = FIELD_EX64(env->CSR_TLBEHI, CSR_TLBEHI, VPPN);
> +        tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
> +        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
> +        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
> +        tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
> +        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
> +
> +        if ((tlb_g == 1 || tlb_asid == csr_asid) &&
> +            (vpn >> (tlb_ps + 1 - 13) == tlb_vppn >> (tlb_ps + 1 - 13)) && tlb_e) {
> +            env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
> +                                         INDEX, (i & 0xfff));
> +            env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
> +                                         PS, (tlb_ps & 0x3f));
> +            return;
> +        }
> +    }
> +
> +    env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
> +}

Surely this should share code with loongarch_map_address.

> +
> +void helper_tlbrd(CPULoongArchState *env)
> +{
> +    loongarch_tlb *tlb;
> +    int idx;
> +    uint16_t csr_asid, tlb_asid;
> +    uint8_t tlb_ps, tlb_e, tlb_v0, tlb_v1, tlb_d0, tlb_d1;
> +    uint8_t tlb_plv0, tlb_plv1, tlb_mat0, tlb_mat1, tlb_g;
> +    uint64_t tlb_ppn0, tlb_ppn1;
> +    uint8_t tlb_nr0, tlb_nr1, tlb_nx0, tlb_nx1, tlb_rplv0, tlb_rplv1;
> +
> +    idx = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
> +    tlb = &env->tlb[idx];
> +
> +    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
> +    tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
> +    tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
> +    tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
> +    tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
> +
> +    tlb_v0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, V);
> +    tlb_d0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, D);
> +    tlb_plv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PLV);
> +    tlb_mat0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, MAT);
> +    tlb_ppn0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PPN);
> +    tlb_nr0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NR);
> +    tlb_nx0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NX);
> +    tlb_rplv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, RPLV);
> +
> +    tlb_v1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, V);
> +    tlb_d1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, D);
> +    tlb_plv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PLV);
> +    tlb_mat1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, MAT);
> +    tlb_ppn1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PPN);
> +    tlb_nr1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NR);
> +    tlb_nx1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NX);
> +    tlb_rplv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, RPLV);
> +
> +    if (csr_asid != tlb_asid) {
> +        cpu_loongarch_tlb_flush(env);

Why?  Surely the index selected should not have matched on the previous search?

> +    } else {
> +        /* Valid TLB entry */
> +        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
> +                                     INDEX, (idx & 0xfff));
> +        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
> +                                     PS, (tlb_ps & 0x3f));
> +
> +        env->CSR_TLBEHI = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN) << 13;
> +
> +        env->CSR_TLBELO0 = FIELD_DP64(0, CSR_TLBELO0, V, tlb_v0);
> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, D, tlb_d0);
> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, PLV, tlb_plv0);
> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, MAT, tlb_mat0);
> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, G, tlb_g);
> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, PPN, tlb_ppn0);
> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, NR, tlb_nr0);
> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, NX, tlb_nx0);
> +        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, RPLV, tlb_rplv0);
> +
> +        env->CSR_TLBELO1 = FIELD_DP64(0, CSR_TLBELO1, V, tlb_v1);
> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, D, tlb_d1);
> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, PLV, tlb_plv1);
> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, MAT, tlb_mat1);
> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, G, tlb_g);
> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, PPN, tlb_ppn1);
> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, NR, tlb_nr1);
> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, NX, tlb_nx1);
> +        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, RPLV, 

Again, these should easily copy across.

> +    env->CSR_ASID  = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID, tlb_asid);

The documentation for TLBRD does not mention modifications to the current ASID.

> +    default:
> +        do_raise_exception(env, EXCP_INE, GETPC());

You can detect this during translation, and dispatch to the appropriate invtlb sub-function.


r~

