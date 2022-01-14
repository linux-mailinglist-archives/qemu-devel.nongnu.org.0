Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4FB48ED81
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:58:28 +0100 (CET)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OyA-0007ON-P3
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Oe4-00088K-NP
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:37:43 -0500
Received: from [2a00:1450:4864:20::433] (port=43650
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Oe3-0000cX-BU
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:37:40 -0500
Received: by mail-wr1-x433.google.com with SMTP id o3so16219461wrh.10
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fY4h9Zasl1T6lu5BwFhXAKfI2EvfJnF9sL2oRaoqTGk=;
 b=cOIG5UujQAev1mHdAPGLcpBxYivOBceG9Xp9trVyRF86PWz0UwYY0da3XrdcNtZS6T
 YfFxLdhhKLgVjDYUh+RqlBp7mgexfeXEHVfTgOeF03nSyKdH46pL2ZqpbfVXF/P9CUqR
 8OciWjlAArY9bN5iVWs9qjZ8WayhOMw/WM+sf9ya538NKpB4XdCDQMNtC0uy4XTFqRMc
 IXgSoQOfqwX41uW4XWLfgJrVZj772p1VL8y7MMLMjTYC4l0EvWCeCAMLnA2IVO+frGtf
 gPob52sRl/ujjFBsTnw1biS6ECnML5oxtYdtSS5hjqe19jEYPmGuxG7e32qKpCLGzeQr
 0Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fY4h9Zasl1T6lu5BwFhXAKfI2EvfJnF9sL2oRaoqTGk=;
 b=DASYAMFA4384MGnrICj1rQgB8XOzr7mqowoMBhY5eXUdP1Jt0WB/fDapSw7cRGeVq5
 DQ+NKAdtPUsM6hBrcvoUBoSdEKN984ZGeqyRR/Qjg1AcXqLnTP8UCnazsjm4gP1Vy61R
 /iUo521JhNjLdhMAahEJFBSHDTacXHg5rMw0oy3a3wyNW1XaTSXSFfoWMKNjFfXPrZm/
 URcM65PJzvVeFXhAtW8Hv39Fgfxwfqhwt0Q67ywr8JE5F5NbJv7xvjCPUFBHmgZlPBn/
 jY7OoDXEWGM+KRuagX/2nC2ZbItk1R0b7G2voFTSZ3t5IqBXRCr+yQz9Ddb/b2DYXRyZ
 0iBw==
X-Gm-Message-State: AOAM530P+yn6ABXo29F3Ob+54XwKfil6klD4dkDpDGAtKOVX7mSK5Urg
 qQWPq37iPUjUjzTvv9XkmmyN2ZTsd9NLLw==
X-Google-Smtp-Source: ABdhPJwIPjppWJBN4Gd1epyRqGIKY84Cufx5qSX/3CGs8AnrppyD/UKhTuymz8j6Z3lQQF12nHRjQw==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr5118704wrz.489.1642174658177; 
 Fri, 14 Jan 2022 07:37:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v13sm6464141wro.90.2022.01.14.07.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 07:37:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] linux-user: Return void from queue_signal()
Date: Fri, 14 Jan 2022 15:37:32 +0000
Message-Id: <20220114153732.3767229-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114153732.3767229-1-peter.maydell@linaro.org>
References: <20220114153732.3767229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The linux-user queue_signal() function always returns 1, and none of
its callers check the return value.  Give it a void return type
instead.

The return value is a leftover from the old pre-2016 linux-user
signal handling code, which really did have a queue of signals and so
might return a failure indication if too many signals were queued at
once.  The current design avoids having to ever have more than one
signal queued via queue_signal() at once, so it can never fail.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/signal-common.h | 4 ++--
 linux-user/signal.c        | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 42aa479080b..2113165a758 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -59,8 +59,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
 void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
-int queue_signal(CPUArchState *env, int sig, int si_type,
-                 target_siginfo_t *info);
+void queue_signal(CPUArchState *env, int sig, int si_type,
+                  target_siginfo_t *info);
 void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
 void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
 int target_to_host_signal(int sig);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index bfbbeab9ad2..32854bb3752 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -780,8 +780,8 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
 
 /* queue a signal so that it will be send to the virtual CPU as soon
    as possible */
-int queue_signal(CPUArchState *env, int sig, int si_type,
-                 target_siginfo_t *info)
+void queue_signal(CPUArchState *env, int sig, int si_type,
+                  target_siginfo_t *info)
 {
     CPUState *cpu = env_cpu(env);
     TaskState *ts = cpu->opaque;
@@ -794,7 +794,6 @@ int queue_signal(CPUArchState *env, int sig, int si_type,
     ts->sync_signal.pending = sig;
     /* signal that a new signal is pending */
     qatomic_set(&ts->signal_pending, 1);
-    return 1; /* indicates that the signal was queued */
 }
 
 
-- 
2.25.1


