Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7311337681
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:08:44 +0100 (CET)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMvb-000243-LX
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVQ-0004Al-R0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:40 -0500
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:43738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVJ-0006t6-69
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:40 -0500
Received: by mail-qv1-xf32.google.com with SMTP id cx5so2635934qvb.10
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbzdCRnUzVvHAlHdm0W/U/kL5Ps02KKsV67u0VtR3Rc=;
 b=MbDoHyKywnkrny7gIeizhJcUFLPTU7M+NjrizR8mmwdnzPiQ9Qqe0Occr9uvtTfzX1
 fE3OTHsfPWJNf/aurk1EGF1sJzj105EOZr0RGXamU/tLJNOh9blRGpX86YpIHT6HNuk/
 EKi9ALDWIRBfidekbNV5V/SyVb8Qzv7qhYTgym7wM20mZqdxqxBXVxMljpC3b/gk/hso
 J4pjhLEApD9Ng96CW7KIfs9iM/ZAH5A6dnQMjpFooLrkt3kUSRXgSInUzoP+B6W3KGni
 ThUe0MLChLzPe6VWv6WYlkSUpt4oeMXt2E0MXkf4sO78qr4FK5uOobne0mxbhszYkBhj
 kMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbzdCRnUzVvHAlHdm0W/U/kL5Ps02KKsV67u0VtR3Rc=;
 b=X8QrpUSO8/lYFfcDNVet+fU56VRsskN5GDE/caTchWB3w4G7ckmTAzdX64Lm/dijk1
 h+nB4doifJQxWrROwhKDEykDFUN7w8YaHtMSVKdCs4tfzLFiJ6DQyOw7lLN+PEPr864+
 eLi9diHH+PJFaSBzLK5u7IAIgWtx1yryBlaaPxO4JlchwGerpy0HRKd72azDMaZMsRtm
 4DZAvAwPank8tzpxUnqXIl/oGyuGL37hkX3gnq9rcytPvkvWV7IhCpgnVOUdHc3T7/36
 Kosd+efDuDM56TVJzRfZW8qhKkK+6agAMdXpy1LTEHPI7u2oZnYsvjPPPULLt/E++PPY
 WNKA==
X-Gm-Message-State: AOAM530HjU5lQ2CiUO6EJspkOGzBGRFMLkYDivmd9YAtAOtw4YlwxjZF
 1ggvdRDJsnBW+RHXdFdktRwNd1fa/rc4S6Dv
X-Google-Smtp-Source: ABdhPJzXlhxozbZhniYQY1yS5dMbN1tzqb/y61RmYAVFdEUye3yypWDJ8vCKU73kSRVXcrdRcRF9HQ==
X-Received: by 2002:a0c:a954:: with SMTP id z20mr7764107qva.29.1615473687796; 
 Thu, 11 Mar 2021 06:41:27 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 42/57] tcg/tci: Split out tcg_out_op_r[iI]
Date: Thu, 11 Mar 2021 08:39:43 -0600
Message-Id: <20210311143958.562625-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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


