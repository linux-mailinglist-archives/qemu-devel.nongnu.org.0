Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48673376564
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:43:44 +0200 (CEST)
Received: from localhost ([::1]:37254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezpX-0004Hb-Cz
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbS-0000bK-8e
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:10 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbO-0001SL-F7
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:09 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CEBqQ096898;
 Fri, 7 May 2021 12:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=Zc4qOmsp74EkY9xxz4Vkv8OgESU7vm07Wws0OhW7Nr4=;
 b=JQH8fisMT2eJWqdJ1w3jZHSOz4e6GpsdiRblpLXUYlA8Y4kIdVGdH+mC4vtKw7+18da6
 1n2HqXbOj53Wf9GZB4U6lUeCpTy2u3tbG37Y8IKged5Ranx/2pGptfyUCTyAZYX22KHW
 sZkmSwjvsfmNipfUYigiYhZHXFvl5Jb4Irfgh2xSmOBKYAVH6FwD/O0OA6MtxvFtaBp/
 s0Eu2oVOCzBwCHHlShjWdWohdl2KxWr1LbYoDcvObiQKGTZYLfXEO/P89uor14K4M9Vf
 v3DBqPXBTGL+NBxhGc0lE4q0louQUHY5mi9joKlbGqvrA4X3nA2wmP59bB9eSVb5ryac PQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 38ctd89d1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:00 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFNmA031183;
 Fri, 7 May 2021 12:29:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 38css8ss7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:00 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CSxQA071655;
 Fri, 7 May 2021 12:28:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 38css8ss6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:59 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CSv4K016413;
 Fri, 7 May 2021 12:28:58 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:57 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 10/22] pci: export functions for cpr
Date: Fri,  7 May 2021 05:25:08 -0700
Message-Id: <1620390320-301716-11-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: PlXDP6q2Ub-QcX5tlpl9qman2V5Oke0F
X-Proofpoint-ORIG-GUID: PlXDP6q2Ub-QcX5tlpl9qman2V5Oke0F
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export msix_is_pending and msix_init_vector_notifiers for use by cpr.
No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/pci/msix.c         | 20 ++++++++++++++------
 hw/pci/pci.c          |  3 +--
 include/hw/pci/msix.h |  5 +++++
 include/hw/pci/pci.h  |  1 +
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331c..73f4259 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
     return dev->msix_pba + vector / 8;
 }
 
-static int msix_is_pending(PCIDevice *dev, int vector)
+int msix_is_pending(PCIDevice *dev, unsigned int vector)
 {
     return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
 }
@@ -579,6 +579,17 @@ static void msix_unset_notifier_for_vector(PCIDevice *dev, unsigned int vector)
     dev->msix_vector_release_notifier(dev, vector);
 }
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier)
+{
+    assert(use_notifier && release_notifier);
+    dev->msix_vector_use_notifier = use_notifier;
+    dev->msix_vector_release_notifier = release_notifier;
+    dev->msix_vector_poll_notifier = poll_notifier;
+}
+
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
@@ -586,11 +597,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
 {
     int vector, ret;
 
-    assert(use_notifier && release_notifier);
-
-    dev->msix_vector_use_notifier = use_notifier;
-    dev->msix_vector_release_notifier = release_notifier;
-    dev->msix_vector_poll_notifier = poll_notifier;
+    msix_init_vector_notifiers(dev, use_notifier, release_notifier,
+                               poll_notifier);
 
     if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
         (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8f35e13..e08d981 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -226,7 +226,6 @@ static const TypeInfo pcie_bus_info = {
 };
 
 static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
-static void pci_update_mappings(PCIDevice *d);
 static void pci_irq_handler(void *opaque, int irq_num, int level);
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
 static void pci_del_option_rom(PCIDevice *pdev);
@@ -1335,7 +1334,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
     return new_addr;
 }
 
-static void pci_update_mappings(PCIDevice *d)
+void pci_update_mappings(PCIDevice *d)
 {
     PCIIORegion *r;
     int i;
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c..46606cf 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
 bool msix_is_masked(PCIDevice *dev, unsigned vector);
 void msix_set_pending(PCIDevice *dev, unsigned vector);
 void msix_clr_pending(PCIDevice *dev, int vector);
+int msix_is_pending(PCIDevice *dev, unsigned vector);
 
 int msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
@@ -41,6 +42,10 @@ void msix_notify(PCIDevice *dev, unsigned vector);
 
 void msix_reset(PCIDevice *dev);
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier);
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c..bef3e49 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -902,5 +902,6 @@ extern const VMStateDescription vmstate_pci_device;
 }
 
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
+void pci_update_mappings(PCIDevice *d);
 
 #endif
-- 
1.8.3.1


