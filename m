Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07F02030C8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 09:46:53 +0200 (CEST)
Received: from localhost ([::1]:41566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnHAK-00008R-PW
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 03:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jnH6U-0002jz-Kh; Mon, 22 Jun 2020 03:42:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jnH6S-0001tw-EE; Mon, 22 Jun 2020 03:42:54 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05M7VuUb126173; Mon, 22 Jun 2020 03:42:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31shwuhj1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 03:42:50 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05M7W1Dj126637;
 Mon, 22 Jun 2020 03:42:50 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31shwuhhyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 03:42:50 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05M7eJ8H024532;
 Mon, 22 Jun 2020 07:42:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 31sa37twx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 07:42:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05M7fREQ65601838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 07:41:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A31D6A4060;
 Mon, 22 Jun 2020 07:42:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F14CDA405C;
 Mon, 22 Jun 2020 07:42:44 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 07:42:44 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/9] pc-bios: s390x: Move sleep and yield to helper.h
Date: Mon, 22 Jun 2020 03:42:29 -0400
Message-Id: <20200622074235.32528-4-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200622074235.32528-1-frankja@linux.ibm.com>
References: <20200622074235.32528-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_02:2020-06-22,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 cotscore=-2147483648 mlxlogscore=999 suspectscore=1 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006220052
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 03:42:49
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 thuth@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are definitely helper functions.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 pc-bios/s390-ccw/helper.h      | 17 +++++++++++++++++
 pc-bios/s390-ccw/s390-ccw.h    | 18 ------------------
 pc-bios/s390-ccw/virtio-net.c  |  1 +
 pc-bios/s390-ccw/virtio-scsi.c |  1 +
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/pc-bios/s390-ccw/helper.h b/pc-bios/s390-ccw/helper.h
index 78d5bc7442..32a453b634 100644
--- a/pc-bios/s390-ccw/helper.h
+++ b/pc-bios/s390-ccw/helper.h
@@ -14,6 +14,7 @@
 #define S390_CCW_HELPER_H
 
 #include "s390-ccw.h"
+#include "s390-time.h"
 
 /* Avoids compiler warnings when casting a pointer to a u32 */
 static inline uint32_t ptr2u32(void *ptr)
@@ -28,4 +29,20 @@ static inline void *u32toptr(uint32_t n)
     return (void *)(uint64_t)n;
 }
 
+static inline void yield(void)
+{
+    asm volatile ("diag 0,0,0x44"
+                  : :
+                  : "memory", "cc");
+}
+
+static inline void sleep(unsigned int seconds)
+{
+    ulong target = get_time_seconds() + seconds;
+
+    while (get_time_seconds() < target) {
+        yield();
+    }
+}
+
 #endif
diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
index fae1de363f..c5820e43ae 100644
--- a/pc-bios/s390-ccw/s390-ccw.h
+++ b/pc-bios/s390-ccw/s390-ccw.h
@@ -142,26 +142,8 @@ static inline void debug_print_addr(const char *desc, void *p)
 #define KVM_S390_VIRTIO_SET_STATUS      2
 #define KVM_S390_VIRTIO_CCW_NOTIFY      3
 
-static inline void yield(void)
-{
-    asm volatile ("diag 0,0,0x44"
-                  : :
-                  : "memory", "cc");
-}
-
 #define MAX_SECTOR_SIZE 4096
 
-#include "s390-time.h"
-
-static inline void sleep(unsigned int seconds)
-{
-    ulong target = get_time_seconds() + seconds;
-
-    while (get_time_seconds() < target) {
-        yield();
-    }
-}
-
 static inline void IPL_assert(bool term, const char *message)
 {
     if (!term) {
diff --git a/pc-bios/s390-ccw/virtio-net.c b/pc-bios/s390-ccw/virtio-net.c
index a13f3b6fb9..2fcb0a58c5 100644
--- a/pc-bios/s390-ccw/virtio-net.c
+++ b/pc-bios/s390-ccw/virtio-net.c
@@ -20,6 +20,7 @@
 #include "s390-ccw.h"
 #include "virtio.h"
 #include "s390-time.h"
+#include "helper.h"
 
 #ifndef DEBUG_VIRTIO_NET
 #define DEBUG_VIRTIO_NET 0
diff --git a/pc-bios/s390-ccw/virtio-scsi.c b/pc-bios/s390-ccw/virtio-scsi.c
index 7bf0be4ffa..eddfb8a7ad 100644
--- a/pc-bios/s390-ccw/virtio-scsi.c
+++ b/pc-bios/s390-ccw/virtio-scsi.c
@@ -15,6 +15,7 @@
 #include "scsi.h"
 #include "virtio-scsi.h"
 #include "s390-time.h"
+#include "helper.h"
 
 static ScsiDevice default_scsi_device;
 static VirtioScsiCmdReq req;
-- 
2.25.1


