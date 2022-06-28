Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3A455C0BA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:33:56 +0200 (CEST)
Received: from localhost ([::1]:35878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69Tf-0007qD-8a
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Ds-0004Of-Uy
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Dr-0003D1-F5
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:36 -0400
Received: by mail-pf1-x431.google.com with SMTP id c205so11703224pfc.7
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uvve2F6bKnqA+jHkHDZA0DuOutle4LRsyC3luFc/kBA=;
 b=P4UKNWn+foQwxmmqyiF/hUTaQZd79W/mFRqirhbsicN8ep9KEgX+ptKkawSHn0KLev
 5C2r2EMm9zYh2yHyKKOzsSXZrNuyMlnCzIOaxNc7PXFlDH5YjnVh/CjO9nm9D90X6kTM
 Z4ToSst2ClxjLuQ+dBK8O52Hv7fb0i15CAiq199JFFIiApknI+peo23FZiPFOzEtNRKy
 MVJNl4FnAIn0qgwKEiYEzK88R+1FZuGis4VVqKMAU7745YlypzaXLIQ8k4bgwlBLfn1T
 iZOeUIXb135NcAECXmq/xOHpQrS8lhv461gi/VWs3nqe2djGfiI/GVRGY/0Dypio1uEf
 Jo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uvve2F6bKnqA+jHkHDZA0DuOutle4LRsyC3luFc/kBA=;
 b=TDw6KzeUBzZ9mXIaUnQmmFy20v0fMcoBMZ/N3RBvIfNy8XBQSuGgaKj8VwZaY7rUxC
 x2SnIETVIaR7EskPK73nZcW/flNI9gLYZvIxD3n1iO7dOYCK4RE5zIh2hSVoDOaO+WRG
 /b65rBl9n+VUojgdC/EEyyKpFu5Kfxj9B+F/xDRS7YjIDBfNhaiGuTnu45QGgtacnTD9
 hXGxvn6K1N8hWYvDoRMP+8/UdNeex8PJAJ7gpZnbtnB2HCp1VXc1R8pc2hmJdRPXUMGe
 1/w7KUOIdWyBC0PxHgtlAUjtliJ43JfrDgovlwjgycmzdKJIhRG3HUC2cwTxmd0B5fPw
 CHog==
X-Gm-Message-State: AJIora+lyohA+YLF3FD0pjAoaBBLeRFzCrcJWuIqYZZe7tpQZkW/BnsI
 b38J8pL6lZW+w7rwfx3rK1BuBjD44Iz2dg==
X-Google-Smtp-Source: AGRyM1sLWzGMspC9++SeiSlcLJNs5kgd7Ikjw4bi1hzjFBcdOT0iQ6R72glNsZAO0wVfNSazxb1Xvg==
X-Received: by 2002:a05:6a00:15c1:b0:525:2db4:2a2c with SMTP id
 o1-20020a056a0015c100b005252db42a2cmr3104330pfu.30.1656415054050; 
 Tue, 28 Jun 2022 04:17:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 a8-20020a654188000000b003fd4831e6fesm9079283pgq.70.2022.06.28.04.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:17:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
Subject: [PATCH v5 8/8] target/mips: Remove GET_TARGET_STRING and
 FREE_TARGET_STRING
Date: Tue, 28 Jun 2022 16:47:01 +0530
Message-Id: <20220628111701.677216-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628111701.677216-1-richard.henderson@linaro.org>
References: <20220628111701.677216-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index b54267681e..5fb1ad9092 100644
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


