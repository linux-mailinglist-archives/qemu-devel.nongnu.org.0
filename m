Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B3038F3F5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:59:27 +0200 (CEST)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llGjW-00011V-Tc
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=771b08666=sidcha@amazon.de>)
 id 1llGfz-0003pu-GQ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:55:47 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:22670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=771b08666=sidcha@amazon.de>)
 id 1llGfx-0001aL-2F
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1621886146; x=1653422146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/cT7Nw140FNR31PuXevCkr1pgU1HbzKiOZ6t4fkkRnQ=;
 b=MLPxjH3m0FdpBU4/ycIs2TawVDcmCSZbO2bQzqhFcqlhVFr5q7X3BdzX
 ChwTKM4LQtj5nEBriaaSH191xxMKPrBgnbPWO0HXm1WhDFcgf7AzeVvKi
 qAJhE1zW97Xk192nAI9CuFJKFVdeOI4It1cfZAcbnnU4pymm8MxUJZiAE 0=;
X-IronPort-AV: E=Sophos;i="5.82,325,1613433600"; d="scan'208";a="114312601"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 24 May 2021 19:55:35 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2B9EAA20BC; Mon, 24 May 2021 19:55:32 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.161.253) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Mon, 24 May 2021 19:55:28 +0000
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha@amazon.de>, Siddharth Chandrasekaran
 <sidcha.dev@gmail.com>, Alexander Graf <graf@amazon.com>, Evgeny Iakovlev
 <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis Aslanidis
 <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: [PATCH 2/6] hyper-v: Use -1 as invalid overlay address
Date: Mon, 24 May 2021 21:54:05 +0200
Message-ID: <13aa6b6a4434198ad3d43e48501bce1796266850.1621885749.git.sidcha@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621885749.git.sidcha@amazon.de>
References: <cover.1621885749.git.sidcha@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.253]
X-ClientProxiedBy: EX13D10UWB004.ant.amazon.com (10.43.161.121) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=771b08666=sidcha@amazon.de; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When managing overlay pages, we used hwaddr 0 to signal an invalid
address (to disable a page). Although unlikely, 0 _could_ be a valid
overlay offset as Hyper-V TLFS does not specify anything about it.

Use -1 as the invalid address indicator as it can never be a valid
address.

Signed-off-by: Siddharth Chandrasekaran <sidcha@amazon.de>
---
 hw/hyperv/hyperv.c         | 15 +++++++++------
 include/hw/hyperv/hyperv.h |  1 +
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 8d09206702..ac45e8e139 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -43,7 +43,7 @@ static void alloc_overlay_page(struct hyperv_overlay_page *overlay,
     memory_region_init_ram(&overlay->mr, owner, name,
                            qemu_real_host_page_size, &error_abort);
     overlay->ram_ptr = memory_region_get_ram_ptr(&overlay->mr);
-    overlay->addr = 0;
+    overlay->addr = HYPERV_INVALID_OVERLAY_GPA;
 }
 
 /**
@@ -52,14 +52,17 @@ static void alloc_overlay_page(struct hyperv_overlay_page *overlay,
  */
 static void hyperv_overlay_update(struct hyperv_overlay_page *overlay, hwaddr addr)
 {
-    /* check if overlay page is enabled */
-    addr = (addr & HYPERV_OVERLAY_ENABLED) ? (addr & TARGET_PAGE_MASK) : 0;
+    if (addr != HYPERV_INVALID_OVERLAY_GPA) {
+        /* check if overlay page is enabled */
+        addr = (addr & HYPERV_OVERLAY_ENABLED) ?
+                (addr & TARGET_PAGE_MASK) : HYPERV_INVALID_OVERLAY_GPA;
+    }
 
     if (overlay->addr != addr) {
-        if (overlay->addr) {
+        if (overlay->addr != HYPERV_INVALID_OVERLAY_GPA) {
             memory_region_del_subregion(get_system_memory(), &overlay->mr);
         }
-        if (addr) {
+        if (addr != HYPERV_INVALID_OVERLAY_GPA) {
             memory_region_add_subregion(get_system_memory(), addr, &overlay->mr);
             overlay->ram_ptr = memory_region_get_ram_ptr(&overlay->mr);
         }
@@ -121,7 +124,7 @@ static void synic_reset(DeviceState *dev)
     SynICState *synic = SYNIC(dev);
     memset(synic->msg_page.ram_ptr, 0, sizeof(struct hyperv_message_page));
     memset(synic->event_page.ram_ptr, 0, sizeof(struct hyperv_event_flags_page));
-    synic_update(synic, false, 0, 0);
+    synic_update(synic, false, HYPERV_INVALID_OVERLAY_GPA, HYPERV_INVALID_OVERLAY_GPA);
 }
 
 static void synic_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/hyperv/hyperv.h b/include/hw/hyperv/hyperv.h
index 3b2e0093b5..d989193e84 100644
--- a/include/hw/hyperv/hyperv.h
+++ b/include/hw/hyperv/hyperv.h
@@ -15,6 +15,7 @@
 #include "exec/memory.h"
 
 #define HYPERV_OVERLAY_ENABLED     (1u << 0)
+#define HYPERV_INVALID_OVERLAY_GPA ((hwaddr)-1)
 
 struct hyperv_overlay_page {
     hwaddr addr;
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




