Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058CB4D8D72
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:53:09 +0100 (CET)
Received: from localhost ([::1]:42250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqkd-0005fR-Nw
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:53:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqiC-0002qO-BX; Mon, 14 Mar 2022 15:50:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52750
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqiA-0003NS-EY; Mon, 14 Mar 2022 15:50:36 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EJlVFV009716; 
 Mon, 14 Mar 2022 19:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/CK9g+YBugw9n85Z2cnuiuKsYBg6z3VT0fTH55kr5aA=;
 b=mJ05YM7HL8dRV/lBaL5/q7+qSj7ebtONmyDHHBvN7g3m603NcvQb54xahSqj9YkuSqwZ
 2VIRlRMTVW0hcu35HjNjXeO0dLu0xd6DfLpyqIBVU5A+bCY6Rg1Vt0zCEeEsLNyZNghZ
 h7GTnqu66bX1jXV8Ifqqs+BzKYw8V082cr+PzbxYagNtrbRbfCvhc0cUu6kfAZbV3KZs
 6iacSo1BA6ppPENq0PRys3MvPU+HLM1Y6eEoGKC5EeT+eY30OpR97IWQdinwTfIvtPS2
 QYmrLR5GUW1H8E6LQTfn4hiTiuA6bW2f+BTcFeh9rixH1Y4oLpfy7hZ9Eb91/ypgPoO4 uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6cw8q3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:50:32 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EJlVxO009741;
 Mon, 14 Mar 2022 19:50:31 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6cw8q35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:50:31 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EJl7Li004522;
 Mon, 14 Mar 2022 19:50:31 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 3erk59g82s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:50:31 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EJoTuh44106140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 19:50:29 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AD62112062;
 Mon, 14 Mar 2022 19:50:29 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BF4611206E;
 Mon, 14 Mar 2022 19:50:24 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.184]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 19:50:23 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v4 11/11] s390x/pci: let intercept devices have separate PCI
 groups
Date: Mon, 14 Mar 2022 15:49:20 -0400
Message-Id: <20220314194920.58888-12-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220314194920.58888-1-mjrosato@linux.ibm.com>
References: <20220314194920.58888-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2A0vnuTlbeu-4oJrJrbovqev4NxeZ-at
X-Proofpoint-GUID: u3Mgcy7UkSGS2tzD-BzKTCDfSE8IKDvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_13,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140116
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c         | 19 ++++++++++++++--
 hw/s390x/s390-pci-vfio.c        | 40 ++++++++++++++++++++++++++++++---
 include/hw/s390x/s390-pci-bus.h |  6 ++++-
 3 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 32894fbe9c..e932f72e89 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -748,13 +748,14 @@ static void s390_pci_iommu_free(S390pciState *s, PCIBus *bus, int32_t devfn)
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
@@ -772,12 +773,25 @@ S390PCIGroup *s390_group_find(int id)
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
@@ -825,6 +839,7 @@ static void s390_pcihost_realize(DeviceState *dev, Error **errp)
                                            NULL, g_free);
     s->zpci_table = g_hash_table_new_full(g_int_hash, g_int_equal, NULL, NULL);
     s->bus_no = 0;
+    s->next_sim_grp = ZPCI_SIM_GRP_START;
     QTAILQ_INIT(&s->pending_sei);
     QTAILQ_INIT(&s->zpci_devs);
     QTAILQ_INIT(&s->zpci_dma_limit);
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index def4e90a40..de24c4ddf0 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -150,13 +150,17 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
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
@@ -165,11 +169,41 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
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
index 5b09f0cf2f..0605fcea24 100644
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


