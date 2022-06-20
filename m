Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10755241A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:38:28 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3MI6-0007g0-9H
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdL-0002tf-UN
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:20 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdJ-000237-51
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:19 -0400
Received: by mail-pg1-x532.google.com with SMTP id h192so10903987pgc.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=nsb0HZYKxil8mbkE1ArY0wx/CZJjVWm9UVPFnFHqPdhh89q4JqTcFAAsIBdqkavZko
 spCNYm4z7uYWOtG8IH8qGWbVVp3d6C+mPGAfMGGAmTXbVkkU+g/pAPF2RENrwRscp7ng
 YHO0LaR6Coltx1YH0JrWTV+r80GNgzH3Jj3QUQBE9+hN1Ot/9HW6nXBygPCUWPxL7ASq
 ZYgwJsDcQ9v4HoGAV/GVK+TaasCZpqYRo8MdlrB/h45Zmz35GDDh2ay8AlhPDdJaaaFF
 BKUrambK4TqOskcezKD2TnyV/C1Vqm+Oi42HuOVk4M53yP44dlU5aj4D51ZM5r+z0N7p
 3fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=Vnh3Uh90fMxFXW5FoH7fc/7P55M+JzODBuQCfbW40VV6010WQZfpC2MYK5A+FtryLy
 dEDlym3BalGKMRhIaMAHrKRHMa1qbbEJ8Lppz8wN/iGaZnlminYVwfgbNkB670l17UCO
 WC1WO9F0uB1e/O2C80AIOUPeDDqCnllGCOvqRn/YpVutEzY0L6BrgEs+OaDcDeO47Ef6
 1gmZjzBnsQFkuHs93als+7gZxhVMYSC5t7WXgtxT8gWV+vwSEik6/NgBgT1pHzgNN3ee
 erKVT2oVM0W1CoM1QqtiAqtFruf+vsx7XeeKI1foVJ5fe5WOl8mWolofhRZmaCF8+gdh
 uVtA==
X-Gm-Message-State: AJIora8t8Q/QBYsqERx/y0WJyRsha1M4lxLTV/7ZoH2VrFVxPw6vYH7g
 biM2asN6s6nbzvoPZKzavbegQve2oPC9jA==
X-Google-Smtp-Source: AGRyM1s8LhWfOjKtJF7rXj/cU0KK6nFQrTYin/r4GEB5U5sc2nnnE3xhLgEIi71uksWB9SR02DJtMw==
X-Received: by 2002:a63:dd17:0:b0:3fd:695e:8728 with SMTP id
 t23-20020a63dd17000000b003fd695e8728mr22405599pgg.70.1655747775849; 
 Mon, 20 Jun 2022 10:56:15 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 45/51] linux-user/aarch64: Move sve record checks into
 restore
Date: Mon, 20 Jun 2022 10:52:29 -0700
Message-Id: <20220620175235.60881-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the checks out of the parsing loop and into the
restore function.  This more closely mirrors the code
structure in the kernel, and is slightly clearer.

Reject rather than silently skip incorrect VL and SVE record sizes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 9ff79da4be..22d0b8b4ec 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -250,12 +250,36 @@ static void target_restore_fpsimd_record(CPUARMState *env,
     }
 }
 
-static void target_restore_sve_record(CPUARMState *env,
-                                      struct target_sve_context *sve, int vq)
+static bool target_restore_sve_record(CPUARMState *env,
+                                      struct target_sve_context *sve,
+                                      int size)
 {
-    int i, j;
+    int i, j, vl, vq;
 
-    /* Note that SVE regs are stored as a byte stream, with each byte element
+    if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        return false;
+    }
+
+    __get_user(vl, &sve->vl);
+    vq = sve_vq(env);
+
+    /* Reject mismatched VL. */
+    if (vl != vq * TARGET_SVE_VQ_BYTES) {
+        return false;
+    }
+
+    /* Accept empty record -- used to clear PSTATE.SM. */
+    if (size <= sizeof(*sve)) {
+        return true;
+    }
+
+    /* Reject non-empty but incomplete record. */
+    if (size < TARGET_SVE_SIG_CONTEXT_SIZE(vq)) {
+        return false;
+    }
+
+    /*
+     * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
      * of our 64-bit hunks.
      */
@@ -277,6 +301,7 @@ static void target_restore_sve_record(CPUARMState *env,
             }
         }
     }
+    return true;
 }
 
 static int target_restore_sigframe(CPUARMState *env,
@@ -287,7 +312,7 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
-    int vq = 0, sve_size = 0;
+    int sve_size = 0;
 
     target_restore_general_frame(env, sf);
 
@@ -321,15 +346,9 @@ static int target_restore_sigframe(CPUARMState *env,
             if (sve || size < sizeof(struct target_sve_context)) {
                 goto err;
             }
-            if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = sve_vq(env);
-                sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (size == sve_size) {
-                    sve = (struct target_sve_context *)ctx;
-                    break;
-                }
-            }
-            goto err;
+            sve = (struct target_sve_context *)ctx;
+            sve_size = size;
+            break;
 
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
@@ -362,8 +381,8 @@ static int target_restore_sigframe(CPUARMState *env,
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
-    if (sve) {
-        target_restore_sve_record(env, sve, vq);
+    if (sve && !target_restore_sve_record(env, sve, sve_size)) {
+        goto err;
     }
     unlock_user(extra, extra_datap, 0);
     return 0;
-- 
2.34.1


