Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA921580FDC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:27:53 +0200 (CEST)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGr2-0001Ko-Gn
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGmy-00047z-5d; Tue, 26 Jul 2022 05:23:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGmw-0005XS-92; Tue, 26 Jul 2022 05:23:39 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q9LM44019809;
 Tue, 26 Jul 2022 09:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WyJ2xf/GTmbbTbVk7+KYWPUgxHLFgqiliTyd91uchvo=;
 b=cEE/g5uHhEh7RmOMYaTAJO6weEXJBgZRMU3274vQ/9MnlOHgr+TZJFI36sGl1cw35vyH
 VfHK29+KL1ObjitUwSUiGAR0JbpAZZ0eO6qC/4KcXte0ZTVBRorn9bPBX7QsNWt9Liwn
 KqL0Prski4B6bWBM/z2ereexpyioJGtU8UeLncan74ZPYpOzFkzf4p2caI01r/P3zzWB
 TWeraDMBk16oFx5UcgFo5eAoZ2pWgyNUFBZwdlXmxB3IFenwj/zCgFrHtijvpGYdbrMg
 4uCjOxLLRaaBvygTNAh5bQsMgIm+ZRTEbL7lKwkeZkBzmnKd1R7qZRpMbZk7IPBOWp56 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdjm81px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:37 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26Q9LO79019893;
 Tue, 26 Jul 2022 09:23:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdjm81p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26Q9LALU007691;
 Tue, 26 Jul 2022 09:23:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tbjf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26Q9NVmP23200126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 09:23:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D46FA405C;
 Tue, 26 Jul 2022 09:23:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C494A4054;
 Tue, 26 Jul 2022 09:23:30 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 09:23:30 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v4 02/17] dump: Introduce GuestPhysBlock offset and length
 filter functions
Date: Tue, 26 Jul 2022 09:22:33 +0000
Message-Id: <20220726092248.128336-3-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726092248.128336-1-frankja@linux.ibm.com>
References: <20220726092248.128336-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0Ox4seX5ErDB_0cdd2vg8otqBkLuzFff
X-Proofpoint-ORIG-GUID: tbdXcIWCTk_Pxlxpk7UU6N177mEkycIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260033
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The iteration over the memblocks is hard to understand so it's about
time to clean it up. Instead of manually grabbing the next memblock we
can use QTAILQ_FOREACH to iterate over all memblocks.

Additionally we move the calculation of the offset and length out by
using the dump_get_memblock_*() functions.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 37 +++++++++++++++++++++++++++++++++++++
 include/sysemu/dump.h |  5 +++++
 2 files changed, 42 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index 0ed7cf9c7b..0fd7c76c1e 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -591,6 +591,43 @@ static void dump_begin(DumpState *s, Error **errp)
     write_elf_notes(s, errp);
 }
 
+int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t filter_area_start,
+                               int64_t filter_area_length)
+{
+    int64_t size, left, right;
+
+    /* No filter, return full size */
+    if (!filter_area_length) {
+        return block->target_end - block->target_start;
+    }
+
+    /* calculate the overlapped region. */
+    left = MAX(filter_area_start, block->target_start);
+    right = MIN(filter_area_start + filter_area_length, block->target_end);
+    size = right - left;
+    size = size > 0 ? size : 0;
+
+    return size;
+}
+
+int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start,
+                                int64_t filter_area_length)
+{
+    if (filter_area_length) {
+        /* return -1 if the block is not within filter area */
+        if (block->target_start >= filter_area_start + filter_area_length ||
+            block->target_end <= filter_area_start) {
+            return -1;
+        }
+
+        if (filter_area_start > block->target_start) {
+            return filter_area_start - block->target_start;
+        }
+    }
+
+    return 0;
+}
+
 static int get_next_block(DumpState *s, GuestPhysBlock *block)
 {
     while (1) {
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index ffc2ea1072..6ce3c24197 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -203,4 +203,9 @@ typedef struct DumpState {
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
 uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
 uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
+
+int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t filter_area_start,
+                               int64_t filter_area_length);
+int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start,
+                                int64_t filter_area_length);
 #endif
-- 
2.34.1


