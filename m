Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681913AD30D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:43:28 +0200 (CEST)
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKOl-0002Ku-9K
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBo-0001bV-Ud
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:05 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBk-0001Tx-C6
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:04 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t17so8594240pga.5
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TA71KdY0ADT8/xQwWyVtukyaxSrQMBNG8W0Sl0VZeBM=;
 b=WCgmp3xtNOWyJCeVKGGBOhtZ2erCff7jAAGZlHCJ8unArE1RjHmrV69RNVbIBNSeHR
 vHLbrlKE9lfBqsghv9OZqXccqaglsmJPDChnldYDYELnzNafPLG1wyZByH/p1hnGUe2A
 Gkqp0eUc1zhqusZMyIqgeaA+0+NwdVoYYisYhKP+PrySF6i0UEb8z8tCw8sgdvv9geA9
 WB43tRLRE4uTURIcGHaJktz4/Im5UGtpvlYnbB7yHaoRy9VmKTMQ7O5RV4noFDSpl38j
 kgTMFBXTFxM/66TrGuYkiSYF0HUIDmLKr2Hhkd7t8D9IgVPvmFipIGo0fFakxnPy7cF2
 2bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TA71KdY0ADT8/xQwWyVtukyaxSrQMBNG8W0Sl0VZeBM=;
 b=gGdt3C3znC+/C4E3jauB0QSe+uqF4FfSilk4oo79VxduiktUoteh7ZDeEL9l+G4LHJ
 AOtwxP+IqL3cDaqS+BoOzz9dBE/9kYKUWxplBJS4wPF8ScjA5k6gJInU0tenzl+3+UlT
 gS4PdtG0GTLHP/HztHCBbHpzVosAJo+MXxhL8EZ0NPVgVW54WqjpQpMe7b99Z+C5hXru
 tvPRdME/UMr4aNif/j9+rhHc8fkQCRypJOQZSHwe2lAuWKYFJAljAyDV9xdwdf3gv+RT
 VoVm1N5XfArWpVsg8NAc5awjnG/QhOaUa/ISKSomL+kjpa6sLSks5zTeflTndS3eeVkB
 LVNw==
X-Gm-Message-State: AOAM533ij5yZDalQl6TbLIHvbjKKHBikF9+h6kAkWYRb/W4kSvEjIwyr
 auwR8hNSugmfnrJzLq2gKTHSu2tFHLA7bw==
X-Google-Smtp-Source: ABdhPJxaS8D1CvsFaIoqFNRQLFBwugD169UajCuaVToqCItugqcADgEVlop6T4+tbgMF60oU8FpxKw==
X-Received: by 2002:aa7:9912:0:b029:2e9:c61d:2f27 with SMTP id
 z18-20020aa799120000b02902e9c61d2f27mr6651823pff.60.1624044599173; 
 Fri, 18 Jun 2021 12:29:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/23] linux-user/microblaze: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:40 -0700
Message-Id: <20210618192951.125651-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/target_signal.h |  2 ++
 linux-user/microblaze/signal.c        | 24 +++++++++++++++++-------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/linux-user/microblaze/target_signal.h b/linux-user/microblaze/target_signal.h
index 1c326296de..e8b510f6b1 100644
--- a/linux-user/microblaze/target_signal.h
+++ b/linux-user/microblaze/target_signal.h
@@ -21,4 +21,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* MICROBLAZE_TARGET_SIGNAL_H */
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 4c483bd8c6..aa27454931 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -160,17 +160,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Kernel does not use SA_RESTORER. */
 
-    /* addi r12, r0, __NR_sigreturn */
-    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, frame->tramp + 0);
-    /* brki r14, 0x8 */
-    __put_user(0xb9cc0008U, frame->tramp + 1);
-
     /*
      * Return from sighandler will jump to the tramp.
      * Negative 8 offset because return is rtsd r15, 8
      */
-    env->regs[15] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp) - 8;
+    env->regs[15] = default_rt_sigreturn - 8;
 
     /* Set up registers for signal handler */
     env->regs[1] = frame_addr;
@@ -219,3 +213,19 @@ long do_rt_sigreturn(CPUMBState *env)
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * addi r12, r0, __NR_rt_sigreturn
+     * brki r14, 0x8
+     */
+    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, tramp);
+    __put_user(0xb9cc0008U, tramp + 1);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


