Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA02D452E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 18:16:15 +0200 (CEST)
Received: from localhost ([::1]:53552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIxaQ-0000Wb-Dd
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 12:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQZ-0005dT-Bt
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQY-00044r-6C
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:03 -0400
Received: from relay.sw.ru ([185.231.240.75]:47836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQX-00043h-TZ; Fri, 11 Oct 2019 12:06:02 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQU-0003XG-HD; Fri, 11 Oct 2019 19:05:58 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 008/126] ppc: well form kvmppc_hint_smt_possible error hint
 helper
Date: Fri, 11 Oct 2019 19:03:54 +0300
Message-Id: <20191011160552.22907-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: vsementsov@virtuozzo.com, qemu-ppc@nongnu.org, armbru@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make kvmppc_hint_smt_possible hint append helper well formed:
rename errp to errp_in, as it is IN-parameter here (which is unusual
for errp), rename function to be error_append_*_hint.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 target/ppc/kvm_ppc.h | 4 ++--
 hw/ppc/spapr.c       | 2 +-
 target/ppc/kvm.c     | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 98bd7d5da6..35f1d499ad 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -28,7 +28,7 @@ void kvmppc_set_papr(PowerPCCPU *cpu);
 int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
 void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
 int kvmppc_smt_threads(void);
-void kvmppc_hint_smt_possible(Error **errp);
+void error_append_kvmppc_smt_possible_hint(Error **errp_in);
 int kvmppc_set_smt_threads(int smt);
 int kvmppc_clear_tsr_bits(PowerPCCPU *cpu, uint32_t tsr_bits);
 int kvmppc_or_tsr_bits(PowerPCCPU *cpu, uint32_t tsr_bits);
@@ -164,7 +164,7 @@ static inline int kvmppc_smt_threads(void)
     return 1;
 }
 
-static inline void kvmppc_hint_smt_possible(Error **errp)
+static inline void error_append_kvmppc_smt_possible_hint(Error **errp_in)
 {
     return;
 }
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 514a17ae74..6729269aa9 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2565,7 +2565,7 @@ static void spapr_set_vsmt_mode(SpaprMachineState *spapr, Error **errp)
                                       " requires the use of VSMT mode %d.\n",
                                       smp_threads, kvm_smt, spapr->vsmt);
                 }
-                kvmppc_hint_smt_possible(&local_err);
+                error_append_kvmppc_smt_possible_hint(&local_err);
                 goto out;
             }
         }
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 820724cc7d..af6e667bf8 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2076,7 +2076,7 @@ int kvmppc_set_smt_threads(int smt)
     return ret;
 }
 
-void kvmppc_hint_smt_possible(Error **errp)
+void error_append_kvmppc_smt_possible_hint(Error **errp_in)
 {
     int i;
     GString *g;
@@ -2091,10 +2091,10 @@ void kvmppc_hint_smt_possible(Error **errp)
             }
         }
         s = g_string_free(g, false);
-        error_append_hint(errp, "%s.\n", s);
+        error_append_hint(errp_in, "%s.\n", s);
         g_free(s);
     } else {
-        error_append_hint(errp,
+        error_append_hint(errp_in,
                           "This KVM seems to be too old to support VSMT.\n");
     }
 }
-- 
2.21.0


