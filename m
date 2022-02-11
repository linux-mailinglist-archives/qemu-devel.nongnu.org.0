Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C624B1B96
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:48:09 +0100 (CET)
Received: from localhost ([::1]:42246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL2e-0004Nr-Dh
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:48:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmu-0003xJ-B7
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:52 -0500
Received: from [2607:f8b0:4864:20::42f] (port=40598
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmr-0007Kv-V5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:51 -0500
Received: by mail-pf1-x42f.google.com with SMTP id a39so12642501pfx.7
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OhssSczJVbMJGYs6E9M45NQ4kpIeIUWJ7tzrr8g1OM=;
 b=j6htwAEQ9oIw3SBZXNz4nmczvxT0rlu+FL6bCx5i7XwDsfShRWAxDqMWymkJjcezPj
 DYMdjzEA1qc+ttQ7zZyFauQZv4vwlWfWImmko1WyRlX/3ZyerimnfGDi/hVaYBUZJldh
 WJS/AGqdj8QQ9etBmv1ICDjghCu5U0+rYIuo+XP4aYI3cyWhZq1rgvzSyJlTA7JBv+3j
 YKBlqEKrfIJ1Qgcf+gQbbdYCR1zashYHIvMfvrCGwxrN48hHNXgpPy6QDN6yWpp0RbR6
 Gzx7LqLqu0TrUgwqotqSiuPvegCVqD+e6axKeZ48dmKOtUK8bK4JwTXoYzzOmqLt2vUe
 2UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/OhssSczJVbMJGYs6E9M45NQ4kpIeIUWJ7tzrr8g1OM=;
 b=idy3U6KuvusvkTyJ+uFv+MKi1KUXvtYAUHgUQ+LN3+TFX1o9i9Xb4/sTaBDNMMX4n2
 gLweUq8AgNS5Sp4QIqfyL6KktPX6RABPcIus2F3zIP8HOJ/f0I92G1pdjocGLvfMRHaS
 Q47j9CQaa6SP7GWqucJzEpUBVxwaHGuNcrY4nGcJ2vK47hzkZxNo3RmkBu9vsZwX7whT
 UvTn1XBUsO7BzqrdpZeWSXzv1GI8NH6O44Z0CzHc/OqaanuZ0nFrdJgG1HXYg7dHPp9t
 ghYhHQT8EhB0kZEdP8A+8J3h+kpywS9kJF5vvQoU9hnLyZQv2TND0yvmgRG5J9oCsxZE
 dOjQ==
X-Gm-Message-State: AOAM533XvzVhv52OWdwIQYdaF5mHaP3luwZ6WxVPuK1D2Dv1EdtEI5VX
 ZJIPB/au3oBkcTzUJWET9KZMltVcOWHm6kI6
X-Google-Smtp-Source: ABdhPJzcfB1rWLMgwXAOEDfnYyhwMcNdNad7ozG0Ud4Oy+pfp67VetJ/shGdV00tk9KFQBtYwln+Vw==
X-Received: by 2002:a62:784a:: with SMTP id t71mr10215347pfc.56.1644543107252; 
 Thu, 10 Feb 2022 17:31:47 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/34] linux-user/include/host/sparc64: Fix host_sigcontext
Date: Fri, 11 Feb 2022 12:30:30 +1100
Message-Id: <20220211013059.17994-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sparc64 is unique on linux in *not* passing ucontext_t as
the third argument to a SA_SIGINFO handler.  It passes the
old struct sigcontext instead.

Set both pc and npc in host_signal_set_pc.

Fixes: 8b5bd461935b ("linux-user/host/sparc: Populate host_signal.h")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/include/host/sparc64/host-signal.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/linux-user/include/host/sparc64/host-signal.h b/linux-user/include/host/sparc64/host-signal.h
index f8a8a4908d..64957c2bca 100644
--- a/linux-user/include/host/sparc64/host-signal.h
+++ b/linux-user/include/host/sparc64/host-signal.h
@@ -11,22 +11,23 @@
 #ifndef SPARC64_HOST_SIGNAL_H
 #define SPARC64_HOST_SIGNAL_H
 
-/* FIXME: the third argument to a SA_SIGINFO handler is *not* ucontext_t. */
-typedef ucontext_t host_sigcontext;
+/* The third argument to a SA_SIGINFO handler is struct sigcontext.  */
+typedef struct sigcontext host_sigcontext;
 
-static inline uintptr_t host_signal_pc(host_sigcontext *uc)
+static inline uintptr_t host_signal_pc(host_sigcontext *sc)
 {
-    return uc->uc_mcontext.mc_gregs[MC_PC];
+    return sc->sigc_regs.tpc;
 }
 
-static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
+static inline void host_signal_set_pc(host_sigcontext *sc, uintptr_t pc)
 {
-    uc->uc_mcontext.mc_gregs[MC_PC] = pc;
+    sc->sigc_regs.tpc = pc;
+    sc->sigc_regs.tnpc = pc + 4;
 }
 
-static inline void *host_signal_mask(host_sigcontext *uc)
+static inline void *host_signal_mask(host_sigcontext *sc)
 {
-    return &uc->uc_sigmask;
+    return &sc->sigc_mask;
 }
 
 static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
-- 
2.25.1


