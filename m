Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7CC2F168B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:54:58 +0100 (CET)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxer-0007DV-RC
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUp-0003D3-Sg
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUm-00087l-AZ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610372671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzWPwvt093oI8mO3R5iYNPliGSRKJ/Sll8P3NOMlwUQ=;
 b=cpjnTN1MnDO4/ozW09Vv0p35cQ3RiGeE9xeLxG9ZColb4olJOxXzMm3mjlCIa0lb4po0Tm
 XqBXEghfFI8DVdaLofwIbCdINhlBUuMTwy6tXliTZQDPhtYLkj0NI140dVJlbeRNKeen/5
 wBJ2rlmBh4igmPc3qPYdFIKM01/nA40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-vnSP0IDZP_Gu8AFs7cfPIw-1; Mon, 11 Jan 2021 08:44:29 -0500
X-MC-Unique: vnSP0IDZP_Gu8AFs7cfPIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 517B619251A1;
 Mon, 11 Jan 2021 13:44:28 +0000 (UTC)
Received: from thuth.com (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4353E50DD3;
 Mon, 11 Jan 2021 13:44:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 15/15] fuzz: map all BARs and enable PCI devices
Date: Mon, 11 Jan 2021 14:43:28 +0100
Message-Id: <20210111134328.157775-16-thuth@redhat.com>
In-Reply-To: <20210111134328.157775-1-thuth@redhat.com>
References: <20210111134328.157775-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Warner Losh <imp@freebsd.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Prior to this patch, the fuzzer found inputs to map PCI device BARs and
enable the device. While it is nice that the fuzzer can do this, it
added significant overhead, since the fuzzer needs to map all the
BARs (regenerating the memory topology), at the start of each input.
With this patch, we do this once, before fuzzing, mitigating some of
this overhead.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201221181203.1853-1-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 07ad690683..be76d47d2d 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -16,6 +16,7 @@
 
 #include "hw/core/cpu.h"
 #include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqos/pci-pc.h"
 #include "fuzz.h"
 #include "fork_fuzz.h"
 #include "exec/address-spaces.h"
@@ -762,10 +763,29 @@ static int locate_fuzz_objects(Object *child, void *opaque)
     return 0;
 }
 
+
+static void pci_enum(gpointer pcidev, gpointer bus)
+{
+    PCIDevice *dev = pcidev;
+    QPCIDevice *qdev;
+    int i;
+
+    qdev = qpci_device_find(bus, dev->devfn);
+    g_assert(qdev != NULL);
+    for (i = 0; i < 6; i++) {
+        if (dev->io_regions[i].size) {
+            qpci_iomap(qdev, i, NULL);
+        }
+    }
+    qpci_device_enable(qdev);
+    g_free(qdev);
+}
+
 static void generic_pre_fuzz(QTestState *s)
 {
     GHashTableIter iter;
     MemoryRegion *mr;
+    QPCIBus *pcibus;
     char **result;
 
     if (!getenv("QEMU_FUZZ_OBJECTS")) {
@@ -810,6 +830,10 @@ static void generic_pre_fuzz(QTestState *s)
         exit(1);
     }
 
+    pcibus = qpci_new_pc(s, NULL);
+    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
+    qpci_free_pc(pcibus);
+
     counter_shm_init();
 }
 
-- 
2.27.0


