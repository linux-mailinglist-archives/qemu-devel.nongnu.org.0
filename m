Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF5653E16
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:15:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8IQU-0004P6-Mm; Thu, 22 Dec 2022 05:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IQM-0004LJ-Rn
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IQK-0007YV-Bh
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671703415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YteSLKCJ/5vKIrNzMAKUHdSdLh6vZYfOU3PqlYP+XG4=;
 b=DDQ6EfI3xajwh857h1l1/PQJCNlCn0Q8DAnxMsWr9PlONV7xvJ1DyQf1hrheIhpfJcrlfV
 rkyaAgR0f0RhJtiqfz76LHIMYZ/9o/aSzPA/sI6G3+kWi0iddqNPZKpmAC/LtH4c5MvcC1
 fsQTogBd4kY7jtoljOuY42N4QD0iqHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-qLS5sxzcMhSrGsu7cx51Aw-1; Thu, 22 Dec 2022 05:03:31 -0500
X-MC-Unique: qLS5sxzcMhSrGsu7cx51Aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 978DC101A52E;
 Thu, 22 Dec 2022 10:03:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30B82400D79E;
 Thu, 22 Dec 2022 10:03:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1519F21E6928; Thu, 22 Dec 2022 11:03:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com,
 philmd@linaro.org
Subject: [PATCH v2 2/7] include/hw/cxl: Move typedef PXBDev to cxl.h,
 and put it to use
Date: Thu, 22 Dec 2022 11:03:25 +0100
Message-Id: <20221222100330.380143-3-armbru@redhat.com>
In-Reply-To: <20221222100330.380143-1-armbru@redhat.com>
References: <20221222100330.380143-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

hw/cxl/cxl.h uses the PXBDev structure tag instead of the typedef
name.  The typedef name is defined in hw/pci/pci_bridge.h.  Its
inclusion was dropped in the previous commit to break an inclusion
loop.

Move the typedef to hw/cxl/cxl.h, and use it there.  Delete an extra
typedef in hw/pci-bridge/pci_expander_bridge.c.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/cxl/cxl.h                | 4 +++-
 include/hw/pci/pci_bridge.h         | 1 -
 hw/pci-bridge/pci_expander_bridge.c | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 5129557bee..b161be59b7 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -23,10 +23,12 @@
 
 #define CXL_WINDOW_MAX 10
 
+typedef struct PXBDev PXBDev;
+
 typedef struct CXLFixedWindow {
     uint64_t size;
     char **targets;
-    struct PXBDev *target_hbs[8];
+    PXBDev *target_hbs[8];
     uint8_t num_targets;
     uint8_t enc_int_ways;
     uint8_t enc_int_gran;
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index ca6caf487e..58a3fb0c2c 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -97,7 +97,6 @@ struct PXBDev {
     } cxl;
 };
 
-typedef struct PXBDev PXBDev;
 #define TYPE_PXB_CXL_DEVICE "pxb-cxl"
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
                          TYPE_PXB_CXL_DEVICE)
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index c9e817aa58..870d9bab11 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -50,7 +50,6 @@ struct PXBBus {
 };
 
 #define TYPE_PXB_DEVICE "pxb"
-typedef struct PXBDev PXBDev;
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
                          TYPE_PXB_DEVICE)
 
-- 
2.38.1


