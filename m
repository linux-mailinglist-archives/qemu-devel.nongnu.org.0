Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6830EA77
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:54:22 +0100 (CET)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Umj-0001Vy-SR
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ts2-0008QX-Le
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:55:47 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Trr-0006gq-HH
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:55:43 -0500
Received: by mail-pg1-x534.google.com with SMTP id o7so1065897pgl.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbzdCRnUzVvHAlHdm0W/U/kL5Ps02KKsV67u0VtR3Rc=;
 b=ggDMgUJCODLaNK20KTZ1hBgRwL0Bo2KBembs38je25CjqPME7osnBWSquewY0Sitil
 BTniQOkI3vG98OVhlMyPNYv0yjX/EFr+JqxrKd3pAepgkbymMtfvXmR6FGT/kJ28Xthe
 q9htpFJ+NI/fJSWAamzRjrJNOszAoBZnsh4TPScxb1c9/rn1ECIyL2RgYEXk/vwqP+YC
 UORsrQYNPuy5SdSBn0glhNlIb8iNDBWFJ4tILkm425nCGKwr0gG7q7i9zWsAFV+1BdZO
 yYrjOVtaJzSy1xRgejF+ap7CLGsvKWe1cCW5tDmor1y9amplnMXlpQitNo62klLD3seA
 DINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbzdCRnUzVvHAlHdm0W/U/kL5Ps02KKsV67u0VtR3Rc=;
 b=EZ6GlL/DHNznnuNNCTtuxKCvHFFn4kxaamNLsnS3ndHcLuOVai8ijYQ1qNrcdXC8AW
 sidCs/1VCDAbqTPC9JgTt/H9Zk3rGNLEzuwAZamU6htaQZOVqK5nHguNnus6y867A1Rs
 a2OCZGdmypeo/TLQBTcci9V6XTamJ/EKn221MCcTfewdaldkTnduR/maoNridP404UIv
 uUIpWbl3R3XAvnjIdrQLLm1UIqOXE2w+WOpcqdsiQWfMDV+kFVrbzKDfRytZzXFajc2H
 UoTeWm8J5Mjc77is6WYDmY1cbAui2K2JrI9xILyg1mt0V5WgL4JzZ5js6arMcI8S+ne7
 F42g==
X-Gm-Message-State: AOAM532YkrVNx0Q9i6OAYr75BFxrWA5B77wCxmso8XYTyxJHq/zYu5aP
 PVkPz0ko4xOvca+ANmihVeWTqZS8JekE3QS+
X-Google-Smtp-Source: ABdhPJz0K0WnITWcILJPC9VSlv101CL6uvJAjywx2q8ogXf+NQGBg+eaxD16s/XlFEuAD7kQRLUOFQ==
X-Received: by 2002:a63:ab4f:: with SMTP id k15mr6134100pgp.280.1612403732956; 
 Wed, 03 Feb 2021 17:55:32 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id j4sm3538230pfa.131.2021.02.03.17.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:55:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 82/93] tcg/tci: Split out tcg_out_op_r[iI]
Date: Wed,  3 Feb 2021 15:55:29 -1000
Message-Id: <20210204015529.885398-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 50 ++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e4a5872b2a..c2d2bd24d7 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -324,6 +324,31 @@ static void tcg_out_op_np(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_ri(TCGContext *s, TCGOpcode op, TCGReg r0, int32_t i1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out32(s, i1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
+#if TCG_TARGET_REG_BITS == 64
+static void tcg_out_op_rI(TCGContext *s, TCGOpcode op,
+                          TCGReg r0, uint64_t i1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out64(s, i1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+#endif
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -550,25 +575,20 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg t0, tcg_target_long arg)
+                         TCGReg ret, tcg_target_long arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-    uint32_t arg32 = arg;
-    if (type == TCG_TYPE_I32 || arg == arg32) {
-        tcg_out_op_t(s, INDEX_op_tci_movi_i32);
-        tcg_out_r(s, t0);
-        tcg_out32(s, arg32);
-    } else {
-        tcg_debug_assert(type == TCG_TYPE_I64);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_ri(s, INDEX_op_tci_movi_i32, ret, arg);
+        break;
 #if TCG_TARGET_REG_BITS == 64
-        tcg_out_op_t(s, INDEX_op_tci_movi_i64);
-        tcg_out_r(s, t0);
-        tcg_out64(s, arg);
-#else
-        TODO();
+    case TCG_TYPE_I64:
+        tcg_out_op_rI(s, INDEX_op_tci_movi_i64, ret, arg);
+        break;
 #endif
+    default:
+        g_assert_not_reached();
     }
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
-- 
2.25.1


