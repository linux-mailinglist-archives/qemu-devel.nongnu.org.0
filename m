Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EEDFD371
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 04:36:40 +0100 (CET)
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVSPX-0004co-Od
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 22:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <farman@linux.ibm.com>) id 1iVSOT-00042H-St
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 22:35:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <farman@linux.ibm.com>) id 1iVSOS-0003Fo-R3
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 22:35:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65144
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <farman@linux.ibm.com>)
 id 1iVSOS-0003AW-Md
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 22:35:32 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAF3YT2L117971
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 22:35:24 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w9jtv6qbx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 22:35:24 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <farman@linux.ibm.com>;
 Fri, 15 Nov 2019 03:34:40 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 03:34:39 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAF3Ycq152101186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 03:34:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED89BA4055;
 Fri, 15 Nov 2019 03:34:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBE49A4051;
 Fri, 15 Nov 2019 03:34:37 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 15 Nov 2019 03:34:37 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 9A9FCE01E7; Fri, 15 Nov 2019 04:34:37 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Subject: [RFC PATCH v1 2/8] vfio-ccw: Don't inject an I/O interrupt if the
 subchannel is not enabled
Date: Fri, 15 Nov 2019 04:34:31 +0100
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191115033437.37926-1-farman@linux.ibm.com>
References: <20191115033437.37926-1-farman@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19111503-0020-0000-0000-000003865014
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111503-0021-0000-0000-000021DC69D2
Message-Id: <20191115033437.37926-3-farman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_07:2019-11-14,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=932
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150029
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Farhan Ali <alifm@linux.ibm.com>

According to PoPs, when the SCHIB.PMCW bit 8 is 0 status presented by
the device is not made available to the program. So don't inject an
interrupt in the guest if the guest OS has not enabled the
subchannel.

Signed-off-by: Farhan Ali <alifm@linux.ibm.com>
Signed-off-by: Eric Farman <farman@linux.ibm.com>
---

Notes:
    v0->v1: [EF]
     - Update commit message, as the bit in question is bit 8 not 15

 hw/vfio/ccw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 0919ddbeb8..0590a6f512 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -230,6 +230,11 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
         return;
     }
 
+    /* Virtual subchannel is not enabled */
+    if (!(schib->pmcw.flags & PMCW_FLAGS_MASK_ENA)) {
+        return;
+    }
+
     size = pread(vcdev->vdev.fd, region, vcdev->io_region_size,
                  vcdev->io_region_offset);
     if (size == -1) {
-- 
2.17.1


