Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A838941C5BC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:34:18 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZiz-0006LK-OK
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIQ-0007aE-0v
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:52 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:33309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIO-0006Q7-Dt
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:49 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 d12-20020a05683025cc00b0054d8486c6b8so2822749otu.0
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z6sdM0HHcKJX3xm0cdq26GIq2QyBnBfucTBir90HJQ8=;
 b=fChyf+60poumwB4KWy1JYYveh7q8+eXjWF484pqsz7vpfZmCOQxFadbX6gGrdKdnYN
 Ci3xEYmvVxQY0EEQE+etU/BjYApOKcIRkXQ2CSavKxT2u232Fr0VpNrkxXy4gLPCB0re
 xKJX8DiAG1/9LEP7/Gevx0n91Ck+YadF1FzGSol6TuX6asEmFTZ8o1OC76VAVAnSTVjn
 h+suH5QwBw1r2oqazzuX5o5UJjDvWTR3N5WJ9acwezj8Thb3GUuX5CLPO3XIznIfgOf1
 CJ1Qi+m/A9VScTbTPeeVQPPXECWXiJJMIX1ln+u4tlxxpuh7ZK5zrpcTgpaX1NfkNoK4
 EIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z6sdM0HHcKJX3xm0cdq26GIq2QyBnBfucTBir90HJQ8=;
 b=scSnQzp2RnGQj62GKrbTOE2/XdKO4j/FYF+1FbAryYw+Lwogq/JzFRk1zGfsV2AmUW
 QzgQdDeLGl6C4vvE2+32vaLHh/vCKzrhhNsb4LbLocruYF1ulmUSM3QL6AKNboFEXQk0
 CZ2QkiMSvk1IbPOAbzBA5Mq2kkjSv90snBWNqP1q171oW38d0qzgyX/zAtR32duWawvv
 KJ14H/CQ6aRaRUmmLE76lQ9/Mf0dWU+8Kng6DhfVrUyRb0S2ErpDFiBUeywxTqp0CMzL
 QJu80L8H+rcH6cvwua3LEHWifAzCiB3cSNOZiS2Zt+Ovmx4u7xNHnmwldkF0E+Oh1cNl
 c7mA==
X-Gm-Message-State: AOAM532/JfBNvUBzOf2KkAvwZUG03AWtwVwZQuIozI36EtJCbmMUOv5K
 E5asph4xqtZ7CAlxiP3JR/pvJ+4NEC1FQg==
X-Google-Smtp-Source: ABdhPJyb/z246KbbQcmSMSCLGSavrbNezmYAJD0KJ/qmQ+XyM9NFwpNP1LxQEpfzySxTFQqwAdrOBg==
X-Received: by 2002:a05:6830:14ce:: with SMTP id
 t14mr10365204otq.250.1632920804843; 
 Wed, 29 Sep 2021 06:06:44 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/26] linux-user/s390x: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:48 -0400
Message-Id: <20210929130553.121567-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Cc: qemu-s390x@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: qemu-s390x@nongnu.org
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/target_signal.h |  2 ++
 linux-user/s390x/signal.c        | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/linux-user/s390x/target_signal.h b/linux-user/s390x/target_signal.h
index bbfc464d44..64f5f42201 100644
--- a/linux-user/s390x/target_signal.h
+++ b/linux-user/s390x/target_signal.h
@@ -19,4 +19,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* S390X_TARGET_SIGNAL_H */
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 80f34086d7..676b948147 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -68,7 +68,6 @@ typedef struct {
     target_sigregs sregs;
     int signo;
     target_sigregs_ext sregs_ext;
-    uint16_t retcode;
 } sigframe;
 
 #define TARGET_UC_VXRS 2
@@ -85,7 +84,6 @@ struct target_ucontext {
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
-    uint16_t retcode;
     struct target_siginfo info;
     struct target_ucontext uc;
 } rt_sigframe;
@@ -209,9 +207,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(sigframe, retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
-                   &frame->retcode);
+        restorer = default_sigreturn;
     }
 
     /* Set up registers for signal handler */
@@ -262,9 +258,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(typeof(*frame), retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
-                   &frame->retcode);
+        restorer = default_rt_sigreturn;
     }
 
     /* Create siginfo on the signal stack. */
@@ -405,3 +399,17 @@ long do_rt_sigreturn(CPUS390XState *env)
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 + 2, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn, &tramp[0]);
+
+    default_rt_sigreturn = sigtramp_page + 2;
+    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn, &tramp[1]);
+
+    unlock_user(tramp, sigtramp_page, 2 + 2);
+}
-- 
2.25.1


