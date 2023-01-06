Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F965FC4D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 08:56:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDhYQ-0006Sb-VU; Fri, 06 Jan 2023 02:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=FbrK=5D=kaod.org=clg@ozlabs.org>)
 id 1pDhYL-0006RS-Q7; Fri, 06 Jan 2023 02:54:13 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=FbrK=5D=kaod.org=clg@ozlabs.org>)
 id 1pDhY0-00069F-B3; Fri, 06 Jan 2023 02:53:53 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NpFvv2pfCz4y0k;
 Fri,  6 Jan 2023 18:53:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NpFvr0j4Dz4xwq;
 Fri,  6 Jan 2023 18:53:43 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, frankja@linux.ibm.com,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 2/4] s390x/pv: Check for support on the host
Date: Fri,  6 Jan 2023 08:53:28 +0100
Message-Id: <20230106075330.3662549-3-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106075330.3662549-1-clg@kaod.org>
References: <20230106075330.3662549-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=FbrK=5D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

Support for protected VMs should have been enabled on the host with
the kernel parameter 'prot_virt=1'. If the hardware supports the
feature, it is reflected under sysfs.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/s390x/pv.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8a1c71436b..d53ef8fd38 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -14,6 +14,7 @@
 #include <linux/kvm.h>
 
 #include "qapi/error.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "qom/object_interfaces.h"
@@ -280,9 +281,29 @@ static bool s390_pv_check_cpus(Error **errp)
     return true;
 }
 
+#define S390_PV_HOST "/sys/firmware/uv/prot_virt_host"
+
+static bool s390_pv_check_host(Error **errp)
+{
+    gchar *s = NULL;
+    uint64_t pv_host = 0;
+
+    if (g_file_get_contents(S390_PV_HOST, &s, NULL, NULL)) {
+        pv_host = g_ascii_strtoull(s, NULL, 10);
+    }
+    g_free(s);
+
+    if (pv_host != 1) {
+        error_setg(errp, "Host does not support protected VMs");
+        return false;
+    }
+
+    return true;
+}
+
 static bool s390_pv_guest_check(ConfidentialGuestSupport *cgs, Error **errp)
 {
-    return s390_pv_check_cpus(errp);
+    return s390_pv_check_cpus(errp) && s390_pv_check_host(errp);
 }
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
-- 
2.38.1


