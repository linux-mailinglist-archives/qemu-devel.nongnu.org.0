Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002523F3D68
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:06:41 +0200 (CEST)
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHekr-0002Du-0e
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaJ-0007nn-NY
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:47 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaI-0000d8-4p
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:47 -0400
Received: by mail-pg1-x530.google.com with SMTP id n18so13344828pgm.12
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aaG8+wKRstXR/idWhImzrCGyhK5/kWZ1S3StnyK++N8=;
 b=JhSE/FCD9VpeiNgtOctsp8rBwzZ3IWhSLO/0K0C75LXZxUnzmJT06E5gmwz8kVIBxo
 42i+SDOuvpRUWX/gVHzjRT9xn9ioLdgafmnxhksVVDRIsM/LMGLj7EpCbUAWrEAtNcNq
 etwYjwJAk7fsJhVtbZwZbsrnlQQf2csbX82lxG3OpfJsMJNzN9qcmZJ0ZMvBmBDG1xzU
 0ASOvagUhCEBNtUPS3824vah4EBnELLkhGPm3If0lhnaCPnoZHjl9oFl/rmYi+4HEPzC
 ogbSWtWEOWD31DQjeWSs80TX7ia2Y1JcAGIxwdNLAj5a9JDniZ5HDnJFaeIpzr3eouXc
 Gihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aaG8+wKRstXR/idWhImzrCGyhK5/kWZ1S3StnyK++N8=;
 b=PuT0Fd3IAAFDmo09/vZb7qI8Wl9vdrCX9MSPaA+PxfYtBI1b28NBfgKsCB7bcCcMci
 Q19OUpfjl85TWy2ZzflAp86+qlfCYXk2OiNYK3RPEq3Nr4kxe0GYL47Qq8v9tkEUjWbb
 Kh48fIBNnr47RlKE0myN/VrsUrNEJ9a2PLmQvapJ1AL4F61i32O/BCjqs8V3h8bUtl7K
 /F6cDP6nNw5LjtdcnPc4+o3XpK2RoHcRRIn1HZmimNhdoS7CGdfFZsxkOT5pTXbF2Ck1
 m5q6Eoo56FgQz/weTPduWOozhCS//VQKhENTg3uptV67/wXT/mjvkmBv7SA5bJmg/8Go
 k/Qg==
X-Gm-Message-State: AOAM530B73ckA381ohqiiCs0VQXSs+1aDTqd8HPT6uJXSLbog1G8iZHq
 NXJ8wQbztfQccd4DIuwrjsfA8ZdzdngWCA==
X-Google-Smtp-Source: ABdhPJzl0gghGWHhkr4q7hrIXU1stsx7iSekDlT2ZhZf2GwHYvnt+IKysF93KU9xAjZ+hYL0fe4Arw==
X-Received: by 2002:a63:2585:: with SMTP id
 l127mr26702754pgl.264.1629604544819; 
 Sat, 21 Aug 2021 20:55:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/30] linux-user/alpha: Set TRAP_UNK for bugchk and
 unknown gentrap
Date: Sat, 21 Aug 2021 20:55:16 -0700
Message-Id: <20210822035537.283193-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These si_codes were changed in 535906c684fca, for linux 4.17.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h   | 1 +
 linux-user/alpha/cpu_loop.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a5ce487dcc..55ccc6ae03 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -715,6 +715,7 @@ typedef struct target_siginfo {
 #define TARGET_TRAP_TRACE	(2)	/* process trace trap */
 #define TARGET_TRAP_BRANCH      (3)     /* process taken branch trap */
 #define TARGET_TRAP_HWBKPT      (4)     /* hardware breakpoint/watchpoint */
+#define TARGET_TRAP_UNK         (5)     /* undiagnosed trap */
 
 struct target_rlimit {
         abi_ulong   rlim_cur;
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 7ce2461a02..b2e9503c50 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -99,7 +99,7 @@ void cpu_loop(CPUAlphaState *env)
                 /* BUGCHK */
                 info.si_signo = TARGET_SIGTRAP;
                 info.si_errno = 0;
-                info.si_code = 0;
+                info.si_code = TARGET_TRAP_UNK;
                 info._sifields._sigfault._addr = env->pc;
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
                 break;
@@ -168,7 +168,7 @@ void cpu_loop(CPUAlphaState *env)
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-                    info.si_code = 0;
+                    info.si_code = TARGET_TRAP_UNK;
                     break;
                 }
                 info.si_errno = 0;
-- 
2.25.1


