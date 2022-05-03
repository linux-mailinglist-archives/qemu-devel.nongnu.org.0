Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F024B518FB6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:08:41 +0200 (CEST)
Received: from localhost ([::1]:59928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzlA-00079l-LM
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZp-0000fk-OP
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:57 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZn-0006NI-BW
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:52 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so2882329pjf.3
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=b0mtvFcJe6Lm8uLKbhgRHasfTLJl7kkdx3x7RgBno1I=;
 b=Cm0xXwG9vnUzbCs4MuvOXR3q1/b9UnFyWNoYB7zar7GExUZR6h1+nCpu5mUd0la25f
 +yOSyfZSGe6FVdSaTkQCfavtUIJaQ3akU4XKRqchvk7Hnastoc25CaPbtZr0ENbPBWQU
 gjuaXniAjav9tl4UE+3/S3p1B/RqpXOqI20x9D78I958zA7bjnTwDfJ6HHesj9B/xhMm
 c4WHbDBNrcs0q8WzrtEl6PjKlLzj0XQC2ZZzK0SdvUbAtemWlV2MjstfkzMtE3GKO4Gc
 a2gwI26Bq2YnvV9Fez0M9pZvTzX8Fm1wQJ6FcTHktbWOrUMoZmQhmcThMn8DPvUXwsKt
 pZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b0mtvFcJe6Lm8uLKbhgRHasfTLJl7kkdx3x7RgBno1I=;
 b=L6WUHqLRBkPghgKnFBkOJIRC23Bw7i6jQFzGTXxUtlqYMV0URhcYnmdl2/tk50yqR3
 mSE8N/v0uTW4gdYJZRxPz//R0VhcMQ0gIV19Rim0dQJCOUEpZgJRgSNG5wYChQhdX21u
 id77M306JR0/HWJx+1qsktoGZsE2ksHWoN6X4azHDfnA1zOFuNBrs9IhCOEgU+3KGaEe
 eSPYhWaMDGlaJFzzAAyOla+dl/dCRmlV5WtMU3jNFmxaUig8rIrxP/nekZ66eD0SzyAl
 vf/iYP57FA6OroIyueVOFb1t1FfjGSjjuHN3DQuV7RnnTfbqaCkexRFM9U5JgZpYL294
 axQw==
X-Gm-Message-State: AOAM533muhAazbWYQx8a2Gf+3IXmpBu8PhodUHTKPQIOo40tbOrpzv1g
 VD++oQh7ZLDjc1P+potxNKDta5eYTDhz5A==
X-Google-Smtp-Source: ABdhPJz4+2DOaARm/UC+MitA1FaiXeEIVrC2xHdTnEx6G0nCIi79mFY/mt2UeOuY0jFdZFh2Xtj2AQ==
X-Received: by 2002:a17:90b:388c:b0:1dc:542b:a596 with SMTP id
 mu12-20020a17090b388c00b001dc542ba596mr6500031pjb.76.1651607570053; 
 Tue, 03 May 2022 12:52:50 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 64/74] target/mips: Remove GET_TARGET_STRING and
 FREE_TARGET_STRING
Date: Tue,  3 May 2022 12:48:33 -0700
Message-Id: <20220503194843.1379101-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Inline these macros into the only two callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 0f5b509ce2..a3d5267399 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -198,19 +198,6 @@ static void uhi_fstat_cb(CPUState *cs, uint64_t ret, int err)
     uhi_cb(cs, ret, err);
 }
 
-#define GET_TARGET_STRING(p, addr)              \
-    do {                                        \
-        p = lock_user_string(addr);             \
-        if (!p) {                               \
-            report_fault(env);                  \
-        }                                       \
-    } while (0)
-
-#define FREE_TARGET_STRING(p, gpr)              \
-    do {                                        \
-        unlock_user(p, gpr, 0);                 \
-    } while (0)
-
 void mips_semihosting(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -225,9 +212,13 @@ void mips_semihosting(CPUMIPSState *env)
 
     case UHI_open:
         {
+            target_ulong fname = gpr[4];
             int ret = -1;
 
-            GET_TARGET_STRING(p, gpr[4]);
+            p = lock_user_string(fname);
+            if (!p) {
+                report_fault(env);
+            }
             if (!strcmp("/dev/stdin", p)) {
                 ret = 0;
             } else if (!strcmp("/dev/stdout", p)) {
@@ -235,7 +226,7 @@ void mips_semihosting(CPUMIPSState *env)
             } else if (!strcmp("/dev/stderr", p)) {
                 ret = 2;
             }
-            FREE_TARGET_STRING(p, gpr[4]);
+            unlock_user(p, fname, 0);
 
             /* FIXME: reusing a guest fd doesn't seem correct. */
             if (ret >= 0) {
@@ -243,7 +234,7 @@ void mips_semihosting(CPUMIPSState *env)
                 break;
             }
 
-            semihost_sys_open(cs, uhi_cb, gpr[4], 0, gpr[5], gpr[6]);
+            semihost_sys_open(cs, uhi_cb, fname, 0, gpr[5], gpr[6]);
         }
         break;
 
@@ -314,14 +305,14 @@ void mips_semihosting(CPUMIPSState *env)
 
             pct_d = strstr(p, "%d");
             if (!pct_d) {
-                FREE_TARGET_STRING(p, addr);
+                unlock_user(p, addr, 0);
                 semihost_sys_write(cs, uhi_cb, 2, addr, len);
                 break;
             }
 
             str = g_string_new_len(p, pct_d - p);
             g_string_append_printf(str, "%d%s", (int)gpr[5], pct_d + 2);
-            FREE_TARGET_STRING(p, addr);
+            unlock_user(p, addr, 0);
 
             /*
              * When we're using gdb, we need a guest address, so
-- 
2.34.1


