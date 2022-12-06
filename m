Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5BD644C89
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 20:31:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2ddq-0000ni-Pc; Tue, 06 Dec 2022 14:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2ddl-0000nZ-7M
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 14:30:05 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2ddd-0005va-T3
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 14:30:04 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6JKXt1025787; Tue, 6 Dec 2022 19:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=HT9dTZRkSPIUPCWZ0/RXGZaBkM0n30FNrRaIgYOTuK0=;
 b=FPDEPomVQYoTB/QhQTr7mXT67LmT9qdKtHK2q/exQSBWN5k3bK2470VsDv1w/ImF+OFT
 9xMB5ilGh0vh7xEJ88QBgLurV/8MNUeGwBUr36Ib7vhIqFBlyeqJkJLnaY9ysDEXDejN
 oRq3dGNArkp7eZe3YulEZJcE6bl1n8ntwrhivvf3EByxA3UAj4jTJq4GWHQT+3Xlnjk8
 11E4yuZdGXQtCvtjo4nj3K5SaKxfizc8cCK3Od6wJNMNSTsUUeZt3J4LCV0mktQBWkr1
 dCiTU+iq3lajkGeKXZDq+8JZ9O6glr/IAVzOLlULg02fSUZy1S3hyiR3HTHbL9uFCeHa dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mabtf8587-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 19:29:54 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6JQw3P014406;
 Tue, 6 Dec 2022 19:29:54 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mabtf8573-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 19:29:53 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B69URHs010345;
 Tue, 6 Dec 2022 19:29:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3m9ks41w25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 19:29:51 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6JTnIf38928760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 19:29:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B12120043;
 Tue,  6 Dec 2022 19:29:49 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B5C220040;
 Tue,  6 Dec 2022 19:29:49 +0000 (GMT)
Received: from heavy (unknown [9.171.86.248])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Dec 2022 19:29:48 +0000 (GMT)
Date: Tue, 6 Dec 2022 20:29:47 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
Message-ID: <20221206192947.fi6c3ftrueuiqmch@heavy>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202065200.224537-3-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qPwETQfgpdJgDGSXwkCOdcp4eKZeafV6
X-Proofpoint-ORIG-GUID: MGPoX6OpzNBBY26Oiei_T8AKPHjk0-L2
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212060158
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 01, 2022 at 10:51:49PM -0800, Richard Henderson wrote:
> This reverts 829e1376d940 ("tcg/s390: Introduce TCG_REG_TB"), and
> several follow-up patches.  The primary motivation is to reduce the
> less-tested code paths, pre-z10.  Secondarily, this allows the
> unconditional use of TCG_TARGET_HAS_direct_jump, which might be more
> important for performance than any slight increase in code size.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.h     |   2 +-
>  tcg/s390x/tcg-target.c.inc | 176 +++++--------------------------------
>  2 files changed, 23 insertions(+), 155 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

I have a few questions/ideas for the future below.
 
> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
> index 22d70d431b..645f522058 100644
> --- a/tcg/s390x/tcg-target.h
> +++ b/tcg/s390x/tcg-target.h
> @@ -103,7 +103,7 @@ extern uint64_t s390_facilities[3];
>  #define TCG_TARGET_HAS_mulsh_i32      0
>  #define TCG_TARGET_HAS_extrl_i64_i32  0
>  #define TCG_TARGET_HAS_extrh_i64_i32  0
> -#define TCG_TARGET_HAS_direct_jump    HAVE_FACILITY(GEN_INST_EXT)
> +#define TCG_TARGET_HAS_direct_jump    1

This change doesn't seem to affect that, but what is the minimum
supported s390x qemu host? z900?

>  #define TCG_TARGET_HAS_qemu_st8_i32   0
>  
>  #define TCG_TARGET_HAS_div2_i64       1
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index cb00bb6999..8a4bec0a28 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -65,12 +65,6 @@
>  /* A scratch register that may be be used throughout the backend.  */
>  #define TCG_TMP0        TCG_REG_R1
>  
> -/* A scratch register that holds a pointer to the beginning of the TB.
> -   We don't need this when we have pc-relative loads with the general
> -   instructions extension facility.  */
> -#define TCG_REG_TB      TCG_REG_R12
> -#define USE_REG_TB      (!HAVE_FACILITY(GEN_INST_EXT))
> -
>  #ifndef CONFIG_SOFTMMU
>  #define TCG_GUEST_BASE_REG TCG_REG_R13
>  #endif
> @@ -813,8 +807,8 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
>  }
>  
>  /* load a register with an immediate value */
> -static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
> -                             tcg_target_long sval, bool in_prologue)
> +static void tcg_out_movi(TCGContext *s, TCGType type,
> +                         TCGReg ret, tcg_target_long sval)
>  {
>      tcg_target_ulong uval;
>  
> @@ -853,14 +847,6 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>              tcg_out_insn(s, RIL, LARL, ret, off);
>              return;
>          }
> -    } else if (USE_REG_TB && !in_prologue) {
> -        ptrdiff_t off = tcg_tbrel_diff(s, (void *)sval);
> -        if (off == sextract64(off, 0, 20)) {
> -            /* This is certain to be an address within TB, and therefore
> -               OFF will be negative; don't try RX_LA.  */
> -            tcg_out_insn(s, RXY, LAY, ret, TCG_REG_TB, TCG_REG_NONE, off);
> -            return;
> -        }
>      }
>  
>      /* A 32-bit unsigned value can be loaded in 2 insns.  And given
> @@ -876,10 +862,6 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>      if (HAVE_FACILITY(GEN_INST_EXT)) {
>          tcg_out_insn(s, RIL, LGRL, ret, 0);
>          new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
> -    } else if (USE_REG_TB && !in_prologue) {
> -        tcg_out_insn(s, RXY, LG, ret, TCG_REG_TB, TCG_REG_NONE, 0);
> -        new_pool_label(s, sval, R_390_20, s->code_ptr - 2,
> -                       tcg_tbrel_diff(s, NULL));
>      } else {
>          TCGReg base = ret ? ret : TCG_TMP0;
>          tcg_out_insn(s, RIL, LARL, base, 0);
> @@ -888,12 +870,6 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>      }
>  }

I did some benchmarking of various ways to load constants in context of
GCC in the past, and it turned out that LLIHF+OILF is more efficient
than literal pool [1].

> -static void tcg_out_movi(TCGContext *s, TCGType type,
> -                         TCGReg ret, tcg_target_long sval)
> -{
> -    tcg_out_movi_int(s, type, ret, sval, false);
> -}
> -
>  /* Emit a load/store type instruction.  Inputs are:
>     DATA:     The register to be loaded or stored.
>     BASE+OFS: The effective address.
> @@ -1020,35 +996,6 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
>      return false;
>  }
>  
> -/* load data from an absolute host address */
> -static void tcg_out_ld_abs(TCGContext *s, TCGType type,
> -                           TCGReg dest, const void *abs)
> -{
> -    intptr_t addr = (intptr_t)abs;
> -
> -    if (HAVE_FACILITY(GEN_INST_EXT) && !(addr & 1)) {
> -        ptrdiff_t disp = tcg_pcrel_diff(s, abs) >> 1;
> -        if (disp == (int32_t)disp) {
> -            if (type == TCG_TYPE_I32) {
> -                tcg_out_insn(s, RIL, LRL, dest, disp);
> -            } else {
> -                tcg_out_insn(s, RIL, LGRL, dest, disp);
> -            }
> -            return;
> -        }
> -    }
> -    if (USE_REG_TB) {
> -        ptrdiff_t disp = tcg_tbrel_diff(s, abs);
> -        if (disp == sextract64(disp, 0, 20)) {
> -            tcg_out_ld(s, type, dest, TCG_REG_TB, disp);
> -            return;
> -        }
> -    }
> -
> -    tcg_out_movi(s, TCG_TYPE_PTR, dest, addr & ~0xffff);
> -    tcg_out_ld(s, type, dest, dest, addr & 0xffff);
> -}
> -
>  static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
>                                   int msb, int lsb, int ofs, int z)
>  {
> @@ -1243,17 +1190,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
>          return;
>      }
>  
> -    /* Use the constant pool if USE_REG_TB, but not for small constants.  */
> -    if (USE_REG_TB) {
> -        if (!maybe_out_small_movi(s, type, TCG_TMP0, val)) {
> -            tcg_out_insn(s, RXY, NG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
> -            new_pool_label(s, val & valid, R_390_20, s->code_ptr - 2,
> -                           tcg_tbrel_diff(s, NULL));
> -            return;
> -        }
> -    } else {
> -        tcg_out_movi(s, type, TCG_TMP0, val);
> -    }
> +    tcg_out_movi(s, type, TCG_TMP0, val);
>      if (type == TCG_TYPE_I32) {
>          tcg_out_insn(s, RR, NR, dest, TCG_TMP0);
>      } else {
> @@ -1297,24 +1234,11 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
>          }
>      }
>  
> -    /* Use the constant pool if USE_REG_TB, but not for small constants.  */
> -    if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
> -        if (type == TCG_TYPE_I32) {
> -            tcg_out_insn(s, RR, OR, dest, TCG_TMP0);
> -        } else {
> -            tcg_out_insn(s, RRE, OGR, dest, TCG_TMP0);
> -        }
> -    } else if (USE_REG_TB) {
> -        tcg_out_insn(s, RXY, OG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
> -        new_pool_label(s, val, R_390_20, s->code_ptr - 2,
> -                       tcg_tbrel_diff(s, NULL));
> +    tcg_out_movi(s, type, TCG_TMP0, val);
> +    if (type == TCG_TYPE_I32) {
> +        tcg_out_insn(s, RR, OR, dest, TCG_TMP0);
>      } else {
> -        /* Perform the OR via sequential modifications to the high and
> -           low parts.  Do this via recursion to handle 16-bit vs 32-bit
> -           masks in each half.  */
> -        tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
> -        tgen_ori(s, type, dest, val & 0x00000000ffffffffull);
> -        tgen_ori(s, type, dest, val & 0xffffffff00000000ull);
> +        tcg_out_insn(s, RRE, OGR, dest, TCG_TMP0);
>      }
>  }
>  
> @@ -1332,26 +1256,11 @@ static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
>          }
>      }
>  
> -    /* Use the constant pool if USE_REG_TB, but not for small constants.  */
> -    if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
> -        if (type == TCG_TYPE_I32) {
> -            tcg_out_insn(s, RR, XR, dest, TCG_TMP0);
> -        } else {
> -            tcg_out_insn(s, RRE, XGR, dest, TCG_TMP0);
> -        }
> -    } else if (USE_REG_TB) {
> -        tcg_out_insn(s, RXY, XG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
> -        new_pool_label(s, val, R_390_20, s->code_ptr - 2,
> -                       tcg_tbrel_diff(s, NULL));
> +    tcg_out_movi(s, type, TCG_TMP0, val);
> +    if (type == TCG_TYPE_I32) {
> +        tcg_out_insn(s, RR, XR, dest, TCG_TMP0);
>      } else {
> -        /* Perform the xor by parts.  */
> -        tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
> -        if (val & 0xffffffff) {
> -            tcg_out_insn(s, RIL, XILF, dest, val);
> -        }
> -        if (val > 0xffffffff) {
> -            tcg_out_insn(s, RIL, XIHF, dest, val >> 32);
> -        }
> +        tcg_out_insn(s, RRE, XGR, dest, TCG_TMP0);
>      }
>  }

Wouldn't it be worth keeping XILF/XIFH here?
I don't have any numbers right now, but it looks more compact/efficient
than a load + XGR.
Same for OGR above; I even wonder if both implementations could be
unified.

> @@ -1395,19 +1304,6 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
>          if (maybe_out_small_movi(s, type, TCG_TMP0, c2)) {
>              c2 = TCG_TMP0;
>              /* fall through to reg-reg */
> -        } else if (USE_REG_TB) {
> -            if (type == TCG_TYPE_I32) {
> -                op = (is_unsigned ? RXY_CLY : RXY_CY);
> -                tcg_out_insn_RXY(s, op, r1, TCG_REG_TB, TCG_REG_NONE, 0);
> -                new_pool_label(s, (uint32_t)c2, R_390_20, s->code_ptr - 2,
> -                               4 - tcg_tbrel_diff(s, NULL));
> -            } else {
> -                op = (is_unsigned ? RXY_CLG : RXY_CG);
> -                tcg_out_insn_RXY(s, op, r1, TCG_REG_TB, TCG_REG_NONE, 0);
> -                new_pool_label(s, c2, R_390_20, s->code_ptr - 2,
> -                               tcg_tbrel_diff(s, NULL));
> -            }
> -            goto exit;
>          } else {
>              if (type == TCG_TYPE_I32) {
>                  op = (is_unsigned ? RIL_CLRL : RIL_CRL);
> @@ -2101,43 +1997,22 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>  
>      case INDEX_op_goto_tb:
>          a0 = args[0];
> -        if (s->tb_jmp_insn_offset) {
> -            /*
> -             * branch displacement must be aligned for atomic patching;
> -             * see if we need to add extra nop before branch
> -             */
> -            if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
> -                tcg_out16(s, NOP);
> -            }
> -            tcg_debug_assert(!USE_REG_TB);
> -            tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
> -            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
> -            s->code_ptr += 2;
> -        } else {
> -            /* load address stored at s->tb_jmp_target_addr + a0 */
> -            tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_REG_TB,
> -                           tcg_splitwx_to_rx(s->tb_jmp_target_addr + a0));
> -            /* and go there */
> -            tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_REG_TB);
> +        tcg_debug_assert(s->tb_jmp_insn_offset);
> +        /*
> +         * branch displacement must be aligned for atomic patching;
> +         * see if we need to add extra nop before branch
> +         */
> +        if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
> +            tcg_out16(s, NOP);
>          }
> +        tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
> +        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
> +        tcg_out32(s, 0);
>          set_jmp_reset_offset(s, a0);

This seems to work in practice, but I don't think patching branch
offsets is allowed by PoP (in a multi-threaded environment). For
example, I had to do [2] in order to work around this limitation in
ftrace.

> -
> -        /* For the unlinked path of goto_tb, we need to reset
> -           TCG_REG_TB to the beginning of this TB.  */
> -        if (USE_REG_TB) {
> -            int ofs = -tcg_current_code_size(s);
> -            /* All TB are restricted to 64KiB by unwind info. */
> -            tcg_debug_assert(ofs == sextract64(ofs, 0, 20));
> -            tcg_out_insn(s, RXY, LAY, TCG_REG_TB,
> -                         TCG_REG_TB, TCG_REG_NONE, ofs);
> -        }
>          break;
>  
>      case INDEX_op_goto_ptr:
>          a0 = args[0];
> -        if (USE_REG_TB) {
> -            tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
> -        }
>          tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, a0);
>          break;
>  
> @@ -3405,9 +3280,6 @@ static void tcg_target_init(TCGContext *s)
>      /* XXX many insns can't be used with R0, so we better avoid it for now */
>      tcg_regset_set_reg(s->reserved_regs, TCG_REG_R0);
>      tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
> -    if (USE_REG_TB) {
> -        tcg_regset_set_reg(s->reserved_regs, TCG_REG_TB);
> -    }
>  }

A third benefit seems to be that we now have one more register to
allocate.

>  
>  #define FRAME_SIZE  ((int)(TCG_TARGET_CALL_STACK_OFFSET          \
> @@ -3428,16 +3300,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
>  
>  #ifndef CONFIG_SOFTMMU
>      if (guest_base >= 0x80000) {
> -        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base, true);
> +        tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
>          tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
>      }
>  #endif
>  
>      tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
> -    if (USE_REG_TB) {
> -        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB,
> -                    tcg_target_call_iarg_regs[1]);
> -    }
>  
>      /* br %r3 (go to TB) */
>      tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, tcg_target_call_iarg_regs[1]);
> -- 
> 2.34.1

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=9776b4653bc4f8b568ea49fea4a7d7460e58b68a
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=de5012b41e5c900a8a3875c7a825394c5f624c05

