Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FAA154E7B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 23:00:48 +0100 (CET)
Received: from localhost ([::1]:46942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izpCZ-0000mP-3F
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 17:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <farman@linux.ibm.com>) id 1izoxc-0002vv-28
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:45:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <farman@linux.ibm.com>) id 1izoxZ-0007HG-PR
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:45:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35750)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <farman@linux.ibm.com>)
 id 1izoxZ-0007FS-IU
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:45:17 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 016LhYja048687
 for <qemu-devel@nongnu.org>; Thu, 6 Feb 2020 16:45:17 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y0nrthrsh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 16:45:16 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <farman@linux.ibm.com>;
 Thu, 6 Feb 2020 21:45:15 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Feb 2020 21:45:12 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 016LjArq60817582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 21:45:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EF164205F;
 Thu,  6 Feb 2020 21:45:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B50B4204B;
 Thu,  6 Feb 2020 21:45:09 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  6 Feb 2020 21:45:09 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 112C4E027B; Thu,  6 Feb 2020 22:45:09 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [RFC PATCH v2 3/7] vfio-ccw: Refactor cleanup of regions
Date: Thu,  6 Feb 2020 22:45:05 +0100
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206214509.16434-1-farman@linux.ibm.com>
References: <20200206214509.16434-1-farman@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20020621-0008-0000-0000-000003506F4D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020621-0009-0000-0000-00004A710494
Message-Id: <20200206214509.16434-4-farman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-06_04:2020-02-06,
 2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=899 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=2 clxscore=1015 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060158
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we're at it, add a g_free() for the async_cmd_region that
is the last thing currently created.  g_free() knows how to handle
NULL pointers, so this makes it easier to remember what cleanups
need to be performed when new regions are added.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---

Notes:
    v1-v2:
     - Add Conny's r-b

 hw/vfio/ccw.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 19144ecfc7..26e479c53f 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -371,8 +371,7 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
     vcdev->io_region_size = info->size;
     if (sizeof(*vcdev->io_region) != vcdev->io_region_size) {
         error_setg(errp, "vfio: Unexpected size of the I/O region");
-        g_free(info);
-        return;
+        goto out_err;
     }
 
     vcdev->io_region_offset = info->offset;
@@ -385,15 +384,20 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         vcdev->async_cmd_region_size = info->size;
         if (sizeof(*vcdev->async_cmd_region) != vcdev->async_cmd_region_size) {
             error_setg(errp, "vfio: Unexpected size of the async cmd region");
-            g_free(vcdev->io_region);
-            g_free(info);
-            return;
+            goto out_err;
         }
         vcdev->async_cmd_region_offset = info->offset;
         vcdev->async_cmd_region = g_malloc0(info->size);
     }
 
     g_free(info);
+    return;
+
+out_err:
+    g_free(vcdev->async_cmd_region);
+    g_free(vcdev->io_region);
+    g_free(info);
+    return;
 }
 
 static void vfio_ccw_put_region(VFIOCCWDevice *vcdev)
-- 
2.17.1


