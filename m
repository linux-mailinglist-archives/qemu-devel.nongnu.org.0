Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B410619815B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 18:36:41 +0200 (CEST)
Received: from localhost ([::1]:52698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIxOy-0003CW-Pg
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 12:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIxNo-0001q4-3L
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:35:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIxNm-00067G-Eu
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:35:28 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:38941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jIxNl-0005ye-L7; Mon, 30 Mar 2020 12:35:26 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436283|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.144939-0.000344041-0.854717;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03296; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H7kpwIv_1585586117; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H7kpwIv_1585586117)
 by smtp.aliyun-inc.com(10.147.41.143);
 Tue, 31 Mar 2020 00:35:18 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v7 29/61] target/riscv: vector narrowing fixed-point clip
 instructions
Date: Mon, 30 Mar 2020 23:36:01 +0800
Message-Id: <20200330153633.15298-30-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
References: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: guoren@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  13 +++
 target/riscv/insn32.decode              |   6 +
 target/riscv/insn_trans/trans_rvv.inc.c |   8 ++
 target/riscv/vector_helper.c            | 141 ++++++++++++++++++++++++
 4 files changed, 168 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f36f840714..7f7fdcb451 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -784,3 +784,16 @@ DEF_HELPER_6(vssra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vssra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vnclip_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclip_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclip_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclipu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnclip_vx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2ecac3d96d..8b898f9bad 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -437,6 +437,12 @@ vssrl_vi        101010 . ..... ..... 011 ..... 1010111 @r_vm
 vssra_vv        101011 . ..... ..... 000 ..... 1010111 @r_vm
 vssra_vx        101011 . ..... ..... 100 ..... 1010111 @r_vm
 vssra_vi        101011 . ..... ..... 011 ..... 1010111 @r_vm
+vnclipu_vv      101110 . ..... ..... 000 ..... 1010111 @r_vm
+vnclipu_vx      101110 . ..... ..... 100 ..... 1010111 @r_vm
+vnclipu_vi      101110 . ..... ..... 011 ..... 1010111 @r_vm
+vnclip_vv       101111 . ..... ..... 000 ..... 1010111 @r_vm
+vnclip_vx       101111 . ..... ..... 100 ..... 1010111 @r_vm
+vnclip_vi       101111 . ..... ..... 011 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index d5aaf18a07..d03ec2688f 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1799,3 +1799,11 @@ GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
 GEN_OPIVI_TRANS(vssrl_vi, 1, vssrl_vx, opivx_check)
 GEN_OPIVI_TRANS(vssra_vi, 0, vssra_vx, opivx_check)
+
+/* Vector Narrowing Fixed-Point Clip Instructions */
+GEN_OPIVV_NARROW_TRANS(vnclipu_vv)
+GEN_OPIVV_NARROW_TRANS(vnclip_vv)
+GEN_OPIVX_NARROW_TRANS(vnclipu_vx)
+GEN_OPIVX_NARROW_TRANS(vnclip_vx)
+GEN_OPIVI_NARROW_TRANS(vnclipu_vi, 1, vnclipu_vx)
+GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 00ee42ea83..502656d005 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -874,6 +874,12 @@ GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
 #define WOP_SSU_B int16_t, int8_t, uint8_t, int16_t, uint16_t
 #define WOP_SSU_H int32_t, int16_t, uint16_t, int32_t, uint32_t
 #define WOP_SSU_W int64_t, int32_t, uint32_t, int64_t, uint64_t
+#define NOP_SSS_B int8_t, int8_t, int16_t, int8_t, int16_t
+#define NOP_SSS_H int16_t, int16_t, int32_t, int16_t, int32_t
+#define NOP_SSS_W int32_t, int32_t, int64_t, int32_t, int64_t
+#define NOP_UUU_B uint8_t, uint8_t, uint16_t, uint8_t, uint16_t
+#define NOP_UUU_H uint16_t, uint16_t, uint32_t, uint16_t, uint32_t
+#define NOP_UUU_W uint32_t, uint32_t, uint64_t, uint32_t, uint64_t
 
 /* operation of two vector elements */
 typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
@@ -3008,6 +3014,7 @@ vssra64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
     res   = (a >> shift)  + round;
     return res;
 }
+
 RVVCALL(OPIVV2_RM, vssra_vv_b, OP_SSS_B, H1, H1, H1, vssra8)
 RVVCALL(OPIVV2_RM, vssra_vv_h, OP_SSS_H, H2, H2, H2, vssra16)
 RVVCALL(OPIVV2_RM, vssra_vv_w, OP_SSS_W, H4, H4, H4, vssra32)
@@ -3025,3 +3032,137 @@ GEN_VEXT_VX_RM(vssra_vx_b, 1, 1, clearb)
 GEN_VEXT_VX_RM(vssra_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vssra_vx_w, 4, 4, clearl)
 GEN_VEXT_VX_RM(vssra_vx_d, 8, 8, clearq)
+
+/* Vector Narrowing Fixed-Point Clip Instructions */
+static inline int8_t
+vnclip8(CPURISCVState *env, int vxrm, int16_t a, int8_t b)
+{
+    uint8_t round, shift = b & 0xf;
+    int16_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > INT8_MAX) {
+        env->vxsat = 0x1;
+        return INT8_MAX;
+    } else if (res < INT8_MIN) {
+        env->vxsat = 0x1;
+        return INT8_MIN;
+    } else {
+        return res;
+    }
+}
+
+static inline int16_t
+vnclip16(CPURISCVState *env, int vxrm, int32_t a, int16_t b)
+{
+    uint8_t round, shift = b & 0x1f;
+    int32_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > INT16_MAX) {
+        env->vxsat = 0x1;
+        return INT16_MAX;
+    } else if (res < INT16_MIN) {
+        env->vxsat = 0x1;
+        return INT16_MIN;
+    } else {
+        return res;
+    }
+}
+
+static inline int32_t
+vnclip32(CPURISCVState *env, int vxrm, int64_t a, int32_t b)
+{
+    uint8_t round, shift = b & 0x3f;
+    int64_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > INT32_MAX) {
+        env->vxsat = 0x1;
+        return INT32_MAX;
+    } else if (res < INT32_MIN) {
+        env->vxsat = 0x1;
+        return INT32_MIN;
+    } else {
+        return res;
+    }
+}
+
+RVVCALL(OPIVV2_RM, vnclip_vv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
+RVVCALL(OPIVV2_RM, vnclip_vv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
+RVVCALL(OPIVV2_RM, vnclip_vv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
+GEN_VEXT_VV_RM(vnclip_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vnclip_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vnclip_vv_w, 4, 4, clearl)
+
+RVVCALL(OPIVX2_RM, vnclip_vx_b, NOP_SSS_B, H1, H2, vnclip8)
+RVVCALL(OPIVX2_RM, vnclip_vx_h, NOP_SSS_H, H2, H4, vnclip16)
+RVVCALL(OPIVX2_RM, vnclip_vx_w, NOP_SSS_W, H4, H8, vnclip32)
+GEN_VEXT_VX_RM(vnclip_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vnclip_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vnclip_vx_w, 4, 4, clearl)
+
+static inline uint8_t
+vnclipu8(CPURISCVState *env, int vxrm, uint16_t a, uint8_t b)
+{
+    uint8_t round, shift = b & 0xf;
+    uint16_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > UINT8_MAX) {
+        env->vxsat = 0x1;
+        return UINT8_MAX;
+    } else {
+        return res;
+    }
+}
+
+static inline uint16_t
+vnclipu16(CPURISCVState *env, int vxrm, uint32_t a, uint16_t b)
+{
+    uint8_t round, shift = b & 0x1f;
+    uint32_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > UINT16_MAX) {
+        env->vxsat = 0x1;
+        return UINT16_MAX;
+    } else {
+        return res;
+    }
+}
+
+static inline uint32_t
+vnclipu32(CPURISCVState *env, int vxrm, uint64_t a, uint32_t b)
+{
+    uint8_t round, shift = b & 0x3f;
+    int64_t res;
+
+    round = get_round(vxrm, a, shift);
+    res   = (a >> shift)  + round;
+    if (res > UINT32_MAX) {
+        env->vxsat = 0x1;
+        return UINT32_MAX;
+    } else {
+        return res;
+    }
+}
+
+RVVCALL(OPIVV2_RM, vnclipu_vv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
+RVVCALL(OPIVV2_RM, vnclipu_vv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
+RVVCALL(OPIVV2_RM, vnclipu_vv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
+GEN_VEXT_VV_RM(vnclipu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vnclipu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vnclipu_vv_w, 4, 4, clearl)
+
+RVVCALL(OPIVX2_RM, vnclipu_vx_b, NOP_UUU_B, H1, H2, vnclipu8)
+RVVCALL(OPIVX2_RM, vnclipu_vx_h, NOP_UUU_H, H2, H4, vnclipu16)
+RVVCALL(OPIVX2_RM, vnclipu_vx_w, NOP_UUU_W, H4, H8, vnclipu32)
+GEN_VEXT_VX_RM(vnclipu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vnclipu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vnclipu_vx_w, 4, 4, clearl)
-- 
2.23.0


