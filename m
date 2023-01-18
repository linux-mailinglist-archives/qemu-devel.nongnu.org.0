Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D921671ACE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:36:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6io-0004gz-Pi; Wed, 18 Jan 2023 06:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6iE-0004WD-BV
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6iB-0007Wq-Dd
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0WM6vwdwKTocxW97fh/iErmSQNDsEuNBSXOqq8hAftg=;
 b=CQq4lSUyIvp6gRm6IymVqe5TO9zTudfx3zZ7UPe9OBafxnrIhrIOsoOd/b+609HRj2v77d
 3FNBdwMc3t96l6H1tBR23cHv5bkHrApyobdtst4cpKfc5R9p3NSsHFiYVJbJQACLH6GjhT
 n9neFVGYpL8phsk1VJF3zkXMAri/WUI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-1obymIUHPX2XQkzf_s9mKw-1; Wed, 18 Jan 2023 06:34:32 -0500
X-MC-Unique: 1obymIUHPX2XQkzf_s9mKw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2E271C0515F;
 Wed, 18 Jan 2023 11:34:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 279FF492B00;
 Wed, 18 Jan 2023 11:34:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 9/9] s390x/pv: Implement a CGS check helper
Date: Wed, 18 Jan 2023 12:34:18 +0100
Message-Id: <20230118113418.1650416-10-thuth@redhat.com>
In-Reply-To: <20230118113418.1650416-1-thuth@redhat.com>
References: <20230118113418.1650416-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When protected virtualization is initialized, compute the maximum
number of vCPUs supported by the machine and return useful information
to the user before the machine starts in case of error.

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
Message-Id: <20230116174607.2459498-2-clg@kaod.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/pv.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8dfe92d8df..8a1c71436b 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -20,6 +20,7 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/pv.h"
+#include "hw/s390x/sclp.h"
 #include "target/s390x/kvm/kvm_s390x.h"
 
 static bool info_valid;
@@ -249,6 +250,41 @@ struct S390PVGuestClass {
     ConfidentialGuestSupportClass parent_class;
 };
 
+/*
+ * If protected virtualization is enabled, the amount of data that the
+ * Read SCP Info Service Call can use is limited to one page. The
+ * available space also depends on the Extended-Length SCCB (ELS)
+ * feature which can take more buffer space to store feature
+ * information. This impacts the maximum number of CPUs supported in
+ * the machine.
+ */
+static uint32_t s390_pv_get_max_cpus(void)
+{
+    int offset_cpu = s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
+        offsetof(ReadInfo, entries) : SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
+
+    return (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry);
+}
+
+static bool s390_pv_check_cpus(Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    uint32_t pv_max_cpus = s390_pv_get_max_cpus();
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
+static bool s390_pv_guest_check(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    return s390_pv_check_cpus(errp);
+}
+
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
@@ -261,6 +297,10 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         return -1;
     }
 
+    if (!s390_pv_guest_check(cgs, errp)) {
+        return -1;
+    }
+
     cgs->ready = true;
 
     return 0;
-- 
2.31.1


