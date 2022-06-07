Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4473541F7C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:29:04 +0200 (CEST)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyidD-0007Kd-Uy
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyhef-0005in-Nr
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:26:29 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyheX-0007vO-Ax
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:26:29 -0400
Received: by mail-pl1-x62a.google.com with SMTP id b5so15995724plx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 15:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bOpw6kxmi87dpdkEkilkb5+DQd7aJjfziEI5ji+nxm4=;
 b=hyzrz15TYzUF17CeVLOonEZS2zzErQPIL2uYxRGmTETIlRNsAHKxpdgD9chnNAzjQr
 9LktInSlaClMX1CmWSeGtk0cooyYVd6m4GoU6p9EQ2x5m/xk2SehCe3zGiWo0yOI6txj
 zz4VAEExk+GvtQCbbR/UmzLgEoDBF/jhV4tHXrbscLDjaZPc9axPvws4Unp0J9QE4585
 NwPjSU9C0OIWHKhpzfXKOgr2DztlHEZvKcMV3rFmmREcIUtHLtQIpG7FehvEw8nTvhr3
 ktkMTudLg9CvMtEh35LxOfuFUYCnqX+7GO3XlxfzTH+VQdkBN0w++n1MXUW+cyVCP08r
 t0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bOpw6kxmi87dpdkEkilkb5+DQd7aJjfziEI5ji+nxm4=;
 b=kFSZjcDx9w3DtbS8g9PO5JH2Z2FqqSVeA8rDiFLEUduoTmwe9BRfGA3NfwxctQHRru
 b7k5bfnd2qp5nghl1zoxyJA2Wi4VVvM7jwJmJ5tj+IV4Au0CkeQQ7YHFKjsGpTti5QxH
 SkCzeo6mpJVOT2itoiFEqgmRbtrKNfrjYGBJjInNgCzhg495znvRY+q0ibY/IC+PAa/M
 qPPianFtxwpOjlokhBDJ8YM5svs97MUsTeTNrKgymt4YgMyhvXc2ePri6pYl9Xs/irg0
 Gv0ZWcDgM5sTJ8Q+2J1cAaJZp8Bj1lSRqMMAwX7Q1gxkf+K523ReyiBhd5FwIuYDzeN3
 7qFw==
X-Gm-Message-State: AOAM530vwckwH2NHQYEc4Vfe1WbZn1m7FKEo0mrwOHQkOu+4JzaCNvnB
 m+j1w+gSaX7qWpR9mCjGAlRqhd7lBJ0cqQ==
X-Google-Smtp-Source: ABdhPJxrwt54PEnIg1/YqESMnCUGZIJh/6tCWQ9K5CCYY2b+PUF08ZzlYwQXjz2Ls0y8gbH0HiHRiQ==
X-Received: by 2002:a17:902:f64c:b0:156:7ceb:b579 with SMTP id
 m12-20020a170902f64c00b001567cebb579mr30456157plg.73.1654640779883; 
 Tue, 07 Jun 2022 15:26:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a17090ae4d300b001e2fade86c1sm15112133pju.2.2022.06.07.15.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 15:26:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v4 2/3] target/m68k: Make semihosting system only
Date: Tue,  7 Jun 2022 15:26:15 -0700
Message-Id: <20220607222616.717435-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607222616.717435-1-richard.henderson@linaro.org>
References: <20220607222616.717435-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 target/m68k/m68k-semi.c    | 36 ------------------------------------
 target/m68k/meson.build    |  6 ++++--
 3 files changed, 4 insertions(+), 43 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 3d3033155f..caead1cb74 100644
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
index 37b409b0b9..d0697ddbd1 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -21,13 +21,8 @@
 
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#if defined(CONFIG_USER_ONLY)
-#include "qemu.h"
-#define SEMIHOSTING_HEAP_SIZE (128 * 1024 * 1024)
-#else
 #include "semihosting/softmmu-uaccess.h"
 #include "hw/boards.h"
-#endif
 #include "qemu/log.h"
 
 #define HOSTED_EXIT  0
@@ -377,43 +372,12 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
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


