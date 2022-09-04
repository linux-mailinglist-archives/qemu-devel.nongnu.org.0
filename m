Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752655AC345
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:42:47 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUkHG-00083p-Bo
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1P-0007ve-KZ
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1O-00031K-1g
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:23 -0400
Received: by mail-wm1-x332.google.com with SMTP id j26so3746584wms.0
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GIDTjvgN2dQLUduv7RxatH83G3BsgCWMQ2FcB7REqfs=;
 b=htw0ZOd24uJ5W5NFVRyCZo0Nl92Hi7Pr7kqraSBtofGxF1jrvpoxfMIrjqR7+QIeoT
 DD/6QI4uO7MYOPrpLwF1MTGoN4eK8I5OZ95uGJ+wZ3aI7ywNkE7P170eY2P/PdPOL6VT
 NpF3jMGSky1T92UUkLyCqddBo/VVl9sNH/i4M3gPyja8wUBqHfksrd9eKeSzhTuCpsVo
 cttZ8eaAp+exnIqZMjPSv3o+jLuCg+OlPNiYJT2Z4iMLgMS+ndvO0UiLFy5jwtlse5/1
 S/jcY8sGimPmK4habS52zXHRStOohFB/OCSym7AfSbFwENN109wcf1SpCFCrI89zeICH
 q1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GIDTjvgN2dQLUduv7RxatH83G3BsgCWMQ2FcB7REqfs=;
 b=fYOzuJVAvh5IIV+uMm2ueCvuO6o3qzHiszfj9mi3ahcZvduT4YaWsg3AU2U/036ObJ
 JRWlgO1rsH+WbVGPN+shwQzcfo3JJuHzf8WCyPwK5RTCNJQS+PXcgMq3Unv0PZfJEcOO
 PfOiKmcHk3vxH7Pp2M1uJQLMeqFDnYAGguiZbgJpLyDmgUz7ADltm/oIF7X1y6q2v2OZ
 K8Deszw3RVQyaGLlsLpRhK0Fe4jt0ZGtUyVqsozlDsUGmwM1NwYV2HwgrRpothRXmq1+
 H7W/0tp1yzP0z8bBcVSzi5n5LMCn2kVWD4aM/6A7l6SgqmhWatY+HkKsJxDFjNKXY8au
 2NTQ==
X-Gm-Message-State: ACgBeo3or6Qf5dtfD6ErskcFGaywaXqGW8ALY09zOlFZWRBsw97vGJeY
 4FDM5SYIiMYIpgNYb7MW8Y6kDb/6wrc=
X-Google-Smtp-Source: AA6agR4Oa3xeyJEHOCD3c8Lq//cSYVzt02gN8ohKXDfVu0/d9ZBPa13FJaFQ8NL26HS17npkIfTR2w==
X-Received: by 2002:a7b:c016:0:b0:3a5:fff2:62f4 with SMTP id
 c22-20020a7bc016000000b003a5fff262f4mr7882891wmb.104.1662276380333; 
 Sun, 04 Sep 2022 00:26:20 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 d16-20020adfe850000000b0022526db2363sm5695580wrn.30.2022.09.04.00.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:19 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 08/11] target/openrisc: Enable MTTCG
Date: Sun,  4 Sep 2022 08:26:04 +0100
Message-Id: <20220904072607.44275-9-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This patch enables multithread TCG for OpenRISC.  Since the or1k shared
syncrhonized timer can be updated from each vCPU via helpers we use a
mutex to synchronize updates.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
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
2.37.2


