Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B22576897
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 22:58:34 +0200 (CEST)
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCSOP-0002sn-HW
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 16:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oCSL1-0005aK-IC; Fri, 15 Jul 2022 16:55:04 -0400
Received: from [200.168.210.66] (port=55753 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oCSKy-00083Z-Ta; Fri, 15 Jul 2022 16:55:02 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 15 Jul 2022 17:54:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 928FC800181;
 Fri, 15 Jul 2022 17:54:52 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, cohuck@redhat.com, farosas@linux.ibm.com
Subject: [PATCH v4 1/3] target/ppc: Add HASHKEYR and HASHPKEYR SPRs
Date: Fri, 15 Jul 2022 17:54:37 -0300
Message-Id: <20220715205439.161110-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
References: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jul 2022 20:54:52.0995 (UTC)
 FILETIME=[21A8C930:01D8988D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add the Special Purpose Registers HASHKEYR and HASHPKEYR, which were
introduced by the Power ISA 3.1B. They are used by the new instructions
hashchk(p) and hashst(p).

The ISA states that the Operating System should generate the value for
these registers when creating a process, so it's its responsability to
do so. We initialize it with 0 for qemu-softmmu, and set a random 64
bits value for linux-user.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---

Is the way I did the random number generation ok?

---
 target/ppc/cpu.h      |  2 ++
 target/ppc/cpu_init.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index a4c893cfad..4551d81b5f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1676,6 +1676,8 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_BOOKE_GIVOR14     (0x1BD)
 #define SPR_TIR               (0x1BE)
 #define SPR_PTCR              (0x1D0)
+#define SPR_HASHKEYR          (0x1D4)
+#define SPR_HASHPKEYR         (0x1D5)
 #define SPR_BOOKE_SPEFSCR     (0x200)
 #define SPR_Exxx_BBEAR        (0x201)
 #define SPR_Exxx_BBTAR        (0x202)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d1493a660c..29c7752483 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5700,6 +5700,33 @@ static void register_power9_mmu_sprs(CPUPPCState *env)
 #endif
 }
 
+static void register_power10_hash_sprs(CPUPPCState *env)
+{
+    /*
+     * it's the OS responsability to generate a random value for the registers
+     * in each process' context. So, initialize it with 0 here.
+     */
+    uint64_t hashkeyr_initial_value = 0, hashpkeyr_initial_value = 0;
+#if defined(CONFIG_USER_ONLY)
+    /* in linux-user, setup the hash register with a random value */
+    GRand *rand = g_rand_new();
+    hashkeyr_initial_value =
+        ((uint64_t)g_rand_int(rand) << 32) | (uint64_t)g_rand_int(rand);
+    hashpkeyr_initial_value =
+        ((uint64_t)g_rand_int(rand) << 32) | (uint64_t)g_rand_int(rand);
+    g_rand_free(rand);
+#endif
+    spr_register(env, SPR_HASHKEYR, "HASHKEYR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_generic,
+            hashkeyr_initial_value);
+    spr_register_hv(env, SPR_HASHPKEYR, "HASHPKEYR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_generic,
+            hashpkeyr_initial_value);
+}
+
 /*
  * Initialize PMU counter overflow timers for Power8 and
  * newer Power chips when using TCG.
@@ -6484,6 +6511,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power8_book4_sprs(env);
     register_power8_rpr_sprs(env);
     register_power9_mmu_sprs(env);
+    register_power10_hash_sprs(env);
 
     /* FIXME: Filter fields properly based on privilege level */
     spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
-- 
2.25.1


