Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC6F66AF1A
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 03:41:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGsxE-0002uQ-He; Sat, 14 Jan 2023 21:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGsxC-0002uH-UH
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 21:41:02 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGsxA-0005VU-Fx
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 21:41:02 -0500
Received: by mail-pl1-x632.google.com with SMTP id p24so27080703plw.11
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 18:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/iBYJLwjEr097+IfpuOVYL817eSkLS0G8upZx6HBnNw=;
 b=sR+BEWncHYqPt5VVD4cbdtaQK8b2WffrWZA/5NCV5ULABb+ERUwPMjyP0OmM0U6UEE
 j+1eZPm0PhTiYQFcUb/8cFFFqJlpWTTtJWT2z9ais99uFkelsq9I60rC3TxAJBR3bJu9
 pwCQDItwdMJ1JML15rXIjVYu6AcfA5aVwjLk2j+2u8MlDeQ3wcnRnr532ND01w9gqxMp
 9pjkN49+Bi4wJ5Nyf0J6jKmppYOj2ms51yTAM7lWvIjjH8Ann6cywZimG5eyOd/G2wFg
 wuVNqZWgEWjEKXyh8q/FKs1og9BuOtF+CbzDGONsTjpf4eD4G14DF5fYZMZHJqEIq11i
 LTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/iBYJLwjEr097+IfpuOVYL817eSkLS0G8upZx6HBnNw=;
 b=dNlb4cHpYyQiRkQyddn2i2frVaDP0klfksXH+JVc21R3DJD3vsn5byvNqrltbDNIi7
 KURroC7YfCBWjPhcZSbp8s8mAA2vWclWk883LSgHOztmG9U5gYpXLStm6V73A/YbHbBk
 HgjwND0ZMmO9/TEQustKbeWltfpYu2tAG4Z8D91bQ6SddGB21WKOlv8R/vtP+6EgGd2d
 9ij+0um7cADnkwYNwMwHP8YZNoBG8cfTOiadnuupUVXy9qdT06vUf62MyG6UGYKmDcN2
 1z6/MyZ/yu6cMvaShawMkDNtvTT9XDc+p1heISrfIURMDVsF0ECIsJxD+yMjF5pCM1OV
 wnwA==
X-Gm-Message-State: AFqh2kogLn+9Y/WdbW6RXdNS85ypDsIO55pUgZQM5vS+gNyeCRic5den
 z7lp0SYAFxnfr4XyV23QoY1640RPTPs6AaL8
X-Google-Smtp-Source: AMrXdXtupEnNv1VKblMrtOF2HdzQ3gHa/45M+13CtTAv4GSjoHivVS/rbRkQZvSdPqG1SQnLeLfRmQ==
X-Received: by 2002:a17:902:b60b:b0:192:b6af:415 with SMTP id
 b11-20020a170902b60b00b00192b6af0415mr16322740pls.14.1673750458522; 
 Sat, 14 Jan 2023 18:40:58 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p10-20020a170902e74a00b001944981cfe1sm8196602plf.199.2023.01.14.18.40.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jan 2023 18:40:57 -0800 (PST)
Message-ID: <4e342456-d0f9-2aac-cba1-38a3070dc2d8@linaro.org>
Date: Sat, 14 Jan 2023 16:40:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4] tcg/arm: Use register pair allocation for
 qemu_{ld,st}_i64
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20230107010637.1285036-1-richard.henderson@linaro.org>
In-Reply-To: <20230107010637.1285036-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Ping.

r~

On 1/6/23 15:06, Richard Henderson wrote:
> Although we still can't use ldrd and strd for all operations,
> increase the chances by getting the register allocation correct.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> v3 was patch 5 in a larger patch set:
> 
>    https://lore.kernel.org/qemu-devel/20221111074101.2069454-6-richard.henderson@linaro.org/
> 
> most of which has been merged.
> 
> r~
> 
> ---
>   tcg/arm/tcg-target-con-set.h |  7 ++++---
>   tcg/arm/tcg-target-con-str.h |  2 ++
>   tcg/arm/tcg-target.c.inc     | 28 ++++++++++++++++++----------
>   3 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
> index 3685e1786a..b8849b2478 100644
> --- a/tcg/arm/tcg-target-con-set.h
> +++ b/tcg/arm/tcg-target-con-set.h
> @@ -15,8 +15,9 @@ C_O0_I2(r, rIN)
>   C_O0_I2(s, s)
>   C_O0_I2(w, r)
>   C_O0_I3(s, s, s)
> +C_O0_I3(S, p, s)
>   C_O0_I4(r, r, rI, rI)
> -C_O0_I4(s, s, s, s)
> +C_O0_I4(S, p, s, s)
>   C_O1_I1(r, l)
>   C_O1_I1(r, r)
>   C_O1_I1(w, r)
> @@ -38,8 +39,8 @@ C_O1_I2(w, w, wZ)
>   C_O1_I3(w, w, w, w)
>   C_O1_I4(r, r, r, rI, rI)
>   C_O1_I4(r, r, rIN, rIK, 0)
> -C_O2_I1(r, r, l)
> -C_O2_I2(r, r, l, l)
> +C_O2_I1(e, p, l)
> +C_O2_I2(e, p, l, l)
>   C_O2_I2(r, r, r, r)
>   C_O2_I4(r, r, r, r, rIN, rIK)
>   C_O2_I4(r, r, rI, rI, rIN, rIK)
> diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
> index 8f501149e1..24b4b59feb 100644
> --- a/tcg/arm/tcg-target-con-str.h
> +++ b/tcg/arm/tcg-target-con-str.h
> @@ -8,9 +8,11 @@
>    * Define constraint letters for register sets:
>    * REGS(letter, register_mask)
>    */
> +REGS('e', ALL_GENERAL_REGS & 0x5555) /* even regs */
>   REGS('r', ALL_GENERAL_REGS)
>   REGS('l', ALL_QLOAD_REGS)
>   REGS('s', ALL_QSTORE_REGS)
> +REGS('S', ALL_QSTORE_REGS & 0x5555)  /* even qstore */
>   REGS('w', ALL_VECTOR_REGS)
>   
>   /*
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 9245ea86d0..e82749a602 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -1692,9 +1692,11 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
>           tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
>           break;
>       case MO_UQ:
> +        /* We used pair allocation for datalo, so already should be aligned. */
> +        tcg_debug_assert((datalo & 1) == 0);
> +        tcg_debug_assert(datahi == datalo + 1);
>           /* LDRD requires alignment; double-check that. */
> -        if (get_alignment_bits(opc) >= MO_64
> -            && (datalo & 1) == 0 && datahi == datalo + 1) {
> +        if (get_alignment_bits(opc) >= MO_64) {
>               /*
>                * Rm (the second address op) must not overlap Rt or Rt + 1.
>                * Since datalo is aligned, we can simplify the test via alignment.
> @@ -1748,9 +1750,11 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
>           tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
>           break;
>       case MO_UQ:
> +        /* We used pair allocation for datalo, so already should be aligned. */
> +        tcg_debug_assert((datalo & 1) == 0);
> +        tcg_debug_assert(datahi == datalo + 1);
>           /* LDRD requires alignment; double-check that. */
> -        if (get_alignment_bits(opc) >= MO_64
> -            && (datalo & 1) == 0 && datahi == datalo + 1) {
> +        if (get_alignment_bits(opc) >= MO_64) {
>               tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
>           } else if (datalo == addrlo) {
>               tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
> @@ -1832,9 +1836,11 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
>           tcg_out_st32_r(s, cond, datalo, addrlo, addend);
>           break;
>       case MO_64:
> +        /* We used pair allocation for datalo, so already should be aligned. */
> +        tcg_debug_assert((datalo & 1) == 0);
> +        tcg_debug_assert(datahi == datalo + 1);
>           /* STRD requires alignment; double-check that. */
> -        if (get_alignment_bits(opc) >= MO_64
> -            && (datalo & 1) == 0 && datahi == datalo + 1) {
> +        if (get_alignment_bits(opc) >= MO_64) {
>               tcg_out_strd_r(s, cond, datalo, addrlo, addend);
>           } else if (scratch_addend) {
>               tcg_out_st32_rwb(s, cond, datalo, addend, addrlo);
> @@ -1869,9 +1875,11 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
>           tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
>           break;
>       case MO_64:
> +        /* We used pair allocation for datalo, so already should be aligned. */
> +        tcg_debug_assert((datalo & 1) == 0);
> +        tcg_debug_assert(datahi == datalo + 1);
>           /* STRD requires alignment; double-check that. */
> -        if (get_alignment_bits(opc) >= MO_64
> -            && (datalo & 1) == 0 && datahi == datalo + 1) {
> +        if (get_alignment_bits(opc) >= MO_64) {
>               tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
>           } else {
>               tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
> @@ -2339,11 +2347,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_qemu_ld_i32:
>           return TARGET_LONG_BITS == 32 ? C_O1_I1(r, l) : C_O1_I2(r, l, l);
>       case INDEX_op_qemu_ld_i64:
> -        return TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, l) : C_O2_I2(r, r, l, l);
> +        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, l) : C_O2_I2(e, p, l, l);
>       case INDEX_op_qemu_st_i32:
>           return TARGET_LONG_BITS == 32 ? C_O0_I2(s, s) : C_O0_I3(s, s, s);
>       case INDEX_op_qemu_st_i64:
> -        return TARGET_LONG_BITS == 32 ? C_O0_I3(s, s, s) : C_O0_I4(s, s, s, s);
> +        return TARGET_LONG_BITS == 32 ? C_O0_I3(S, p, s) : C_O0_I4(S, p, s, s);
>   
>       case INDEX_op_st_vec:
>           return C_O0_I2(w, r);


