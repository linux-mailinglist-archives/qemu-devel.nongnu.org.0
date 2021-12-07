Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9450646C690
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 22:18:08 +0100 (CET)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muhqh-0005Tb-Mx
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 16:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1muhec-00030G-Tr; Tue, 07 Dec 2021 16:05:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1muhea-0000Iw-68; Tue, 07 Dec 2021 16:05:38 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7JbfgX022879; 
 Tue, 7 Dec 2021 21:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3t4A4bUm2urZNXCML1ikVWPAyYTM5aMHmMATOWQH5gc=;
 b=SDr7tQFxYpHmk7B1n3V/jp8rVUM2pKzkFBbq2xfsy/1O1EESMPPekCs6Tjeb1yKA5KJ4
 s6hN6ja1APsr50l1TVBT3hAgZXDzdqW0yZEs7y4QiKmDuovAAUxQG+kYOlBDk2OWb/01
 beZuYp3p+hD8TJgy8VFGpUVpLLQUCKPWn5w7dgSzw/Ihpx8AW+4+z3U286J4dLRL7qNO
 kgFD55vgr6cS/VjCMxifVxJECSxOa0HeN8dV7My2KZBaXhjRaiWBrpZzLcxPchzxS9my
 HtvFxA4817Aiqy1cXIO0aG5EJLcodRgTgLFyjoUx0dfcwP2MF0TOMnoH9abN8elxV5gH 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctajxphp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 21:05:24 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B7Kn9Wk018928;
 Tue, 7 Dec 2021 21:05:23 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctajxphnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 21:05:23 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7KvxWn021323;
 Tue, 7 Dec 2021 21:05:23 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3cqyyau66c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 21:05:22 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7L5LjE51642700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 21:05:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04973AE05C;
 Tue,  7 Dec 2021 21:05:21 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6785AE067;
 Tue,  7 Dec 2021 21:05:17 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.152.43]) by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 21:05:17 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH 12/12] s390x/pci: let intercept devices have separate PCI
 groups
Date: Tue,  7 Dec 2021 16:04:25 -0500
Message-Id: <20211207210425.150923-13-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211207210425.150923-1-mjrosato@linux.ibm.com>
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: U3pp6uU9svBOs8TymBXXHe26AB4v1hSn
X-Proofpoint-GUID: Sary_HgKS-W2OfpKI0H1_asMVU3hdD_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_08,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070128
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 david@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use the reserved pool of simulated PCI groups to allow intercept
devices to have separate groups from interpreted devices as some group
values may be different. If we run out of simulated PCI groups, subsequent
intercept devices just get the default group.
Furthermore, if we encounter any PCI groups from hostdevs that are marked
as simulated, let's just assign them to the default group to avoid
conflicts between host simulated groups and our own simulated groups.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c         | 19 ++++++++++++++--
 hw/s390x/s390-pci-vfio.c        | 40 ++++++++++++++++++++++++++++++---
 include/hw/s390x/s390-pci-bus.h |  6 ++++-
 3 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index ab442f17fb..8b0f3ef120 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -747,13 +747,14 @@ static void s390_pci_iommu_free(S390pciState *s, PCIBus *bus, int32_t devfn)
     object_unref(OBJECT(iommu));
 }
 
-S390PCIGroup *s390_group_create(int id)
+S390PCIGroup *s390_group_create(int id, int host_id)
 {
     S390PCIGroup *group;
     S390pciState *s = s390_get_phb();
 
     group = g_new0(S390PCIGroup, 1);
     group->id = id;
+    group->host_id = host_id;
     QTAILQ_INSERT_TAIL(&s->zpci_groups, group, link);
     return group;
 }
@@ -771,12 +772,25 @@ S390PCIGroup *s390_group_find(int id)
     return NULL;
 }
 
+S390PCIGroup *s390_group_find_host_sim(int host_id)
+{
+    S390PCIGroup *group;
+    S390pciState *s = s390_get_phb();
+
+    QTAILQ_FOREACH(group, &s->zpci_groups, link) {
+        if (group->id >= ZPCI_SIM_GRP_START && group->host_id == host_id) {
+            return group;
+        }
+    }
+    return NULL;
+}
+
 static void s390_pci_init_default_group(void)
 {
     S390PCIGroup *group;
     ClpRspQueryPciGrp *resgrp;
 
-    group = s390_group_create(ZPCI_DEFAULT_FN_GRP);
+    group = s390_group_create(ZPCI_DEFAULT_FN_GRP, ZPCI_DEFAULT_FN_GRP);
     resgrp = &group->zpci_group;
     resgrp->fr = 1;
     resgrp->dasm = 0;
@@ -824,6 +838,7 @@ static void s390_pcihost_realize(DeviceState *dev, Error **errp)
                                            NULL, g_free);
     s->zpci_table = g_hash_table_new_full(g_int_hash, g_int_equal, NULL, NULL);
     s->bus_no = 0;
+    s->next_sim_grp = ZPCI_SIM_GRP_START;
     QTAILQ_INIT(&s->pending_sei);
     QTAILQ_INIT(&s->zpci_devs);
     QTAILQ_INIT(&s->zpci_dma_limit);
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index c9269683f5..bdc5892287 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -305,13 +305,17 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
 {
     struct vfio_info_cap_header *hdr;
     struct vfio_device_info_cap_zpci_group *cap;
+    S390pciState *s = s390_get_phb();
     ClpRspQueryPciGrp *resgrp;
     VFIOPCIDevice *vpci =  container_of(pbdev->pdev, VFIOPCIDevice, pdev);
 
     hdr = vfio_get_device_info_cap(info, VFIO_DEVICE_INFO_CAP_ZPCI_GROUP);
 
-    /* If capability not provided, just use the default group */
-    if (hdr == NULL) {
+    /*
+     * If capability not provided or the underlying hostdev is simulated, just
+     * use the default group.
+     */
+    if (hdr == NULL || pbdev->zpci_fn.pfgid >= ZPCI_SIM_GRP_START) {
         trace_s390_pci_clp_cap(vpci->vbasedev.name,
                                VFIO_DEVICE_INFO_CAP_ZPCI_GROUP);
         pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
@@ -320,11 +324,41 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
     }
     cap = (void *) hdr;
 
+    /*
+     * For an intercept device, let's use an existing simulated group if one
+     * one was already created for other intercept devices in this group.
+     * If not, create a new simulated group if any are still available.
+     * If all else fails, just fall back on the default group.
+     */
+    if (!pbdev->interp) {
+        pbdev->pci_group = s390_group_find_host_sim(pbdev->zpci_fn.pfgid);
+        if (pbdev->pci_group) {
+            /* Use existing simulated group */
+            pbdev->zpci_fn.pfgid = pbdev->pci_group->id;
+            return;
+        } else {
+            if (s->next_sim_grp == ZPCI_DEFAULT_FN_GRP) {
+                /* All out of simulated groups, use default */
+                trace_s390_pci_clp_cap(vpci->vbasedev.name,
+                                       VFIO_DEVICE_INFO_CAP_ZPCI_GROUP);
+                pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
+                pbdev->pci_group = s390_group_find(ZPCI_DEFAULT_FN_GRP);
+                return;
+            } else {
+                /* We can assign a new simulated group */
+                pbdev->zpci_fn.pfgid = s->next_sim_grp;
+                s->next_sim_grp++;
+                /* Fall through to create the new sim group using CLP info */
+            }
+        }
+    }
+
     /* See if the PCI group is already defined, create if not */
     pbdev->pci_group = s390_group_find(pbdev->zpci_fn.pfgid);
 
     if (!pbdev->pci_group) {
-        pbdev->pci_group = s390_group_create(pbdev->zpci_fn.pfgid);
+        pbdev->pci_group = s390_group_create(pbdev->zpci_fn.pfgid,
+                                             pbdev->zpci_fn.pfgid);
 
         resgrp = &pbdev->pci_group->zpci_group;
         if (cap->flags & VFIO_DEVICE_INFO_ZPCI_FLAG_REFRESH) {
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 9941ca0084..8664023d5d 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -315,13 +315,16 @@ typedef struct ZpciFmb {
 QEMU_BUILD_BUG_MSG(offsetof(ZpciFmb, fmt0) != 48, "padding in ZpciFmb");
 
 #define ZPCI_DEFAULT_FN_GRP 0xFF
+#define ZPCI_SIM_GRP_START 0xF0
 typedef struct S390PCIGroup {
     ClpRspQueryPciGrp zpci_group;
     int id;
+    int host_id;
     QTAILQ_ENTRY(S390PCIGroup) link;
 } S390PCIGroup;
-S390PCIGroup *s390_group_create(int id);
+S390PCIGroup *s390_group_create(int id, int host_id);
 S390PCIGroup *s390_group_find(int id);
+S390PCIGroup *s390_group_find_host_sim(int host_id);
 
 struct S390PCIBusDevice {
     DeviceState qdev;
@@ -370,6 +373,7 @@ struct S390pciState {
     QTAILQ_HEAD(, S390PCIBusDevice) zpci_devs;
     QTAILQ_HEAD(, S390PCIDMACount) zpci_dma_limit;
     QTAILQ_HEAD(, S390PCIGroup) zpci_groups;
+    uint8_t next_sim_grp;
 };
 
 S390pciState *s390_get_phb(void);
-- 
2.27.0


