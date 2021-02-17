Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB931E110
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:10:18 +0100 (CET)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU5R-0005qd-39
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMn-0001nY-N5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:09 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMm-0007id-3J
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:09 -0500
Received: by mail-pl1-x631.google.com with SMTP id a24so8021820plm.11
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbzdCRnUzVvHAlHdm0W/U/kL5Ps02KKsV67u0VtR3Rc=;
 b=ER/NplcnuZ/Yrth49dhkpkbWSVRyZZF0DnQg5xki9M77awBu1/OeVjdiPg67QwZdBl
 eI9HYY3PQDLmIUSKVl3FJHxre6UWWaYxQnvFARTN/J0rht87OPC64mUbzYJIMyYfOVHn
 UzfTPDEWA5nucUT7OHdqKpBs1acV1PVriNt9BZu4TZkx/22uaqJHmDnpv6SYsQiKf6q2
 FXpQPJ9VPmpa6cNXtePQsu6v4H9GCAbVwmN24nTOiTmgYmv2hczECCImBQBdCZRWvc7K
 3ytmZGSQrHk4sHdJ/vZHUdQBzmaucUZX0dtE3mgGV3q94bHnJAXdhJuemZXoKjEIRGSD
 LEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbzdCRnUzVvHAlHdm0W/U/kL5Ps02KKsV67u0VtR3Rc=;
 b=aTnz2e2++b8Y+g7dCx8yVoD15LMBhy6XTO9HzR+Pq7X+SA1W/ejFGJWWE8ktZU05G0
 QpJpL3R7uuvMya1VO6/nkvmaXw85MZQddiAE3f5YoMZDha4fhciN1EntBOMhXPRaBoXC
 JTHSB7M2H8yKeQFWhDWpKMKlmQCyI4+730K4QXGnDVaovdW9s4w5tls+AzD/v/TXbWkQ
 mseoCJ522RNXKHXBZWhZMHXEHnTw+5RsH/aq28ehBPflqhFoXWDoOZUILxbZPRZxrrPA
 3+uB8vOJOso0o9DRxTIMvNfc/nxwhs8v2J7Axm2CnpNnvT74/NhSZVJ2P/nKP+13mtOe
 8XBQ==
X-Gm-Message-State: AOAM533iZqtlQmyDUPf6Og3UByxyiXcwSSvovcffjf9uT/kWz1l7n/08
 /hFqimuu5j4wmNwAo8vKVTZTU/f7s+BEgw==
X-Google-Smtp-Source: ABdhPJxnI+HR5EGGyC4p+438ykL4AU4un7TK2I33TX+OI6UcoKzlOV9wO5SKBoXjUFbLXTfS/k9J4Q==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id
 d12mr566848pjw.202.1613593446909; 
 Wed, 17 Feb 2021 12:24:06 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 57/71] tcg/tci: Split out tcg_out_op_r[iI]
Date: Wed, 17 Feb 2021 12:20:22 -0800
Message-Id: <20210217202036.1724901-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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


