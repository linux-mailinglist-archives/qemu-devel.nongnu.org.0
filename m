Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2678A32BC6E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:01:23 +0100 (CET)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZYY-0006RE-5U
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMe-000695-RC; Wed, 03 Mar 2021 16:49:04 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMd-0002Z2-2M; Wed, 03 Mar 2021 16:49:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id j2so12517380wrx.9;
 Wed, 03 Mar 2021 13:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3OqS7UcP206wRkOojyBF7HLEMqlrEg0K8qjlNSdHuN0=;
 b=hU7xL3jg+s6l7qGQ1ugo7clEuznfIYKCNPA6so5H4ANvAZEdef67E+IBrjWvumF8mr
 dRaunXw3yBmkFeXwznR6lnXEqeWW10oOtoH2DPV195giWlfdKoyRDNfM6yqFRly64ifM
 fvCYb8C6uHL0CBnsCOwK/+tfU4AJjzk3WEauKBuyGtHsNy4P1aaKon77h8q2qbBl2skk
 hixzKIqFxRydwPqWGXpdLc+/74/J0ToRIPbXRP7V3aiG7gOHgluV4PWATbJNzuIh9931
 /v6xe4YWJopUeMrC6S63Dqz9EjeQoz5nbfVE61Ytobk18UpAmG6Ce9X4PaZBonK2zCNP
 q7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3OqS7UcP206wRkOojyBF7HLEMqlrEg0K8qjlNSdHuN0=;
 b=D6XyExKKRaVS/nhsL0CnqMa+9VVddyJU/TThf5+JeerfpygHnaa8UGul9JYYMt+g1p
 8eFJIv+F4w+NCvX6nih92EjmzPH8UzkiXS4IWvoqqDTqrr4iXo3ut8b0IomjRb+4L9y1
 9sE3VBOQMqMjdFafT0xWDLUIi/+HyFiLZNLxgUtTrfDizwJ1vQzFTci9MHkUwoarlai4
 iLBBkywGcxjbrrN57ybypAPS96kFfCkSVmbMi/DwaKZHvDbUQDPB3/FM1Sn9DIxtvf8T
 6eRej0+zomvXKq+lcPZhT/qoC06ueY9k8q0v7DvvX9vK8OvhSECdTOQT9mYLs3tl+tFd
 H53A==
X-Gm-Message-State: AOAM533Q6Aoa13ENAfEBpiAwmK6Kn1z30Ap6/5Wd26VuVte1gkscrmIL
 5COXAJjv8uKvBVql3ROBXLS6QJ/YGbc=
X-Google-Smtp-Source: ABdhPJz4gRG2A32sGzAfcHZ66PB3N78cOzrpsqLmQPbStAAohyvMC5U0xEoflplH77GEmL2Zf9PVIw==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr816978wrk.146.1614808140459; 
 Wed, 03 Mar 2021 13:49:00 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l8sm18988768wrx.83.2021.03.03.13.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:48:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/28] target/arm: Move code blocks around
Date: Wed,  3 Mar 2021 22:47:00 +0100
Message-Id: <20210303214708.1727801-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To simplify later #ifdef'ry, move some code around.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h    | 16 ++++++++--------
 target/arm/debug_helper.c | 22 +++++++++++-----------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d6ace004855..3fb295431ae 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -278,14 +278,6 @@ void hw_watchpoint_update_all(ARMCPU *cpu);
  * Update a QEMU breakpoint based on the information the guest has set in the
  * DBGBCR<n>_EL1 and DBGBVR<n>_EL1 registers.
  */
-void hw_breakpoint_update(ARMCPU *cpu, int n);
-/*
- * Update the QEMU breakpoints for every guest breakpoint. This does a
- * complete delete-and-reinstate of the QEMU breakpoint list and so is
- * suitable for use after migration or on reset.
- */
-void hw_breakpoint_update_all(ARMCPU *cpu);
-
 /* Callback function for checking if a watchpoint should trigger. */
 bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
@@ -295,6 +287,14 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
  */
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
 
+void hw_breakpoint_update(ARMCPU *cpu, int n);
+/*
+ * Update the QEMU breakpoints for every guest breakpoint. This does a
+ * complete delete-and-reinstate of the QEMU breakpoint list and so is
+ * suitable for use after migration or on reset.
+ */
+void hw_breakpoint_update_all(ARMCPU *cpu);
+
 /* Callback function for when a watchpoint or breakpoint triggers. */
 void arm_debug_excp_handler(CPUState *cs);
 
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2ff72d47d19..c01d8524443 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -216,6 +216,17 @@ static bool check_watchpoints(ARMCPU *cpu)
     return false;
 }
 
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+{
+    /*
+     * Called by core code when a CPU watchpoint fires; need to check if this
+     * is also an architectural watchpoint match.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    return check_watchpoints(cpu);
+}
+
 static bool check_breakpoints(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
@@ -247,17 +258,6 @@ void HELPER(check_breakpoints)(CPUARMState *env)
     }
 }
 
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
-{
-    /*
-     * Called by core code when a CPU watchpoint fires; need to check if this
-     * is also an architectural watchpoint match.
-     */
-    ARMCPU *cpu = ARM_CPU(cs);
-
-    return check_watchpoints(cpu);
-}
-
 void arm_debug_excp_handler(CPUState *cs)
 {
     /*
-- 
2.26.2


