Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EAC65D1CD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 12:52:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2J9-0007d7-1u; Wed, 04 Jan 2023 06:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=6L6x=5B=kaod.org=clg@ozlabs.org>)
 id 1pD2J7-0007ce-Pq; Wed, 04 Jan 2023 06:51:45 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=6L6x=5B=kaod.org=clg@ozlabs.org>)
 id 1pD2J5-0002Sr-Tj; Wed, 04 Jan 2023 06:51:45 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Nn7HK41F6z4y0W;
 Wed,  4 Jan 2023 22:51:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Nn7HG3cwQz4y0B;
 Wed,  4 Jan 2023 22:51:38 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 5/5] s390x/pv: Move check on hugepage under
 s390_pv_guest_check()
Date: Wed,  4 Jan 2023 12:51:11 +0100
Message-Id: <20230104115111.3240594-6-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104115111.3240594-1-clg@kaod.org>
References: <20230104115111.3240594-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=6L6x=5B=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/s390x/pv.c       | 14 +++++++++++++-
 target/s390x/diag.c |  7 -------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 96c0728ec9..4e1f991d98 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -302,9 +302,21 @@ static bool s390_pv_check_host(Error **errp)
     return true;
 }
 
+static bool s390_pv_check_hpage(Error **errp)
+{
+    if (kvm_s390_get_hpage_1m()) {
+        error_setg(errp, "Protected VMs can currently not be backed with "
+                   "huge pages");
+        return false;
+    }
+
+    return true;
+}
+
 static bool s390_pv_guest_check(const Object *obj, Error **errp)
 {
-    return s390_pv_check_cpus(errp) && s390_pv_check_host(errp);
+    return s390_pv_check_cpus(errp) && s390_pv_check_host(errp) &&
+        s390_pv_check_hpage(errp);
 }
 
 bool s390_pv_check(Error **errp)
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 9b16e25930..28f4350aed 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -170,13 +170,6 @@ out:
             return;
         }
 
-        if (kvm_enabled() && kvm_s390_get_hpage_1m()) {
-            error_report("Protected VMs can currently not be backed with "
-                         "huge pages");
-            env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
-            return;
-        }
-
         if (!s390_pv_check(&local_err)) {
             error_report_err(local_err);
             env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
-- 
2.38.1


