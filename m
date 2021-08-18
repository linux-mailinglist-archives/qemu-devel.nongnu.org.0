Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9CE3F0C66
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:06:32 +0200 (CEST)
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRpX-0002r6-LJ
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9q-0007FA-TL
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:26 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9p-0002kO-9b
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:26 -0400
Received: by mail-pf1-x430.google.com with SMTP id w68so3185659pfd.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZvnR6dmCENTgvfOhQCUhTTkcIQWTTdu6sE1/LbqswCI=;
 b=KZpzW1W2MpIiZEfKLI5dCmioFaL+W0N8VRtkfaV+QIULWwclewpCoQoXlz7vKd9FSb
 gVUzeML3f83RymOT93uqMkg29kLQjur7kSqf8ewWpkPt1b9uXIBM9Wajz5UBL6cYZws7
 3tMuZCgx3bhAS517CAUj444pkQ2errBy9eK1vOCvGTlKIFvzMRKinxTXjltmEmQIDMk9
 viiqMj8tMX4dPZt6cZo+bl0MDpwH5VJlmm6I6lX5/n1Rh/H2FXFeFoauLzR7G2co8Gag
 jG5AXKmVN2qA5yBRh8PxU/arVVdc9oGoUA6i1HQoyRlMgOOLN3wgHzslaA2DSlNIpNHB
 xfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZvnR6dmCENTgvfOhQCUhTTkcIQWTTdu6sE1/LbqswCI=;
 b=e3wmTTW8NKFUL1jgUW8858TNeeOxgVQUxx6XY2/ubRELp1nrfzoKBB4LoT185QOfoZ
 jJHtB3Ev5BvHu9ulKyhHmeqA52TrI615b6/WcrRAfmcZkDeVjlcQBL0TBZkNdImP1yi3
 mFrM13FiEr5BPyJZ8PmvUMlY9O+RY/lUCC+3+V2D7nE+EpA+ySZWMoi8p+5ANiXPC6IB
 QPirapoZNi2ABM7PLEQC9tfkoI98FHjEQaY95S9hzNtwyE7PxLxCrAgrdylCBhnW7VrU
 W/3WYg2TIt2AJ/u6qB3T1PEQpJ9ERD503OOEMTULP4AZ6Wmxjl1NDsS/IjcTNXTu4zTe
 9Kcw==
X-Gm-Message-State: AOAM532J2aHMMzsHvr1Xwos1bIMtaWD4EAZ8quU6+dTq5DPAl+Fx4tpQ
 eB/1TvEIW7B3ycx0sxFyVyTJoSUT1CWUKw==
X-Google-Smtp-Source: ABdhPJx+T4nS9KOPiGUi8P2qfQVg1nyKwM/EJF3hNhknRZu0oRng0obddYu8609faXNZUQMcHgtBfA==
X-Received: by 2002:a63:5024:: with SMTP id e36mr10393836pgb.66.1629314603989; 
 Wed, 18 Aug 2021 12:23:23 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 49/66] linux-user: Add code for PR_GET/SET_UNALIGN
Date: Wed, 18 Aug 2021 09:19:03 -1000
Message-Id: <20210818191920.390759-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

This requires extra work for each target, but adds the
common syscall code, and the necessary flag in CPUState.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  3 +++
 linux-user/syscall.c  | 21 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b7d5bc1200..088b2d1adf 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -412,6 +412,9 @@ struct CPUState {
 
     bool ignore_memory_transaction_failures;
 
+    /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
+    bool prctl_unalign_sigbus;
+
     struct hax_vcpu_state *hax_vcpu;
 
     struct hvf_vcpu_state *hvf;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e303a9da7f..b2e3c28b41 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6640,6 +6640,25 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
         }
         return do_prctl_get_tagged_addr_ctrl(env);
 
+    /*
+     * We only implement PR_UNALIGN_SIGBUS, and only for those targets
+     * who have had their translator updated to insert MO_ALIGN.
+     */
+#if 0
+    case PR_GET_UNALIGN:
+        {
+            CPUState *cs = env_cpu(env);
+            uint32_t res = PR_UNALIGN_NOPRINT;
+            if (cs->prctl_unalign_sigbus) {
+                res |= PR_UNALIGN_SIGBUS;
+            }
+            return put_user_u32(res, arg2);
+        }
+    case PR_SET_UNALIGN:
+        env_cpu(env)->prctl_unalign_sigbus = arg2 & PR_UNALIGN_SIGBUS;
+        return 0;
+#endif
+
     case PR_GET_DUMPABLE:
     case PR_SET_DUMPABLE:
     case PR_GET_KEEPCAPS:
@@ -6682,8 +6701,6 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_THP_DISABLE:
     case PR_GET_TSC:
     case PR_SET_TSC:
-    case PR_GET_UNALIGN:
-    case PR_SET_UNALIGN:
     default:
         /* Disable to prevent the target disabling stuff we need. */
         return -TARGET_EINVAL;
-- 
2.25.1


