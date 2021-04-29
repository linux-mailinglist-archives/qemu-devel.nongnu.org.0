Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD92C36F13A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 22:44:08 +0200 (CEST)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcDW3-0007EI-Bf
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 16:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcDUX-0006g2-0P; Thu, 29 Apr 2021 16:42:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21096
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcDUU-0000rA-Lx; Thu, 29 Apr 2021 16:42:32 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TKYKKC077247; Thu, 29 Apr 2021 16:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=tRgBryrZmcbhIbE9Uj/kyCkpowKanyHz2SNoBthTi1k=;
 b=fQPNwqM6PpdaDMNRpnrOhVzvbd3eKhXG9lpsT6xtd5N6R1QYtNJ/0hJIoATmar2Qxmgx
 xkdnqac6duLgmJiyZ7CrblOHPP1L7Du4s5obhxscvqIQWaMh633AMMxlGIpJZDLg3fjo
 CSmbGk97GI8DwUu0wgaV0E6jyRYpJ2KZ+LFchG5jnNXl1ogsSH1/dWaGogNBjsnVSuL9
 Ikpl0ufi3wp2hev4kgiEyRqcRlQZn2yltt862jno2FMCgtRSs4P912dBbYC9/A98ZZph
 6b+izxTWGCR7yGEAc6xiD/je8nWAuC0zOW3TSNSwP+MDCSoLHk5L/IidhTvMcY2UONRa Mg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3882k5abg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 16:42:21 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TKfTGd027208;
 Thu, 29 Apr 2021 20:42:20 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 384ay9rnqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 20:42:20 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TKgJmk21889288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 20:42:19 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A1A5112061;
 Thu, 29 Apr 2021 20:42:19 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA91B112067;
 Thu, 29 Apr 2021 20:42:18 +0000 (GMT)
Received: from localhost (unknown [9.211.156.251])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Apr 2021 20:42:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/7] target/ppc: Isolated SPR read/write callbacks
In-Reply-To: <20210429162130.2412-4-bruno.larsen@eldorado.org.br>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-4-bruno.larsen@eldorado.org.br>
Date: Thu, 29 Apr 2021 17:42:16 -0300
Message-ID: <87bl9w3jrr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g_vWFS4qhbRhbUcAbhVBmiSLX_2pbhwI
X-Proofpoint-GUID: g_vWFS4qhbRhbUcAbhVBmiSLX_2pbhwI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_11:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, "Bruno Larsen
 \(billionai\)" <bruno.larsen@eldorado.org.br>, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:

> Moved all SPR read/write callback, and some related functions, to a
> new file specific for it. These callbacks are TCG only, so separating
> them is required to support the flag disable-tcg.
>
> Making the spr_noaccess function not static, and moving the define to
> internal.h is required, as spr_tcg.c.inc has to be included after
> SPR_NOACCESS has been used.
>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/internal.h           |    3 +
>  target/ppc/spr_tcg.c.inc        | 1033 +++++++++++++++++++++++++++++++
>  target/ppc/translate.c          |   49 +-
>  target/ppc/translate_init.c.inc |  981 -----------------------------
>  4 files changed, 1039 insertions(+), 1027 deletions(-)
>  create mode 100644 target/ppc/spr_tcg.c.inc
>
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 184ba6d6b3..1de15acfbd 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -228,4 +228,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
>  void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
>  gchar *ppc_gdb_arch_name(CPUState *cs);
>  
> +void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
> +#define SPR_NOACCESS (&spr_noaccess)
> +
>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/ppc/spr_tcg.c.inc b/target/ppc/spr_tcg.c.inc
> new file mode 100644
> index 0000000000..48274dd52b
> --- /dev/null
> +++ b/target/ppc/spr_tcg.c.inc
> @@ -0,0 +1,1033 @@
> +#include "exec/translator.h"

This is already in translate.c.

> +
> +/*****************************************************************************/
> +/* Reader and writer functions for SPRs */
> +
> +/* I really see no reason to keep these gen_*_xer */
> +/* instead of just leaving the code in the spr_*_xer */

Ok, let's do this for the next version then.

> +static void gen_read_xer(DisasContext *ctx, TCGv dst)
> +{
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +    tcg_gen_mov_tl(dst, cpu_xer);
> +    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
> +    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
> +    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
> +    tcg_gen_or_tl(t0, t0, t1);
> +    tcg_gen_or_tl(dst, dst, t2);
> +    tcg_gen_or_tl(dst, dst, t0);
> +    if (is_isa300(ctx)) {
> +        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
> +        tcg_gen_or_tl(dst, dst, t0);
> +        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
> +        tcg_gen_or_tl(dst, dst, t0);
> +    }
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}
> +
> +static void gen_write_xer(TCGv src)
> +{
> +    /* Write all flags, while reading back check for isa300 */
> +    tcg_gen_andi_tl(cpu_xer, src,
> +                    ~((1u << XER_SO) |
> +                      (1u << XER_OV) | (1u << XER_OV32) |
> +                      (1u << XER_CA) | (1u << XER_CA32)));
> +    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
> +    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
> +    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
> +    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
> +    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
> +}

<snip>

> +/* User read access to SPR */
> +/* USPRx */
> +/* UMMCRx */
> +/* UPMCx */
> +/* USIA */
> +/* UDECR */
> +static void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
> +}
> +
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
> +}
> +#endif
> +

You missed this:

/* SPR common to all non-embedded PowerPC */

> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +#endif
> +
> +/* SPR common to all non-embedded PowerPC, except 601 */
> +/* Time base */
> +static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}

<snip>

> +static void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
> +{
> +    int sprn_offs;
> +
> +    if (sprn >= SPR_BOOKE_IVOR0 && sprn <= SPR_BOOKE_IVOR15) {
> +        sprn_offs = sprn - SPR_BOOKE_IVOR0;
> +    } else if (sprn >= SPR_BOOKE_IVOR32 && sprn <= SPR_BOOKE_IVOR37) {
> +        sprn_offs = sprn - SPR_BOOKE_IVOR32 + 32;
> +    } else if (sprn >= SPR_BOOKE_IVOR38 && sprn <= SPR_BOOKE_IVOR42) {
> +        sprn_offs = sprn - SPR_BOOKE_IVOR38 + 38;
> +    } else {
> +        printf("Trying to write an unknown exception vector %d %03x\n",
> +               sprn, sprn);
> +        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
> +        return;
> +    }
> +
> +    TCGv t0 = tcg_temp_new();
> +    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivor_mask));
> +    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> +    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_offs]));
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +#endif
> +
> +#ifdef TARGET_PPC64

#ifndef CONFIG_USER_ONLY

> +static void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +
> +    /*
> +     * Note, the HV=1 PR=0 case is handled earlier by simply using
> +     * spr_write_generic for HV mode in the SPR table
> +     */
> +
> +    /* Build insertion mask into t1 based on context */
> +    if (ctx->pr) {
> +        gen_load_spr(t1, SPR_UAMOR);
> +    } else {
> +        gen_load_spr(t1, SPR_AMOR);
> +    }
> +
> +    /* Mask new bits into t2 */
> +    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> +
> +    /* Load AMR and clear new bits in t0 */
> +    gen_load_spr(t0, SPR_AMR);
> +    tcg_gen_andc_tl(t0, t0, t1);
> +
> +    /* Or'in new bits and write it out */
> +    tcg_gen_or_tl(t0, t0, t2);
> +    gen_store_spr(SPR_AMR, t0);
> +    spr_store_dump_spr(SPR_AMR);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}
> +
> +static void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +
> +    /*
> +     * Note, the HV=1 case is handled earlier by simply using
> +     * spr_write_generic for HV mode in the SPR table
> +     */
> +
> +    /* Build insertion mask into t1 based on context */
> +    gen_load_spr(t1, SPR_AMOR);
> +
> +    /* Mask new bits into t2 */
> +    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> +
> +    /* Load AMR and clear new bits in t0 */
> +    gen_load_spr(t0, SPR_UAMOR);
> +    tcg_gen_andc_tl(t0, t0, t1);
> +
> +    /* Or'in new bits and write it out */
> +    tcg_gen_or_tl(t0, t0, t2);
> +    gen_store_spr(SPR_UAMOR, t0);
> +    spr_store_dump_spr(SPR_UAMOR);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}
> +
> +static void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +
> +    /*
> +     * Note, the HV=1 case is handled earlier by simply using
> +     * spr_write_generic for HV mode in the SPR table
> +     */
> +
> +    /* Build insertion mask into t1 based on context */
> +    gen_load_spr(t1, SPR_AMOR);
> +
> +    /* Mask new bits into t2 */
> +    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> +
> +    /* Load AMR and clear new bits in t0 */
> +    gen_load_spr(t0, SPR_IAMR);
> +    tcg_gen_andc_tl(t0, t0, t1);
> +
> +    /* Or'in new bits and write it out */
> +    tcg_gen_or_tl(t0, t0, t2);
> +    gen_store_spr(SPR_IAMR, t0);
> +    spr_store_dump_spr(SPR_IAMR);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}

#endif /* CONFIG_USER_ONLY */

> +#endif
> +
> +#if !defined(CONFIG_USER_ONLY)
> +static void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_fixup_thrm(cpu_env);
> +    gen_load_spr(cpu_gpr[gprn], sprn);
> +    spr_load_dump_spr(sprn);
> +}

<snip>

> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b319d409c6..a6e677fa6d 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -36,6 +36,7 @@
>  #include "exec/translator.h"
>  #include "exec/log.h"
>  #include "qemu/atomic128.h"
> +#include "internal.h"

This is already included.

