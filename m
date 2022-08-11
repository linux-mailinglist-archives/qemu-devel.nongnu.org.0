Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5B58FC03
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:15:38 +0200 (CEST)
Received: from localhost ([::1]:53816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM769-00018K-IY
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM72x-0003jP-2x; Thu, 11 Aug 2022 08:12:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM72u-0008NS-5E; Thu, 11 Aug 2022 08:12:17 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6suO015358;
 Thu, 11 Aug 2022 12:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9myEFsptWOG+da2aiognzUBr0/VJSX9ar+NwjQMjUGA=;
 b=Bmkev84AvyIeWBwx2Ss3g5VKCNSFdF45hgmzWnmqjOwxF/KNCw1w52v9nRz4BJClogoa
 mMcOQEtGpqo2DH14AaoLZOUI2rW0DJ4Tf6dTa+nM6l0Za3A9Gpi94p3+ZaIt65KAJp/Q
 pyA6ZKM2jJTX2EnT0O0LgXCKzS5KKDXc9wMMelDSKEF8X7TJIsUuBVic0Ob7UOeCZkPi
 PGflAWcA7bhw9J12ZNmvuzkOlYn2mnXjrmmdFBYM8wBVgSpIawu1OoRBm27KOnpAOkBT
 V0yJP5g/UXt1CjpnKcsYn/WqGX0qYpWSYAtOn0lLl+qvCboQ+QHOLRIj41dchMr/NY3j /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw14a8v24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:13 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7Teh022885;
 Thu, 11 Aug 2022 12:12:12 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw14a8v0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC758q025449;
 Thu, 11 Aug 2022 12:12:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3huww2j0fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BCC54j26214834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A794AAE04D;
 Thu, 11 Aug 2022 12:12:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85F46AE045;
 Thu, 11 Aug 2022 12:12:04 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:04 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 05/18] dump: Rework filter area variables
Date: Thu, 11 Aug 2022 12:10:58 +0000
Message-Id: <20220811121111.9878-6-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yGVyBg-jSf_LplAmOhetwEDWQjAXq9yV
X-Proofpoint-GUID: 2MQm40rvIK7ELnz_ZxGqBWMrykMIkJ5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110037
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

While the DumpState begin and length variables directly mirror the API
variable names they are not very descriptive. So let's add a
"filter_area_" prefix and make has_filter a function checking length > 0.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 53 +++++++++++++++++++++++++------------------
 include/sysemu/dump.h | 13 ++++++++---
 2 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index e204912a89..b043337bc7 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -59,6 +59,11 @@ static inline bool dump_is_64bit(DumpState *s)
     return s->dump_info.d_class == ELFCLASS64;
 }
 
+static inline bool dump_has_filter(DumpState *s)
+{
+    return s->filter_area_length > 0;
+}
+
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val)
 {
     if (s->dump_info.d_endian == ELFDATA2LSB) {
@@ -443,29 +448,30 @@ static void get_offset_range(hwaddr phys_addr,
     *p_offset = -1;
     *p_filesz = 0;
 
-    if (s->has_filter) {
-        if (phys_addr < s->begin || phys_addr >= s->begin + s->length) {
+    if (dump_has_filter(s)) {
+        if (phys_addr < s->filter_area_begin ||
+            phys_addr >= s->filter_area_begin + s->filter_area_length) {
             return;
         }
     }
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        if (s->has_filter) {
-            if (block->target_start >= s->begin + s->length ||
-                block->target_end <= s->begin) {
+        if (dump_has_filter(s)) {
+            if (block->target_start >= s->filter_area_begin + s->filter_area_length ||
+                block->target_end <= s->filter_area_begin) {
                 /* This block is out of the range */
                 continue;
             }
 
-            if (s->begin <= block->target_start) {
+            if (s->filter_area_begin <= block->target_start) {
                 start = block->target_start;
             } else {
-                start = s->begin;
+                start = s->filter_area_begin;
             }
 
             size_in_block = block->target_end - start;
-            if (s->begin + s->length < block->target_end) {
-                size_in_block -= block->target_end - (s->begin + s->length);
+            if (s->filter_area_begin + s->filter_area_length < block->target_end) {
+                size_in_block -= block->target_end - (s->filter_area_begin + s->filter_area_length);
             }
         } else {
             start = block->target_start;
@@ -638,12 +644,12 @@ static void dump_iterate(DumpState *s, Error **errp)
     int64_t memblock_size, memblock_start;
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        memblock_start = dump_filtered_memblock_start(block, s->begin, s->length);
+        memblock_start = dump_filtered_memblock_start(block, s->filter_area_begin, s->filter_area_length);
         if (memblock_start == -1) {
             continue;
         }
 
-        memblock_size = dump_filtered_memblock_size(block, s->begin, s->length);
+        memblock_size = dump_filtered_memblock_size(block, s->filter_area_begin, s->filter_area_length);
 
         /* Write the memory to file */
         write_memory(s, block, memblock_start, memblock_size, errp);
@@ -1504,14 +1510,14 @@ static int validate_start_block(DumpState *s)
 {
     GuestPhysBlock *block;
 
-    if (!s->has_filter) {
+    if (!dump_has_filter(s)) {
         return 0;
     }
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
         /* This block is out of the range */
-        if (block->target_start >= s->begin + s->length ||
-            block->target_end <= s->begin) {
+        if (block->target_start >= s->filter_area_begin + s->filter_area_length ||
+            block->target_end <= s->filter_area_begin) {
             continue;
         }
         return 0;
@@ -1550,10 +1556,10 @@ static int64_t dump_calculate_size(DumpState *s)
     int64_t size = 0, total = 0, left = 0, right = 0;
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        if (s->has_filter) {
+        if (dump_has_filter(s)) {
             /* calculate the overlapped region. */
-            left = MAX(s->begin, block->target_start);
-            right = MIN(s->begin + s->length, block->target_end);
+            left = MAX(s->filter_area_begin, block->target_start);
+            right = MIN(s->filter_area_begin + s->filter_area_length, block->target_end);
             size = right - left;
             size = size > 0 ? size : 0;
         } else {
@@ -1643,9 +1649,12 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     s->fd = fd;
-    s->has_filter = has_filter;
-    s->begin = begin;
-    s->length = length;
+    if (has_filter && !length) {
+        error_setg(errp, QERR_INVALID_PARAMETER, "length");
+        goto cleanup;
+    }
+    s->filter_area_begin = begin;
+    s->filter_area_length = length;
 
     memory_mapping_list_init(&s->list);
 
@@ -1778,8 +1787,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         return;
     }
 
-    if (s->has_filter) {
-        memory_mapping_filter(&s->list, s->begin, s->length);
+    if (dump_has_filter(s)) {
+        memory_mapping_filter(&s->list, s->filter_area_begin, s->filter_area_length);
     }
 
     /*
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 7fce1d4af6..b62513d87d 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -166,9 +166,16 @@ typedef struct DumpState {
     hwaddr memory_offset;
     int fd;
 
-    bool has_filter;
-    int64_t begin;
-    int64_t length;
+    /*
+     * Dump filter area variables
+     *
+     * A filtered dump only contains the guest memory designated by
+     * the start address and length variables defined below.
+     *
+     * If length is 0, no filtering is applied.
+     */
+    int64_t filter_area_begin;  /* Start address of partial guest memory area */
+    int64_t filter_area_length; /* Length of partial guest memory area */
 
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
-- 
2.34.1


