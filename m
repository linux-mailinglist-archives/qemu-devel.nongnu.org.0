Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D724305B81
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 13:36:00 +0100 (CET)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4k3D-0001aV-38
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 07:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l4k29-00016Z-HM
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:34:53 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:46216
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l4k27-0007gy-7Z
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:34:53 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 1FE92DA14B2;
 Wed, 27 Jan 2021 13:34:49 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 07004460C81; Wed, 27 Jan 2021 13:34:49 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] tcg/tci: Fix some unaligned memory accesses
Date: Wed, 27 Jan 2021 13:34:46 +0100
Message-Id: <20210127123446.2037721-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
v2: Use inline functions from qemu/bswap.h instead of memcpy as suggested by Richard.

 tcg/tci.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 42354d8ebb..ddbb259e1d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -166,7 +166,11 @@ static uint64_t tci_uint64(uint32_t high, uint32_t low)
 /* Read constant (native size) from bytecode. */
 static tcg_target_ulong tci_read_i(const uint8_t **tb_ptr)
 {
-    tcg_target_ulong value = *(const tcg_target_ulong *)(*tb_ptr);
+#if TCG_TARGET_REG_BITS == 32
+    tcg_target_ulong value = ldl_he_p(*tb_ptr);
+#elif TCG_TARGET_REG_BITS == 64
+    tcg_target_ulong value = ldq_he_p(*tb_ptr);
+#endif
     *tb_ptr += sizeof(value);
     return value;
 }
@@ -174,7 +178,7 @@ static tcg_target_ulong tci_read_i(const uint8_t **tb_ptr)
 /* Read unsigned constant (32 bit) from bytecode. */
 static uint32_t tci_read_i32(const uint8_t **tb_ptr)
 {
-    uint32_t value = *(const uint32_t *)(*tb_ptr);
+    uint32_t value = ldl_he_p(*tb_ptr);
     *tb_ptr += sizeof(value);
     return value;
 }
@@ -182,7 +186,7 @@ static uint32_t tci_read_i32(const uint8_t **tb_ptr)
 /* Read signed constant (32 bit) from bytecode. */
 static int32_t tci_read_s32(const uint8_t **tb_ptr)
 {
-    int32_t value = *(const int32_t *)(*tb_ptr);
+    int32_t value = ldl_he_p(*tb_ptr);
     *tb_ptr += sizeof(value);
     return value;
 }
@@ -191,7 +195,7 @@ static int32_t tci_read_s32(const uint8_t **tb_ptr)
 /* Read constant (64 bit) from bytecode. */
 static uint64_t tci_read_i64(const uint8_t **tb_ptr)
 {
-    uint64_t value = *(const uint64_t *)(*tb_ptr);
+    uint64_t value = ldq_he_p(*tb_ptr);
     *tb_ptr += sizeof(value);
     return value;
 }
@@ -1129,7 +1133,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             /* QEMU specific operations. */
 
         case INDEX_op_exit_tb:
-            ret = *(uint64_t *)tb_ptr;
+            ret = ldq_he_p(tb_ptr);
             goto exit;
             break;
         case INDEX_op_goto_tb:
-- 
2.29.2


