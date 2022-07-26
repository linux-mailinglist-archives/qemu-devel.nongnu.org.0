Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB226580FFA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:32:50 +0200 (CEST)
Received: from localhost ([::1]:41150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGvp-0007BX-Sl
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGn1-00049J-VB; Tue, 26 Jul 2022 05:23:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGmz-0005Xq-Et; Tue, 26 Jul 2022 05:23:42 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q8rZpV003444;
 Tue, 26 Jul 2022 09:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LS8pnEvpw99rgr0cK7XIWYWcq9881KCuKAGk8GYir3k=;
 b=AjyMeJPlGdFX965pg+zDmAKWPMb3+a4vCyplsslRfUPeejhR0AaUVOK3RHNhlMA3+zrX
 V3Tkxe5+I9hBOn0wBQDOvFZ6kP4w8kYCT4f4c3KBKAUkORmYvZOKhv42VchkihSnsFoP
 QOLP5dkzqA2T8qySMq47RkXhCdX81V7D790zCxyNYaG5rQXbwzfLyEjBU/KJDon2KcpX
 S0OWQdVL2o+D3IQG2X6n4f/DPjVzie95fG6mjmiC4Q2PObpIxruNJQ5d7DkGRpqE5OXm
 ovJyJlq+hPal3B+nlRkaT/VAQV9YtegMYgYWyTbxXauWrynRjRs3Rb3aqE5YKeB95kBY Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjd59gtgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:39 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26Q8tOh8011926;
 Tue, 26 Jul 2022 09:23:38 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjd59gtfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26Q9L1Ta017876;
 Tue, 26 Jul 2022 09:23:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3hh6euj8j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:35 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26Q9NWsE21430708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 09:23:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4BE1A405B;
 Tue, 26 Jul 2022 09:23:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A39F5A4054;
 Tue, 26 Jul 2022 09:23:31 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 09:23:31 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v4 03/17] dump: Convert GuestPhysBlock iterators and use the
 filter functions
Date: Tue, 26 Jul 2022 09:22:34 +0000
Message-Id: <20220726092248.128336-4-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726092248.128336-1-frankja@linux.ibm.com>
References: <20220726092248.128336-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jk3yy2JKNMDFBJHbKldO1A9Uz_lvt-ZY
X-Proofpoint-ORIG-GUID: fdIcymmzY054hS2rWR4DNaJ3JcI1Rydw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260033
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
time to clean it up. Instead of manually grabbing the next memblock we
can use QTAILQ_FOREACH to iterate over all memblocks.

Additionally we move the calculation of the offset and length out by
using the dump_get_memblock_*() functions.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 51 +++++++++++----------------------------------------
 1 file changed, 11 insertions(+), 40 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0fd7c76c1e..35b9833a00 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -628,56 +628,27 @@ int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start
     return 0;
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
-- 
2.34.1


