Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5D55BF74
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:34:50 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66gK-0004OQ-ML
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jv-0002MP-9t
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:27 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jt-0000a6-Kp
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:27 -0400
Received: by mail-pg1-x530.google.com with SMTP id 9so11074535pgd.7
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOSJj8VCPFHmlYdoQtcKShj3B4Hf2mnMJRAlgJxNn5k=;
 b=ZQSdHDs0EGAoR01+DKW88oOMGPaOaHHE3JuU78ENscPXUV+vv2F6Nzq4Sg/sloQZu5
 1AVS1FG+GKvjE+8I125cvBGoa/g0ew34CcqP6JvEcNEdrjx5ROGyPkPxGRStP/Ww9py9
 bT9CrXdd6wQwMlGvFM28O+xX203i4p63gOhHpUoTrr/GtORgFY74RyVeflrdxCih5ywF
 /Z91m/7/4FRGGJTBg8/R8At3RSs/H/oJnk1pbg6maO7yeTURgcrDSedz6+bpAOsqFzHT
 agkGHEsIWDArtHFGNlAUk3ILnCgTQ64T4x3oKMSBewLgXn+2wWjnqmdoxuOnOOVjflEj
 RXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOSJj8VCPFHmlYdoQtcKShj3B4Hf2mnMJRAlgJxNn5k=;
 b=zNqM5ZosNHv7xccuC+f17YpALYUEUTymoQBtEQHGt7b1CiOsTAb+VQVgtcDYXe96hl
 cIQ+7r9mv2+vTBSc3jLjmDPXsinqVYAUppJeX35INdUYW1ouJThEVlXP7Wryb18itlI8
 gIBuZ86pdwH7v1SNdw6/uLz8z/CX6omnmcJi8cyLh5C3VoQGNFIuzCMLM9XibgNsLqV2
 JnolC47IbAYoZjFKlvavbhFnyJweHPaeBTD67C4T3KWQqU7WbzRVGOQ2ahDCSLTDmcfh
 8SD26DXDo9MPKIIDkveXDpaV4fKf66024RlhStHa7qU3MNqHVLngSLRgBUjEkCUeIHdx
 28/g==
X-Gm-Message-State: AJIora8UIYQWnCVHPhVZ6EpfMAPRBaf5AY3j/Lrvnjc4Mi8BwoRr0v9o
 NySJj9B8V0UTeWtGpOpPdFTdNME6f2GRbQ==
X-Google-Smtp-Source: AGRyM1tLj5TYoIJ86gSfZMmxRc8/LYGGTrArE7Km5ljF809TR6xC/EvNslGPRZazoJUeHlET0wo9qQ==
X-Received: by 2002:a63:f34a:0:b0:405:dd6:5278 with SMTP id
 t10-20020a63f34a000000b004050dd65278mr15826596pgj.359.1656392364238; 
 Mon, 27 Jun 2022 21:59:24 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 55/60] target/m68k: Make semihosting system only
Date: Tue, 28 Jun 2022 10:23:58 +0530
Message-Id: <20220628045403.508716-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
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


