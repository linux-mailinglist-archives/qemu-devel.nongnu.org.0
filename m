Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA23BE01C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:13:00 +0200 (CEST)
Received: from localhost ([::1]:57796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vBT-00022r-Et
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upJ-0001pB-LE
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:06 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up4-0006fk-UR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:05 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so2565225pjs.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TA71KdY0ADT8/xQwWyVtukyaxSrQMBNG8W0Sl0VZeBM=;
 b=uGTxjkZeh/eQV/fD0Uw2pfruz52ZtfAbIYdKNopyxuwqTtj9Q/7r++tuLg0gsgy8s/
 igs7MOUmkX+EML5WaXupNTkLRZn3JB0DlL1iNBuVuLgIzVHfaLs2Kg2T/57P37uulxe4
 0ZUTlGB2g0HwL/uvqO5bj8hRhlCuF/c7I8A4r9iOrdi+10nbVKAtELb2/7lSankh2rD1
 /LWBrdLksOlF1Lg/CxgUu6c0qGht7AxekQQZ3feZdmKyWpWnHYlluc6aQV1nN8okg1sA
 48t2+/cUUqUWvddX8shSdpONPcjFREh+GiIdtgAQAWM0FtJxPhvIE70WI/VpD9Hmrati
 Uy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TA71KdY0ADT8/xQwWyVtukyaxSrQMBNG8W0Sl0VZeBM=;
 b=Iv07GgCdO1Od/Tur0pHQuFgdCSH5o90driPuJaqfj8Q20n3afiz9mOlrUNQEI+DHRZ
 2oVts4+F6TGpojgvFFfIY4Df3wzgXTGRHSxLW+iIaMHKjZNOKLBuOSInd0HsbxXYuM4s
 JVWzKpok2i7jvE59rn5V6HdI/qvuW1DiI1qGxdgxLdG4pThn5jAdxmRxsRbFN3UtBslZ
 OYyMgkRw1AtHF7L/C5h06f+7VpOrSagTMRiC2DAy3vME2e5l655b3ulzxjP1xDb5soUk
 SiOoiGdpjWhSJ9xZBJmZwVwmcL3K4Dq7cj00MfSUikmkUOM4blfOq4V2gOr379I7++mU
 TleA==
X-Gm-Message-State: AOAM531LzmUrz0n9zn6fq51gU8SfZ5glyOymPqLD0v7678ThkHM0RmNg
 CMwyD4lM7hfUxYsniIgla6+npl3pQBDWBQ==
X-Google-Smtp-Source: ABdhPJwIix57k8pCP8KXmVBiDWfkAkapcdg+0tcZbaBwZeXQt5vNiga0jSOI7PbRvqmq6HUHJhMLeA==
X-Received: by 2002:a17:90a:c484:: with SMTP id
 j4mr19842800pjt.218.1625615389469; 
 Tue, 06 Jul 2021 16:49:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/36] linux-user/microblaze: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:21 -0700
Message-Id: <20210706234932.356913-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


