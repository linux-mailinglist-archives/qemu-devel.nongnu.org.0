Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C129C36AAE8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:02:00 +0200 (CEST)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larVW-00088u-2I
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNn-00082g-GU
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:59 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNe-0007ap-1q
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id p17so2241074plf.12
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8X2zO03TJt4CS4kEskEmYiM2hl5KYuyxMDL0WRDKy+4=;
 b=NvDLXBwSeYyk2kdp5sGZ/m76MRFTLTFwL4NOtXc6yteuy0vZlJF1rqDkq4BaeOJ3qw
 0I963gxd9BfQ0eYc7a5uZw6+mxHBWbCFzVmf62AWwULEGrblK8z5OVVLSYo4MhlTZtKF
 jAXgZ7H6rhrGK3CkjVyLTHeD8BsqEzJ4rzPcrfGBnh7eHFt/91f9tkpFfa2lPtwy477i
 rfQEiiv5FGGy5YM8/BfDr+9Io7f0QkX59/MoqIjxNVFWkWY2bWQJKDVpS4TZnwhnopUY
 7CebqEYR/G1C+RQRcWFl83UpHKnc4hzJ8uTrFvbeIU3fnlMVW8e+7TevQYALCbjPyT04
 Vb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8X2zO03TJt4CS4kEskEmYiM2hl5KYuyxMDL0WRDKy+4=;
 b=h0O/ii0qbViK5yLjfEUEYcFxG4UrMcyakwZ7Zt/IjUtJwEwFObsIMqx1g9emR9XSw5
 kF4quPsJiBM7MZqGEwc+q7Ca/MZWL6K/5Mo3evrmq0plVSyFQvdFVs21vTHIyKDYz7h5
 1Q413m2Vw+99sDUlhJ1lv3dSWjcBeP0+N/BuqLKVGOjWXtAGFY7wNdBFXZ95go8PtjUX
 rJ4IRREk2LnNUJQaBf10tKAJJm1WmCW+kCNl8nMfxIN2R+YPYBt0THZ4wQVGtjg5a+ZI
 lluuMLWtsVHhkAvNUC++0mmfQ2k4m9UuTi9wy7si9gNZuQjhiUQ/EBTPsA4tqbtCifOU
 Dd/w==
X-Gm-Message-State: AOAM530WqkjVGwpFjTvTMmmT9heyHMMBF9Lazmk0MT/Bf/vQ8LSMjPrY
 MTntofYVkPqtbXDF+Sitoe4SVt57iFawVA==
X-Google-Smtp-Source: ABdhPJybpXmVUbgXJRlLbf88ITT4vI/Pu010m4E22+2omr2kKLNEj2xP1AaI79riSv5dLM4pUDpQhQ==
X-Received: by 2002:a17:90a:af91:: with SMTP id
 w17mr20021967pjq.205.1619405627366; 
 Sun, 25 Apr 2021 19:53:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/25] linux-user/sparc: Clean up get_sigframe
Date: Sun, 25 Apr 2021 19:53:26 -0700
Message-Id: <20210426025334.1168495-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Remove inline; fix spacing and comment format.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 69fee5a76a..57dbc72c99 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -65,24 +65,25 @@ struct target_signal_frame {
     qemu_siginfo_fpu_t fpu_state;
 };
 
-static inline abi_ulong get_sigframe(struct target_sigaction *sa, 
-                                     CPUSPARCState *env,
-                                     unsigned long framesize)
+static abi_ulong get_sigframe(struct target_sigaction *sa,
+                              CPUSPARCState *env,
+                              size_t framesize)
 {
     abi_ulong sp = get_sp_from_cpustate(env);
 
     /*
      * If we are on the alternate signal stack and would overflow it, don't.
      * Return an always-bogus address instead so we will die with SIGSEGV.
-         */
+     */
     if (on_sig_stack(sp) && !likely(on_sig_stack(sp - framesize))) {
-            return -1;
+        return -1;
     }
 
     /* This is the X/Open sanctioned signal stack switching.  */
     sp = target_sigsp(sp, sa) - framesize;
 
-    /* Always align the stack frame.  This handles two cases.  First,
+    /*
+     * Always align the stack frame.  This handles two cases.  First,
      * sigaltstack need not be mindful of platform specific stack
      * alignment.  Second, if we took this signal because the stack
      * is not aligned properly, we'd like to take the signal cleanly
-- 
2.25.1


