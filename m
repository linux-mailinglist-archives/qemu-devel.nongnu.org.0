Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6993AD307
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:40:50 +0200 (CEST)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKMC-00067t-Jr
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBr-0001gx-Jh
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:08 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBj-0001T6-Nq
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id k6so8420080pfk.12
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xpu2YK19uuJHVJ3NNjszM1h9FJEm/LgeiKDUdqCp49o=;
 b=w/8jmxyBSKlvXRwDrwQgpovS6jdC54Ol5itVKLEOrJ3pdVj9Xyzqo9NjU1wkuiQlKq
 0gxhhGClhOl950E/flYjrAnYb3zkYcEiLqcGyBTSVyJiOgz3ga/9maTlGwurmDmnVrVl
 0hxoOb2j7Sff9T4vhZ76gRRB/lGELv2E93CXBCU0zXCrvhw/W0kJEqDliFA/6fRByb31
 8+m5kjaBayrCXjr5f8RQYIfvx9PMbB71UlxLil9EzaxIMXcM3fZL6BaunP6SKsHuZaoe
 rMv00ojo/EOHMZhZEvFIY+5j5e4GOZJfkQ5gA9VyMlWo/YsTjpiPk9DWViVzVzgU3vJJ
 Lwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xpu2YK19uuJHVJ3NNjszM1h9FJEm/LgeiKDUdqCp49o=;
 b=CVWnzKyB46jUCSm4fyMs5odknbkUJ2B/+E6CUkpIshZGstGbpqRCXO8B+IMAAYPotI
 BHha2JVtTPZJoI0WDilCdMQ/49oh8Yw3blM9J5GMkD2Nmmr5RPCBlJM5Wk7AI5cH+IDA
 GBeWe7RQowWCpBT0EhRZXcQFUIIfaqVgZLuZ18hFh5JnmlenCVdNzabdi1PxIFT8qvBl
 vkHbAhLrsBQXYKbCAcjD0bh+xFw1LyR76edRry6mah1e/N5ZOH2shXXyU8r9ptvcgNh8
 Oc2PBcbmU+GyBujxpbs8ZMzN87TIADxe3pJZtt413zShQh4NxwF2LEKq2ovFFgP8h024
 ZyrQ==
X-Gm-Message-State: AOAM5305Najp5LU5a/NYVDgigVTfdG4H3rh3vJ5eFcTDQihNrVxcmz48
 QmEPz1WqXpGPoLQiOJiw9DoUbR5Myxp6KQ==
X-Google-Smtp-Source: ABdhPJza+epWZI6KmSqgvlpo/vVJSkgn86poDdwFaWTR3WxX1CW2mIIxBu2UIc2d2q8ML3SMrws9oQ==
X-Received: by 2002:a05:6a00:1344:b029:2f6:5ce3:218e with SMTP id
 k4-20020a056a001344b02902f65ce3218emr6600467pfu.80.1624044598536; 
 Fri, 18 Jun 2021 12:29:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/23] linux-user/m68k: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:39 -0700
Message-Id: <20210618192951.125651-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/target_signal.h |  2 ++
 linux-user/m68k/signal.c        | 47 +++++++++++++++------------------
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/linux-user/m68k/target_signal.h b/linux-user/m68k/target_signal.h
index d096544ef8..94157bf1f4 100644
--- a/linux-user/m68k/target_signal.h
+++ b/linux-user/m68k/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* M68K_TARGET_SIGNAL_H */
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index d06230655e..b4fade1ed6 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -38,7 +38,6 @@ struct target_sigframe
     int sig;
     int code;
     abi_ulong psc;
-    char retcode[8];
     abi_ulong extramask[TARGET_NSIG_WORDS-1];
     struct target_sigcontext sc;
 };
@@ -75,7 +74,6 @@ struct target_rt_sigframe
     int sig;
     abi_ulong pinfo;
     abi_ulong puc;
-    char retcode[8];
     struct target_siginfo info;
     struct target_ucontext uc;
 };
@@ -129,7 +127,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
 {
     struct target_sigframe *frame;
     abi_ulong frame_addr;
-    abi_ulong retcode_addr;
     abi_ulong sc_addr;
     int i;
 
@@ -151,16 +148,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     }
 
     /* Set up to return from userspace.  */
-
-    retcode_addr = frame_addr + offsetof(struct target_sigframe, retcode);
-    __put_user(retcode_addr, &frame->pretcode);
-
-    /* moveq #,d0; trap #0 */
-
-    __put_user(0x70004e40 + (TARGET_NR_sigreturn << 16),
-               (uint32_t *)(frame->retcode));
-
-    /* Set up to return from userspace */
+    __put_user(default_sigreturn, &frame->pretcode);
 
     env->aregs[7] = frame_addr;
     env->pc = ka->_sa_handler;
@@ -287,7 +275,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 {
     struct target_rt_sigframe *frame;
     abi_ulong frame_addr;
-    abi_ulong retcode_addr;
     abi_ulong info_addr;
     abi_ulong uc_addr;
     int err = 0;
@@ -324,17 +311,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     }
 
     /* Set up to return from userspace.  */
-
-    retcode_addr = frame_addr + offsetof(struct target_sigframe, retcode);
-    __put_user(retcode_addr, &frame->pretcode);
-
-    /* moveq #,d0; notb d0; trap #0 */
-
-    __put_user(0x70004600 + ((TARGET_NR_rt_sigreturn ^ 0xff) << 16),
-               (uint32_t *)(frame->retcode + 0));
-    __put_user(0x4e40, (uint16_t *)(frame->retcode + 4));
-
-    /* Set up to return from userspace */
+    __put_user(default_rt_sigreturn, &frame->pretcode);
 
     env->aregs[7] = frame_addr;
     env->pc = ka->_sa_handler;
@@ -410,3 +387,23 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    void *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 + 6, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+
+    /* moveq #,d0; trap #0 */
+    __put_user(0x70004e40 + (TARGET_NR_sigreturn << 16), (uint32_t *)tramp);
+
+    default_rt_sigreturn = sigtramp_page + 4;
+
+    /* moveq #,d0; notb d0; trap #0 */
+    __put_user(0x70004600 + ((TARGET_NR_rt_sigreturn ^ 0xff) << 16),
+               (uint32_t *)(tramp + 4));
+    __put_user(0x4e40, (uint16_t *)(tramp + 8));
+
+    unlock_user(tramp, sigtramp_page, 4 + 6);
+}
-- 
2.25.1


