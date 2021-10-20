Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C0D434301
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 03:37:43 +0200 (CEST)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md0Y2-0006m2-55
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 21:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md0XF-00067e-Ay
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 21:36:53 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md0XD-0001BN-33
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 21:36:52 -0400
Received: by mail-pf1-x432.google.com with SMTP id d5so1559607pfu.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 18:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rH2fCvsBSx/djbq0Qg8cjDsLijA2sDLkCM5cwXSWwMU=;
 b=oxhI8PZAC3XJcLpj9F9JiHYq/0L4KsNFUQqmGM01R8aONe7rr3BE3IaxkZFz4AgV8A
 dBS0Vn6C5E86jgzEYt9ynGQfEy/u4AcU1VtP058uFliyFC91nt+zduoGWExT87Tf/z0n
 fQNZWR9t5vNVdnPivxx1css/Fo0mVi4DB4XqsuXWfSE7ghE0Se2Js3xKPzJesvQWbRQk
 887DpurlvYJuUmtYSvsXsecNH1v1WMpiHt0V4t5H93SpoFsm5fw+X1nlIAtoFmJuIYmD
 oPGHcTE9q5QEErdJGb336pQz84PSqj0SLOy6OyRvzdZY8iMzv+MwmRHtNyhMOu6D0ZPh
 0CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rH2fCvsBSx/djbq0Qg8cjDsLijA2sDLkCM5cwXSWwMU=;
 b=jnduc3Zn/p8HiaeIa4UyEnKOYAnfVHKkVUu1iZp9bgfM4FHh9uedh5LrKCgh1tUgeW
 gI1lbt48IvsGqYhS8K5sL9hQe/MGtRSn10+MwSmE4+wWma9Z1qTqrCZDgtYXcx98o+YG
 Ic/prk9tj/QXKhxQigdr0vEb4t0lRI2PY1F8mJ/c7sAeSN31pxrq/nrq+GIeoJltkpMv
 K0ErdvH+1wJXsIo4/xt58bMhh714iPaF99KThhbXBtJfmCkbgmylHOLjNMQFRWRGWBpV
 eAw4qIUFHh4jIYiX8XMOtJeCjIu/Dthsj9eHZONQO4eT41iKKya+k/IrEVBsKV5KKUah
 b4IA==
X-Gm-Message-State: AOAM530K5qekEk3FBDSnwxiFP2ys9QuqsFuEGeaT9FoV85ZFoirwdDx0
 IV8DjGelrwHUKmz6j+Bf509vfA==
X-Google-Smtp-Source: ABdhPJyiqcg3aHVXPD7HhSni+tIJbxIgeOnoMTXL6Q9WSx7TOEOAncXgbeW1FGTQYGvEOH/4eB77/Q==
X-Received: by 2002:a05:6a00:14cc:b0:44d:ebab:2e16 with SMTP id
 w12-20020a056a0014cc00b0044debab2e16mr3328686pfu.23.1634693808991; 
 Tue, 19 Oct 2021 18:36:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e9sm455834pfv.189.2021.10.19.18.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 18:36:48 -0700 (PDT)
Subject: Re: [PATCH 07/31] target/loongarch: Add loongarch csr/iocsr
 instruction support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-8-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb33aeb0-3a82-1300-cbbc-3e260cee8a5f@linaro.org>
Date: Tue, 19 Oct 2021 18:36:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-8-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
> +target_ulong helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
> +{
> +    int64_t v;
> +
> +#define CASE_CSR_RDQ(csr)            \
> +    case LOONGARCH_CSR_ ## csr:      \
> +    {                                \
> +        v = env->CSR_ ## csr;        \
> +        break;                       \
> +    };                               \

There's absolutely no reason to call a helper function for a simple load.

> +    case LOONGARCH_CSR_PGD:
> +
> +        if (env->CSR_TLBRERA & 0x1) {
> +            v = env->CSR_TLBRBADV;
> +        } else {
> +            v = env->CSR_BADV;
> +        }
> +
> +        if ((v >> 63) & 0x1) {
> +            v = env->CSR_PGDH;
> +        } else {
> +            v = env->CSR_PGDL;
> +        }
> +        break;

This is the only one that requires a helper on read.

> +    if (csr == LOONGARCH_CSR_ASID) {
> +        if (old_v != val) {
> +            tlb_flush(env_cpu(env));
> +        }
> +    }

And this is the only one that requires a helper on write.

> +    case LOONGARCH_CSR_ESTAT:
> +        qatomic_and(&env->CSR_ESTAT, ~mask);

Why do you believe this requires an atomic update?
What is going to race with the update to a cpu private value?

> +static bool trans_csrrd(DisasContext *ctx, unsigned rd, unsigned csr)
> +{
> +    TCGv dest = gpr_dst(ctx, rd, EXT_NONE);
> +    gen_helper_csr_rdq(dest, cpu_env, tcg_constant_i64(csr));
> +    return true;
> +}
> +
> +static bool trans_csrwr(DisasContext *ctx, unsigned rd, unsigned csr)
> +{
> +    TCGv dest = gpr_dst(ctx, rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, rd, EXT_NONE);
> +
> +    switch (csr) {
> +    case LOONGARCH_CSR_CRMD:
> +        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> +        gen_helper_csr_wrq(dest, cpu_env, src1, tcg_constant_i64(LOONGARCH_CSR_CRMD));
> +        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
> +        ctx->base.is_jmp = DISAS_EXIT;
> +        break;
> +    case LOONGARCH_CSR_EUEN:
> +        gen_helper_csr_wrq(dest, cpu_env, src1, tcg_constant_i64(LOONGARCH_CSR_EUEN));
> +        /* Stop translation */
> +        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
> +        ctx->base.is_jmp = DISAS_EXIT;
> +        break;
> +    default:
> +        gen_helper_csr_wrq(dest, cpu_env, src1, tcg_constant_i64(csr));
> +        break;
> +    }
> +    return true;
> +}
> +
> +static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
> +    TCGv src2 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (a->rj == 0) {
> +        return trans_csrrd(ctx, a->rd, a->csr);
> +    } else if (a->rj == 1) {
> +        return trans_csrwr(ctx, a->rd, a->csr);
> +    }

These should have been decoded separately; see below.

You're missing the check for priv 0 here and in all other functions.

> +
> +    if (a->rd == 0) {
> +        gen_helper_csr_xchgq_r0(cpu_env, src2, tcg_constant_i64(a->csr));
> +    } else {
> +        gen_helper_csr_xchgq(dest, cpu_env, src1, src2, tcg_constant_i64(a->csr));
> +    }

Why do you believe r0 to require a special case?

> +static bool trans_iocsrrd_b(DisasContext *ctx, arg_iocsrrd_b *a)
> +{
> +    TCGv tmp = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    gen_helper_iocsr_read(tmp, cpu_env, src1);
> +    tcg_gen_qemu_ld_tl(dest, tmp, ctx->mem_idx, MO_SB);

This is wrong.  From the manual:

   All IOCSR registers use independent addressing space

therefore you cannot simply read from a modified address, you must use a completely 
different address space.

There are a couple of different solutions that are possible.

(1) Use helper functions calling address_space_ld/st*.

(2) Use a separate mmu_idx, which uses its own address space.
     This requires bouncing through MemTxAttrs, since
     cpu_asidx_from_attrs only take attrs and not mmu_idx.

The second one is may be overkill, unless there will be any cachable memory in iospace.  I 
would expect most of it to be device memory.

> +csrxchg          0000 0100 .............. ..... .....     @fmt_rdrjcsr

{
   csrrd             0000 0100 .............. 00000 .....     @fmt_rdcsr
   csrwr             0000 0100 .............. 00001 .....     @fmt_rdcsr
   csrxchg           0000 0100 .............. ..... .....     @fmt_rdrjcsr
}


r~

