Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82B6114681
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 19:05:11 +0100 (CET)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icvUz-0001IZ-UG
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 13:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDZ-00081K-OO
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:47:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDY-0004m0-IK
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:47:09 -0500
Received: from relay.sw.ru ([185.231.240.75]:48338)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvDX-0003VM-VB; Thu, 05 Dec 2019 12:47:08 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvD6-00013M-VF; Thu, 05 Dec 2019 20:46:40 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/21] ppc: well form kvmppc_hint_smt_possible error hint
 helper
Date: Thu,  5 Dec 2019 20:46:21 +0300
Message-Id: <20191205174635.18758-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205174635.18758-1-vsementsov@virtuozzo.com>
References: <20191205174635.18758-1-vsementsov@virtuozzo.com>
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
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make kvmppc_hint_smt_possible hint append helper well formed:
switch errp paramter to Error *const * type, as it has uncommon
behavior: not change the pointer to return error, but operate on
already existent error object.
Rename function to be kvmppc_error_append_*_hint.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/kvm_ppc.h | 4 ++--
 hw/ppc/spapr.c       | 2 +-
 target/ppc/kvm.c     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 98bd7d5da6..f22daabf51 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -28,7 +28,7 @@ void kvmppc_set_papr(PowerPCCPU *cpu);
 int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
 void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
 int kvmppc_smt_threads(void);
-void kvmppc_hint_smt_possible(Error **errp);
+void kvmppc_error_append_smt_possible_hint(Error *const *errp);
 int kvmppc_set_smt_threads(int smt);
 int kvmppc_clear_tsr_bits(PowerPCCPU *cpu, uint32_t tsr_bits);
 int kvmppc_or_tsr_bits(PowerPCCPU *cpu, uint32_t tsr_bits);
@@ -164,7 +164,7 @@ static inline int kvmppc_smt_threads(void)
     return 1;
 }
 
-static inline void kvmppc_hint_smt_possible(Error **errp)
+static inline void kvmppc_error_append_smt_possible_hint(Error *const *errp)
 {
     return;
 }
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e076f6023c..1b87eb0ffd 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2564,7 +2564,7 @@ static void spapr_set_vsmt_mode(SpaprMachineState *spapr, Error **errp)
                                       " requires the use of VSMT mode %d.\n",
                                       smp_threads, kvm_smt, spapr->vsmt);
                 }
-                kvmppc_hint_smt_possible(&local_err);
+                kvmppc_error_append_smt_possible_hint(&local_err);
                 goto out;
             }
         }
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index c77f9848ec..27ea3ce535 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2076,7 +2076,7 @@ int kvmppc_set_smt_threads(int smt)
     return ret;
 }
 
-void kvmppc_hint_smt_possible(Error **errp)
+void kvmppc_error_append_smt_possible_hint(Error *const *errp)
 {
     int i;
     GString *g;
-- 
2.21.0


