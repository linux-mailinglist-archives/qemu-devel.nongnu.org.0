Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5905254296
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 11:37:57 +0200 (CEST)
Received: from localhost ([::1]:53488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBEM0-0001Vs-Ot
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 05:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kBELH-0000zT-39
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 05:37:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59036
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kBELD-00055W-Rl
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 05:37:10 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R9VfBj032413
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 05:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4DwvKU+klFJRrmZu4dlvRVnUY3gvooEZ199bNOhdDIA=;
 b=YuNr+pG9duMPgynx7FJ7vj1Wzg50ERKtjlj9ngsm8x5q9luLjjedRHGegal29K/OTuNR
 RJqTwjsZzKFQ5uK/nUWguaWnFHApglBFUVbjx/oL3GW5HxQG4Ab8h4cGzBM9GUc+JQN7
 zxCgeZHkkgmQzRMDKkCJ+hUC9JDWvp2WzqfjpKEQCApqRCzMvngh7GoKvWyPpIc8svRW
 aEiWXnUxKDsIXrvfJ736QdSuBNsB4b5O7Z1z/TsTSQYlCF0enIGX4P3oYDzPKeBQuC2F
 DBUDABhAxFIGfhuTJK4gH0klNUGNkBdnHVuZgDnuIvGkF1GWwaLmVaKeuJYCGel3uyV+ UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 336a2k8ej5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 05:37:06 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07R9Vhar032597
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 05:37:06 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 336a2k8eha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 05:37:06 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R9IAeY029591;
 Thu, 27 Aug 2020 09:32:03 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 332ujjuch8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 09:32:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R9W0XA28508424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 09:32:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86BB94204B;
 Thu, 27 Aug 2020 09:32:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E72EB42059;
 Thu, 27 Aug 2020 09:31:59 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 09:31:59 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] pc-bios: s390x: Fix bootmap.c zipl component entry
 data handling
Date: Thu, 27 Aug 2020 05:31:49 -0400
Message-Id: <20200827093152.3026-2-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200827093152.3026-1-frankja@linux.ibm.com>
References: <20200827093152.3026-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 priorityscore=1501 suspectscore=1 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270068
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 05:32:06
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The two main types of zipl component entries are execute and
load/data. The last member of the component entry struct therefore
denotes either a PSW or an address. Let's make this a bit more clear
by introducing a union and cleaning up the code that uses that struct
member.

The execute type component entries written by zipl contain short PSWs,
not addresses. Let's mask them and only pass the address part to
jump_to_IPL_code(uint64_t address) because it expects an address as
visible by the name of the argument.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/bootmap.c | 5 +++--
 pc-bios/s390-ccw/bootmap.h | 7 ++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
index 97205674e5..8747c4ea26 100644
--- a/pc-bios/s390-ccw/bootmap.c
+++ b/pc-bios/s390-ccw/bootmap.c
@@ -10,6 +10,7 @@
 
 #include "libc.h"
 #include "s390-ccw.h"
+#include "s390-arch.h"
 #include "bootmap.h"
 #include "virtio.h"
 #include "bswap.h"
@@ -436,7 +437,7 @@ static void zipl_load_segment(ComponentEntry *entry)
     char *blk_no = &err_msg[30]; /* where to print blockno in (those ZZs) */
 
     blockno = entry->data.blockno;
-    address = entry->load_address;
+    address = entry->compdat.load_addr;
 
     debug_print_int("loading segment at block", blockno);
     debug_print_int("addr", address);
@@ -514,7 +515,7 @@ static void zipl_run(ScsiBlockPtr *pte)
     IPL_assert(entry->component_type == ZIPL_COMP_ENTRY_EXEC, "No EXEC entry");
 
     /* should not return */
-    jump_to_IPL_code(entry->load_address);
+    jump_to_IPL_code(entry->compdat.load_psw & PSW_MASK_SHORT_ADDR);
 }
 
 static void ipl_scsi(void)
diff --git a/pc-bios/s390-ccw/bootmap.h b/pc-bios/s390-ccw/bootmap.h
index 12a0166aae..3946aa3f8d 100644
--- a/pc-bios/s390-ccw/bootmap.h
+++ b/pc-bios/s390-ccw/bootmap.h
@@ -64,11 +64,16 @@ typedef struct BootMapTable {
     BootMapPointer entry[];
 } __attribute__ ((packed)) BootMapTable;
 
+typedef union ComponentEntryData {
+    uint64_t load_psw;
+    uint64_t load_addr;
+} ComponentEntryData;
+
 typedef struct ComponentEntry {
     ScsiBlockPtr data;
     uint8_t pad[7];
     uint8_t component_type;
-    uint64_t load_address;
+    ComponentEntryData compdat;
 } __attribute((packed)) ComponentEntry;
 
 typedef struct ComponentHeader {
-- 
2.25.1


