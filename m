Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8485FFBDC
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 22:14:56 +0200 (CEST)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojnYc-0005nj-PF
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 16:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@xen0n.name>) id 1ojXo3-0005WT-3n
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 23:25:47 -0400
Received: from mail.xen0n.name ([115.28.160.31]:49676
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@xen0n.name>) id 1ojXnz-0002zP-Kp
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 23:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1665804330; bh=/bM3Lx2Rndi+a/y/OwBhiS7ZeFiwk9YkCYVYF3e2CD0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=naSgRY963yljyER/Stx/blzBVVuUqfI01kADWGXs0i71352I6Mt3gPp8dKePWX7Kj
 7viAjsJlcpMAsi5Lt2D00kTry++hwu2ky/i/bJWtxUDgY+5Rkmn94GHKGtfTRLIuPn
 apqCgYVm6qxycKuNjuzZu3ed480UKTZArIEBWWAA=
Received: from [192.168.9.172] (unknown [101.88.135.226])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2CF5660132;
 Sat, 15 Oct 2022 11:25:30 +0800 (CST)
Message-ID: <1a72a123-0358-8a24-6e66-5cc6717c9d2e@xen0n.name>
Date: Sat, 15 Oct 2022 11:25:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101
 Thunderbird/107.0a1
Subject: Re: [PATCH v3] tcg/loongarch64: Add direct jump support
To: Qi Hu <huqi@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221014034020.1167864-1-huqi@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <i@xen0n.name>
In-Reply-To: <20221014034020.1167864-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.856,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Oct 2022 16:13:42 -0400
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

On 10/14/22 11:40, Qi Hu wrote:
> Similar to the ARM64, LoongArch has PC-relative instructions such as
> PCADDU18I. These instructions can be used to support direct jump for
> LoongArch. Additionally, if instruction "B offset" can cover the target
> address(target is within ±128MB range), a single "B offset" plus a nop
> will be used by "tb_target_set_jump_target".
>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 56 +++++++++++++++++++++++++++++---
>   tcg/loongarch64/tcg-target.h     |  5 ++-
>   2 files changed, 53 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index f5a214a17f..2a068a52cc 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -1031,6 +1031,35 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
>   #endif
>   }
>   
> +/* LoongArch use `andi zero, zero, 0` as NOP.  */
"uses"
> +#define NOP OPC_ANDI
> +static void tcg_out_nop(TCGContext *s)
> +{
> +    tcg_out32(s, NOP);
> +}
> +
> +void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
> +                              uintptr_t jmp_rw, uintptr_t addr)
> +{
> +    tcg_insn_unit i1, i2;
> +    ptrdiff_t upper, lower;
> +    ptrdiff_t offset = (addr - jmp_rx) >> 2;
> +
> +    if (offset == sextreg(offset, 0, 28)) {
You've already shifted by 2 above, so here you should check if `offset` 
fits in 26 bits instead.
> +        i1 = encode_sd10k16_insn(OPC_B, offset);
> +        i2 = NOP;
> +    } else {
Could also add an assertion that `offset` fits in 36 bits, as we're now 
bounded by `MAX_CODEGEN_BUFFER_SIZE` and don't really have the 
capability to go larger than that any more, unlike when indirect jumps 
were used.
> +        lower = (int16_t)offset;
> +        upper = (offset - lower) >> 16;
> +
> +        i1 = encode_dsj20_insn(OPC_PCADDU18I, TCG_REG_T0, upper);
> +        i2 = encode_djsk16_insn(OPC_JIRL, TCG_REG_ZERO, TCG_REG_T0, lower);
Instead of hard-coding T0, what about simply using the TMP0 that's 
explicitly reserved as a scratch register?
> +    }
> +    uint64_t pair = ((uint64_t)i2 << 32) | i1;
> +    qatomic_set((uint64_t *)jmp_rw, pair);
> +    flush_idcache_range(jmp_rx, jmp_rw, 8);
> +}
> +
>   /*
>    * Entry-points
>    */
> @@ -1058,11 +1087,28 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           break;
>   
>       case INDEX_op_goto_tb:
> -        assert(s->tb_jmp_insn_offset == 0);
> -        /* indirect jump method */
> -        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
> -                   (uintptr_t)(s->tb_jmp_target_addr + a0));
> -        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
> +        if (s->tb_jmp_insn_offset != NULL) {
> +            /* TCG_TARGET_HAS_direct_jump */
> +            /*
> +             * Ensure that "patch area" are 8-byte aligned so that an
"Ensure that the patch area is"
> +             * atomic write can be used to patch the target address.
> +             */
> +            if ((uintptr_t)s->code_ptr & 7) {
> +                tcg_out_nop(s);
> +            }
> +            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
> +            /*
> +             * actual branch destination will be patched by
> +             * tb_target_set_jmp_target later
> +             */
> +            tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
> +        } else {
> +            /* !TCG_TARGET_HAS_direct_jump */
> +            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
> +                    (uintptr_t)(s->tb_jmp_target_addr + a0));
> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
Why not remove the else block altogether? Removing the respective unused 
code for aarch64 could be considered a separate logical change and I 
think we can do the loongarch64 part independently of whether it's 
appropriate/accepted for aarch64.
> +        }
>           set_jmp_reset_offset(s, a0);
>           break;
>   
> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
> index 67380b2432..ee207ec32c 100644
> --- a/tcg/loongarch64/tcg-target.h
> +++ b/tcg/loongarch64/tcg-target.h
> @@ -42,7 +42,7 @@
>   
>   #define TCG_TARGET_INSN_UNIT_SIZE 4
>   #define TCG_TARGET_NB_REGS 32
> -#define MAX_CODE_GEN_BUFFER_SIZE  SIZE_MAX
> +#define MAX_CODE_GEN_BUFFER_SIZE  (128 * GiB)
If I were you I'd put a comment above saying the 128GiB limit is due to 
the PCADDU18I + JIRL sequence giving a total of 20 + 16 + 2 = 38 bits 
for signed offsets, which is +/- 128GiB. But I'm fine without it too.
>   
>   typedef enum {
>       TCG_REG_ZERO,
> @@ -123,7 +123,7 @@ typedef enum {
>   #define TCG_TARGET_HAS_clz_i32          1
>   #define TCG_TARGET_HAS_ctz_i32          1
>   #define TCG_TARGET_HAS_ctpop_i32        0
> -#define TCG_TARGET_HAS_direct_jump      0
> +#define TCG_TARGET_HAS_direct_jump      1
>   #define TCG_TARGET_HAS_brcond2          0
>   #define TCG_TARGET_HAS_setcond2         0
>   #define TCG_TARGET_HAS_qemu_st8_i32     0
> @@ -166,7 +166,6 @@ typedef enum {
>   #define TCG_TARGET_HAS_muluh_i64        1
>   #define TCG_TARGET_HAS_mulsh_i64        1
>   
> -/* not defined -- call should be eliminated at compile time */
>   void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
>   
>   #define TCG_TARGET_DEFAULT_MO (0)

With the nits addressed,

Reviewed-by: WANG Xuerui <git@xen0n.name>



