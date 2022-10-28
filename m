Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A105A611294
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:24:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPKX-00018x-Kf; Fri, 28 Oct 2022 09:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKT-00011s-Jo
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKS-0005HG-3P
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8FBaf6j0o4xPJN88auBAvKkeP87NQzvWJrTn6qHgRM=;
 b=EOXFhz+xKizz671IIb04dk4252z/HD1h/SihsphaPYyoVEcrR1C0tZ6bdt41cgaZeR61Sr
 032KzKB8pHqmUoU3Kq8CLuzuUKtSlqSgXx4okLAVuBYY/wYJ1EQtfnZKBTgHfv3WZR9xvN
 WD8SYd8iGFhmeSijCSZxqWawguYcFSo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-64PnYpRyMF-rmUM1OsZPsQ-1; Fri, 28 Oct 2022 09:23:13 -0400
X-MC-Unique: 64PnYpRyMF-rmUM1OsZPsQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91D0F101A54E;
 Fri, 28 Oct 2022 13:23:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BAA71121319;
 Fri, 28 Oct 2022 13:23:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Nico Boehr <nrb@linux.ibm.com>
Subject: [PULL 03/21] s390x/tod-kvm: don't save/restore the TOD in PV guests
Date: Fri, 28 Oct 2022 15:22:46 +0200
Message-Id: <20221028132304.829103-4-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Nico Boehr <nrb@linux.ibm.com>

Under PV, the guest's TOD clock is under control of the ultravisor and the
hypervisor cannot change it.

With upcoming kernel changes[1], the Linux kernel will reject QEMU's
request to adjust the guest's clock in this case, so don't attempt to set
the clock.

This avoids the following warning message on save/restore of a PV guest:

warning: Unable to set KVM guest TOD clock: Operation not supported

[1] https://lore.kernel.org/all/20221011160712.928239-2-nrb@linux.ibm.com/

Fixes: c3347ed0d2ee ("s390x: protvirt: Support unpack facility")
Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
Message-Id: <20221012123229.1196007-1-nrb@linux.ibm.com>
[thuth: Add curly braces]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/tod-kvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
index 9d0cbfbce2..e2202dae2d 100644
--- a/hw/s390x/tod-kvm.c
+++ b/hw/s390x/tod-kvm.c
@@ -13,6 +13,7 @@
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 #include "hw/s390x/tod.h"
+#include "hw/s390x/pv.h"
 #include "kvm/kvm_s390x.h"
 
 static void kvm_s390_get_tod_raw(S390TOD *tod, Error **errp)
@@ -84,6 +85,14 @@ static void kvm_s390_tod_vm_state_change(void *opaque, bool running,
     S390TODState *td = opaque;
     Error *local_err = NULL;
 
+    /*
+     * Under PV, the clock is under ultravisor control, hence we cannot restore
+     * it on resume.
+     */
+    if (s390_is_pv()) {
+        return;
+    }
+
     if (running && td->stopped) {
         /* Set the old TOD when running the VM - start the TOD clock. */
         kvm_s390_set_tod_raw(&td->base, &local_err);
-- 
2.31.1


