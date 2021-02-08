Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E3312918
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:55:55 +0100 (CET)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wiQ-0004Cw-Tr
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRS-0001Wl-Mz
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:22 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRR-0005pJ-95
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:22 -0500
Received: by mail-pl1-x631.google.com with SMTP id u11so6996089plg.13
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MYKpHAJMq3pQVgdvIIf5gybikCrqAwnvbyA/L0Pt44U=;
 b=qs2c+c7Tay5Y+SM3Xgc6t/ODPCOIx8SRg/YctcLnU4ZnzovNo1UUW6w2yWx9Lc/ZC7
 ppclE3B0R3rmyDJpxB4+cz4NZAwvBXYUTs+k3xHvTsq5mXXaCYZR74Ug+lQcMxJBD3pA
 kQQucQqT5iZLX31dF+9smkDFqSxGJicApMKDfWeg9pegPtpLogH9VQAmQU+ncyco5gp9
 6Kxorptaun9OGg94VIO+/5r6kcfRYlRuDRlHBJJUubHM26jcUC2Z/cE1zmLZFxI+rf4K
 WkbTuussG9SwrzOKXJWBTzd1cEUWdsmy0+jyRuzZ1L04BlNDWKNjEz1kurwckT9PfgW6
 JQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MYKpHAJMq3pQVgdvIIf5gybikCrqAwnvbyA/L0Pt44U=;
 b=FKR14I9W56gTcKcgX/u6z+84jwmg6F5c/KdlUZqAcaY1oUXYKIQAIt7k9aTyssykE0
 pG3DAmqmaubiRhUrPI7CobSar8cJQXGq3Q+lOnjKM7t4LAEkvnK0eCPckHbqgP765HJh
 Dlry1pBRzKSkZ6DW1nPTXhD2+rl5z8e8put19lRuFKEbaTZ9OgBhU4UwzMo8X8Y19Xs2
 2jBgp1nYBQalKdKmBtW7Ko9nU49GTSmzrBKSqxUVY3dPIfrRF6GwXtJFWx8xOngWXtVs
 qFBBDkpHHgHRf9OBPyG+3Nbw+HlJ7xDQWDzfLGkA0Is8Ka6PTvCf7BQzdfDLDbFRuQEr
 R5lQ==
X-Gm-Message-State: AOAM533+UNfNwbFqmCAwjkYA8pkMcbP3/kRtUsFaE6auNgwbOyLlH43y
 /i9MID1tefTiYPTCecGOlf8uWdUZ/k9Rbw==
X-Google-Smtp-Source: ABdhPJxUZzQqNfSN9hcHBV0316gPmcuy+aEgf37OxInyIcGdOV77LNH9tKBSbCQOQTylTbbZFtgvug==
X-Received: by 2002:a17:902:edcd:b029:df:d2b1:ecf0 with SMTP id
 q13-20020a170902edcdb02900dfd2b1ecf0mr14577802plk.15.1612751900120; 
 Sun, 07 Feb 2021 18:38:20 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/70] tcg/tci: Split out tci_args_rrrc
Date: Sun,  7 Feb 2021 18:37:03 -0800
Message-Id: <20210208023752.270606-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1736234bfd..86625061f1 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -207,6 +207,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     *i2 = tci_read_s32(tb_ptr);
 }
 
+static void tci_args_rrrc(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *c3 = tci_read_b(tb_ptr);
+}
+
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
     bool result = false;
@@ -430,11 +439,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tb_ptr = (uint8_t *)label;
             continue;
         case INDEX_op_setcond_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare32(regs[r1], regs[r2], condition);
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
@@ -446,11 +452,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare64(regs[r1], regs[r2], condition);
             break;
 #endif
         CASE_32_64(mov)
-- 
2.25.1


