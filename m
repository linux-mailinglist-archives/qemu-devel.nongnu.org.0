Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFAA65D1CF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 12:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2J7-0007c1-7p; Wed, 04 Jan 2023 06:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=6L6x=5B=kaod.org=clg@ozlabs.org>)
 id 1pD2J5-0007bJ-Nf; Wed, 04 Jan 2023 06:51:43 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=6L6x=5B=kaod.org=clg@ozlabs.org>)
 id 1pD2J3-0002Ql-LC; Wed, 04 Jan 2023 06:51:43 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Nn7HG00yWz4y0k;
 Wed,  4 Jan 2023 22:51:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Nn7HB6lK4z4y0B;
 Wed,  4 Jan 2023 22:51:34 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 4/5] s390x/pv: Introduce a s390_pv_check() helper for runtime
Date: Wed,  4 Jan 2023 12:51:10 +0100
Message-Id: <20230104115111.3240594-5-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104115111.3240594-1-clg@kaod.org>
References: <20230104115111.3240594-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=6L6x=5B=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@redhat.com>

If a secure kernel is started in a non-protected VM, the OS will hang
during boot without giving a proper error message to the user.

Perform the checks on Confidential Guest support at runtime with an
helper called from the service call switching the guest to protected
mode.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/s390x/pv.h |  2 ++
 hw/s390x/pv.c         | 14 ++++++++++++++
 target/s390x/diag.c   |  7 +++++++
 3 files changed, 23 insertions(+)

diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 9360aa1091..ca7dac2e20 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -55,6 +55,7 @@ int kvm_s390_dump_init(void);
 int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
 int kvm_s390_dump_mem_state(uint64_t addr, size_t len, void *dest);
 int kvm_s390_dump_completion_data(void *buff);
+bool s390_pv_check(Error **errp);
 #else /* CONFIG_KVM */
 static inline bool s390_is_pv(void) { return false; }
 static inline int s390_pv_query_info(void) { return 0; }
@@ -75,6 +76,7 @@ static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff) { return 0; }
 static inline int kvm_s390_dump_mem_state(uint64_t addr, size_t len,
                                           void *dest) { return 0; }
 static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
+static inline bool s390_pv_check(Error **errp) { return false; }
 #endif /* CONFIG_KVM */
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8d0d3f4adc..96c0728ec9 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -307,6 +307,20 @@ static bool s390_pv_guest_check(const Object *obj, Error **errp)
     return s390_pv_check_cpus(errp) && s390_pv_check_host(errp);
 }
 
+bool s390_pv_check(Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    Object *obj = OBJECT(ms->cgs);
+
+    if (!obj) {
+        error_setg(errp, "Protected VM started without a Confidential"
+                   " Guest support interface");
+        return false;
+    }
+
+    return s390_pv_guest_check(obj, errp);
+}
+
 OBJECT_DEFINE_TYPE_WITH_INTERFACES(S390PVGuest,
                                    s390_pv_guest,
                                    S390_PV_GUEST,
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 76b01dcd68..9b16e25930 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -79,6 +79,7 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
     uint64_t addr =  env->regs[r1];
     uint64_t subcode = env->regs[r3];
     IplParameterBlock *iplb;
+    Error *local_err = NULL;
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
         s390_program_interrupt(env, PGM_PRIVILEGED, ra);
@@ -176,6 +177,12 @@ out:
             return;
         }
 
+        if (!s390_pv_check(&local_err)) {
+            error_report_err(local_err);
+            env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
+            return;
+        }
+
         s390_ipl_reset_request(cs, S390_RESET_PV);
         break;
     default:
-- 
2.38.1


