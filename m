Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0253F0D97
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:42:34 +0200 (CEST)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTKT-0001pq-Ll
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7i-0005nP-8T
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:22 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7g-0005jk-OW
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:21 -0400
Received: by mail-pg1-x533.google.com with SMTP id r2so3707343pgl.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Eg6xgC0Zn9gwcbgRPdMs7fC32gwJkdzHxMMdYwWwU48=;
 b=lzqU6AbYnic27Qu+JRNkYp2wEg5vm3lsRjgvxjYO1Vt5JpnTMaaj8f+eNd2uEXJkaz
 JInq2JrJbLNzZsLWB7vpfmCAZ/xGrmoSjshpaBr2Oi3KqceSHVuhV1j5axtVp79O+uVr
 ag0oYpEXYOIFPcfWplGwsWDiGwrMgzKMmMQQOPTV7C7jijhJZ9nTMKTYwWfsInbm3Mpa
 SkjVgv1aAMfyJHcp8M9kpf29x5+s30udWrYApoIkaPaS4zyxMr4gunWmMgfjbKDmAlFE
 O8ExFR+YNBitM0oON+jS8T2SMIW4F2OjlvLbp6nm/H9gPU66CujKsZWfZlZmcwdacLOD
 hpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eg6xgC0Zn9gwcbgRPdMs7fC32gwJkdzHxMMdYwWwU48=;
 b=pOhxSHHAvIJZgAmbHn+F45E1hgDSZ3VV0at0ViBZRhJXamzrIU0+5KFydDs1HKpHWx
 daWb4p2qWSJj4jXlBMJeBB/uuTyAMTgYb8Lh5HxKKGMMWjnb7l0q8ZBnPJINI6XOofxL
 phJl+3AyMY3PT8coHz3KkualmDakSil/X97aIDhv9Ux9dPIYEeS4pv+lYKiqSF/7lT7f
 V0cP7zVC98S/+Z/vHoHHmt9J4La04lh2z6Emi4HmoUy/TVxYEUKDDO4UbVpGl1dpZiyT
 ACOag29o5kKmEdaE+yjZgmw7iw7Z7rgjC5ea+Dns5BDnwtQodzaMa/Uh2BgKNQj85Oe5
 SY9g==
X-Gm-Message-State: AOAM5306WMsp8jos5T+6vG5oEZj+DKVsPcDk339KHfw9wO3JJGMGv09C
 8SzOExl2vuay5qIasWVPim5qosDP1cf+jw==
X-Google-Smtp-Source: ABdhPJzC6KF7AlY1wpvmWs4MCE9RnNwYcil5JXrJwK9WLVofFRYFrUUFAvzPWafZ9228tlQ0PNyaqA==
X-Received: by 2002:a63:164a:: with SMTP id 10mr10873862pgw.161.1629322159470; 
 Wed, 18 Aug 2021 14:29:19 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/14] tcg/arm: Examine QEMU_TCG_DEBUG environment variable
Date: Wed, 18 Aug 2021 11:29:03 -1000
Message-Id: <20210818212912.396794-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the environment variable to test an older ISA from
the one supported by the host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  8 +++++++-
 tcg/arm/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index f41b809554..e47720a85b 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -28,9 +28,15 @@
 
 extern int arm_arch;
 
+#ifdef CONFIG_DEBUG_TCG
+#define use_armv5t_instructions (arm_arch >= 5)
+#define use_armv6_instructions  (arm_arch >= 6)
+#define use_armv7_instructions  (arm_arch >= 7)
+#else
 #define use_armv5t_instructions (__ARM_ARCH >= 5 || arm_arch >= 5)
 #define use_armv6_instructions  (__ARM_ARCH >= 6 || arm_arch >= 6)
 #define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
+#endif
 
 #undef TCG_TARGET_STACK_GROWSUP
 #define TCG_TARGET_INSN_UNIT_SIZE 4
@@ -83,7 +89,7 @@ typedef enum {
 #else
 extern bool use_idiv_instructions;
 #endif
-#ifdef __ARM_NEON__
+#if defined(__ARM_NEON__) && !defined(CONFIG_DEBUG_TCG)
 #define use_neon_instructions  1
 #else
 extern bool use_neon_instructions;
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 87df812bb5..0c7e4f8411 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2455,6 +2455,38 @@ static void tcg_target_init(TCGContext *s)
         }
     }
 
+    /*
+     * For debugging/testing purposes, allow the ISA to be reduced
+     * (but not extended) from the set detected above.
+     */
+#ifdef CONFIG_DEBUG_TCG
+    {
+        char *opt = g_strdup(getenv("QEMU_TCG_DEBUG"));
+        if (opt) {
+            for (char *o = strtok(opt, ","); o ; o = strtok(NULL, ",")) {
+                if (o[0] == 'v' &&
+                    o[1] >= '4' &&
+                    o[1] <= '0' + arm_arch &&
+                    o[2] == 0) {
+                    arm_arch = o[1] - '0';
+                    continue;
+                }
+                if (strcmp(o, "!neon") == 0) {
+                    use_neon_instructions = false;
+                    continue;
+                }
+                if (strcmp(o, "help") == 0) {
+                    printf("QEMU_TCG_DEBUG=<opt>{,<opt>} where <opt> is\n"
+                           "  v<N>   select ARMv<N>\n"
+                           "  !neon  disable ARM NEON\n");
+                    exit(0);
+                }
+            }
+            g_free(opt);
+        }
+    }
+#endif
+
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
 
     tcg_target_call_clobber_regs = 0;
-- 
2.25.1


