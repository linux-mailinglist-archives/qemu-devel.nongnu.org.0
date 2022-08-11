Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7AB58FC02
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:15:36 +0200 (CEST)
Received: from localhost ([::1]:53678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM767-000128-Dg
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM72x-0003jO-2X; Thu, 11 Aug 2022 08:12:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM72t-0008N6-AD; Thu, 11 Aug 2022 08:12:16 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6uoY016685;
 Thu, 11 Aug 2022 12:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5TNBlaF2zGxsbDWMGODVISrMpbgLLMPdmidwDYEJRqs=;
 b=lNJlbOW+Tg24eVfMb6ZBwI92coZqYJ6aYaQ4r6xIirb0PJPxXgGYFRm1dkEaohzH/+de
 44xVI4L+lZV/H8Q4hYwuPDHaDRMtWIvcwGYRbFHLQyJTXXemLrTJb+vjZsSd4NJWfx7s
 hgNMSrcfdAmtGL91kBus2lMbg5XKOY2A32rFDXryFxaxuzVSpxAaalE3RdTk9iNg10ik
 mNCP6mJd0MsC2SWFg4xOupsR7JF9/ck7VdjQmGaNgExmfBYyRYko3OwDm1/X3VocShf+
 t1GqykRh77piVOKn9N3vXfKj6zEIwtyypIowq0jZguuBHPYzcC8u8YUauBO7lQQb6J9A Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1b0ghry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:09 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7Jl0022229;
 Thu, 11 Aug 2022 12:12:08 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1b0ghqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:08 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC758p025449;
 Thu, 11 Aug 2022 12:12:06 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3huww2j0fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BCC3Mq36110656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 171E4AE04D;
 Thu, 11 Aug 2022 12:12:03 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAA67AE045;
 Thu, 11 Aug 2022 12:12:01 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:01 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 03/18] dump: Refactor dump_iterate and introduce
 dump_filter_memblock_*()
Date: Thu, 11 Aug 2022 12:10:56 +0000
Message-Id: <20220811121111.9878-4-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pjeVIAPxGCjsjKUTFmr1I6y8ipVEUrJ8
X-Proofpoint-ORIG-GUID: qM3qc0eyQm0507Pe82LxuKbnarIZhYBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208110037
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

The iteration over the memblocks in dump_iterate() is hard to
understand so it's about time to clean it up. Instead of manually
grabbing the next memblock we can use QTAILQ_FOREACH to iterate over
all memblocks.

Additionally we move the calculation of the offset and length out by
introducing and using the dump_filter_memblock_*() functions. These
functions will later be used to cleanup other parts of dump.c.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
---
 dump/dump.c | 80 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0ed7cf9c7b..340de5a1e7 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -591,31 +591,43 @@ static void dump_begin(DumpState *s, Error **errp)
     write_elf_notes(s, errp);
 }
 
-static int get_next_block(DumpState *s, GuestPhysBlock *block)
+static int64_t dump_filtered_memblock_size(GuestPhysBlock *block,
+                                           int64_t filter_area_start,
+                                           int64_t filter_area_length)
 {
-    while (1) {
-        block = QTAILQ_NEXT(block, next);
-        if (!block) {
-            /* no more block */
-            return 1;
-        }
+    int64_t size, left, right;
 
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
+    /* No filter, return full size */
+    if (!filter_area_length) {
+        return block->target_end - block->target_start;
     }
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
+static int64_t dump_filtered_memblock_start(GuestPhysBlock *block,
+                                            int64_t filter_area_start,
+                                            int64_t filter_area_length)
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
 }
 
 /* write all memory to vmcore */
@@ -623,24 +635,22 @@ static void dump_iterate(DumpState *s, Error **errp)
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
+        memblock_start = dump_filtered_memblock_start(block, s->begin, s->length);
+        if (memblock_start == -1) {
+            continue;
         }
-        write_memory(s, block, s->start, size, errp);
+
+        memblock_size = dump_filtered_memblock_size(block, s->begin, s->length);
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
-- 
2.34.1


