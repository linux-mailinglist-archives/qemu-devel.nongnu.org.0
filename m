Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68215AB20B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:49:28 +0200 (CEST)
Received: from localhost ([::1]:39280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU731-0001q7-DA
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oU6yB-0006So-Ef
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:44:29 -0400
Received: from rev.ng ([5.9.113.41]:51873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oU6xz-0003X9-Ev
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Reply-To:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cAZlXTZbXkfvvydCPHHYwuQKDAV0s/O//+0UxOWNAbY=; b=GEb5mEV3b3ad2uEqY4cOnzn1x4
 o7rHLiGCGDdBwCfslxa2uTRBpJf0SKKDfiJ+Wur/uYlBmm2G2krwn3EyOeosEnlVLJR3laCDFXTIz
 8FQja3B2AgfLpW4pJmGZrzDWOgg1z6NIa/XaMvx0PdiAPAsRVfY4RgqsVFy8AW3xgCYs=;
Message-ID: <150fd137-8f83-d6e8-afdc-f1b2f1bd69c5@rev.ng>
Date: Fri, 2 Sep 2022 15:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Content-Language: en-US
To: Brian Cain <bcain@quicinc.com>, qemu-devel@nongnu.org, tsimpson@quicinc.com
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20220901212931.27310-1-bcain@quicinc.com>
Organization: rev.ng
In-Reply-To: <20220901212931.27310-1-bcain@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

Hi, Brian!

I've taken a look and most of this patch seems good, however I have a few
comments/observations.

> Some registers are defined to have immutable bits, this commit
> will implement that behavior.
>
> Signed-off-by: Brian Cain <bcain@quicinc.com>
> ---
>   target/hexagon/gen_masked.c       |  44 ++++++++++++
>   target/hexagon/gen_masked.h       |  26 ++++++++
>   target/hexagon/genptr.c           |  33 ++++++++-
>   target/hexagon/hex_regs.h         |   6 ++
>   target/hexagon/meson.build        |   1 +
>   tests/tcg/hexagon/Makefile.target |   1 +
>   tests/tcg/hexagon/reg_mut.c       | 107 ++++++++++++++++++++++++++++++
>   7 files changed, 217 insertions(+), 1 deletion(-)
>   create mode 100644 target/hexagon/gen_masked.c
>   create mode 100644 target/hexagon/gen_masked.h
>   create mode 100644 tests/tcg/hexagon/reg_mut.c
>
> diff --git a/target/hexagon/gen_masked.c b/target/hexagon/gen_masked.c
> new file mode 100644
> index 0000000000..faffee2e13
> --- /dev/null
> +++ b/target/hexagon/gen_masked.c
> @@ -0,0 +1,44 @@
> +/*
> + *  Copyright(c) 2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "tcg/tcg-op.h"
> +#include "gen_masked.h"
> +
> +void gen_masked_reg_write(TCGv cur_val, TCGv in_val, TCGv out_val,
> +    target_ulong reg_mask) {

Brace on new line per coding standard. Also I would line up the 
indentation with
the rest of the arguments to match the rest of the hexagon frontend. I would
suggest putting output arguments first to match other TCG ops, could become
confusing otherwise, so

     void gen_masked_reg_write(TCGv out_val, TCGv in_val, TCGv cur_val,
                               target_ulong reg_mask)
     {

> +    TCGv set_bits = tcg_temp_new();
> +    TCGv cleared_bits = tcg_temp_new();
> +
> +    /*
> +     * set_bits = in_val & reg_mask
> +     * cleared_bits = (~in_val) & reg_mask
> +     */
> +    tcg_gen_andi_tl(set_bits, in_val, reg_mask);
> +    tcg_gen_not_tl(cleared_bits, in_val);
> +    tcg_gen_andi_tl(cleared_bits, cleared_bits, reg_mask);
> +
> +    /*
> +     * result = (reg_cur | set_bits) & (~cleared_bits)
> +     */
> +    tcg_gen_not_tl(cleared_bits, cleared_bits);
> +    tcg_gen_or_tl(set_bits, set_bits, cur_val);
> +    tcg_gen_and_tl(out_val, set_bits, cleared_bits);
> +
> +    tcg_temp_free(set_bits);
> +    tcg_temp_free(cleared_bits);
> +}

You could cut down on a single not operation in this function since

     ~cleared_bits = ~((~in_val) & reg_mask)
                   = in_val | (~reg_mask)

I looked at the output of qemu-hexagon -d op_opt and this operation
is not performed by the TCG optimizer, so we would end up saving
an instruction.

> diff --git a/target/hexagon/gen_masked.h b/target/hexagon/gen_masked.h
> new file mode 100644
> index 0000000000..71f4b2818b
> --- /dev/null
> +++ b/target/hexagon/gen_masked.h
> @@ -0,0 +1,26 @@
> +/*
> + *  Copyright(c) 2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef GEN_MASKED_H
> +#define GEN_MASKED_H
> +
> +#include "tcg/tcg-op.h"
> +
> +void gen_masked_reg_write(TCGv cur_val, TCGv in_val, TCGv out_val,
> +    target_ulong reg_mask);
> +
> +#endif /* GEN_MASKED_H */
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 8a334ba07b..21385f556e 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -29,6 +29,7 @@
>   #undef QEMU_GENERATE
>   #include "gen_tcg.h"
>   #include "gen_tcg_hvx.h"
> +#include "gen_masked.h"
>   
>   static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
>   {
> @@ -53,9 +54,24 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
>       tcg_temp_free(slot_mask);
>   }
>   
> +static const hexagon_mut_entry gpr_mut_masks[HEX_REG_LAST_VALUE] = {
> +    [HEX_REG_PC] = {true, 0x00000000},
> +    [HEX_REG_GP] = {true, 0xffffffc0},
> +    [HEX_REG_USR] = {true, 0x3ecfff3f},
> +    [HEX_REG_UTIMERLO] = {true, 0x00000000},
> +    [HEX_REG_UTIMERHI] = {true, 0x00000000},
> +};
> +
> +

Remove extra newline.

Also I notice

     gen_log_reg_write
     gen_log_predicated_reg_write_pair

now call gen_masked_reg_write, is there any reason why

     gen_log_reg_write_pair
     gen_log_predicated_reg_write

have been excluded?


>   static inline void gen_log_reg_write(int rnum, TCGv val)
>   {
> -    tcg_gen_mov_tl(hex_new_value[rnum], val);
> +    const hexagon_mut_entry entry = gpr_mut_masks[rnum];
> +    if (entry.present) {
> +        gen_masked_reg_write(hex_gpr[rnum], val, hex_new_value[rnum],
> +            entry.mask);

Line up entry.mask); with rest of arguments.


> +    } else {
> +        tcg_gen_mov_tl(hex_new_value[rnum], val);
> +    }
>       if (HEX_DEBUG) {
>           /* Do this so HELPER(debug_commit_end) will know */
>           tcg_gen_movi_tl(hex_reg_written[rnum], 1);
> @@ -64,18 +80,32 @@ static inline void gen_log_reg_write(int rnum, TCGv val)
>   
>   static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
>   {
> +    const hexagon_mut_entry entry0 = gpr_mut_masks[rnum];
> +    const hexagon_mut_entry entry1 = gpr_mut_masks[rnum + 1];
>       TCGv val32 = tcg_temp_new();
>       TCGv zero = tcg_constant_tl(0);
>       TCGv slot_mask = tcg_temp_new();
> +    TCGv tmp_val = tcg_temp_new();
>   
>       tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
> +
>       /* Low word */
>       tcg_gen_extrl_i64_i32(val32, val);
> +    if (entry0.present) {
> +        tcg_gen_mov_tl(tmp_val, val32);
> +        gen_masked_reg_write(hex_gpr[rnum], tmp_val, val32, entry0.mask);
> +        tcg_temp_free(tmp_val);

There's a double free of tmp_val here. Even better would be to get rid of
tmp_val, and instead use

gen_masked_reg_write(hex_gpr[rnum], val32, val32, entry0.mask);


> +    }
>       tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum],
>                          slot_mask, zero,
>                          val32, hex_new_value[rnum]);
> +
>       /* High word */
>       tcg_gen_extrh_i64_i32(val32, val);
> +    if (entry1.present) {
> +        tcg_gen_mov_tl(tmp_val, val32);
> +        gen_masked_reg_write(hex_gpr[rnum], tmp_val, val32, entry1.mask);

Same applies here, should be able to get rid of tmp_val, also shouldn't it
be hex_gpr[rnum+1] in the call to gen_masked_reg_write?


> +    }
>       tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum + 1],
>                          slot_mask, zero,
>                          val32, hex_new_value[rnum + 1]);
> @@ -95,6 +125,7 @@ static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
>   
>       tcg_temp_free(val32);
>       tcg_temp_free(slot_mask);
> +    tcg_temp_free(tmp_val);
>   }
>   
>   static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
> diff --git a/target/hexagon/hex_regs.h b/target/hexagon/hex_regs.h
> index a63c2c0fd5..db48cff96e 100644
> --- a/target/hexagon/hex_regs.h
> +++ b/target/hexagon/hex_regs.h
> @@ -79,6 +79,12 @@ enum {
>       HEX_REG_QEMU_HVX_CNT      = 54,
>       HEX_REG_UTIMERLO          = 62,
>       HEX_REG_UTIMERHI          = 63,
> +    HEX_REG_LAST_VALUE        = 64,
>   };
>   
> +
> +typedef struct {
> +    bool present;
> +    target_ulong mask;
> +} hexagon_mut_entry;

struct names should be CamelCase.


>   #endif
> diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
> index b61243103f..ea1f66982a 100644
> --- a/target/hexagon/meson.build
> +++ b/target/hexagon/meson.build
> @@ -168,6 +168,7 @@ hexagon_ss.add(files(
>       'op_helper.c',
>       'gdbstub.c',
>       'genptr.c',
> +    'gen_masked.c',
>       'reg_fields.c',
>       'decode.c',
>       'iclass.c',
> diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
> index 96a4d7a614..385d787a00 100644
> --- a/tests/tcg/hexagon/Makefile.target
> +++ b/tests/tcg/hexagon/Makefile.target
> @@ -43,6 +43,7 @@ HEX_TESTS += load_align
>   HEX_TESTS += atomics
>   HEX_TESTS += fpstuff
>   HEX_TESTS += overflow
> +HEX_TESTS += reg_mut
>   
>   TESTS += $(HEX_TESTS)
>   
> diff --git a/tests/tcg/hexagon/reg_mut.c b/tests/tcg/hexagon/reg_mut.c
> new file mode 100644
> index 0000000000..7e81ec6bf3
> --- /dev/null
> +++ b/tests/tcg/hexagon/reg_mut.c
> @@ -0,0 +1,107 @@
> +/*
> + *  Copyright(c) 2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <stdio.h>
> +#include <stdint.h>
> +
> +int err;
> +
> +#define check_ne(N, EXPECT) \
> +    { uint32_t value = N; \
> +        if (value == EXPECT) { \
> +            printf("ERROR: \"%s\" 0x%04x == 0x%04x at %s:%d\n", #N, value, \
> +                EXPECT, __FILE__, __LINE__); \
> +            err++; \
> +        } \
> +    }
> +
> +#define check(N, EXPECT) \
> +    { uint32_t value = N; \
> +        if (value != EXPECT) { \
> +            printf("ERROR: \"%s\" 0x%04x != 0x%04x at %s:%d\n", #N, value, \
> +                  EXPECT, __FILE__, __LINE__); \
> +            err++; \
> +        } \
> +    }
> +

Wrap these two macros in do {...} while(0) instead


> +#define READ_REG(reg_name, out_reg) \
> +  asm volatile ("%0 = " reg_name "\n\t" \
> +                : "=r"(out_reg) \
> +                : \
> +                : \
> +                ); \
> +
> +#define WRITE_REG(reg_name, out_reg, in_reg) \
> +  asm volatile (reg_name " = %1\n\t" \
> +                "%0 = " reg_name "\n\t" \
> +                : "=r"(out_reg) \
> +                : "r"(in_reg) \
> +                : reg_name \
> +                ); \

3 minor nitpicks, use 4-space indents for asm volatile lines, remove the
trailing ; \ at the end of the macros, and READ_REG is unused.


> +
> +   /*
> +    * Instruction word: { pc = r0 }
> +    *
> +    * This instruction is barred by the assembler.
> +    *
> +    *    3                   2                   1
> +    *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
> +    * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> +    * |    Opc[A2_tfrrcr]   | Src[R0] |P P|                 |  C9/PC  |
> +    * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> +    */

Very nice ascii art!


> +#define PC_EQ_R0 ".word 0x6220c009\n\t"
> +
> +static inline uint32_t set_pc(uint32_t in_reg)
> +{
> +    uint32_t out_reg;
> +    asm volatile("r0 = %1\n\t"
> +                 PC_EQ_R0
> +                 "%0 = pc\n\t"
> +                : "=r"(out_reg)
> +                : "r"(in_reg)
> +                : "r0");
> +    return out_reg;
> +}
> +
> +static inline uint32_t set_usr(uint32_t in_reg)
> +{
> +    uint32_t out_reg;
> +    WRITE_REG("usr", out_reg, in_reg);
> +    return out_reg;
> +}
> +
> +int main()
> +{
> +    check(set_usr(0x00),       0x00);
> +    check(set_usr(0xffffffff), 0x3ecfff3f);
> +    check(set_usr(0x00),       0x00);
> +    check(set_usr(0x01),       0x01);
> +    check(set_usr(0xff),       0x3f);
> +
> +    /*
> +     * PC is special.  Setting it to these values
> +     * should cause an instruction fetch miss.
> +     */
> +    check_ne(set_pc(0x00000000), 0x00000000);
> +    check_ne(set_pc(0xffffffff), 0xffffffff);
> +    check_ne(set_pc(0x00000001), 0x00000001);
> +    check_ne(set_pc(0x000000ff), 0x000000ff);
> +
> +    puts(err ? "FAIL" : "PASS");
> +    return err;
> +}

-- 
Anton Johansson,
rev.ng Labs Srl.


