Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8EE20BC18
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 00:03:07 +0200 (CEST)
Received: from localhost ([::1]:59122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jowR7-0008BH-Sa
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 18:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439617756=alistair.francis@wdc.com>)
 id 1jowID-00038z-EW
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:53:53 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439617756=alistair.francis@wdc.com>)
 id 1jowI9-00030Y-Vz
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593208432; x=1624744432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z+jiY5tNM+yGB2s0F5VKiar/IcWYdygE9umtmX1lsZw=;
 b=a/qDkSC64+p4hxgt5Divs89Y3ret506q8Prw8y/GtIlegur+QTB4humY
 dXycVSJOcVNz/waLkUIkhgWNFjgJg0dq0Ec1wkt4O62TGhXshcQQepnBX
 JFILBMGy8zCMXW+vPMZdkJA9Rm27ZB8+yJY4xe5hfdY2zAFtMAOPzGAWp
 IZDAz35FwfoxSoS5uYZF4QDpNPDOLecaXeerxUgT0e3F0+r2RaxGrs5e+
 l0Ch5kGA7az7N5yqdiFdMphsfVTzNoiTHTukR0kZ01gNngBm90gjbyuFM
 Z+K4N3MOiv7C+AbFTYHNRaqbHIn9UvrpCxc+HYttKnxH1OQrYJaATM7dp g==;
IronPort-SDR: ukokV9l1ta/7ZdKhKf7yXMLu1CSDITW2A9AtZuMz0vQNCyGjf4gjUBxqy8Vj9aFlxTdl5807mU
 O7ywbseoz0ivXLC9soS/W06WlEEs8PzFdZs/N6wmgBp3kqzC0JSwp+6S+4jrFFCzzHBFAnjPvG
 y0UKKcghF7NOeKlt3jR9+36arJIdCGCum2PhSROGLmBVNN6MjEiG8sDDgpKK8u6hvYuZKEtsKf
 jklHsPMt7w2EQ7wJP9CGbbzJcI2s1MNM5qowy6lTWBuKL95ZzT/bDk871wCyoX8FHcFJJ7LjeU
 OQU=
X-IronPort-AV: E=Sophos;i="5.75,285,1589212800"; d="scan'208";a="244048393"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2020 05:53:46 +0800
IronPort-SDR: lV8H1JGzeOBDIkrcoKqirikzHkoR8gd2sYdferC0LVm+a0gJitW65CunjdElqmKsEs79WfuOjX
 De0HFKX3GoTGt1zGXmHCz9vGtunFADRec=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 14:42:43 -0700
IronPort-SDR: h7B4RW9kLD/K8GgwGYsLJumo473tcvnkx0Z6G7fD6oNHbtRKf4GWac2kQAEm/hmvEwOkzALHSx
 W6BlA1npa9Rw==
WDCIronportException: Internal
Received: from 2hc7cg2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.58.206])
 by uls-op-cesaip01.wdc.com with ESMTP; 26 Jun 2020 14:53:45 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 37/63] target/riscv: vector widening floating-point fused
 multiply-add instructions
Date: Fri, 26 Jun 2020 14:43:44 -0700
Message-Id: <20200626214410.3613258-38-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626214410.3613258-1-alistair.francis@wdc.com>
References: <20200626214410.3613258-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=439617756=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 17:53:44
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200623215920.2594-36-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 17 +++++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 10 +++
 target/riscv/vector_helper.c            | 91 +++++++++++++++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 108a177f25..b537030a11 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -906,3 +906,20 @@ DEF_HELPER_6(vfmsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfnmsub_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfnmsub_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfnmsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
+DEF_HELPER_6(vfwmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmacc_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwnmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwnmacc_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmsac_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmsac_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwnmsac_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwnmsac_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmacc_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwmacc_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwnmacc_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwnmacc_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwmsac_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwmsac_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwnmsac_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwnmsac_vf_w, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9ca765d37f..c9d5078385 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -481,6 +481,14 @@ vfmsub_vv       101010 . ..... ..... 001 ..... 1010111 @r_vm
 vfmsub_vf       101010 . ..... ..... 101 ..... 1010111 @r_vm
 vfnmsub_vv      101011 . ..... ..... 001 ..... 1010111 @r_vm
 vfnmsub_vf      101011 . ..... ..... 101 ..... 1010111 @r_vm
+vfwmacc_vv      111100 . ..... ..... 001 ..... 1010111 @r_vm
+vfwmacc_vf      111100 . ..... ..... 101 ..... 1010111 @r_vm
+vfwnmacc_vv     111101 . ..... ..... 001 ..... 1010111 @r_vm
+vfwnmacc_vf     111101 . ..... ..... 101 ..... 1010111 @r_vm
+vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
+vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
+vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
+vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index ee601fd790..3a5fd0cf89 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2079,3 +2079,13 @@ GEN_OPFVF_TRANS(vfmadd_vf, opfvf_check)
 GEN_OPFVF_TRANS(vfnmadd_vf, opfvf_check)
 GEN_OPFVF_TRANS(vfmsub_vf, opfvf_check)
 GEN_OPFVF_TRANS(vfnmsub_vf, opfvf_check)
+
+/* Vector Widening Floating-Point Fused Multiply-Add Instructions */
+GEN_OPFVV_WIDEN_TRANS(vfwmacc_vv, opfvv_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwnmacc_vv, opfvv_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwmsac_vv, opfvv_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwnmsac_vv, opfvv_widen_check)
+GEN_OPFVF_WIDEN_TRANS(vfwmacc_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwnmacc_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwmsac_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1173964efd..27d5b3837f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3683,3 +3683,94 @@ RVVCALL(OPFVF3, vfnmsub_vf_d, OP_UUU_D, H8, H8, fnmsub64)
 GEN_VEXT_VF(vfnmsub_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfnmsub_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfnmsub_vf_d, 8, 8, clearq)
+
+/* Vector Widening Floating-Point Fused Multiply-Add Instructions */
+static uint32_t fwmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
+{
+    return float32_muladd(float16_to_float32(a, true, s),
+                        float16_to_float32(b, true, s), d, 0, s);
+}
+
+static uint64_t fwmacc32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
+{
+    return float64_muladd(float32_to_float64(a, s),
+                        float32_to_float64(b, s), d, 0, s);
+}
+
+RVVCALL(OPFVV3, vfwmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwmacc16)
+RVVCALL(OPFVV3, vfwmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwmacc32)
+GEN_VEXT_VV_ENV(vfwmacc_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwmacc_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF3, vfwmacc_vf_h, WOP_UUU_H, H4, H2, fwmacc16)
+RVVCALL(OPFVF3, vfwmacc_vf_w, WOP_UUU_W, H8, H4, fwmacc32)
+GEN_VEXT_VF(vfwmacc_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwmacc_vf_w, 4, 8, clearq)
+
+static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
+{
+    return float32_muladd(float16_to_float32(a, true, s),
+                        float16_to_float32(b, true, s), d,
+                        float_muladd_negate_c | float_muladd_negate_product, s);
+}
+
+static uint64_t fwnmacc32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
+{
+    return float64_muladd(float32_to_float64(a, s),
+                        float32_to_float64(b, s), d,
+                        float_muladd_negate_c | float_muladd_negate_product, s);
+}
+
+RVVCALL(OPFVV3, vfwnmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwnmacc16)
+RVVCALL(OPFVV3, vfwnmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwnmacc32)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF3, vfwnmacc_vf_h, WOP_UUU_H, H4, H2, fwnmacc16)
+RVVCALL(OPFVF3, vfwnmacc_vf_w, WOP_UUU_W, H8, H4, fwnmacc32)
+GEN_VEXT_VF(vfwnmacc_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwnmacc_vf_w, 4, 8, clearq)
+
+static uint32_t fwmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
+{
+    return float32_muladd(float16_to_float32(a, true, s),
+                        float16_to_float32(b, true, s), d,
+                        float_muladd_negate_c, s);
+}
+
+static uint64_t fwmsac32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
+{
+    return float64_muladd(float32_to_float64(a, s),
+                        float32_to_float64(b, s), d,
+                        float_muladd_negate_c, s);
+}
+
+RVVCALL(OPFVV3, vfwmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwmsac16)
+RVVCALL(OPFVV3, vfwmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwmsac32)
+GEN_VEXT_VV_ENV(vfwmsac_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwmsac_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF3, vfwmsac_vf_h, WOP_UUU_H, H4, H2, fwmsac16)
+RVVCALL(OPFVF3, vfwmsac_vf_w, WOP_UUU_W, H8, H4, fwmsac32)
+GEN_VEXT_VF(vfwmsac_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwmsac_vf_w, 4, 8, clearq)
+
+static uint32_t fwnmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
+{
+    return float32_muladd(float16_to_float32(a, true, s),
+                        float16_to_float32(b, true, s), d,
+                        float_muladd_negate_product, s);
+}
+
+static uint64_t fwnmsac32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
+{
+    return float64_muladd(float32_to_float64(a, s),
+                        float32_to_float64(b, s), d,
+                        float_muladd_negate_product, s);
+}
+
+RVVCALL(OPFVV3, vfwnmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwnmsac16)
+RVVCALL(OPFVV3, vfwnmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwnmsac32)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF3, vfwnmsac_vf_h, WOP_UUU_H, H4, H2, fwnmsac16)
+RVVCALL(OPFVF3, vfwnmsac_vf_w, WOP_UUU_W, H8, H4, fwnmsac32)
+GEN_VEXT_VF(vfwnmsac_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwnmsac_vf_w, 4, 8, clearq)
-- 
2.27.0


