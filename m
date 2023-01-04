Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E065D1D3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 12:53:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2Iy-0007VD-JO; Wed, 04 Jan 2023 06:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=6L6x=5B=kaod.org=clg@ozlabs.org>)
 id 1pD2Ix-0007Tj-4b; Wed, 04 Jan 2023 06:51:35 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=6L6x=5B=kaod.org=clg@ozlabs.org>)
 id 1pD2Iv-0002Pm-Fl; Wed, 04 Jan 2023 06:51:34 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Nn7H66HDyz4y0f;
 Wed,  4 Jan 2023 22:51:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Nn7H35vnfz4y0B;
 Wed,  4 Jan 2023 22:51:27 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 2/5] s390x/pv: Implement CGS check handler
Date: Wed,  4 Jan 2023 12:51:08 +0100
Message-Id: <20230104115111.3240594-3-clg@kaod.org>
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

When a protected VM is started with the maximum number of CPUs (248),
the service call providing information on the CPUs requires more
buffer space than allocated and QEMU disgracefully aborts :

    LOADPARM=[........]
    Using virtio-blk.
    Using SCSI scheme.
    ...................................................................................
    qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long

Implement a test for this limitation in the ConfidentialGuestSupportClass
check handler and provide some valid information to the user before the
machine starts.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/s390x/pv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8dfe92d8df..3a7ec70634 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -266,6 +266,26 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     return 0;
 }
 
+static bool s390_pv_check_cpus(Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    uint32_t pv_max_cpus = mc->max_cpus - 1;
+
+    if (ms->smp.max_cpus > pv_max_cpus) {
+        error_setg(errp, "Protected VMs support a maximum of %d CPUs",
+                   pv_max_cpus);
+        return false;
+    }
+
+    return true;
+}
+
+static bool s390_pv_guest_check(const Object *obj, Error **errp)
+{
+    return s390_pv_check_cpus(errp);
+}
+
 OBJECT_DEFINE_TYPE_WITH_INTERFACES(S390PVGuest,
                                    s390_pv_guest,
                                    S390_PV_GUEST,
@@ -275,6 +295,9 @@ OBJECT_DEFINE_TYPE_WITH_INTERFACES(S390PVGuest,
 
 static void s390_pv_guest_class_init(ObjectClass *oc, void *data)
 {
+    ConfidentialGuestSupportClass *cgsc = CONFIDENTIAL_GUEST_SUPPORT_CLASS(oc);
+
+    cgsc->check = s390_pv_guest_check;
 }
 
 static void s390_pv_guest_init(Object *obj)
-- 
2.38.1


