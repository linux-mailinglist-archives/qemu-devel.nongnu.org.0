Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D026E339759
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:22:55 +0100 (CET)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnN8-00016F-Sw
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lKmir-0004UN-Mm
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:41:19 -0500
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:56616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lKmik-0003K7-Vh
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:41:15 -0500
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 51A0D3F526;
 Fri, 12 Mar 2021 19:41:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjNqE_XhyrUG; Fri, 12 Mar 2021 19:40:56 +0100 (CET)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id E39EA3F506;
 Fri, 12 Mar 2021 19:40:55 +0100 (CET)
Date: Fri, 12 Mar 2021 19:40:59 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 3/5] target/mips/tx79: Move RDHWR usermode kludge to
 trans_SQ()
Message-ID: <YEu1u2w54D7Qf/G0@sx9>
References: <20210312162434.1869129-1-f4bug@amsat.org>
 <20210312162434.1869129-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312162434.1869129-4-f4bug@amsat.org>
Received-SPF: softfail client-ip=79.136.2.42; envelope-from=noring@nocrew.org;
 helo=pio-pvt-msa3.bahnhof.se
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 12 March 2021, Philippe Mathieu-Daudé wrote:
> Now than SQ is properly implemented, we can move the RDHWR
> kludge required to have usermode working with recent glibc.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: { RDHWR_user } (rth)
> 
> Fredrik, I'm not understanding fully your discussion with Maciej:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg783053.html
> So any help welcome to get your patch merged into mainstream.

So the most important change is that rd is always $29 which for SQ
always corresponds to -6085(zero). Other values of rd are ignored,
as they were not intended to be used although the Linux kernel has
some code for a few cases as Maciej explained.

> ---
>  target/mips/tx79.decode      |  5 +++-
>  target/mips/translate.c      | 56 ------------------------------------
>  target/mips/tx79_translate.c | 31 ++++++++++++++++++++
>  3 files changed, 35 insertions(+), 57 deletions(-)
> 
> diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
> index 0756b13149e..25ddaa92bbd 100644
> --- a/target/mips/tx79.decode
> +++ b/target/mips/tx79.decode
> @@ -45,4 +45,7 @@ PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
>  # SPECIAL
>  
>  LQ              011110 ..... ..... ................     @ldst
> -SQ              011111 ..... ..... ................     @ldst
> +{
> +  RDHWR_user    011111 00000 ..... ..... 00000 111011   @rt_rd
                                      ^^^^^
I assume that the "rd" field would be 11101 here? Notice that the
highest bit is set, which explains why the SQ offset is negative and
why that last rather than the first (null) page is referenced.

> +  SQ            011111 ..... ..... ................     @ldst
> +}
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index c822083f031..671c67f5fc7 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -1167,7 +1167,6 @@ enum {
>  
>  enum {
>      MMI_OPC_CLASS_MMI = 0x1C << 26,    /* Same as OPC_SPECIAL2 */
> -    MMI_OPC_SQ        = 0x1F << 26,    /* Same as OPC_SPECIAL3 */
>  };
>  
>  /*
> @@ -24428,53 +24427,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
>      }
>  }
>  
> -static void gen_mmi_sq(DisasContext *ctx, int base, int rt, int offset)
> -{
> -    gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_SQ */
> -}
> -
> -/*
> - * The TX79-specific instruction Store Quadword
> - *
> - * +--------+-------+-------+------------------------+
> - * | 011111 |  base |   rt  |           offset       | SQ
> - * +--------+-------+-------+------------------------+
> - *      6       5       5                 16
> - *
> - * has the same opcode as the Read Hardware Register instruction
> - *
> - * +--------+-------+-------+-------+-------+--------+
> - * | 011111 | 00000 |   rt  |   rd  | 00000 | 111011 | RDHWR
> - * +--------+-------+-------+-------+-------+--------+
> - *      6       5       5       5       5        6
> - *
> - * that is required, trapped and emulated by the Linux kernel. However, all
> - * RDHWR encodings yield address error exceptions on the TX79 since the SQ
> - * offset is odd. Therefore all valid SQ instructions can execute normally.
> - * In user mode, QEMU must verify the upper and lower 11 bits to distinguish
> - * between SQ and RDHWR, as the Linux kernel does.
> - */
> -static void decode_mmi_sq(CPUMIPSState *env, DisasContext *ctx)
> -{
> -    int base = extract32(ctx->opcode, 21, 5);
> -    int rt = extract32(ctx->opcode, 16, 5);
> -    int offset = extract32(ctx->opcode, 0, 16);
> -
> -#ifdef CONFIG_USER_ONLY
> -    uint32_t op1 = MASK_SPECIAL3(ctx->opcode);
> -    uint32_t op2 = extract32(ctx->opcode, 6, 5);
> -
> -    if (base == 0 && op2 == 0 && op1 == OPC_RDHWR) {
> -        int rd = extract32(ctx->opcode, 11, 5);
> -
> -        gen_rdhwr(ctx, rt, rd, 0);
> -        return;
> -    }
> -#endif
> -
> -    gen_mmi_sq(ctx, base, rt, offset);
> -}
> -
>  #endif
>  
>  static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
> @@ -24664,15 +24616,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
>          decode_opc_special2_legacy(env, ctx);
>          break;
>      case OPC_SPECIAL3:
> -#if defined(TARGET_MIPS64)
> -        if (ctx->insn_flags & INSN_R5900) {
> -            decode_mmi_sq(env, ctx);    /* MMI_OPC_SQ */
> -        } else {
> -            decode_opc_special3(env, ctx);
> -        }
> -#else
>          decode_opc_special3(env, ctx);
> -#endif
>          break;
>      case OPC_REGIMM:
>          op1 = MASK_REGIMM(ctx->opcode);
> diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
> index d840dfdb9cc..3b1ef05e95b 100644
> --- a/target/mips/tx79_translate.c
> +++ b/target/mips/tx79_translate.c
> @@ -239,6 +239,37 @@ static bool trans_SQ(DisasContext *ctx, arg_itype *a)
>      return true;
>  }
>  
> +/*
> + * The TX79-specific instruction Store Quadword
> + *
> + * +--------+-------+-------+------------------------+
> + * | 011111 |  base |   rt  |           offset       | SQ
> + * +--------+-------+-------+------------------------+
> + *      6       5       5                 16
> + *
> + * has the same opcode as the Read Hardware Register instruction
> + *
> + * +--------+-------+-------+-------+-------+--------+
> + * | 011111 | 00000 |   rt  |   rd  | 00000 | 111011 | RDHWR
> + * +--------+-------+-------+-------+-------+--------+
> + *      6       5       5       5       5        6
> + *
> + * that is required, trapped and emulated by the Linux kernel. However, all
> + * RDHWR encodings yield address error exceptions on the TX79 since the SQ
> + * offset is odd. Therefore all valid SQ instructions can execute normally.
> + * In user mode, QEMU must verify the upper and lower 11 bits to distinguish
> + * between SQ and RDHWR, as the Linux kernel does.
> + */

The "SQ offset is odd" should be replaced with something like "SQ asserts
an address exception since -6085(zero) always resolves to 0xffffe83b in
32-bit KSEG2", as seen in the Linux kernel comment about RDHWR:

	/*
	 * On the R5900, a valid RDHWR instruction
	 *
	 *     +--------+-------+----+----+-------+--------+
	 *     | 011111 | 00000 | rt | rd | 00000 | 111011 |
	 *     +--------+-------+----+----+-------+--------+
	 *          6       5      5    5     5        6
	 *
	 * having rd $29 (MIPS_HWR_ULR) is interpreted as
	 * the R5900 specific SQ instruction
	 *
	 *     +--------+-------+----+---------------------+
	 *     | 011111 |  base | rt |        offset       |
	 *     +--------+-------+----+---------------------+
	 *          6       5      5            16
	 *
	 * being (where rd usually is $3)
	 *
	 *     sq v1,-6085(zero)
	 *
	 * that asserts an address exception since -6085(zero)
	 * always resolves to 0xffffe83b in 32-bit KSEG2.
	 *
	 * Other legacy values of rd, such as MIPS_HWR_CPUNUM,
	 * are ignored.
	 */

Fredrik

> +static bool trans_RDHWR_user(DisasContext *ctx, arg_rtype *a)
> +{
> +#if defined(CONFIG_USER_ONLY)
> +    gen_rdhwr(ctx, a->rt, a->rd, 0);
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
>  /*
>   *     Multiply and Divide (19 instructions)
>   *     -------------------------------------
> -- 
> 2.26.2
> 

