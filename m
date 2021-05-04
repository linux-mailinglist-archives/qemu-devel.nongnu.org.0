Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC43725A7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:02:07 +0200 (CEST)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldo8E-0003Cj-9N
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzu-0005B7-LC; Tue, 04 May 2021 01:53:32 -0400
Received: from ozlabs.org ([203.11.71.1]:51761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzs-0004fS-0V; Tue, 04 May 2021 01:53:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK0rvwz9sWC; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=QN9OGBLE2HmT8V/0wRszHECV89IjJIxItnBzN/dvEDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I7leRdoPnCOG4Zb4KWK9sKd64s3IYRQklnOsX8pvnvyReir5IXHLmrGva9kRiVduk
 JLV40zniKYAI5iE2NsSgHaTSvVZKj3NWdjczPcfDgD8oKzRFpxVST5VTmqgby/XRrs
 3kMo+tTLJgRwwS2illfeOfiPt2Rmw3UmrpQV1+D8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 06/46] target/ppc: Retain hflags_nmsr only for migration
Date: Tue,  4 May 2021 15:52:32 +1000
Message-Id: <20210504055312.306823-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We have eliminated all normal uses of hflags_nmsr.  We need
not even compute it except when we want to migrate.  Rename
the field to emphasize this.

Remove the fixme comment for migrating access_type.  This value
is only ever used with the current executing instruction, and
is never live when the cpu is halted for migration.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210315184615.1985590-6-richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h         | 4 ++--
 target/ppc/helper_regs.c | 2 --
 target/ppc/machine.c     | 9 ++++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 061d2eed1b..79c4033a42 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1105,8 +1105,8 @@ struct CPUPPCState {
 #endif
 
     /* These resources are used only in QEMU core */
-    target_ulong hflags;      /* hflags is MSR & HFLAGS_MASK */
-    target_ulong hflags_nmsr; /* specific hflags, not coming from MSR */
+    target_ulong hflags;
+    target_ulong hflags_compat_nmsr; /* for migration compatibility */
     int immu_idx;     /* precomputed MMU index to speed up insn accesses */
     int dmmu_idx;     /* precomputed MMU index to speed up data accesses */
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 95b9aca61f..a87e354ca2 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -104,8 +104,6 @@ void hreg_compute_hflags(CPUPPCState *env)
          */
         uint32_t le = extract32(env->spr[SPR_HID0], 3, 1);
         env->hflags |= le << MSR_LE;
-        /* Retain for backward compatibility with migration. */
-        env->hflags_nmsr = le << MSR_LE;
     }
 }
 
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index f6eeda9642..1f7a353c78 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -310,6 +310,10 @@ static int cpu_pre_save(void *opaque)
         }
     }
 
+    /* Retain migration compatibility for pre 6.0 for 601 machines. */
+    env->hflags_compat_nmsr = (env->flags & POWERPC_FLAG_HID0_LE
+                               ? env->hflags & MSR_LE : 0);
+
     return 0;
 }
 
@@ -829,9 +833,8 @@ const VMStateDescription vmstate_ppc_cpu = {
         /* Supervisor mode architected state */
         VMSTATE_UINTTL(env.msr, PowerPCCPU),
 
-        /* Internal state */
-        VMSTATE_UINTTL(env.hflags_nmsr, PowerPCCPU),
-        /* FIXME: access_type? */
+        /* Backward compatible internal state */
+        VMSTATE_UINTTL(env.hflags_compat_nmsr, PowerPCCPU),
 
         /* Sanity checking */
         VMSTATE_UINTTL_TEST(mig_msr_mask, PowerPCCPU, cpu_pre_2_8_migration),
-- 
2.31.1


