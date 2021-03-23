Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D27334554D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:07:23 +0100 (CET)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWS2-0001UP-De
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKo-0002lF-Ue
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:54 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKm-0006u2-OV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464792; x=1648000792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VISzj7nrHdSTOSETE9b6Nd1OPBUeFuhUpmZ+CkIAt6Q=;
 b=IiBa7mmDaaxoM4uAIT067PsFM5J+P3na0j0HjKO4z0307z6El8ncdDUL
 nj2D9n9duStc7X+tZPkw5UYOSgqCOvTTiN8qNoGLC2297NhO7LiUylR79
 5GgEnc/yxl8kCFgNCdZoSUjbdWSZi3KctEkQZUqMzAu5QW4fU5LXjs/TB
 d1DAdvLmcWk1XVtsfqazSBZ5SdZOPS7SgoJsTShr6x9r0ygIXQQpeyESO
 8nUacbSxU1GmNWDaIaq7vnj2tQZ6tXMpTM3QTY7Uj5uHdvoHNH/A7X2B4
 l71mfmmZUI/MDqqmSElgskeZxf0MZnbha2Qd9jqHIicnjzR9VnMz52MjM g==;
IronPort-SDR: kI8dWE/qEQ5j7xBmBB+aEOW+1FamnyndeKmQOL/p7n4R7IEE2a5WbzcNdPhPpF1piBsr0lkQo1
 JoCV0lxsYVOrdBpA9GG4JE7wpdwNKiXIAxwTlydHMk5z2ZCHyI8naTD0TA1l8HMYyQAxO+fG4L
 32K8/Odww1UbsNjo2/Nsxu5p/w3eI+m2YGlW+8XU03aFM+8207HBsdf7S6RbUa5yRAtva4O98Q
 ZL6o1OB9MOjmbpaFbvV7DJsK8wIBDPHspKT3gFB0WJojvNbV4SKqiapEGEyiBVJaGA0HtPnmvW
 3ug=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707644"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:39 +0800
IronPort-SDR: wtPOUw/BS3HNiAgU0EK6gGBj0iVQ/qeTsqFRb/tJTFBfbBuvaJU4i++pIwA1sXE8CCSlQXR4rj
 bEB0eEjFgLTQ/dqX9akUtpd8PDrYbMZdiju8nf+2v8LfgqIGxEHoY76NC7tWC9GF/GKG2PXiu9
 6ILQUjwe3Y3gE2GzXYUlboLDlq+tlAq1uGfgyD6OgcmjvRDLO4wPyotg8mGwnIMi8AvKA4lDxT
 uVIOIVcIECMH7vDXp37jtUDLNtAqr858SoL1I7uJkiHv5VBtxbVGBRip8j646zBfEZry8VuEyY
 PSuclnxw7BKwqR9Jvre3IHYo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:47 -0700
IronPort-SDR: TjZZ+/Es6ejcOcAFQtG/wfnSr+p/cVASPBxpqTg5qvVdJIuQqFqi85mWULYj9nC2JDeJ2sJ0YH
 4fytwfCyj1JQystfgj7z7UynuWHaBqNMq34QoxxzvAzQz3+zLG0qqj7iAGc+pLiIjLWsn6W4S8
 IdF4nq59l3wuyiUjEV+/GxK7kpTCMzvl9zRvrn29wo3pe65VGjkL5ZxVJd5rHg1ejHPU79MAVu
 6BEQGFB75tEPGPaT1YgcoK1YrzI+5PelUbwIyVj/3UVsPDwiCOgiLI3/nZlbRXMmOOO65YVNQ4
 9Vo=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 12/16] target/riscv: Add proper two-stage lookup exception
 detection
Date: Mon, 22 Mar 2021 21:57:52 -0400
Message-Id: <20210323015756.3168650-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

The current two-stage lookup detection in riscv_cpu_do_interrupt falls
short of its purpose, as all it checks is whether two-stage address
translation either via the hypervisor-load store instructions or the
MPRV feature would be allowed.

What we really need instead is whether two-stage address translation was
active when the exception was raised. However, in riscv_cpu_do_interrupt
we do not have the information to reliably detect this. Therefore, when
we raise a memory fault exception we have to record whether two-stage
address translation is active.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210319141459.1196741-1-georg.kotheimer@kernkonzept.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu_helper.c | 21 ++++++++-------------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb2826a2..0a33d387ba 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -213,6 +213,10 @@ struct CPURISCVState {
     target_ulong satp_hs;
     uint64_t mstatus_hs;
 
+    /* Signals whether the current exception occurred with two-stage address
+       translation active. */
+    bool two_stage_lookup;
+
     target_ulong scounteren;
     target_ulong mcounteren;
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2a990f6253..7d6ed80f6b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -356,6 +356,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
     env->mcause = 0;
     env->pc = env->resetvec;
+    env->two_stage_lookup = false;
 #endif
     cs->exception_index = EXCP_NONE;
     env->load_res = -1;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8d4a62988d..21c54ef561 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -654,6 +654,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
         g_assert_not_reached();
     }
     env->badaddr = address;
+    env->two_stage_lookup = two_stage;
 }
 
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
@@ -695,6 +696,8 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 
     env->badaddr = addr;
+    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
+                            riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
 }
 
@@ -718,6 +721,8 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
+    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
+                            riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
 #endif /* !CONFIG_USER_ONLY */
@@ -967,16 +972,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
             target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
-            bool two_stage_lookup = false;
 
-            if (env->priv == PRV_M ||
-                (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-                (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
-                    get_field(env->hstatus, HSTATUS_HU))) {
-                    two_stage_lookup = true;
-            }
-
-            if ((riscv_cpu_virt_enabled(env) || two_stage_lookup) && write_tval) {
+            if (env->two_stage_lookup && write_tval) {
                 /*
                  * If we are writing a guest virtual address to stval, set
                  * this to 1. If we are trapping to VS we will set this to 0
@@ -1014,10 +1011,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 riscv_cpu_set_force_hs_excep(env, 0);
             } else {
                 /* Trap into HS mode */
-                if (!two_stage_lookup) {
-                    env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
-                                             riscv_cpu_virt_enabled(env));
-                }
+                env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
                 htval = env->guest_phys_fault_addr;
             }
         }
@@ -1073,6 +1067,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      * RISC-V ISA Specification.
      */
 
+    env->two_stage_lookup = false;
 #endif
     cs->exception_index = EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.30.1


