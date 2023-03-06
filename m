Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F50E6AB3D4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:43:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyu0-0004Sg-92; Sun, 05 Mar 2023 19:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytZ-0004OD-U3
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:06 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytX-0006QT-R7
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:05 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso11579132pjb.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h450rGjyTZMisHQ1+XeWIIv6LyNvYamk2pEqV4pV0zw=;
 b=sY8CLkuZYjpUMQSsnrt78on/ucWVOZRouUCN/7dyH6QKsrr7YNDSqzR0wdGL0Edhex
 qW6d2T2FV/6gf7Xgcbn4syBCZ3cn6MHr0kOdxZrC2exJhKe7PP4o9q7y9nXKAMuABywI
 E1OR5qPs0jxsmt4ihlwxFQNqrTGaBx1Mb2ixAnSrIXPTdc+Ub1YXeo7bTSF6ZU50U+wi
 BIF7rrTU5yB928wnIOzNNLuB8Fmm0LZtnxIVzobXCRVhA1FSpPnkuNYQnYgDrVhuVOP2
 AgxpgF1zo8qmpAS85MWO/EnvXWvi2gH5VPUaLvdxbMQ3yA6rw9heCFwgw8x/cpNwhweS
 /YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h450rGjyTZMisHQ1+XeWIIv6LyNvYamk2pEqV4pV0zw=;
 b=tffUHShtDd/hKRjlWQqyM3sRJBZ6PPn19UXzj7wWHABpLvQogkNuDlXAO2gr2cNa2R
 BYP567jmyvf2Ni7Bbcsq6H/RiLmyxrwgc1fmVqvKRR8pOZIL/AHuqKIQ6pAwtieJl7SN
 vXGI4LEhWUXvq1rIzqSQUACOP996VT/53n9DRAjuzJQ/pvtz7nRd1N3PQJc5HQGtPRNv
 F6wzxRKOSumq330SpLcOMCuqZK6MusX8ua7LlpcC7/nBy1CkyY45b6d+Hs8FFDkKwSfr
 +KymbpGm262Ldx9rtoHCppolio5krx6cWAeccE2kfJ4TtylgBTGxnHCZhqb3D+UChaCT
 Y5Aw==
X-Gm-Message-State: AO0yUKVfb3J+WYe3kXRe7okLC/lajZ+4breOhyu4zAbayHUkjRVpsfJW
 PWGglAN1XfF9au2SPBj1mzERaLYFTBnR6w/noceW5w==
X-Google-Smtp-Source: AK7set/RxNSm5+zyb8gDbIqeWAqtw2hC8AM0ALsQnDF+2XsGZc4WpbJbRgu0SMQGBLbkyjQqSuyEEQ==
X-Received: by 2002:a17:90b:314a:b0:237:85fd:e0b0 with SMTP id
 ip10-20020a17090b314a00b0023785fde0b0mr9741388pjb.29.1678063202254; 
 Sun, 05 Mar 2023 16:40:02 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/84] softmmu: Check watchpoints for read+write at once
Date: Sun,  5 Mar 2023 16:38:37 -0800
Message-Id: <20230306003954.1866998-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Atomic operations are read-modify-write, and we'd like to
be able to test both read and write with one call.  This is
easy enough, with BP_MEM_READ | BP_MEM_WRITE.

Add BP_HIT_SHIFT to make it easy to set BP_WATCHPOINT_HIT_*.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  7 ++++---
 softmmu/watchpoint.c  | 19 ++++++++++---------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fb5d9667ca..75689bff02 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -923,9 +923,10 @@ void cpu_single_step(CPUState *cpu, int enabled);
 #define BP_GDB                0x10
 #define BP_CPU                0x20
 #define BP_ANY                (BP_GDB | BP_CPU)
-#define BP_WATCHPOINT_HIT_READ 0x40
-#define BP_WATCHPOINT_HIT_WRITE 0x80
-#define BP_WATCHPOINT_HIT (BP_WATCHPOINT_HIT_READ | BP_WATCHPOINT_HIT_WRITE)
+#define BP_HIT_SHIFT          6
+#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
 
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint);
diff --git a/softmmu/watchpoint.c b/softmmu/watchpoint.c
index 279129dd1c..ad58736787 100644
--- a/softmmu/watchpoint.c
+++ b/softmmu/watchpoint.c
@@ -162,9 +162,12 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         /* this is currently used only by ARM BE32 */
         addr = cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
     }
+
+    assert((flags & ~BP_MEM_ACCESS) == 0);
     QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (watchpoint_address_matches(wp, addr, len)
-            && (wp->flags & flags)) {
+        int hit_flags = wp->flags & flags;
+
+        if (hit_flags && watchpoint_address_matches(wp, addr, len)) {
             if (replay_running_debug()) {
                 /*
                  * replay_breakpoint reads icount.
@@ -184,16 +187,14 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 replay_breakpoint();
                 return;
             }
-            if (flags == BP_MEM_READ) {
-                wp->flags |= BP_WATCHPOINT_HIT_READ;
-            } else {
-                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
-            }
+
+            wp->flags |= hit_flags << BP_HIT_SHIFT;
             wp->hitaddr = MAX(addr, wp->vaddr);
             wp->hitattrs = attrs;
 
-            if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
-                !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
+            if (wp->flags & BP_CPU
+                && cc->tcg_ops->debug_check_watchpoint
+                && !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 continue;
             }
-- 
2.34.1


