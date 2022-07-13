Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5B5736E8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 15:09:55 +0200 (CEST)
Received: from localhost ([::1]:48278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBc7m-0005CB-5X
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 09:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc50-00082a-5a; Wed, 13 Jul 2022 09:07:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc4x-00069D-IT; Wed, 13 Jul 2022 09:07:01 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DD10gB012410;
 Wed, 13 Jul 2022 13:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1FKNutaZiKs7VX6L+hAwV7jTrn62yRPl5SBfG0TVed8=;
 b=D/n+JLhP21HKrxWXmGmYJuiQSc7VI6MwL2vP/hCvzr/rwi/5LyGWBMQ+XKoceWV4zbDZ
 EmFVrUhs3doQDBjdJ++w8AxO7eU9U0q8/x+jutjHBBMuTYErSw0K7C4vKgcE+UmCzbFB
 KWROrea+71Xb8MDDPB8bwrC1HIuMpIMTWcg5ndO6Il/AK3qhOiAL8KwmYAeKVmyjpjeY
 qHrylJo1CSloqPfbxWCoKdFWFWVPn0zDtw2s0jENdwe5ZOyXS6apcOLTO1Jm7Xlk/fF3
 GUCx9jcqcH4pAroHbQnYJcbXzEB8HYql9maNAR0tVezB6ZdTsr6wY50Xi1+O3LvEvE3V DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9w6aandu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:53 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DBlJEf015951;
 Wed, 13 Jul 2022 13:06:53 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9w6aancf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:53 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DCp6U9029727;
 Wed, 13 Jul 2022 13:06:50 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3h8ncngv36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:50 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26DD5GMK21954922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 13:05:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 385D1AE053;
 Wed, 13 Jul 2022 13:06:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F6ADAE04D;
 Wed, 13 Jul 2022 13:06:46 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 13:06:46 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 richard.henderson@linaro.org
Subject: [PATCH v2 01/11] dump: Cleanup memblock usage
Date: Wed, 13 Jul 2022 13:03:12 +0000
Message-Id: <20220713130322.25517-2-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713130322.25517-1-frankja@linux.ibm.com>
References: <20220713130322.25517-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 23vGIS19H5_q-_bcYLA3WlHZLAz-5DtB
X-Proofpoint-ORIG-GUID: NOxumviR4i_bBnx4xUDVJHGW5rF2YMPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_01,2022-07-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207130053
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

The iteration over the memblocks is hard to understand so it's about
time to clean it up.

struct DumpState's next_block and start members can and should be
local variables within the iterator.

Instead of manually grabbing the next memblock we can use
QTAILQ_FOREACH to iterate over all memblocks.

The begin and length fields in the DumpState have been left untouched
since the qmp arguments share their names.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 91 +++++++++++--------------------------------
 include/sysemu/dump.h | 47 +++++++++++++++++++---
 2 files changed, 65 insertions(+), 73 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 4d9658ffa2..6feba3cbfa 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -591,56 +591,27 @@ static void dump_begin(DumpState *s, Error **errp)
     write_elf_notes(s, errp);
 }
 
-static int get_next_block(DumpState *s, GuestPhysBlock *block)
-{
-    while (1) {
-        block = QTAILQ_NEXT(block, next);
-        if (!block) {
-            /* no more block */
-            return 1;
-        }
-
-        s->start = 0;
-        s->next_block = block;
-        if (s->has_filter) {
-            if (block->target_start >= s->begin + s->length ||
-                block->target_end <= s->begin) {
-                /* This block is out of the range */
-                continue;
-            }
-
-            if (s->begin > block->target_start) {
-                s->start = s->begin - block->target_start;
-            }
-        }
-
-        return 0;
-    }
-}
-
 /* write all memory to vmcore */
 static void dump_iterate(DumpState *s, Error **errp)
 {
     ERRP_GUARD();
     GuestPhysBlock *block;
-    int64_t size;
+    int64_t memblock_size, memblock_start;
 
-    do {
-        block = s->next_block;
-
-        size = block->target_end - block->target_start;
-        if (s->has_filter) {
-            size -= s->start;
-            if (s->begin + s->length < block->target_end) {
-                size -= block->target_end - (s->begin + s->length);
-            }
+    QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
+        memblock_start = dump_get_memblock_start(block, s->begin, s->length);
+        if (memblock_start == -1) {
+            continue;
         }
-        write_memory(s, block, s->start, size, errp);
+
+        memblock_size = dump_get_memblock_size(block, s->begin, s->length);
+
+        /* Write the memory to file */
+        write_memory(s, block, memblock_start, memblock_size, errp);
         if (*errp) {
             return;
         }
-
-    } while (!get_next_block(s, block));
+    }
 }
 
 static void create_vmcore(DumpState *s, Error **errp)
@@ -1490,30 +1461,22 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
     }
 }
 
-static ram_addr_t get_start_block(DumpState *s)
+static int validate_start_block(DumpState *s)
 {
     GuestPhysBlock *block;
 
     if (!s->has_filter) {
-        s->next_block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         return 0;
     }
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
+        /* This block is out of the range */
         if (block->target_start >= s->begin + s->length ||
             block->target_end <= s->begin) {
-            /* This block is out of the range */
             continue;
         }
-
-        s->next_block = block;
-        if (s->begin > block->target_start) {
-            s->start = s->begin - block->target_start;
-        } else {
-            s->start = 0;
-        }
-        return s->start;
-    }
+        return 0;
+   }
 
     return -1;
 }
@@ -1540,25 +1503,17 @@ bool qemu_system_dump_in_progress(void)
     return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
 }
 
-/* calculate total size of memory to be dumped (taking filter into
- * acoount.) */
+/*
+ * calculate total size of memory to be dumped (taking filter into
+ * account.)
+ */
 static int64_t dump_calculate_size(DumpState *s)
 {
     GuestPhysBlock *block;
-    int64_t size = 0, total = 0, left = 0, right = 0;
+    int64_t total = 0;
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        if (s->has_filter) {
-            /* calculate the overlapped region. */
-            left = MAX(s->begin, block->target_start);
-            right = MIN(s->begin + s->length, block->target_end);
-            size = right - left;
-            size = size > 0 ? size : 0;
-        } else {
-            /* count the whole region in */
-            size = (block->target_end - block->target_start);
-        }
-        total += size;
+        total += dump_get_memblock_size(block, s->begin, s->length);
     }
 
     return total;
@@ -1660,8 +1615,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         goto cleanup;
     }
 
-    s->start = get_start_block(s);
-    if (s->start == -1) {
+    /* Is the filter filtering everything? */
+    if (validate_start_block(s) == -1) {
         error_setg(errp, QERR_INVALID_PARAMETER, "begin");
         goto cleanup;
     }
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index ffc2ea1072..f3bf98c220 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -166,11 +166,10 @@ typedef struct DumpState {
     hwaddr memory_offset;
     int fd;
 
-    GuestPhysBlock *next_block;
-    ram_addr_t start;
-    bool has_filter;
-    int64_t begin;
-    int64_t length;
+    /* Guest memory related data */
+    bool has_filter;           /* Are we dumping parts of the memory? */
+    int64_t begin;             /* Start address of the chunk we want to dump */
+    int64_t length;            /* Length of the dump we want to dump */
 
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
@@ -203,4 +202,42 @@ typedef struct DumpState {
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
 uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
 uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
+
+static inline int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t filter_area_start,
+                                             int64_t filter_area_length)
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
+static inline int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start,
+                                  int64_t filter_area_length)
+{
+    if (filter_area_length) {
+        /*
+         * Check if block is within guest memory dump area. If not
+         * go to next one.
+         */
+        if (block->target_start >= filter_area_start + filter_area_length ||
+            block->target_end <= filter_area_start) {
+            return -1;
+        }
+        if (filter_area_start > block->target_start) {
+            return filter_area_start - block->target_start;
+        }
+    }
+    return block->target_start;
+}
 #endif
-- 
2.34.1


