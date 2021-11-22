Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5899B458D77
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:30:48 +0100 (CET)
Received: from localhost ([::1]:35894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7X5-0003SD-Eh
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:30:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1mp7Vq-0002cp-1w; Mon, 22 Nov 2021 06:29:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13496
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1mp7Vn-0006Fn-AB; Mon, 22 Nov 2021 06:29:29 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMBHPNr022702; 
 Mon, 22 Nov 2021 11:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tyewLaydH9gb76XFpz0LHjNLwBj1cTG+RF5jPFdETds=;
 b=b4VmzQx6ixDBUukRerOQdJpLo1w7TDgS1TkdjR7kRGxvvF9xUUtP/dipzIDn5AftHjXt
 ZG2ctQjIG/4FSPT8hs2C0QLFIfDGrM929EQeEq2Jz717l5ql3KwcFl8nD63PLKG2u8Pw
 s3trkSacDInY7OSzh+LxenjzJpGtNtzhZve18eUXUG5XtiCSA7k8zALylVjVN3wJd9Dm
 hIG2Y5wA/zw3O5LgrShlJsPgUYmGlOs2BsSU15+sm1JuPYUKGzb9QfmWzIFdqJZkUEyf
 85GWCu2j6SY2Hf9xqKnjjdBogn9gc8OJwgFLUk1JBQouzYhVuMtUxFqkb+Jh0st2daeT zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cga70g827-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 11:29:24 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AMBHPL5022711;
 Mon, 22 Nov 2021 11:29:23 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cga70g81k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 11:29:23 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AMBGsb2007001;
 Mon, 22 Nov 2021 11:29:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3cern9vp0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 11:29:21 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AMBM98346465296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 11:22:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94E864C04E;
 Mon, 22 Nov 2021 11:29:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43ED64C058;
 Mon, 22 Nov 2021 11:29:18 +0000 (GMT)
Received: from marcibm.ibmuc.com (unknown [9.171.54.169])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Nov 2021 11:29:18 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] s390x/ipl: support extended kernel command line size
Date: Mon, 22 Nov 2021 12:29:09 +0100
Message-Id: <20211122112909.18138-1-mhartmay@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UV6acpqiXZYpzYe9acqltcYwPVGUG3sx
X-Proofpoint-ORIG-GUID: JIm5mBzq5mXrsZ5pnsPNfEpSXIRB3169
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_05,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220055
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mhartmay@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the past s390 used a fixed command line length of 896 bytes. This has changed
with the Linux commit 5ecb2da660ab ("s390: support command lines longer than 896
bytes"). There is now a parm area indicating the maximum command line size. This
parm area has always been initialized to zero, so with older kernels this field
would read zero and we must then assume that only 896 bytes are available.

Acked-by: Viktor Mihajlovski <mihajlov@de.ibm.com>
Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
---
 hw/s390x/ipl.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 7ddca0127fc2..092c66b3f9f1 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -37,8 +37,9 @@
 
 #define KERN_IMAGE_START                0x010000UL
 #define LINUX_MAGIC_ADDR                0x010008UL
+#define KERN_PARM_AREA_SIZE_ADDR        0x010430UL
 #define KERN_PARM_AREA                  0x010480UL
-#define KERN_PARM_AREA_SIZE             0x000380UL
+#define LEGACY_KERN_PARM_AREA_SIZE      0x000380UL
 #define INITRD_START                    0x800000UL
 #define INITRD_PARM_START               0x010408UL
 #define PARMFILE_START                  0x001000UL
@@ -110,6 +111,21 @@ static uint64_t bios_translate_addr(void *opaque, uint64_t srcaddr)
     return srcaddr + dstaddr;
 }
 
+static uint64_t get_max_kernel_cmdline_size(void)
+{
+    uint64_t *size_ptr = rom_ptr(KERN_PARM_AREA_SIZE_ADDR, sizeof(*size_ptr));
+
+    if (size_ptr) {
+        uint64_t size;
+
+        size = be64_to_cpu(*size_ptr);
+        if (size != 0) {
+            return size;
+        }
+    }
+    return LEGACY_KERN_PARM_AREA_SIZE;
+}
+
 static void s390_ipl_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -197,10 +213,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
             ipl->start_addr = KERN_IMAGE_START;
             /* Overwrite parameters in the kernel image, which are "rom" */
             if (parm_area) {
-                if (cmdline_size > KERN_PARM_AREA_SIZE) {
+                uint64_t max_cmdline_size = get_max_kernel_cmdline_size();
+                if (cmdline_size > max_cmdline_size) {
                     error_setg(errp,
                                "kernel command line exceeds maximum size: %zu > %lu",
-                               cmdline_size, KERN_PARM_AREA_SIZE);
+                               cmdline_size, max_cmdline_size);
                     return;
                 }
 
-- 
2.31.1


