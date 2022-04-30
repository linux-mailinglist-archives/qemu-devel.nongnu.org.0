Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE01515DEE
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:57:34 +0200 (CEST)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknbJ-0005XT-4s
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAp-00052G-GK
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:12 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAn-0006Wd-SA
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:11 -0400
Received: by mail-pl1-x62f.google.com with SMTP id p6so9292421plf.9
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7t75AdkHW0PfbXkAsxv9MftHWj0Q+Sv53bh3Cjx9bU=;
 b=RUOK++L1aSRINe+5iBfBfh8Lpq02+5rb8zr4OIQOw1ySFrrOUChrB7f0T+BY5eBtk7
 GXwBoCXE8YfqaQzyM2uaDJyyKffee/+Aim/Hx8wt4EbMvvTE8IkYhfaBhnivo0kQB7U3
 gNILVed/vNTJ0obBzOFEq38exqL8rwfUw57SV9aF4YkPzB2+lGWmLzMuVw9ByRYg164D
 t+YIFmfv1GJhk7Y4hafsZluYgkw/fUKlARTJOzFbDl1Mw4fn6b9SFi22C7kKmBWTsf/h
 DRud+b3drAdbvkYjHE9CNLztP63Rc9ELy+31s689Eg+gOp2uua0+aHVSxw/qzpCJfdEZ
 nbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7t75AdkHW0PfbXkAsxv9MftHWj0Q+Sv53bh3Cjx9bU=;
 b=Nochwi5QtQbxXUCg8+9n5TetjQ6pR9YcTHcFWPxQw87BxhZW0ZCM9rq19qTJS6qAmx
 eh2/EyLViPKHD8gKiVKjYmHXuGVSGrgQwELvX32ZLXf2h9zK32KlZrngb9wWxaNeQjem
 GBi/XtwnhfNlZG2bfvunUUBz1vxsP9KWps/2DdW83pAakDP/4QNlKK3Rc79os/ISmRDB
 omMqe5qsuO+HrI7Yu8kCKHBDNAXnUTLJcqMWVl/5R89j/fPrA6joL7ATzcYHq3RCPfUj
 bpBfO6ALcqWG4dtWVd4WZrcbjFG2wi1g72hy6gz85O0+9MN5hW7SmDFuIw8Nb8rF13Jh
 T2Fg==
X-Gm-Message-State: AOAM530xB829eq4+xo/N4t+owdeypcjb0pvsYyAdbvBiwUrLBw30EFW6
 npMuQxiFPV3xD/Jvw8t4TtvJEgcj9ICpEQ==
X-Google-Smtp-Source: ABdhPJx7erLiMC8LIQPMvTIuSRSZj9R0b62sGiH5XQVL2v0niw5KZa+DVSGmtiBt/QBHzjGaL7aIRQ==
X-Received: by 2002:a17:90b:17c3:b0:1dc:3f12:1dbc with SMTP id
 me3-20020a17090b17c300b001dc3f121dbcmr515562pjb.169.1651325408568; 
 Sat, 30 Apr 2022 06:30:08 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 35/43] target/m68k: Make semihosting system only
Date: Sat, 30 Apr 2022 06:29:24 -0700
Message-Id: <20220430132932.324018-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we had a call to do_m68k_semihosting in linux-user, it
wasn't actually reachable.  We don't include DISAS_INSN(halt)
as an instruction unless system mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c |  5 -----
 target/m68k/m68k-semi.c    | 37 +------------------------------------
 target/m68k/meson.build    |  6 ++++--
 3 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index d1bf8548b7..fa6aa112cb 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -36,11 +36,6 @@ void cpu_loop(CPUM68KState *env)
         process_queued_cpu_work(cs);
 
         switch(trapnr) {
-        case EXCP_HALT_INSN:
-            /* Semihosing syscall.  */
-            env->pc += 4;
-            do_m68k_semihosting(env, env->dregs[0]);
-            break;
         case EXCP_ILLEGAL:
         case EXCP_LINEA:
         case EXCP_LINEF:
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 5b4c51957e..4b5621a101 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -21,13 +21,9 @@
 
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#if defined(CONFIG_USER_ONLY)
-#include "qemu.h"
-#define SEMIHOSTING_HEAP_SIZE (128 * 1024 * 1024)
-#else
+#include "semihosting/guestfd.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "hw/boards.h"
-#endif
 #include "qemu/log.h"
 
 #define HOSTED_EXIT  0
@@ -375,43 +371,12 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         }
         break;
     case HOSTED_INIT_SIM:
-#if defined(CONFIG_USER_ONLY)
-        {
-        CPUState *cs = env_cpu(env);
-        TaskState *ts = cs->opaque;
-        /* Allocate the heap using sbrk.  */
-        if (!ts->heap_limit) {
-            abi_ulong ret;
-            uint32_t size;
-            uint32_t base;
-
-            base = do_brk(0);
-            size = SEMIHOSTING_HEAP_SIZE;
-            /* Try a big heap, and reduce the size if that fails.  */
-            for (;;) {
-                ret = do_brk(base + size);
-                if (ret >= (base + size)) {
-                    break;
-                }
-                size >>= 1;
-            }
-            ts->heap_limit = base + size;
-        }
-        /*
-         * This call may happen before we have writable memory, so return
-         * values directly in registers.
-         */
-        env->dregs[1] = ts->heap_limit;
-        env->aregs[7] = ts->stack_base;
-        }
-#else
         /*
          * FIXME: This is wrong for boards where RAM does not start at
          * address zero.
          */
         env->dregs[1] = current_machine->ram_size;
         env->aregs[7] = current_machine->ram_size;
-#endif
         return;
     default:
         cpu_abort(env_cpu(env), "Unsupported semihosting syscall %d\n", nr);
diff --git a/target/m68k/meson.build b/target/m68k/meson.build
index 05cd9fbd1e..27d2d7ba87 100644
--- a/target/m68k/meson.build
+++ b/target/m68k/meson.build
@@ -4,14 +4,16 @@ m68k_ss.add(files(
   'fpu_helper.c',
   'gdbstub.c',
   'helper.c',
-  'm68k-semi.c',
   'op_helper.c',
   'softfloat.c',
   'translate.c',
 ))
 
 m68k_softmmu_ss = ss.source_set()
-m68k_softmmu_ss.add(files('monitor.c'))
+m68k_softmmu_ss.add(files(
+  'm68k-semi.c',
+  'monitor.c'
+))
 
 target_arch += {'m68k': m68k_ss}
 target_softmmu_arch += {'m68k': m68k_softmmu_ss}
-- 
2.34.1


