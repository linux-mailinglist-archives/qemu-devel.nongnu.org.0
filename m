Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24A6A0A06
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:12:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBNC-0007ie-7Y; Thu, 23 Feb 2023 08:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pVBN9-0007gm-IQ; Thu, 23 Feb 2023 08:10:55 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pVBN5-0005YF-MA; Thu, 23 Feb 2023 08:10:53 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DA4D204AC;
 Thu, 23 Feb 2023 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677157850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=natOrxcghh2zyYNa/12pnvmlNmiN5SwAjy+1kjcsMMY=;
 b=omHOwDnTh3dPR4EYEhTgChOxCf2s1qAVBtJQ63u2c7kVIX+47CzGCO2DyEb7K387mm3DaS
 kdxvVitdCF+x+QTAp6vi7clK55qeMbQelUP6r4aIduJ0dagFnmdq+e8lQoHkDhUXmhLJ9F
 oYCLNQKSVKsqwVA41ILHujCierY6poA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677157850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=natOrxcghh2zyYNa/12pnvmlNmiN5SwAjy+1kjcsMMY=;
 b=uMT6nHEp4ZgOtJHgdhba+R7OK+w6sSfJIXG/qLMkT/pCEMeWwmWEPdECtmEnU50KDM7S8Q
 OnDzdLhGT8zAT6BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60B53139B5;
 Thu, 23 Feb 2023 13:10:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eBy2Ctdl92MLawAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:10:47 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 01/20] target/arm: Wrap breakpoint/watchpoint updates with
 tcg_enabled
Date: Thu, 23 Feb 2023 10:08:22 -0300
Message-Id: <20230223130841.25916-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is in preparation for restricting compilation of some parts of
debug_helper.c to TCG only.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu.c          |  6 ++++--
 target/arm/debug_helper.c | 16 ++++++++++++----
 target/arm/machine.c      |  7 +++++--
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 876ab8f3bf..da416f7b1c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -539,8 +539,10 @@ static void arm_cpu_reset_hold(Object *obj)
     }
 #endif
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+    }
     arm_rebuild_hflags(env);
 }
 
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 3c671c88c1..3325eb9d7d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -939,7 +939,9 @@ static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     value &= ~3ULL;
 
     raw_write(env, ri, value);
-    hw_watchpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_watchpoint_update(cpu, i);
+    }
 }
 
 static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -949,7 +951,9 @@ static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int i = ri->crm;
 
     raw_write(env, ri, value);
-    hw_watchpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_watchpoint_update(cpu, i);
+    }
 }
 
 void hw_breakpoint_update(ARMCPU *cpu, int n)
@@ -1062,7 +1066,9 @@ static void dbgbvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int i = ri->crm;
 
     raw_write(env, ri, value);
-    hw_breakpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_breakpoint_update(cpu, i);
+    }
 }
 
 static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1079,7 +1085,9 @@ static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     value = deposit64(value, 8, 1, extract64(value, 7, 1));
 
     raw_write(env, ri, value);
-    hw_breakpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_breakpoint_update(cpu, i);
+    }
 }
 
 void define_debug_regs(ARMCPU *cpu)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index b4c3850570..fd6323f6d8 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
@@ -848,8 +849,10 @@ static int cpu_post_load(void *opaque, int version_id)
         return -1;
     }
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+    }
 
     /*
      * TCG gen_update_fp_context() relies on the invariant that
-- 
2.35.3


