Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C967178FD5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 12:51:10 +0100 (CET)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9SYP-0002YX-HN
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 06:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j9SR2-0006Mp-7D
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 06:43:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j9SR1-0007hp-2J
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 06:43:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31224
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j9SR0-0007hb-UD
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 06:43:31 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024Bdo3q094048
 for <qemu-devel@nongnu.org>; Wed, 4 Mar 2020 06:43:30 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj6nj3ca9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 04 Mar 2020 06:43:30 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 4 Mar 2020 11:43:28 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Mar 2020 11:43:27 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 024BhQAp59506828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 11:43:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E574A42045;
 Wed,  4 Mar 2020 11:43:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F29842042;
 Wed,  4 Mar 2020 11:43:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.152.224.55])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 11:43:25 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/18] pc-bios: s390x: Save iplb location in lowcore
Date: Wed,  4 Mar 2020 06:42:31 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200304114231.23493-1-frankja@linux.ibm.com>
References: <20200304114231.23493-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030411-4275-0000-0000-000003A844A9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030411-4276-0000-0000-000038BD5017
Message-Id: <20200304114231.23493-19-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_01:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=579 suspectscore=1
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040090
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The POP states that for a list directed IPL the IPLB is stored into
memory by the machine loader and its address is stored at offset 0x14
of the lowcore.

ZIPL currently uses the address in offset 0x14 to access the IPLB and
acquire flags about secure boot. If the IPLB address points into
memory which has an unsupported mix of flags set, ZIPL will panic
instead of booting the OS.

As the lowcore can have quite a high entropy for a guest that did drop
out of protected mode (i.e. rebooted) we encountered the ZIPL panic
quite often.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Tested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
---
 pc-bios/s390-ccw/jump2ipl.c  |  1 +
 pc-bios/s390-ccw/main.c      |  8 +++++++-
 pc-bios/s390-ccw/netmain.c   |  1 +
 pc-bios/s390-ccw/s390-arch.h | 10 ++++++++--
 pc-bios/s390-ccw/s390-ccw.h  |  1 +
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
index da13c43cc0..4eba2510b0 100644
--- a/pc-bios/s390-ccw/jump2ipl.c
+++ b/pc-bios/s390-ccw/jump2ipl.c
@@ -35,6 +35,7 @@ void jump_to_IPL_code(uint64_t address)
 {
     /* store the subsystem information _after_ the bootmap was loaded */
     write_subsystem_identification();
+    write_iplb_location();
 
     /* prevent unknown IPL types in the guest */
     if (iplb.pbt == S390_IPL_TYPE_QEMU_SCSI) {
diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
index a21b386280..4e65b411e1 100644
--- a/pc-bios/s390-ccw/main.c
+++ b/pc-bios/s390-ccw/main.c
@@ -9,6 +9,7 @@
  */
 
 #include "libc.h"
+#include "helper.h"
 #include "s390-arch.h"
 #include "s390-ccw.h"
 #include "cio.h"
@@ -22,7 +23,7 @@ QemuIplParameters qipl;
 IplParameterBlock iplb __attribute__((__aligned__(PAGE_SIZE)));
 static bool have_iplb;
 static uint16_t cutype;
-LowCore const *lowcore; /* Yes, this *is* a pointer to address 0 */
+LowCore *lowcore; /* Yes, this *is* a pointer to address 0 */
 
 #define LOADPARM_PROMPT "PROMPT  "
 #define LOADPARM_EMPTY  "        "
@@ -42,6 +43,11 @@ void write_subsystem_identification(void)
     *zeroes = 0;
 }
 
+void write_iplb_location(void)
+{
+    lowcore->ptr_iplb = ptr2u32(&iplb);
+}
+
 void panic(const char *string)
 {
     sclp_print(string);
diff --git a/pc-bios/s390-ccw/netmain.c b/pc-bios/s390-ccw/netmain.c
index f2dcc01e27..309ffa30d9 100644
--- a/pc-bios/s390-ccw/netmain.c
+++ b/pc-bios/s390-ccw/netmain.c
@@ -40,6 +40,7 @@
 #define DEFAULT_TFTP_RETRIES 20
 
 extern char _start[];
+void write_iplb_location(void) {}
 
 #define KERNEL_ADDR             ((void *)0L)
 #define KERNEL_MAX_SIZE         ((long)_start)
diff --git a/pc-bios/s390-ccw/s390-arch.h b/pc-bios/s390-ccw/s390-arch.h
index 504fc7c2f0..5f36361c02 100644
--- a/pc-bios/s390-ccw/s390-arch.h
+++ b/pc-bios/s390-ccw/s390-arch.h
@@ -36,7 +36,13 @@ typedef struct LowCore {
     /* prefix area: defined by architecture */
     PSWLegacy       ipl_psw;                  /* 0x000 */
     uint32_t        ccw1[2];                  /* 0x008 */
-    uint32_t        ccw2[2];                  /* 0x010 */
+    union {
+        uint32_t        ccw2[2];                  /* 0x010 */
+        struct {
+            uint32_t reserved10;
+            uint32_t ptr_iplb;
+        };
+    };
     uint8_t         pad1[0x80 - 0x18];        /* 0x018 */
     uint32_t        ext_params;               /* 0x080 */
     uint16_t        cpu_addr;                 /* 0x084 */
@@ -85,7 +91,7 @@ typedef struct LowCore {
     PSW             io_new_psw;               /* 0x1f0 */
 } __attribute__((packed, aligned(8192))) LowCore;
 
-extern LowCore const *lowcore;
+extern LowCore *lowcore;
 
 static inline void set_prefix(uint32_t address)
 {
diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
index 11bce7d73c..21f27e7990 100644
--- a/pc-bios/s390-ccw/s390-ccw.h
+++ b/pc-bios/s390-ccw/s390-ccw.h
@@ -57,6 +57,7 @@ void consume_io_int(void);
 /* main.c */
 void panic(const char *string);
 void write_subsystem_identification(void);
+void write_iplb_location(void);
 extern char stack[PAGE_SIZE * 8] __attribute__((__aligned__(PAGE_SIZE)));
 unsigned int get_loadparm_index(void);
 
-- 
2.20.1


