Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3A9518EDB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:32:47 +0200 (CEST)
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzCQ-0005bN-DW
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZZ-00088A-7J
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:37 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZX-0006Ju-G9
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:36 -0400
Received: by mail-pf1-x42d.google.com with SMTP id v11so6100304pff.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V7t75AdkHW0PfbXkAsxv9MftHWj0Q+Sv53bh3Cjx9bU=;
 b=kP2ub37soMbISTYZmNSoTeOIKjTqgsc6T6QH6Mi4kduOyp06oeMxlIbnoDCuW9is7M
 kMQWX+n1m5bBv5Nr8esseJZWFb40+CMcBhfs4mrRw88sjH5sDtDB2wzPbvyFeuv4IRlI
 QvMjg7kahaVd6oT0OCMRNg6pOxpapb2LvzZ6IaBkPV7k3H1ePG1+2KZnf0Oz4A7q+m6R
 47UhyQXwRkg728RmMqfYpOuLDYPIooQV40cCVFW1aM3bIMpB4a2USNHkrxMaT0hxUvuD
 hzs2RBjTl02XxjsymnJkUMD57JkN/BLdmtFrizPg0Xq08e5pG7HwN141Pj9HhLmDVJe5
 fccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7t75AdkHW0PfbXkAsxv9MftHWj0Q+Sv53bh3Cjx9bU=;
 b=kyCgjhd6tWraIGcZUxDO/HgSBW9JGrjOrAcxFzmZglUg3/Ir+enzeIC4yYYUJTeHhi
 E2BWNy75/oFEKDJRefzumPZoD1MStOp2Z5t8br8QAVdTF7EbFjoGcSKHKOI2SmCvzLHf
 EyGMzw+HkgffCiw3Mozqvg67G8/n5XA5HFs5xpRPlw1owqOx2vmh4275Dgxy5DtSaaws
 +ooRIPXZeKr+3vdACZq/KtHoxqHr/v7ukpBU9OlMSr9OFYtlc/v3Ql46k6mO3u5PQLhC
 +rxruWi7LUG20KwIQFS49eAdxANa/KuALLtrhnz60B44ecM+SH7abE4HC5cTq/BCiJG1
 tvnQ==
X-Gm-Message-State: AOAM531unzUZ7RFA+dq/TlXS6GUFG6zE0ceu54yj0ZMAvG7fWGqXIFqT
 TuY4cchAJbxbTLNRG/JTrkhlQzdurowoaQ==
X-Google-Smtp-Source: ABdhPJyqnmNw+xhPTXGqv3uC5+zPxRGQC80LYt4mH/w7JBb9UmD7e3OqKzQZD+Aur7YxEIm33+iJoA==
X-Received: by 2002:a05:6a00:24cc:b0:50d:58bf:5104 with SMTP id
 d12-20020a056a0024cc00b0050d58bf5104mr17686124pfv.36.1651607554017; 
 Tue, 03 May 2022 12:52:34 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 49/74] target/m68k: Make semihosting system only
Date: Tue,  3 May 2022 12:48:18 -0700
Message-Id: <20220503194843.1379101-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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


