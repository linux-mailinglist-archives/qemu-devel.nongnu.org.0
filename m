Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9077F542151
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:39:56 +0200 (CEST)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoQ7-0000iv-LK
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6q-000725-Oy
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:20:00 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6p-00024B-3U
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:20:00 -0400
Received: by mail-pj1-x1034.google.com with SMTP id e9so7052436pju.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lf36jiR6VUIV3UBN1JaIb1RW/v6kW3v6qxzzklReehI=;
 b=fow0+1f9ayyYKmSkThePoL8Y3P73mC7rcuJXJkWsf7KoealjAQcaoBnEsTfq3PSJ55
 3QJQ4boEC2CS346e0vbpTbQx+gJmKGsmASXWMEQW887/AtShwPXIF6EBSjk75NUUC3cz
 VZJLslrIgX+Fkqh9/77EFB29E8RXLrrLQZSH772463hfLxhRduXKhyvDtrIPCal1cbtl
 9QJU7BgZgYxL4RLOPmLq5YtnMnlu5vDMKuZn6BqT+nkkeAfLi2uFumMM4bceH7o97QqL
 Q5Xd8RM8Um8Z9+3UEVjMtj84wYKEo9WjuKWl+Ijxu4+43zUwowOkfOCH+bSevGxCHD+N
 VgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lf36jiR6VUIV3UBN1JaIb1RW/v6kW3v6qxzzklReehI=;
 b=qUvo5T0BS6gsBxF1sah5BHQPznkFq/UKSfhOn12oQvM34c/iqZ8i9KW7qnYw0/bgrp
 FwdAv6wrCdV5Wx/7SIvekiGrdjrW9r8euhWRv6/Wzf+NEn/jsQ4uO8uCVoBQ9sRTO3QK
 ohFW94utZKzED4FO5ru4to7EjHXsjQwn/6d8f1I/IMzi8+/IMLl8lvY8W/z1VtzCu2sO
 MX1J+jItjcv22rzfU0LK/jA5PmOU1PodNi49BszacsR/hEYXl7aByOl/9m2caXp+Uqeu
 C2q+/OV3N+7CiE7uMRmlumz4/ccG2v0JnYJ9O7qjcxLv+L78gGaIDUuBLYPkDQa0iaNI
 48Hw==
X-Gm-Message-State: AOAM533n32+r8keN9Mdw2rzSFpCwA8o0sIZw7u/Kr6H9txmDsdQDoc1C
 Y9eGwR/DXNvcX7nybrygx0sHpCVOuHwAoQ==
X-Google-Smtp-Source: ABdhPJxrme25t6It1RukM4lJiiAR1rGBOtvAOmzPYgP0rJ3btIuqPFEQAGrLAYs6XtOKA5q0QKRGIw==
X-Received: by 2002:a17:902:d4cf:b0:167:735a:e7a1 with SMTP id
 o15-20020a170902d4cf00b00167735ae7a1mr16233082plg.161.1654665596774; 
 Tue, 07 Jun 2022 22:19:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 11/11] target/mips: Remove GET_TARGET_STRING and
 FREE_TARGET_STRING
Date: Tue,  7 Jun 2022 22:19:45 -0700
Message-Id: <20220608051945.802339-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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


