Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E739C265
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:28:50 +0200 (CEST)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpHN3-0007tY-83
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpHM7-0007Dv-B2
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:27:51 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpHM5-0004YE-QF
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:27:51 -0400
Received: by mail-pg1-x52c.google.com with SMTP id i34so2449842pgl.9
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBnD80OWvAt3AEc/b5nWfCgyZ/ubHwErEKV/hyUvRD4=;
 b=a2gCOhX/xSxvtajDu1wLrvkdHCHL1q2KOZhqBICwEVtnRVMfqLe2lxUoWaRHOShtk1
 CaP0oxJe6HPxEM+PvvptouqHUjBJuo+QK7VDTrhDIJV3b+iyzxne49EEDVDM0YKG4mCU
 OxvJV0LFGkUPcfEyR3/LrWdmIOseIU0a/9MY/19uonOIyGyrrd79jLIVerw0OcZUA83F
 duFDHTBeRIbgjzFZSCAVfVsftaAMJ1eiefAYx/RrEt0SQz7l2ivo7GE+MA++I9/I/osP
 g3gFiPAZXFWKjMVhpo1GBBqf2umJrbzbJ7aQMZ9IJDdiiJjwAwyZEPWWetiFRMHfhtW2
 alug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBnD80OWvAt3AEc/b5nWfCgyZ/ubHwErEKV/hyUvRD4=;
 b=QmKrcbWzwUlUl1NySUWm+Hbu2QEyssbnvFKDEUCEvItOqvOpDW4pBnP0A9U6mECRPD
 dT2d/oH4XaoapMSzg3YhiHU/IL6FrbycHQrw2bitrh98/sZw+htziGFaT5QjGPLRJpet
 OToDI/ZBy7ngfHta6eU8VFJLUX8hrsTLjzLUgrTSTHg8utp1GNR1Q0bAdqE8I0adFVtR
 6swxS/Ve3I8K9XtAozLPrSk9YYBdrxa66LAWae9zb24lqLyWx+rYgALDaHv4rfxgsUgA
 HS4xR5T32+y9xJ0dwlUeSJYlwpMVO3N6rtLSNFhrx6CP/4lh27XO6cnGQsambpotKMQ5
 sNwQ==
X-Gm-Message-State: AOAM530/4tHW1ZhKCf6Cl9CA0k/skI2Wr1KenVx6YxFCCRzdusyNY7yR
 Y5GonR50E+rHHcY6wDZ8FRZxC0MdA/xHGw==
X-Google-Smtp-Source: ABdhPJyQvlikMVBAsyIBNYw7E6xar9P/q44YrXbL+66PxLK5fKXnsVopW2rFN52xt3bOg2kJZUjNOw==
X-Received: by 2002:a65:64c4:: with SMTP id t4mr6954096pgv.222.1622842068397; 
 Fri, 04 Jun 2021 14:27:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gn4sm5447197pjb.16.2021.06.04.14.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 14:27:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Introduce tcg_remove_ops_after
Date: Fri,  4 Jun 2021 14:27:47 -0700
Message-Id: <20210604212747.959028-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  1 +
 tcg/tcg.c         | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 74cb345308..6895246fab 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1081,6 +1081,7 @@ TCGOp *tcg_emit_op(TCGOpcode opc);
 void tcg_op_remove(TCGContext *s, TCGOp *op);
 TCGOp *tcg_op_insert_before(TCGContext *s, TCGOp *op, TCGOpcode opc);
 TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op, TCGOpcode opc);
+void tcg_remove_ops_after(TCGOp *op);
 
 void tcg_optimize(TCGContext *s);
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0dc271aac9..262dbba1fd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2649,6 +2649,19 @@ void tcg_op_remove(TCGContext *s, TCGOp *op)
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


