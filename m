Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10113A4B97
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:05:07 +0200 (CEST)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr98-0005Uk-SN
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmv-00036Z-CQ
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:09 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqms-0002mS-9U
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:09 -0400
Received: by mail-pj1-x1035.google.com with SMTP id g4so6555273pjk.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TzNUcN4JD2JTYnUB/p6WRvyMqqqhllIV6sanl9jNAWM=;
 b=TW8EEaBnKSjAMr2mJYfc9yiD8SenEuoi/UuqdLPKWcX0J+34+tOBHNzNPsNOV+uxn0
 QvrvEc7h2W442IaC8vgZ/yXwKIfzkEpq9hICNMqQSt7X7YyGWgtvEH7g5Mf3avEkTS9Q
 Dut9fq6wX4TlkYytJPNKhCC3eO3kg5wNaDT2pJrR1i7e6Za0yPeF3ZRdpTUkHK+H82jR
 oIS/A3fqyRRbQHLB46cv6eewpLO71g5qqU/OnkkxmFMQgpGyebl3mYLICPJs8mCtT9mE
 qifbH8m/ri+o9yFRmbcKxsNAKBHMpmwKn8e3ZaqvxeQrpHGAVtofUePZHmFPbyuIfScR
 hwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TzNUcN4JD2JTYnUB/p6WRvyMqqqhllIV6sanl9jNAWM=;
 b=VzhOedsgyo2vDVxXl52LDhR/PLYUIJIDHmkh0zlEwUPBwCusbr/NctWEwgMsYl3qjz
 4u0gHOXW6htasggT0+IGU0TrBSdymB7rhO411onGIbLdrHBptn0HRmdys+x5eoCPqMn7
 GU0T6JZy7JWr+zbTLB505INV/WCD5l9HD5FRMbOqKxvK0z1TbXH4VP0M7gjZoR2jfOnv
 ErSg12AFiXsNSIuAbGdflZVnB3jYOlX2E6vVd65VYaC+T97ooWK+OCtXTfqNSaOs7n3R
 VZX9uDV0p5dOQ56n8E0WD8aW4x02P7zUH10q13HfCc2v8KYLMoDSGxborhC6L+5enowm
 sDqg==
X-Gm-Message-State: AOAM530QnHFkjH2f4q0NudLZKt2l5OUTl5cJsrJD4Mewngisj1vpArex
 jCvtgWk+TXB674V+BZFJPTAmk2ivM6b2ig==
X-Google-Smtp-Source: ABdhPJwFP9OZZN1miaEMr+ewkUTAqBeVwO9zp8EkQzGeo+DLzXWdAkMuMOeh2sLNlBtJhvBLzz9Iuw==
X-Received: by 2002:a17:903:2093:b029:117:6a8a:f7aa with SMTP id
 d19-20020a1709032093b02901176a8af7aamr6210507plc.6.1623454923724; 
 Fri, 11 Jun 2021 16:42:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:42:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/34] tcg: Introduce tcg_remove_ops_after
Date: Fri, 11 Jun 2021 16:41:40 -0700
Message-Id: <20210611234144.653682-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a function to remove everything emitted
since a given point.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 10 ++++++++++
 tcg/tcg.c         | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index e95abac9f4..1d056ed0ed 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1071,6 +1071,16 @@ void tcg_op_remove(TCGContext *s, TCGOp *op);
 TCGOp *tcg_op_insert_before(TCGContext *s, TCGOp *op, TCGOpcode opc);
 TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op, TCGOpcode opc);
 
+/**
+ * tcg_remove_ops_after:
+ * @op: target operation
+ *
+ * Discard any opcodes emitted since @op.  Expected usage is to save
+ * a starting point with tcg_last_op(), speculatively emit opcodes,
+ * then decide whether or not to keep those opcodes after the fact.
+ */
+void tcg_remove_ops_after(TCGOp *op);
+
 void tcg_optimize(TCGContext *s);
 
 /* Allocate a new temporary and initialize it with a constant. */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 81da553244..ca482c2301 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2083,6 +2083,19 @@ void tcg_op_remove(TCGContext *s, TCGOp *op)
 #endif
 }
 
+void tcg_remove_ops_after(TCGOp *op)
+{
+    TCGContext *s = tcg_ctx;
+
+    while (true) {
+        TCGOp *last = tcg_last_op();
+        if (last == op) {
+            return;
+        }
+        tcg_op_remove(s, last);
+    }
+}
+
 static TCGOp *tcg_op_alloc(TCGOpcode opc)
 {
     TCGContext *s = tcg_ctx;
-- 
2.25.1


