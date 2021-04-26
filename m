Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79DD36BA91
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 22:09:43 +0200 (CEST)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb7Y6-0001TG-Nz
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 16:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lb7VG-00081d-99; Mon, 26 Apr 2021 16:06:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lb7VA-0001lr-Mq; Mon, 26 Apr 2021 16:06:46 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QK4Rxk129717; Mon, 26 Apr 2021 16:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Ka9MaunFP4IiGJLqsyf+obyKKGby0RxltYUGN5sN+mw=;
 b=CEBfZHCYnGezcDPkKahQaziuKSNd/4Ut1RL9T6cM/bdRkG3S40bTBxwGlChBsJer2akm
 9jb+rEtIPOYrjQdvWcJ0n2fvMOkCcGOnb8LiwthW8QDsFUdC7czhU0LRgsCcdnkmR7Qz
 iuU1XbpJ/dwRleNpK5JDVPJmVpTrEWEcqwzQAtf3yy6vvcgMrQYqjkXOgdOT+uddQrKE
 GhJTjCxnMCwSRDvoS3HNMGz0+zmBlFdttNAvDkworhXM52kaCBm+azSL78NgdGHQs6f3
 2Wn4A89S+kto4KY8hDyvY1drb2Bg+4dTUE3Em2oQ2mjv62azmp1a1wNpfb01w0p11jU2 sQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3860yjdhkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 16:06:32 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13QJgQHV024804;
 Mon, 26 Apr 2021 20:06:31 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 384ay98n5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 20:06:31 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13QK6UD518743720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 20:06:30 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 450B5AE05C;
 Mon, 26 Apr 2021 20:06:30 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D0A8AE05F;
 Mon, 26 Apr 2021 20:06:28 +0000 (GMT)
Received: from localhost (unknown [9.163.28.241])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Apr 2021 20:06:28 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 2/4] target/ppc: isolated SPR read/write callbacks
In-Reply-To: <20210423191807.77963-3-bruno.larsen@eldorado.org.br>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
 <20210423191807.77963-3-bruno.larsen@eldorado.org.br>
Date: Mon, 26 Apr 2021 17:06:26 -0300
Message-ID: <87mttk3j5p.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TZMisaQl9SSdz9u9W26iQRs1ujaJFyEd
X-Proofpoint-ORIG-GUID: TZMisaQl9SSdz9u9W26iQRs1ujaJFyEd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_09:2021-04-26,
 2021-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260153
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

> Moved all functions related to SPR read/write callbacks into a new file
> specific for holding these. This is setting up a better separation of
> SPR registration, which is required to be able to build disabling
> TCG.
>
> The solution to move it to spr_tcg.c.inc and including it in translate.c
> is a work in progress, any better solutions are very much appreciated.
> Also, making the R/W functions not static is required for the next
> commit.

Looks like this could be done in the next commit then.

>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/spr_tcg.c.inc        | 1002 +++++++++++++++++++++++++++++++
>  target/ppc/spr_tcg.h            |  132 ++++
>  target/ppc/translate.c          |   48 +-
>  target/ppc/translate_init.c.inc |  986 ------------------------------
>  4 files changed, 1136 insertions(+), 1032 deletions(-)
>  create mode 100644 target/ppc/spr_tcg.c.inc
>  create mode 100644 target/ppc/spr_tcg.h
>
> diff --git a/target/ppc/spr_tcg.c.inc b/target/ppc/spr_tcg.c.inc
> new file mode 100644
> index 0000000000..a0e62b3816
> --- /dev/null
> +++ b/target/ppc/spr_tcg.c.inc
> @@ -0,0 +1,1002 @@
> +#include "exec/translator.h"
> +#include "spr_tcg.h"
> +
> +#ifdef TARGET_PPC64
> +void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
> +                                    int bit, int sprn, int cause)
> +{
> +    TCGv_i32 t1 = tcg_const_i32(bit);
> +    TCGv_i32 t2 = tcg_const_i32(sprn);
> +    TCGv_i32 t3 = tcg_const_i32(cause);
> +
> +    gen_helper_fscr_facility_check(cpu_env, t1, t2, t3);
> +
> +    tcg_temp_free_i32(t3);
> +    tcg_temp_free_i32(t2);
> +    tcg_temp_free_i32(t1);
> +}
> +
> +void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
> +                                   int bit, int sprn, int cause)
> +{
> +    TCGv_i32 t1 = tcg_const_i32(bit);
> +    TCGv_i32 t2 = tcg_const_i32(sprn);
> +    TCGv_i32 t3 = tcg_const_i32(cause);
> +
> +    gen_helper_msr_facility_check(cpu_env, t1, t2, t3);
> +
> +    tcg_temp_free_i32(t3);
> +    tcg_temp_free_i32(t2);
> +    tcg_temp_free_i32(t1);
> +}
> +#endif
> +/*****************************************************************************/
> +/* Reader and writer functions for SPRs */
> +
> +void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
> +{
> +#if 0
> +    sprn = ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
> +    printf("ERROR: try to access SPR %d !\n", sprn);
> +#endif
> +}
> +
> +/*
> + * Generic callbacks:
> + * do nothing but store/retrieve spr value
> + */
> +void spr_load_dump_spr(int sprn)
> +{
> +#ifdef PPC_DUMP_SPR_ACCESSES

The define needs to come along.

> +    TCGv_i32 t0 = tcg_const_i32(sprn);
> +    gen_helper_load_dump_spr(cpu_env, t0);
> +    tcg_temp_free_i32(t0);
> +#endif
> +}
> +
> +void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_load_spr(cpu_gpr[gprn], sprn);
> +    spr_load_dump_spr(sprn);
> +}
> +
> +void spr_store_dump_spr(int sprn)
> +{
> +#ifdef PPC_DUMP_SPR_ACCESSES
> +    TCGv_i32 t0 = tcg_const_i32(sprn);
> +    gen_helper_store_dump_spr(cpu_env, t0);
> +    tcg_temp_free_i32(t0);
> +#endif
> +}
> +
> +void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_store_spr(sprn, cpu_gpr[gprn]);
> +    spr_store_dump_spr(sprn);
> +}
> +
> +/* SPR common to all PowerPC */
> +/* XER */
> +
> +/* I really see no reason to keep these gen_*_xer */
> +/* instead of just leaving the code in the spr_*_xer */
> +void gen_read_xer(DisasContext *ctx, TCGv dst)
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
> +void gen_write_xer(TCGv src)
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

These two can continue being static.

> +
> +void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_read_xer(ctx, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_write_xer(cpu_gpr[gprn]);
> +}
> +
> +/* LR */
> +void spr_read_lr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_lr);
> +}
> +
> +void spr_write_lr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    tcg_gen_mov_tl(cpu_lr, cpu_gpr[gprn]);
> +}
> +
> +/* CTR */
> +void spr_read_ctr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_ctr);
> +}
> +
> +void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    tcg_gen_mov_tl(cpu_ctr, cpu_gpr[gprn]);
> +}
> +
> +/* User read access to SPR */
> +/* USPRx */
> +/* UMMCRx */
> +/* UPMCx */
> +/* USIA */
> +/* UDECR */
> +void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
> +}
> +
> +/* SPR common to all non-embedded PowerPC, except 601 */
> +/* Time base */
> +void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
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
> +void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
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
> +
> +ATTRIBUTE_UNUSED
> +void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_atbl(cpu_gpr[gprn], cpu_env);
> +}
> +
> +ATTRIBUTE_UNUSED
> +void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_atbu(cpu_gpr[gprn], cpu_env);
> +}
> +
> +/* PowerPC 601 specific registers */
> +/* RTC */
> +void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_601_rtcl(cpu_gpr[gprn], cpu_env);
> +}
> +
> +void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_601_rtcu(cpu_gpr[gprn], cpu_env);
> +}
> +
> +/* SPE specific registers */
> +void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv_i32 t0 = tcg_temp_new_i32();
> +    tcg_gen_ld_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
> +    tcg_gen_extu_i32_tl(cpu_gpr[gprn], t0);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_temp_new_i32();
> +    tcg_gen_trunc_tl_i32(t0, cpu_gpr[gprn]);
> +    tcg_gen_st_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
> +    tcg_temp_free_i32(t0);
> +}
> +
> +#ifndef CONFIG_USER_ONLY

Moving a big amount of code like this to another file *and* rearranging
the code within the file at the same time makes it harder to review and
is error prone. I'd move the code in one patch and rearrange things in a
separate patch if needed.

> +void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
> +{
> +#ifdef TARGET_PPC64
> +    TCGv t0 = tcg_temp_new();
> +    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +    spr_store_dump_spr(sprn);
> +#else
> +    spr_write_generic(ctx, sprn, gprn);
> +#endif
> +}
> +
> +void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +    gen_load_spr(t0, sprn);
> +    tcg_gen_neg_tl(t1, cpu_gpr[gprn]);
> +    tcg_gen_and_tl(t0, t0, t1);
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +}
> +
> +void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
> +{
> +}
> +
> +void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
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
> +void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +ATTRIBUTE_UNUSED
> +void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_atbl(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +ATTRIBUTE_UNUSED
> +void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_atbu(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +/* IBAT0U...IBAT0U */
> +/* IBAT0L...IBAT7L */
> +void spr_read_ibat(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
> +}
> +
> +void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           IBAT[sprn & 1][((sprn - SPR_IBAT4U) / 2) + 4]));
> +}
> +
> +void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> +    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
> +    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0L) / 2);
> +    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
> +    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +/* DBAT0U...DBAT7U */
> +/* DBAT0L...DBAT7L */
> +void spr_read_dbat(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           DBAT[sprn & 1][(sprn - SPR_DBAT0U) / 2]));
> +}
> +
> +void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           DBAT[sprn & 1][((sprn - SPR_DBAT4U) / 2) + 4]));
> +}
> +
> +void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0U) / 2);
> +    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
> +    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0L) / 2);
> +    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
> +    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +/* SDR1 */
> +void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_sdr1(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_601_rtcu(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_601_rtcl(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
> +    /* Must stop the translation as endianness may have changed */
> +    gen_stop_exception(ctx);
> +}
> +
> +void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState,
> +                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
> +}
> +
> +void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> +    gen_helper_store_601_batl(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> +    gen_helper_store_601_batu(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_store_spr(sprn, cpu_gpr[gprn]);
> +    gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
> +    /* We must stop translation as we may have rebooted */
> +    gen_stop_exception(ctx);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +/* PowerPC 403 specific registers */
> +/* PBL1 / PBU1 / PBL2 / PBU2 */
> +void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> +                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
> +}
> +
> +void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32(sprn - SPR_403_PBL1);
> +    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xF);
> +    gen_store_spr(SPR_PIR, t0);
> +    tcg_temp_free(t0);
> +}
> +/* end PPC 403 specific */
> +
> +/* Callback used to write the exception vector base */
> +void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivpr_mask));
> +    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> +    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +
> +void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
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
> +/* end exception vector callbacks */
> +
> +void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_fixup_thrm(cpu_env);
> +    gen_load_spr(cpu_gpr[gprn], sprn);
> +    spr_load_dump_spr(sprn);
> +}
> +
> +void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR0_DCE | L1CSR0_CPE);
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +
> +void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR1_ICE | L1CSR1_CPE);
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +
> +void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
> +                    ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_L2LFC));
> +    gen_store_spr(sprn, t0);
> +    tcg_temp_free(t0);
> +}
> +
> +void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv_i32 t0 = tcg_const_i32(sprn);
> +    gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
> +    tcg_temp_free_i32(t0);
> +}
> +
> +void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_booke_set_eplc(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_booke_set_epsc(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv val = tcg_temp_new();
> +    tcg_gen_ext32u_tl(val, cpu_gpr[gprn]);
> +    gen_store_spr(SPR_BOOKE_MAS3, val);
> +    tcg_gen_shri_tl(val, cpu_gpr[gprn], 32);
> +    gen_store_spr(SPR_BOOKE_MAS7, val);
> +    tcg_temp_free(val);
> +}
> +
> +void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv mas7 = tcg_temp_new();
> +    TCGv mas3 = tcg_temp_new();
> +    gen_load_spr(mas7, SPR_BOOKE_MAS7);
> +    tcg_gen_shli_tl(mas7, mas7, 32);
> +    gen_load_spr(mas3, SPR_BOOKE_MAS3);
> +    tcg_gen_or_tl(cpu_gpr[gprn], mas3, mas7);
> +    tcg_temp_free(mas3);
> +    tcg_temp_free(mas7);
> +}
> +
> +#ifdef TARGET_PPC64
> +void spr_read_cfar(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_cfar);
> +}
> +
> +void spr_write_cfar(DisasContext *ctx, int sprn, int gprn)
> +{
> +    tcg_gen_mov_tl(cpu_cfar, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
> +}
> +
> +ATTRIBUTE_UNUSED
> +void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +/* HDECR */
> +void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_end();
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_stop_exception(ctx);
> +    }
> +}
> +
> +/* 64 bits PowerPC specific SPRs */
> +/* PIDR */
> +void spr_write_pidr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_pidr(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_lpidr(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_read_hior(DisasContext *ctx, int gprn, int sprn)
> +{
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, excp_prefix));
> +}
> +
> +void spr_write_hior(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0x3FFFFF00000ULL);
> +    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
> +    tcg_temp_free(t0);
> +}
> +
> +void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_ptcr(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_pcr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_pcr(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +/* DPDES */
> +void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_helper_load_dpdes(cpu_gpr[gprn], cpu_env);
> +}
> +
> +void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_dpdes(cpu_env, cpu_gpr[gprn]);
> +}
> +
> +void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
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
> +void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
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
> +void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
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
> +
> +#endif
> +#endif /* !defined(CONFIG_USER_ONLY) */
> +
> +#ifdef TARGET_PPC64
> +void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv spr_up = tcg_temp_new();
> +    TCGv spr = tcg_temp_new();
> +
> +    gen_load_spr(spr, sprn - 1);
> +    tcg_gen_shri_tl(spr_up, spr, 32);
> +    tcg_gen_ext32u_tl(cpu_gpr[gprn], spr_up);
> +
> +    tcg_temp_free(spr);
> +    tcg_temp_free(spr_up);
> +}
> +
> +void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv spr = tcg_temp_new();
> +
> +    gen_load_spr(spr, sprn - 1);
> +    tcg_gen_deposit_tl(spr, spr, cpu_gpr[gprn], 32, 32);
> +    gen_store_spr(sprn - 1, spr);
> +
> +    tcg_temp_free(spr);
> +}
> +
> +void spr_read_tar(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
> +    spr_read_generic(ctx, gprn, sprn);
> +}
> +
> +void spr_write_tar(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +
> +void spr_read_tm(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> +    spr_read_generic(ctx, gprn, sprn);
> +}
> +
> +void spr_write_tm(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +
> +void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> +    spr_read_prev_upper32(ctx, gprn, sprn);
> +}
> +
> +void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> +    spr_write_prev_upper32(ctx, sprn, gprn);
> +}
> +
> +void spr_read_ebb(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> +    spr_read_generic(ctx, gprn, sprn);
> +}
> +
> +void spr_write_ebb(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> +    spr_write_generic(ctx, sprn, gprn);
> +}
> +
> +void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> +    spr_read_prev_upper32(ctx, gprn, sprn);
> +}
> +
> +void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> +    spr_write_prev_upper32(ctx, sprn, gprn);
> +}
> +
> +void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv hmer = tcg_temp_new();
> +
> +    gen_load_spr(hmer, sprn);
> +    tcg_gen_and_tl(hmer, cpu_gpr[gprn], hmer);
> +    gen_store_spr(sprn, hmer);
> +    spr_store_dump_spr(sprn);
> +    tcg_temp_free(hmer);
> +}
> +
> +void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
> +}
> +#endif
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> new file mode 100644
> index 0000000000..1e09d001a9
> --- /dev/null
> +++ b/target/ppc/spr_tcg.h
> @@ -0,0 +1,132 @@
> +#ifndef SPR_TCG_H
> +#define SPR_TCG_H
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/translator.h"
> +#include "tcg/tcg.h"
> +
> +/* prototypes for readers and writers for SPRs */
> +
> +#ifdef TARGET_PPC64
> +void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
> +                                    int bit, int sprn, int cause);
> +void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
> +                                   int bit, int sprn, int cause);
> +#endif

The gen_* functions are only called from within the spr.c.inc file. You
shouldn't need them here.

> +
> +void spr_load_dump_spr(int sprn);
> +void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
> +void spr_store_dump_spr(int sprn);
> +void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
> +void gen_read_xer(DisasContext *ctx, TCGv dst);
> +void gen_write_xer(TCGv src);

Same here.

> +void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_lr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_atbu(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
> +
> +#ifndef CONFIG_USER_ONLY
> +void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_clear(DisasContext *ctx, int sprn, int gprn);
> +void spr_access_nop(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_decr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_decr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_tbl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_tbu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_atbl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_atbu(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ibat(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_dbat(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_pir(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_thrm(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_eplc(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_epsc(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_mas73(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_mas73(DisasContext *ctx, int gprn, int sprn);
> +#ifdef TARGET_PPC64
> +void spr_read_cfar(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_cfar(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ureg(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_purr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_purr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_vtb(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_vtb(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_pidr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_hior(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_hior(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_pcr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_amr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_uamor(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_iamr(DisasContext *ctx, int sprn, int gprn);
> +#endif
> +#endif
> +
> +#ifdef TARGET_PPC64
> +void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_tar(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_tar(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_tm(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_tm(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ebb(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_ebb(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
> +#endif
> +
> +#endif
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b319d409c6..bb893be928 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4175,43 +4175,6 @@ static void gen_tdi(DisasContext *ctx)
>  
>  /***                          Processor control                            ***/
>  
> -static void gen_read_xer(DisasContext *ctx, TCGv dst)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -    TCGv t2 = tcg_temp_new();
> -    tcg_gen_mov_tl(dst, cpu_xer);
> -    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
> -    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
> -    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
> -    tcg_gen_or_tl(t0, t0, t1);
> -    tcg_gen_or_tl(dst, dst, t2);
> -    tcg_gen_or_tl(dst, dst, t0);
> -    if (is_isa300(ctx)) {
> -        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
> -        tcg_gen_or_tl(dst, dst, t0);
> -        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
> -        tcg_gen_or_tl(dst, dst, t0);
> -    }
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -}
> -
> -static void gen_write_xer(TCGv src)
> -{
> -    /* Write all flags, while reading back check for isa300 */
> -    tcg_gen_andi_tl(cpu_xer, src,
> -                    ~((1u << XER_SO) |
> -                      (1u << XER_OV) | (1u << XER_OV32) |
> -                      (1u << XER_CA) | (1u << XER_CA32)));
> -    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
> -    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
> -    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
> -    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
> -    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
> -}
> -
>  /* mcrxr */
>  static void gen_mcrxr(DisasContext *ctx)
>  {
> @@ -4299,15 +4262,6 @@ static void gen_mfmsr(DisasContext *ctx)
>      tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_msr);
>  }
>  
> -static void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
> -{
> -#if 0
> -    sprn = ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
> -    printf("ERROR: try to access SPR %d !\n", sprn);
> -#endif
> -}
> -#define SPR_NOACCESS (&spr_noaccess)

What happens to code in translate.c that checks this? I don't think you
can remove it.

> -
>  /* mfspr */
>  static inline void gen_op_mfspr(DisasContext *ctx)
>  {
> @@ -8515,3 +8469,5 @@ void restore_state_to_opc(CPUPPCState *env, TranslationBlock *tb,
>  {
>      env->nip = data[0];
>  }
> +
> +#include "spr_tcg.c.inc"
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index 7bb54c259e..604423bd7b 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -47,673 +47,6 @@
>  /* #define PPC_DUMP_SPR_ACCESSES */
>  /* #define USE_APPLE_GDB */
>  
> -/*
> - * Generic callbacks:
> - * do nothing but store/retrieve spr value
> - */
> -static void spr_load_dump_spr(int sprn)
> -{
> -#ifdef PPC_DUMP_SPR_ACCESSES
> -    TCGv_i32 t0 = tcg_const_i32(sprn);
> -    gen_helper_load_dump_spr(cpu_env, t0);
> -    tcg_temp_free_i32(t0);
> -#endif
> -}
> -
> -static void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_load_spr(cpu_gpr[gprn], sprn);
> -    spr_load_dump_spr(sprn);
> -}
> -
> -static void spr_store_dump_spr(int sprn)
> -{
> -#ifdef PPC_DUMP_SPR_ACCESSES
> -    TCGv_i32 t0 = tcg_const_i32(sprn);
> -    gen_helper_store_dump_spr(cpu_env, t0);
> -    tcg_temp_free_i32(t0);
> -#endif
> -}
> -
> -static void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_store_spr(sprn, cpu_gpr[gprn]);
> -    spr_store_dump_spr(sprn);
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
> -{
> -#ifdef TARGET_PPC64
> -    TCGv t0 = tcg_temp_new();
> -    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -    spr_store_dump_spr(sprn);
> -#else
> -    spr_write_generic(ctx, sprn, gprn);
> -#endif
> -}
> -
> -static void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -    gen_load_spr(t0, sprn);
> -    tcg_gen_neg_tl(t1, cpu_gpr[gprn]);
> -    tcg_gen_and_tl(t0, t0, t1);
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -}
> -
> -static void spr_access_nop(DisasContext *ctx, int sprn, int gprn)
> -{
> -}
> -
> -#endif
> -
> -/* SPR common to all PowerPC */
> -/* XER */
> -static void spr_read_xer(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_read_xer(ctx, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_xer(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_write_xer(cpu_gpr[gprn]);
> -}
> -
> -/* LR */
> -static void spr_read_lr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_lr);
> -}
> -
> -static void spr_write_lr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    tcg_gen_mov_tl(cpu_lr, cpu_gpr[gprn]);
> -}
> -
> -/* CFAR */
> -#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> -static void spr_read_cfar(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_cfar);
> -}
> -
> -static void spr_write_cfar(DisasContext *ctx, int sprn, int gprn)
> -{
> -    tcg_gen_mov_tl(cpu_cfar, cpu_gpr[gprn]);
> -}
> -#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
> -
> -/* CTR */
> -static void spr_read_ctr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_mov_tl(cpu_gpr[gprn], cpu_ctr);
> -}
> -
> -static void spr_write_ctr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    tcg_gen_mov_tl(cpu_ctr, cpu_gpr[gprn]);
> -}
> -
> -/* User read access to SPR */
> -/* USPRx */
> -/* UMMCRx */
> -/* UPMCx */
> -/* USIA */
> -/* UDECR */
> -static void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
> -}
> -
> -#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> -static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
> -}
> -#endif
> -
> -/* SPR common to all non-embedded PowerPC */
> -/* DECR */
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -#endif
> -
> -/* SPR common to all non-embedded PowerPC, except 601 */
> -/* Time base */
> -static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -ATTRIBUTE_UNUSED
> -static void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_atbl(cpu_gpr[gprn], cpu_env);
> -}
> -
> -ATTRIBUTE_UNUSED
> -static void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_atbu(cpu_gpr[gprn], cpu_env);
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -ATTRIBUTE_UNUSED
> -static void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_atbl(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -ATTRIBUTE_UNUSED
> -static void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_atbu(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -#if defined(TARGET_PPC64)
> -ATTRIBUTE_UNUSED
> -static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -/* HDECR */
> -static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -#endif
> -#endif
> -
> -#if !defined(CONFIG_USER_ONLY)
> -/* IBAT0U...IBAT0U */
> -/* IBAT0L...IBAT7L */
> -static void spr_read_ibat(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
> -}
> -
> -static void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           IBAT[sprn & 1][((sprn - SPR_IBAT4U) / 2) + 4]));
> -}
> -
> -static void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> -    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
> -    gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0L) / 2);
> -    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
> -    gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -/* DBAT0U...DBAT7U */
> -/* DBAT0L...DBAT7L */
> -static void spr_read_dbat(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           DBAT[sprn & 1][(sprn - SPR_DBAT0U) / 2]));
> -}
> -
> -static void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           DBAT[sprn & 1][((sprn - SPR_DBAT4U) / 2) + 4]));
> -}
> -
> -static void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0U) / 2);
> -    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
> -    gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0L) / 2);
> -    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
> -    gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -/* SDR1 */
> -static void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_sdr1(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -#if defined(TARGET_PPC64)
> -/* 64 bits PowerPC specific SPRs */
> -/* PIDR */
> -static void spr_write_pidr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_pidr(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_lpidr(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_read_hior(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, excp_prefix));
> -}
> -
> -static void spr_write_hior(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0x3FFFFF00000ULL);
> -    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
> -    tcg_temp_free(t0);
> -}
> -static void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_ptcr(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_pcr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_pcr(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -/* DPDES */
> -static void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_dpdes(cpu_gpr[gprn], cpu_env);
> -}
> -
> -static void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_dpdes(cpu_env, cpu_gpr[gprn]);
> -}
> -#endif
> -#endif
> -
> -/* PowerPC 601 specific registers */
> -/* RTC */
> -static void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_601_rtcl(cpu_gpr[gprn], cpu_env);
> -}
> -
> -static void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_load_601_rtcu(cpu_gpr[gprn], cpu_env);
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_601_rtcu(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_601_rtcl(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
> -    /* Must stop the translation as endianness may have changed */
> -    gen_stop_exception(ctx);
> -}
> -#endif
> -
> -/* Unified bats */
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState,
> -                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
> -}
> -
> -static void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> -    gen_helper_store_601_batl(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
> -    gen_helper_store_601_batu(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -#endif
> -
> -/* PowerPC 40x specific registers */
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_store_spr(sprn, cpu_gpr[gprn]);
> -    gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
> -    /* We must stop translation as we may have rebooted */
> -    gen_stop_exception(ctx);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -
> -static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> -    gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
> -}
> -#endif
> -
> -/* PowerPC 403 specific registers */
> -/* PBL1 / PBU1 / PBL2 / PBU2 */
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
> -}
> -
> -static void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32(sprn - SPR_403_PBL1);
> -    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xF);
> -    gen_store_spr(SPR_PIR, t0);
> -    tcg_temp_free(t0);
> -}
> -#endif
> -
> -/* SPE specific registers */
> -static void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    TCGv_i32 t0 = tcg_temp_new_i32();
> -    tcg_gen_ld_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
> -    tcg_gen_extu_i32_tl(cpu_gpr[gprn], t0);
> -    tcg_temp_free_i32(t0);
> -}
> -
> -static void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_temp_new_i32();
> -    tcg_gen_trunc_tl_i32(t0, cpu_gpr[gprn]);
> -    tcg_gen_st_i32(t0, cpu_env, offsetof(CPUPPCState, spe_fscr));
> -    tcg_temp_free_i32(t0);
> -}
> -
> -#if !defined(CONFIG_USER_ONLY)
> -/* Callback used to write the exception vector base */
> -static void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivpr_mask));
> -    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> -    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_prefix));
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -
> -static void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn)
> -{
> -    int sprn_offs;
> -
> -    if (sprn >= SPR_BOOKE_IVOR0 && sprn <= SPR_BOOKE_IVOR15) {
> -        sprn_offs = sprn - SPR_BOOKE_IVOR0;
> -    } else if (sprn >= SPR_BOOKE_IVOR32 && sprn <= SPR_BOOKE_IVOR37) {
> -        sprn_offs = sprn - SPR_BOOKE_IVOR32 + 32;
> -    } else if (sprn >= SPR_BOOKE_IVOR38 && sprn <= SPR_BOOKE_IVOR42) {
> -        sprn_offs = sprn - SPR_BOOKE_IVOR38 + 38;
> -    } else {
> -        printf("Trying to write an unknown exception vector %d %03x\n",
> -               sprn, sprn);
> -        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
> -        return;
> -    }
> -
> -    TCGv t0 = tcg_temp_new();
> -    tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivor_mask));
> -    tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> -    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_offs]));
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -#endif
> -
>  static inline void vscr_init(CPUPPCState *env, uint32_t val)
>  {
>      /* Altivec always uses round-to-nearest */
> @@ -1232,104 +565,6 @@ static void gen_spr_7xx(CPUPPCState *env)
>  }
>  
>  #ifdef TARGET_PPC64
> -#ifndef CONFIG_USER_ONLY
> -static void spr_write_amr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -    TCGv t2 = tcg_temp_new();
> -
> -    /*
> -     * Note, the HV=1 PR=0 case is handled earlier by simply using
> -     * spr_write_generic for HV mode in the SPR table
> -     */
> -
> -    /* Build insertion mask into t1 based on context */
> -    if (ctx->pr) {
> -        gen_load_spr(t1, SPR_UAMOR);
> -    } else {
> -        gen_load_spr(t1, SPR_AMOR);
> -    }
> -
> -    /* Mask new bits into t2 */
> -    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> -
> -    /* Load AMR and clear new bits in t0 */
> -    gen_load_spr(t0, SPR_AMR);
> -    tcg_gen_andc_tl(t0, t0, t1);
> -
> -    /* Or'in new bits and write it out */
> -    tcg_gen_or_tl(t0, t0, t2);
> -    gen_store_spr(SPR_AMR, t0);
> -    spr_store_dump_spr(SPR_AMR);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -}
> -
> -static void spr_write_uamor(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -    TCGv t2 = tcg_temp_new();
> -
> -    /*
> -     * Note, the HV=1 case is handled earlier by simply using
> -     * spr_write_generic for HV mode in the SPR table
> -     */
> -
> -    /* Build insertion mask into t1 based on context */
> -    gen_load_spr(t1, SPR_AMOR);
> -
> -    /* Mask new bits into t2 */
> -    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> -
> -    /* Load AMR and clear new bits in t0 */
> -    gen_load_spr(t0, SPR_UAMOR);
> -    tcg_gen_andc_tl(t0, t0, t1);
> -
> -    /* Or'in new bits and write it out */
> -    tcg_gen_or_tl(t0, t0, t2);
> -    gen_store_spr(SPR_UAMOR, t0);
> -    spr_store_dump_spr(SPR_UAMOR);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -}
> -
> -static void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -    TCGv t2 = tcg_temp_new();
> -
> -    /*
> -     * Note, the HV=1 case is handled earlier by simply using
> -     * spr_write_generic for HV mode in the SPR table
> -     */
> -
> -    /* Build insertion mask into t1 based on context */
> -    gen_load_spr(t1, SPR_AMOR);
> -
> -    /* Mask new bits into t2 */
> -    tcg_gen_and_tl(t2, t1, cpu_gpr[gprn]);
> -
> -    /* Load AMR and clear new bits in t0 */
> -    gen_load_spr(t0, SPR_IAMR);
> -    tcg_gen_andc_tl(t0, t0, t1);
> -
> -    /* Or'in new bits and write it out */
> -    tcg_gen_or_tl(t0, t0, t2);
> -    gen_store_spr(SPR_IAMR, t0);
> -    spr_store_dump_spr(SPR_IAMR);
> -
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -}
> -#endif /* CONFIG_USER_ONLY */
>  
>  static void gen_spr_amr(CPUPPCState *env)
>  {
> @@ -1375,15 +610,6 @@ static void gen_spr_iamr(CPUPPCState *env)
>  }
>  #endif /* TARGET_PPC64 */
>  
> -#ifndef CONFIG_USER_ONLY
> -static void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_helper_fixup_thrm(cpu_env);
> -    gen_load_spr(cpu_gpr[gprn], sprn);
> -    spr_load_dump_spr(sprn);
> -}
> -#endif /* !CONFIG_USER_ONLY */
> -
>  static void gen_spr_thrm(CPUPPCState *env)
>  {
>      /* Thermal management */
> @@ -1751,57 +977,6 @@ static void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
>  #endif
>  }
>  
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR0_DCE | L1CSR0_CPE);
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -
> -static void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn], L1CSR1_ICE | L1CSR1_CPE);
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -
> -static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv t0 = tcg_temp_new();
> -
> -    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
> -                    ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_L2LFC));
> -    gen_store_spr(sprn, t0);
> -    tcg_temp_free(t0);
> -}
> -
> -static void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -static void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 = tcg_const_i32(sprn);
> -    gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -static void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_booke_set_eplc(cpu_env, cpu_gpr[gprn]);
> -}
> -static void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_booke_set_epsc(cpu_env, cpu_gpr[gprn]);
> -}
> -
> -#endif
> -
>  static void gen_spr_usprg3(CPUPPCState *env)
>  {
>      spr_register(env, SPR_USPRG3, "USPRG3",
> @@ -4882,31 +4057,6 @@ POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
>  }
>  
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_mas73(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv val = tcg_temp_new();
> -    tcg_gen_ext32u_tl(val, cpu_gpr[gprn]);
> -    gen_store_spr(SPR_BOOKE_MAS3, val);
> -    tcg_gen_shri_tl(val, cpu_gpr[gprn], 32);
> -    gen_store_spr(SPR_BOOKE_MAS7, val);
> -    tcg_temp_free(val);
> -}
> -
> -static void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
> -{
> -    TCGv mas7 = tcg_temp_new();
> -    TCGv mas3 = tcg_temp_new();
> -    gen_load_spr(mas7, SPR_BOOKE_MAS7);
> -    tcg_gen_shli_tl(mas7, mas7, 32);
> -    gen_load_spr(mas3, SPR_BOOKE_MAS3);
> -    tcg_gen_or_tl(cpu_gpr[gprn], mas3, mas7);
> -    tcg_temp_free(mas3);
> -    tcg_temp_free(mas7);
> -}
> -
> -#endif
> -
>  enum fsl_e500_version {
>      fsl_e500v1,
>      fsl_e500v2,
> @@ -7602,65 +6752,7 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
>                   POWERPC_FLAG_BUS_CLK;
>  }
> -
>  #if defined(TARGET_PPC64)
> -#if defined(CONFIG_USER_ONLY)
> -#define POWERPC970_HID5_INIT 0x00000080
> -#else
> -#define POWERPC970_HID5_INIT 0x00000000
> -#endif

Where do these went?

> -
> -static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
> -                                    int bit, int sprn, int cause)
> -{
> -    TCGv_i32 t1 = tcg_const_i32(bit);
> -    TCGv_i32 t2 = tcg_const_i32(sprn);
> -    TCGv_i32 t3 = tcg_const_i32(cause);
> -
> -    gen_helper_fscr_facility_check(cpu_env, t1, t2, t3);
> -
> -    tcg_temp_free_i32(t3);
> -    tcg_temp_free_i32(t2);
> -    tcg_temp_free_i32(t1);
> -}
> -
> -static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
> -                                   int bit, int sprn, int cause)
> -{
> -    TCGv_i32 t1 = tcg_const_i32(bit);
> -    TCGv_i32 t2 = tcg_const_i32(sprn);
> -    TCGv_i32 t3 = tcg_const_i32(cause);
> -
> -    gen_helper_msr_facility_check(cpu_env, t1, t2, t3);
> -
> -    tcg_temp_free_i32(t3);
> -    tcg_temp_free_i32(t2);
> -    tcg_temp_free_i32(t1);
> -}
> -
> -static void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn)
> -{
> -    TCGv spr_up = tcg_temp_new();
> -    TCGv spr = tcg_temp_new();
> -
> -    gen_load_spr(spr, sprn - 1);
> -    tcg_gen_shri_tl(spr_up, spr, 32);
> -    tcg_gen_ext32u_tl(cpu_gpr[gprn], spr_up);
> -
> -    tcg_temp_free(spr);
> -    tcg_temp_free(spr_up);
> -}
> -
> -static void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv spr = tcg_temp_new();
> -
> -    gen_load_spr(spr, sprn - 1);
> -    tcg_gen_deposit_tl(spr, spr, cpu_gpr[gprn], 32, 32);
> -    gen_store_spr(sprn - 1, spr);
> -
> -    tcg_temp_free(spr);
> -}
>  
>  static int check_pow_970(CPUPPCState *env)
>  {
> @@ -7961,24 +7053,6 @@ static void gen_spr_power5p_tb(CPUPPCState *env)
>                      0x00000000);
>  }
>  
> -#if !defined(CONFIG_USER_ONLY)
> -static void spr_write_hmer(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv hmer = tcg_temp_new();
> -
> -    gen_load_spr(hmer, sprn);
> -    tcg_gen_and_tl(hmer, cpu_gpr[gprn], hmer);
> -    gen_store_spr(sprn, hmer);
> -    spr_store_dump_spr(sprn);
> -    tcg_temp_free(hmer);
> -}
> -
> -static void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
> -}
> -#endif /* !defined(CONFIG_USER_ONLY) */
> -
>  static void gen_spr_970_lpar(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -8176,18 +7250,6 @@ static void gen_spr_power6_common(CPUPPCState *env)
>                   0x00000000);
>  }
>  
> -static void spr_read_tar(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
> -    spr_read_generic(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_tar(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_TAR, sprn, FSCR_IC_TAR);
> -    spr_write_generic(ctx, sprn, gprn);
> -}
> -
>  static void gen_spr_power8_tce_address_control(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_TAR, "TAR",
> @@ -8196,30 +7258,6 @@ static void gen_spr_power8_tce_address_control(CPUPPCState *env)
>                       KVM_REG_PPC_TAR, 0x00000000);
>  }
>  
> -static void spr_read_tm(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> -    spr_read_generic(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_tm(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> -    spr_write_generic(ctx, sprn, gprn);
> -}
> -
> -static void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> -    spr_read_prev_upper32(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_msr_facility_check(ctx, SPR_FSCR, MSR_TM, sprn, FSCR_IC_TM);
> -    spr_write_prev_upper32(ctx, sprn, gprn);
> -}
> -
>  static void gen_spr_power8_tm(CPUPPCState *env)
>  {
>      spr_register_kvm(env, SPR_TFHAR, "TFHAR",
> @@ -8240,30 +7278,6 @@ static void gen_spr_power8_tm(CPUPPCState *env)
>                   0x00000000);
>  }
>  
> -static void spr_read_ebb(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> -    spr_read_generic(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_ebb(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> -    spr_write_generic(ctx, sprn, gprn);
> -}
> -
> -static void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> -    spr_read_prev_upper32(ctx, gprn, sprn);
> -}
> -
> -static void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
> -{
> -    gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
> -    spr_write_prev_upper32(ctx, sprn, gprn);
> -}
> -
>  static void gen_spr_power8_ebb(CPUPPCState *env)
>  {
>      spr_register(env, SPR_BESCRS, "BESCRS",

