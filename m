Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DEC31291A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:56:56 +0100 (CET)
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wjP-0005VA-BZ
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRm-0001cv-Se
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:42 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRb-0005s2-8Z
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:42 -0500
Received: by mail-pg1-x536.google.com with SMTP id t25so9272123pga.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CAFEcBhH5Bm/1S+hn6Be2S25m9MyX50Fw2Tvsr0CL7s=;
 b=YTQPY1rmM84LAE7Mf2LydjmwlauK1HhfGkR/DHCBvgNlEH34qwByYLh8PYQwe2eHj/
 7Ic299818C+mKJAZKYQm9vTm/n7lSkviQqtSO0IEnTkBMgaHoZCZnYC24n1zA4m+s7oT
 aHlayLiyViqo1DvgMyFlV57MuNGdxLNLnSRgU01/w9iUtAu5xIrwlMQM1lFBwbP8h62B
 PaZSB9aqGCDg9BG8JpbHNiodFC0OaFBYryLLhBeacFFO5Nm3rkZLndNiLB7WJdDrkb8u
 +wizuCp2tcooUtYdzh2doYoz9/3moRLhMahg5DAUB4+QNc8WETNMs7e9VhLYdo8Q5iV9
 TznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CAFEcBhH5Bm/1S+hn6Be2S25m9MyX50Fw2Tvsr0CL7s=;
 b=ki6pqp7tE7S4Nj7hz2YwI2uF0ZW1QijgFJTSQuFxmthyXJ0wsPEJXlec+iuK9kOaA8
 +Sdh2PMbn69W/1Vs1UiTvZdPgPHVMvWvd56UeM3WWlhJMdxcKzXgDCoepdt6KCHPnukS
 Zxc9e87G8UGMhQKZ2YAkzeXlLIE+sKmuw3hYf58NpPOsicgVCUIVN+InBj9KeAR06/7J
 qNug5bejrWWTaoW6qPRKRklqJFwGPzx1dm3DMPQAH+QtpqnVh8BmCZJp3P7tyt+ml8t/
 2hPyBt/GPHt1CHm9gBaGrlEsuOpOvGo8NyD2oEBeuhN4oOMEurnik1iJ9RpWab6EuKjr
 SVVA==
X-Gm-Message-State: AOAM5306ikS3Dkd9Tzk4Nws6qqi2chQvauDism7Eh+jOURp0/hr6hPSQ
 nBc3atM9K4oDZHSJvWRkmFgi8udClXzK9w==
X-Google-Smtp-Source: ABdhPJx288xI00AOVdg9HUitccStMhYSEdyLmJnChQIXjrvZV5O3OK4+d6jqI9+OPI7wCkKxYb0x6g==
X-Received: by 2002:a63:4d4e:: with SMTP id n14mr14931956pgl.37.1612751910029; 
 Sun, 07 Feb 2021 18:38:30 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/70] tcg/tci: Split out tci_args_rrrrrr
Date: Sun,  7 Feb 2021 18:37:11 -0800
Message-Id: <20210208023752.270606-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
 tcg/tci.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0301ee63a7..84d77855ee 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -258,6 +258,17 @@ static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
     *r4 = tci_read_r(tb_ptr);
     *c5 = tci_read_b(tb_ptr);
 }
+
+static void tci_args_rrrrrr(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *r4 = tci_read_r(tb_ptr);
+    *r5 = tci_read_r(tb_ptr);
+}
 #endif
 
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
@@ -437,7 +448,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        TCGReg r3, r4;
+        TCGReg r3, r4, r5;
         uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
@@ -643,18 +654,16 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_add2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            tmp64 += tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, tmp64);
+            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = tci_uint64(regs[r3], regs[r2]);
+            T2 = tci_uint64(regs[r5], regs[r4]);
+            tci_write_reg64(regs, r1, r0, T1 + T2);
             break;
         case INDEX_op_sub2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            tmp64 -= tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, tmp64);
+            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = tci_uint64(regs[r3], regs[r2]);
+            T2 = tci_uint64(regs[r5], regs[r4]);
+            tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
         case INDEX_op_brcond2_i32:
             tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
-- 
2.25.1


