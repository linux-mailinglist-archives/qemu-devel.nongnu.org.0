Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D4948826A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:38:00 +0100 (CET)
Received: from localhost ([::1]:49976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66pN-0007xi-9W
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lf-0005iA-6H
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:09 -0500
Received: from [2607:f8b0:4864:20::435] (port=44990
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lc-00048y-Pc
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:06 -0500
Received: by mail-pf1-x435.google.com with SMTP id t187so7048725pfb.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gNW3zpumLFHPqplHLKc2ywbGSNXOgU1ULWv67Fdx+a8=;
 b=p4eo/abBIlFS/qYjuGZmUf+oWl+obovIUlhDoS+TpyKGYvFl+mFMDV1B0+cPMQKtHr
 m38uHQ0PJ3PFviUpF+8koW5cswglxq/iJdXyjHefnK+jfT5wx+XsWzo5BZHTLTbXL5oJ
 Ad/m3zQRXhZwkEvGMI3/OmpZe4RJw9iw6tgmn50k0AunoUHLD3q/ZYtrbWLw1Wa49MDX
 YRD4OgUvr2ixticbw/3qWCxvTFtwg+Wk3CFQr8dyz4Xb0Q+qzMtbgMTdgnYeJDCKKuvZ
 bgOi3T/rANnXkcPmooCNLVRGBfOVzWPo7oPgPuzhut78Zq7AjrX5gHdhGBJxix7FtiB4
 X+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gNW3zpumLFHPqplHLKc2ywbGSNXOgU1ULWv67Fdx+a8=;
 b=FcML4AyQNqFwwf9GMe1wHhj8v8/35x4aGFgQyQkodQ3FTZSNvwoz9C56lRwIa6xh+j
 ABVpulsP71XFAm3+U2Pq+JgPsZdKJNxFgRwR/wSDstbJMlyOfVGKkbpBLE+gLBlo+/Qh
 XUCq+ds+a9P/CTS0DkgR5MDbhRRm3He0WjllvJgOUEF4c5Lc2SNtdqWyDo6TfYbzBhiV
 ASmUcWNzPbgNzdaRatfVhKV3DvvdzVK/YNcdyDdsvCbABhdpzi9lR40n+qjmJ1B7FM/Q
 D+dFh0LI0LDkMCjznoKXjDlaASCS4lOZ1KUNLzlwsroY6W/mqrrDQEr1zXUBG+JYZ6ov
 Z+1g==
X-Gm-Message-State: AOAM5308Ud7kdwYR4O23rT0HiK0Vib0QkNmzcL/n5vkJ5j1JARZTkskr
 IsyIP6PhVjaROsQajbAUIh7EzSy53GmOoQ==
X-Google-Smtp-Source: ABdhPJxUL+OLfbv5RkWS8wytmki4ieXMSOx1hZyF0Kq/5cbmMnbDrhbCR4ZgxlRXXXCqGQYRiT/q1Q==
X-Received: by 2002:a65:6aa7:: with SMTP id x7mr21572871pgu.273.1641623818644; 
 Fri, 07 Jan 2022 22:36:58 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:36:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/12] tcg/mips: Split out tcg_out_movi_two
Date: Fri,  7 Jan 2022 22:36:40 -0800
Message-Id: <20220108063644.478043-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emit all 32-bit signed constants, which can be loaded in two insns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 8741fdd49c..142583b613 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -541,6 +541,22 @@ static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
     return false;
 }
 
+static bool tcg_out_movi_two(TCGContext *s, TCGReg ret, tcg_target_long arg)
+{
+    /*
+     * All signed 32-bit constants are loadable with two immediates,
+     * and everything else requires more work.
+     */
+    if (arg == (int32_t)arg) {
+        if (!tcg_out_movi_one(s, ret, arg)) {
+            tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
+            tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg & 0xffff);
+        }
+        return true;
+    }
+    return false;
+}
+
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
@@ -548,21 +564,18 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         arg = (int32_t)arg;
     }
 
-    if (tcg_out_movi_one(s, ret, arg)) {
+    /* Load all 32-bit constants. */
+    if (tcg_out_movi_two(s, ret, arg)) {
         return;
     }
 
-    if (TCG_TARGET_REG_BITS == 32 || arg == (int32_t)arg) {
-        tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
+    tcg_out_movi(s, TCG_TYPE_I32, ret, arg >> 31 >> 1);
+    if (arg & 0xffff0000ull) {
+        tcg_out_dsll(s, ret, ret, 16);
+        tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg >> 16);
+        tcg_out_dsll(s, ret, ret, 16);
     } else {
-        tcg_out_movi(s, TCG_TYPE_I32, ret, arg >> 31 >> 1);
-        if (arg & 0xffff0000ull) {
-            tcg_out_dsll(s, ret, ret, 16);
-            tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg >> 16);
-            tcg_out_dsll(s, ret, ret, 16);
-        } else {
-            tcg_out_dsll(s, ret, ret, 32);
-        }
+        tcg_out_dsll(s, ret, ret, 32);
     }
     if (arg & 0xffff) {
         tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg & 0xffff);
-- 
2.25.1


