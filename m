Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811865FC45B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 13:37:46 +0200 (CEST)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oia3V-0001cc-Kp
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 07:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oia0h-00057m-HP
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:34:53 -0400
Received: from mail.xen0n.name ([115.28.160.31]:49672
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oia0d-0008Nk-SS
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1665574482; bh=Na5y9wtc3yuYUWJK0ZkBGY/tTpdHiXzuXKtkBJtU4ew=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WIZ5Q53h1K1dc+ofc58TrnLseRJeosKpnlc6CyxfPEE6l+9Jnk/shHSnwBszslObs
 PPlBhFcEqkP5Liei3II5TBmYBj56Njz8XUKWoV1tR2X8Y6TZprgI+idPC2FtaifGTV
 tq1evhBDuzRNXV/g8srufW6i7NBTn4VPOZjPOp6Q=
Received: from [100.100.57.122] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F0D8C6009B;
 Wed, 12 Oct 2022 19:34:41 +0800 (CST)
Message-ID: <d386cad2-02ea-e062-9a9d-86dbbf47b251@xen0n.name>
Date: Wed, 12 Oct 2022 19:34:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH 2/2] tcg/loongarch64: Add direct jump support
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <cover.1665405913.git.huqi@loongson.cn>
 <cc5770f1a03bf90fa8b990666fb061b1e063b803.1665405913.git.huqi@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <cc5770f1a03bf90fa8b990666fb061b1e063b803.1665405913.git.huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.528,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Thanks for the improvement! Some room for improvement though...

On 2022/10/12 17:13, Qi Hu wrote:
> Similar to the ARM64, LoongArch has PC-relative instructions such as
> PCADDU18I. These instructions can be used to support direct jump for
> LoongArch. Additionally, if instruction "B offset" can cover the target
> address, "tb_target_set_jmp_target" will only patch the "B offset".

"if the target is within +/- 28 bits range, a single "B offset" plus a 
nop will be used instead" might sound better?

>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>   tcg/loongarch64/tcg-insn-defs.c.inc |  3 ++
>   tcg/loongarch64/tcg-target.c.inc    | 49 ++++++++++++++++++++++++++---
>   tcg/loongarch64/tcg-target.h        |  2 +-
>   3 files changed, 48 insertions(+), 6 deletions(-)
>
> diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc b/tcg/loongarch64/tcg-insn-defs.c.inc
> index d162571856..f5869c6bb1 100644
> --- a/tcg/loongarch64/tcg-insn-defs.c.inc
> +++ b/tcg/loongarch64/tcg-insn-defs.c.inc
> @@ -112,6 +112,9 @@ typedef enum {
>       OPC_BLE = 0x64000000,
>       OPC_BGTU = 0x68000000,
>       OPC_BLEU = 0x6c000000,
> +    /* pseudo-instruction */
> +    NOP = 0x03400000,
> +

You certainly saw the big fat comment block saying the file was 
auto-generated and thus shouldn't be touched, didn't you? ;-)

I saw your need for a NOP constant later though, and you can instead add 
`#define OPC_NOP OPC_ANDI` in tcg-target.c.inc, just below the include 
of tcg-insn-defs.c.inc.

>   } LoongArchInsn;
>   
>   static int32_t __attribute__((unused))
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index f5a214a17f..3a7b1df081 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -1058,11 +1058,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
> +            /* Ensure that PCADD+JIRL are 8-byte aligned so that an atomic
> +               write can be used to patch the target address. */
There isn't a "PCADD" in LoongArch, and it's possible for the 2 insns to 
be "B + NOP" as well. So better reword a bit like "Ensure that the 
8-byte direct jump fragment is aligned ..." (and add another space after 
the period at the end of the sentence).
> +            if ((uintptr_t)s->code_ptr & 7) {
> +                tcg_out32(s, NOP);
> +            }
> +            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
> +            /* actual branch destination will be patched by
> +               tb_target_set_jmp_target later. */
Either make it a proper sentence by title-casing "actual" and adding 
another space after the trailing period, or remove the period.
> +            tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
> +        } else {
> +            /* !TCG_TARGET_HAS_direct_jump */
> +            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
> +                    (uintptr_t)(s->tb_jmp_target_addr + a0));
> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
> +        }
We unconditionally support the direct jump method after the change, so 
do we need to retain this block any more? Note the aarch64 port 
currently does the same (declaring unconditional support for direct 
jumps but keeping both code paths), if we want to remove this code path 
then you may want to remove the aarch64 one respectively too.
>           set_jmp_reset_offset(s, a0);
>           break;
>   
> @@ -1708,6 +1721,32 @@ static void tcg_target_init(TCGContext *s)
>       tcg_regset_set_reg(s->reserved_regs, TCG_REG_RESERVED);
>   }
>   
> +void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
> +                              uintptr_t jmp_rw, uintptr_t addr)
> +{

Move the function to somewhere above, like above the "/* Entrypoints */" 
section (and maybe introduce another section)? The various parts are 
more-or-less arranged in a particular order, so it's like going back to 
implementing concrete things after finishing everything and calling it a 
day.

Also you forgot to remove the now inappropriate comment about this 
helper in tcg-target.h.

> +    tcg_insn_unit i1, i2;
> +
> +    ptrdiff_t offset = addr - jmp_rx;
> +
> +    if (offset == sextreg(offset, 0, 28)) {
> +        i1 = OPC_B | ((offset >> 18) & 0x3ff) | ((offset << 8) & 0x3fffc00);
Use encode_sd10k16_insn instead. No need to juggle the bits yourself and 
you get nice range assertion for free.
> +        i2 = NOP;
> +    } else {
> +        offset >>= 2;
> +
> +        ptrdiff_t upper, lower;
Promote the declaration to the top of the block (before offset 
shifting), IIRC that's the official coding style.
> +        upper = ((offset + (1 << 15)) >> 16) & 0xfffff;
> +        lower = (offset & 0xffff);
> +        /* patch pcaddu18i */
> +        i1 = OPC_PCADDU18I | upper << 5 | TCG_REG_T0;
> +        /* patch jirl */
> +        i2 = OPC_JIRL | lower << 10 | TCG_REG_T0 << 5;

Similarly you could simplify the assembly here, with encode_dsj20_insn 
and encode_djsk16_insn respectively.

And the code is straight-forward enough to not need the "patch foo" 
comments.

> +    }
> +    uint64_t pair = (uint64_t)i2 << 32 | i1;
Maybe add a couple more parentheses to make the precedence easier to 
follow? (for people who struggle to remember things like this, like me)
> +    qatomic_set((uint64_t *)jmp_rw, pair);
> +    flush_idcache_range(jmp_rx, jmp_rw, 8);
> +}
> +
>   typedef struct {
>       DebugFrameHeader h;
>       uint8_t fde_def_cfa[4];
> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
> index 67380b2432..0e552731f5 100644
> --- a/tcg/loongarch64/tcg-target.h
> +++ b/tcg/loongarch64/tcg-target.h
> @@ -123,7 +123,7 @@ typedef enum {
>   #define TCG_TARGET_HAS_clz_i32          1
>   #define TCG_TARGET_HAS_ctz_i32          1
>   #define TCG_TARGET_HAS_ctpop_i32        0
> -#define TCG_TARGET_HAS_direct_jump      0
> +#define TCG_TARGET_HAS_direct_jump      1
>   #define TCG_TARGET_HAS_brcond2          0
>   #define TCG_TARGET_HAS_setcond2         0
>   #define TCG_TARGET_HAS_qemu_st8_i32     0

