Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209561F686
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:48:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os3PR-00021F-RB; Mon, 07 Nov 2022 09:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1os3PP-00020t-GL
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:47:31 -0500
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1os3PN-0001Ip-8S
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:47:31 -0500
Received: by mail-pj1-f50.google.com with SMTP id k5so10785370pjo.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 06:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QYUwq6ZCwnbW0O+ip18uCuAWBEvaGBxVSZ3K0ygtMHI=;
 b=4h49lDhYO/FOPbIkp2O54P/hbYicmL/inpGWENC3OBXyokL0zrlBGuX8PHy3lHvcha
 /WxK8Y9SZlDQOj51i+oSuCOETBS79b7oI+8Aotd6tCQfPYdkXnUepO5VQixYwRwI6f64
 0F6gle5pRoj7AAuXKkXjTxharcMOVzyHt9Kz3eNq2sSguP3k0fsivp/M1EzA7r3pqjHS
 V12//x6z6MqgbPFAZpBh0XTn7WJV6KFBF7T9K32rmkf06HpLmrLXFAqfXcYtyNDFLuHj
 jxSIhiwRjRd07rKsntcnVy/NexZhUWdI6btLkpELFggmCpZEDHha6DjX2p13m0HW/oc7
 P8vA==
X-Gm-Message-State: ACrzQf1XCj/wckhWR+EFzKZuFb/oNd4tlZL8Cg3fY7mWY1zDVH4d4k+G
 b75Dxy9FNLWwDUvyvIAWTg1iPokPOJLd1YdJ
X-Google-Smtp-Source: AMsMyM7EwUZTaleln8RHyHarD6h+8z/gABO4TFrCTkxNXN3lI5jBFv+JIh4h3k7vSyrqtLZKkk3VSw==
X-Received: by 2002:a17:902:720a:b0:181:150c:fcc4 with SMTP id
 ba10-20020a170902720a00b00181150cfcc4mr51814853plb.109.1667832447035; 
 Mon, 07 Nov 2022 06:47:27 -0800 (PST)
Received: from localhost.localdomain ([2400:8901:e002:5400::])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a17090a4d0600b002135a57029dsm4380054pjg.29.2022.11.07.06.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 06:47:26 -0800 (PST)
From: Rui Wang <wangrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>, hev <qemu@hev.cc>,
 Rui Wang <wangrui@loongson.cn>
Subject: [PATCH] tcg/loongarch64: Optimize immediate loading
Date: Mon,  7 Nov 2022 22:47:13 +0800
Message-Id: <20221107144713.845550-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.50; envelope-from=r@hev.cc;
 helo=mail-pj1-f50.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

diff:
  Imm                 Before                  After
  0000000000000000    addi.w  rd, zero, 0     ori     rd, zero, 0
                      lu52i.d rd, zero, 0
  00000000fffff800    lu12i.w rd, -1          addi.w  rd, zero, -2048
                      ori     rd, rd, 2048    lu32i.d rd, 0
                      lu32i.d rd, 0
  ...

Signed-off-by: Rui Wang <wangrui@loongson.cn>
---
 tcg/loongarch64/tcg-target.c.inc | 35 +++++++++++---------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d326e28740..7755c4ffd0 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -274,16 +274,6 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     return true;
 }
 
-static bool imm_part_needs_loading(bool high_bits_are_ones,
-                                   tcg_target_long part)
-{
-    if (high_bits_are_ones) {
-        return part != -1;
-    } else {
-        return part != 0;
-    }
-}
-
 /* Loads a 32-bit immediate into rd, sign-extended.  */
 static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
 {
@@ -291,16 +281,16 @@ static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
     tcg_target_long hi12 = sextreg(val, 12, 20);
 
     /* Single-instruction cases.  */
-    if (lo == val) {
-        /* val fits in simm12: addi.w rd, zero, val */
-        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
-        return;
-    }
-    if (0x800 <= val && val <= 0xfff) {
+    if (hi12 == 0) {
         /* val fits in uimm12: ori rd, zero, val */
         tcg_out_opc_ori(s, rd, TCG_REG_ZERO, val);
         return;
     }
+    if (hi12 == sextreg(lo, 12, 20)) {
+        /* val fits in simm12: addi.w rd, zero, val */
+        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
+        return;
+    }
 
     /* High bits must be set; load with lu12i.w + optional ori.  */
     tcg_out_opc_lu12i_w(s, rd, hi12);
@@ -334,8 +324,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
 
     intptr_t pc_offset;
     tcg_target_long val_lo, val_hi, pc_hi, offset_hi;
-    tcg_target_long hi32, hi52;
-    bool rd_high_bits_are_ones;
+    tcg_target_long hi12, hi32, hi52;
 
     /* Value fits in signed i32.  */
     if (type == TCG_TYPE_I32 || val == (int32_t)val) {
@@ -366,25 +355,25 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
         return;
     }
 
+    hi12 = sextreg(val, 12, 20);
     hi32 = sextreg(val, 32, 20);
     hi52 = sextreg(val, 52, 12);
 
     /* Single cu52i.d case.  */
-    if (ctz64(val) >= 52) {
+    if ((hi52 != 0) && (ctz64(val) >= 52)) {
         tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, hi52);
         return;
     }
 
     /* Slow path.  Initialize the low 32 bits, then concat high bits.  */
     tcg_out_movi_i32(s, rd, val);
-    rd_high_bits_are_ones = (int32_t)val < 0;
 
-    if (imm_part_needs_loading(rd_high_bits_are_ones, hi32)) {
+    /* Load hi32 and hi52 explicitly when they are unexpected values. */
+    if (hi32 != sextreg(hi12, 20, 20)) {
         tcg_out_opc_cu32i_d(s, rd, hi32);
-        rd_high_bits_are_ones = hi32 < 0;
     }
 
-    if (imm_part_needs_loading(rd_high_bits_are_ones, hi52)) {
+    if (hi52 != sextreg(hi32, 20, 12)) {
         tcg_out_opc_cu52i_d(s, rd, rd, hi52);
     }
 }
-- 
2.38.1


