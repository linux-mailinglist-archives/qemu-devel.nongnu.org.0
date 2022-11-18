Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD1962F1CA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxys-0007Ii-FT; Fri, 18 Nov 2022 04:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyj-00079t-5D
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:09 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyh-0001z9-Bc
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:08 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so4597777pjk.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R4W5HfqIPTFQiUbVPQ8+JyZxjEG1zccsHxXcJFvRJFQ=;
 b=AUPCvJZgkyHggr4GwiYtzXI/wef3h8GChmtTVv58eyDohg1wDgcJU2LD0QEVfRQ7Eu
 PkriiPhgzc4rtlPHb9yAYb466kkL8Ep/LgUaYYGOhl7PlL19DF2+W/QKxTfy9bsf8MvJ
 +UuGBTYLC0OLvutxuLLz1sLbAeMsxWIq6Y/RnME6q+7x9+SgO5voMheLEAykCXOaDAjQ
 StQSuNOjEu8d3KyVo0ZAF95ghjo8cxZULuqPxYmDR+PrzBuenN1cWcnm61dzWVllFCfd
 MOIgeAMZxCkDuKneCJLMvVGKttPJplVKlPGWB05bJ5w2PfzXp+eJDPOQBVoxcKeuQCX0
 hACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R4W5HfqIPTFQiUbVPQ8+JyZxjEG1zccsHxXcJFvRJFQ=;
 b=unkq5XOcBj1B++zZW8bJnCngrusH1AJrPBO6BRFezOeckyEnbPTaAQUQpumIo6pW8U
 hUMFUAGEd5Kbi0d1WfBdbHX0alw0Ja5KBNNwck7f0Gkl+2FLsT8gjs1A/Oiax/Wj89nX
 deBkwOCCLHoE5F5yA+e1+aemAvYmFuDflPWwfYdqfdEtYzzFaWqlgVRmKQkLhMlorPcm
 WGXC2gIjxvEGuduC8aEmqtXZ9afihMs5HwuNj5yF05K84bo9PnzppwOnLbK3Hj9dlOqq
 dQFDOPw5dsqXZchOfAtEINPgEvruyXsgDli+sEwU6WHXPp+H6Vuq0HIhfOBkWWxhXqWy
 shBg==
X-Gm-Message-State: ANoB5pllS5SMLjfK6v+eevODkZk4Xmz9sfMTqtP/q1OCqEcL+k0d/86x
 ZDM8LTofpte9+dgKKDLl9e40+kB3DJCY3Q==
X-Google-Smtp-Source: AA0mqf7kCOYlBEujdu5t7c5t+3/lenlXabcahXTlp1gMALLoIOo2f6q+gW2M1XXqA/2EEp2sOdjEGQ==
X-Received: by 2002:a17:90b:3605:b0:213:3918:9be6 with SMTP id
 ml5-20020a17090b360500b0021339189be6mr12682370pjb.183.1668764886073; 
 Fri, 18 Nov 2022 01:48:06 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 03/29] accel/tcg: Add cpu_in_serial_context
Date: Fri, 18 Nov 2022 01:47:28 -0800
Message-Id: <20221118094754.242910-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Like cpu_in_exclusive_context, but also true if
there is no other cpu against which we could race.

Use it in tb_flush as a direct replacement.
Use it in cpu_loop_exit_atomic to ensure that there
is no loop against cpu_exec_step_atomic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h        | 5 +++++
 accel/tcg/cpu-exec-common.c | 3 +++
 accel/tcg/tb-maint.c        | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index cb13bade4f..f06bf58e7a 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -119,4 +119,9 @@ static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
 #endif
 }
 
+static inline bool cpu_in_serial_context(CPUState *cs)
+{
+    return !(cs->tcg_cflags & CF_PARALLEL) || cpu_in_exclusive_context(cs);
+}
+
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index c7bc8c6efa..2fb4454c7a 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,6 +21,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "internal.h"
 
 bool tcg_allowed;
 
@@ -78,6 +79,8 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
 
 void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
 {
+    /* Prevent looping if already executing in a serial context. */
+    g_assert(!cpu_in_serial_context(cpu));
     cpu->exception_index = EXCP_ATOMIC;
     cpu_loop_exit_restore(cpu, pc);
 }
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 0cdb35548c..a7c067628c 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -119,7 +119,7 @@ void tb_flush(CPUState *cpu)
     if (tcg_enabled()) {
         unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
 
-        if (cpu_in_exclusive_context(cpu)) {
+        if (cpu_in_serial_context(cpu)) {
             do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
         } else {
             async_safe_run_on_cpu(cpu, do_tb_flush,
-- 
2.34.1


