Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32D2698EA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 00:34:06 +0200 (CEST)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHx2z-0006uU-Md
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 18:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kHwyn-0003dY-9r; Mon, 14 Sep 2020 18:29:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24162
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kHwyl-0002rk-4b; Mon, 14 Sep 2020 18:29:45 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08EM16Pv184435; Mon, 14 Sep 2020 18:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=LTJ9SCOY13WvROMsevAjTtFI/wX7cmIpINdVDEHU+Qk=;
 b=HYpEIc0nglQ34qQ+TSSa4CAnrIYZCFsjXjOC/26hGP3DTAk3WkbCSanx8+gaz9YFPr5d
 eoJ8pXUIY9EXJSywDsmWSuxp1XVePle7WccyIdhihYiNwBlP9iY3wGiVgUkK9NvV9Zye
 Ih++vbIzDFLKEyfMa7YFv+bhHyD/XGELrmKF2GOTPVeolnwD4QL9SSatEeMn0rVO8DiE
 mWPMFqXQ6/mVs/gMhuijnHfRux3e8QDGzdwR+OZrZtq8OAPb7RuUObciSZDzEOukPtjZ
 0kGh3PEIV0CThPAGwFGu/TZvKR4reXjtwDeSt0QjRgz5GLroitPYbs0bMCiS3HYwoRrs aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33jfbab3sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 18:29:41 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08EMS93e070468;
 Mon, 14 Sep 2020 18:29:41 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33jfbab3sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 18:29:41 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08EMRoxb023277;
 Mon, 14 Sep 2020 22:29:41 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 33gny8u00a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 22:29:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08EMTdkk47120828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Sep 2020 22:29:39 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7811BE051;
 Mon, 14 Sep 2020 22:29:39 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EAC5BE04F;
 Mon, 14 Sep 2020 22:29:38 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.85.51])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Sep 2020 22:29:38 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: alex.williamson@redhat.com, cohuck@redhat.com
Subject: [PATCH v2 3/3] vfio: Create shared routine for scanning info
 capabilities
Date: Mon, 14 Sep 2020 18:29:30 -0400
Message-Id: <1600122570-12941-4-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1600122570-12941-1-git-send-email-mjrosato@linux.ibm.com>
References: <1600122570-12941-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_09:2020-09-14,
 2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009140166
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 18:29:38
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 schnelle@linux.ibm.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than duplicating the same loop in multiple locations,
create a static function to do the work.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/vfio/common.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7f4a338..bfbbfe4 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -825,17 +825,12 @@ static void vfio_listener_release(VFIOContainer *container)
     }
 }
 
-struct vfio_info_cap_header *
-vfio_get_region_info_cap(struct vfio_region_info *info, uint16_t id)
+static struct vfio_info_cap_header *
+vfio_get_cap(void *ptr, uint32_t cap_offset, uint16_t id)
 {
     struct vfio_info_cap_header *hdr;
-    void *ptr = info;
-
-    if (!(info->flags & VFIO_REGION_INFO_FLAG_CAPS)) {
-        return NULL;
-    }
 
-    for (hdr = ptr + info->cap_offset; hdr != ptr; hdr = ptr + hdr->next) {
+    for (hdr = ptr + cap_offset; hdr != ptr; hdr = ptr + hdr->next) {
         if (hdr->id == id) {
             return hdr;
         }
@@ -844,23 +839,25 @@ vfio_get_region_info_cap(struct vfio_region_info *info, uint16_t id)
     return NULL;
 }
 
+
+struct vfio_info_cap_header *
+vfio_get_region_info_cap(struct vfio_region_info *info, uint16_t id)
+{
+    if (!(info->flags & VFIO_REGION_INFO_FLAG_CAPS)) {
+        return NULL;
+    }
+
+    return vfio_get_cap((void *)info, info->cap_offset, id);
+}
+
 static struct vfio_info_cap_header *
 vfio_get_iommu_type1_info_cap(struct vfio_iommu_type1_info *info, uint16_t id)
 {
-    struct vfio_info_cap_header *hdr;
-    void *ptr = info;
-
     if (!(info->flags & VFIO_IOMMU_INFO_CAPS)) {
         return NULL;
     }
 
-    for (hdr = ptr + info->cap_offset; hdr != ptr; hdr = ptr + hdr->next) {
-        if (hdr->id == id) {
-            return hdr;
-        }
-    }
-
-    return NULL;
+    return vfio_get_cap((void *)info, info->cap_offset, id);
 }
 
 bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
-- 
1.8.3.1


