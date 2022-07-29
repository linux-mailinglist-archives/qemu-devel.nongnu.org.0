Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F5958573A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:15:17 +0200 (CEST)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZCO-00012j-QS
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ4D-0003am-PS
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:50 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ3y-0001sy-2a
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:49 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q16so5058514pgq.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2LHdwmKsbt7AaEVYQPi9ZpWVFkuaCwouj850ieoIXdQ=;
 b=CGRv/P1JHYI2ToBW5Dm/c7qo6Q0nu/ag+02wMJGky17bJ7WkUmcww+YZRvt7sP32Sm
 ZC4N2O0fxsYiLSCzV4AsiBcj6m+9y2rX7+sXPmAydgFy+ADmk5iYRFSLO+Ar3ylVtS8q
 SV7VMzLdqj5/Ddn8K/lmwjNBlt1QXvLzeknZX4c0Drw4vBmved63xIiQh945tU5d7u2O
 pd8/DBc90gaOsF939eR+hvFsrOp1qEmVLm0nrVOct3cSJFEJGBVS8dTJ3B5z3Ajae7P+
 7hkQnbQ46x7uc9Yq/sE58cmwF9Mj2WYX4ngseHlMkdjH7qlDJJ+9OfSwI5nmJLTUwHnG
 OiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2LHdwmKsbt7AaEVYQPi9ZpWVFkuaCwouj850ieoIXdQ=;
 b=BS+UQvmgnmQdZWMIpVN2+7HYzGzhDW0wgz5HtfagZunC549dqLGhcszn1caiLT4y3X
 aorsftYb7dYtn+JAhxK3HGUNQIn/rLkhM1xazEnkzu2CuyFAG9MsbMaCvPZriEvjOHHR
 heGJt0hfeVpgOx/hkkDH7M6/c61Bqj8SpPbC478NCV19TphPzk+y+UnnKSs88Ctv4Lx5
 GaSEDijE3ApqJr9fZfgN4iM209vR9HQMEh6hynNuefdaycDMA/GLbktWshxmIZQTmgCn
 2KRhpGgaUs79ZgsuSrvVvo8VPjsYQfvxjYqIOV9xHzMVoJrKONa5DK+dX4WgtS9jdIzD
 1yhA==
X-Gm-Message-State: AJIora/QI/BYCQiBaoSNbsoT4vX/G6pxmpKbAgEH914BGSqwSSt500Xq
 G2MTiGlKB+UD7DDUcaSGrjQs6DhUQEOWFg==
X-Google-Smtp-Source: AGRyM1vVUiXw5u/fXN+3hwNmop5qQzVEVMO1EODHVyIJzcOY3rzJsORomJrDbyorS8KOnnFqxwDDhg==
X-Received: by 2002:a05:6a00:14d2:b0:52a:d2a1:5119 with SMTP id
 w18-20020a056a0014d200b0052ad2a15119mr5801199pfu.36.1659135992522; 
 Fri, 29 Jul 2022 16:06:32 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a1709026b4400b0016d3ee4533csm4138832plt.18.2022.07.29.16.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:06:32 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 08/11] target/openrisc: Enable MTTCG
Date: Sat, 30 Jul 2022 08:01:14 +0900
Message-Id: <20220729230117.3768312-9-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729230117.3768312-1-shorne@gmail.com>
References: <20220729230117.3768312-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This patch enables multithread TCG for OpenRISC.  Since the or1k shared
syncrhonized timer can be updated from each vCPU via helpers we use a
mutex to synchronize updates.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v2:
 - Removed cpu_openrisc_timer_has_advanced lock optimization, measuring revealed
   it did not help much.

 configs/targets/or1k-softmmu.mak | 1 +
 target/openrisc/cpu.h            | 2 ++
 target/openrisc/sys_helper.c     | 7 ++++++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/configs/targets/or1k-softmmu.mak b/configs/targets/or1k-softmmu.mak
index 263e970870..432f855a30 100644
--- a/configs/targets/or1k-softmmu.mak
+++ b/configs/targets/or1k-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=openrisc
+TARGET_SUPPORTS_MTTCG=y
 TARGET_BIG_ENDIAN=y
 TARGET_NEED_FDT=y
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index b9584f10d4..1d5efa5ca2 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -25,6 +25,8 @@
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
+#define TCG_GUEST_DEFAULT_MO (0)
+
 #define TYPE_OPENRISC_CPU "or1k-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 48674231e7..da88ad9e77 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -145,6 +145,7 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         break;
     case TO_SPR(10, 0): /* TTMR */
         {
+            qemu_mutex_lock_iothread();
             if ((env->ttmr & TTMR_M) ^ (rb & TTMR_M)) {
                 switch (rb & TTMR_M) {
                 case TIMER_NONE:
@@ -168,14 +169,16 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
                 env->ttmr = rb & ~TTMR_IP;
                 cs->interrupt_request &= ~CPU_INTERRUPT_TIMER;
             }
-
             cpu_openrisc_timer_update(cpu);
+            qemu_mutex_unlock_iothread();
         }
         break;
 
     case TO_SPR(10, 1): /* TTCR */
+        qemu_mutex_lock_iothread();
         cpu_openrisc_count_set(cpu, rb);
         cpu_openrisc_timer_update(cpu);
+        qemu_mutex_unlock_iothread();
         break;
 #endif
 
@@ -303,7 +306,9 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
         return env->ttmr;
 
     case TO_SPR(10, 1): /* TTCR */
+        qemu_mutex_lock_iothread();
         cpu_openrisc_count_update(cpu);
+        qemu_mutex_unlock_iothread();
         return cpu_openrisc_count_get(cpu);
 #endif
 
-- 
2.37.1


