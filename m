Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B265FC48
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 08:54:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDhYV-0006VS-8a; Fri, 06 Jan 2023 02:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=FbrK=5D=kaod.org=clg@ozlabs.org>)
 id 1pDhYN-0006SI-CQ; Fri, 06 Jan 2023 02:54:15 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=FbrK=5D=kaod.org=clg@ozlabs.org>)
 id 1pDhYL-00069x-NZ; Fri, 06 Jan 2023 02:54:15 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NpFw3094Qz4y0p;
 Fri,  6 Jan 2023 18:53:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NpFvz57Gvz4y0l;
 Fri,  6 Jan 2023 18:53:51 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, frankja@linux.ibm.com,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 4/4] s390x/pv: Move check on hugepage under
 s390_pv_guest_check()
Date: Fri,  6 Jan 2023 08:53:30 +0100
Message-Id: <20230106075330.3662549-5-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106075330.3662549-1-clg@kaod.org>
References: <20230106075330.3662549-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=FbrK=5D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

Such conditions on Protected Virtualization can now be checked at init
time.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/s390x/pv.c       | 14 +++++++++++++-
 target/s390x/diag.c |  7 -------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 13c6116076..b8f53a0247 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -301,9 +301,21 @@ static bool s390_pv_check_host(Error **errp)
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
 static bool s390_pv_guest_check(ConfidentialGuestSupport *cgs, Error **errp)
 {
-    return s390_pv_check_cpus(errp) && s390_pv_check_host(errp);
+    return s390_pv_check_cpus(errp) && s390_pv_check_host(errp) &&
+        s390_pv_check_hpage(errp);
 }
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
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


