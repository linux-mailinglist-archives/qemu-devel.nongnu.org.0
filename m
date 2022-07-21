Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750A457CBD7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:26:18 +0200 (CEST)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEWC1-00065W-G6
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9R-0000CA-Uy; Thu, 21 Jul 2022 09:23:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9Q-0006Vn-50; Thu, 21 Jul 2022 09:23:37 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LDK4ix022779;
 Thu, 21 Jul 2022 13:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EtxTSD7JRJXl9J6Jc0fiPUug2v2YgbC0UOTmTPH6Xjc=;
 b=hgB+3ERmZEiikiYF0wc8efL+cOOJcypB026MTL180PNDoeALXIvP2WGmOC5H5ZEY1nRT
 SALZ64xc8YBYd1JvRqDJCDX5FylRHQzz4VK1Hho0qhyEekjDJYdPaIRIyvrsVbMUdzXu
 nwwhYAK4rvORQ3R08W31ORDsPS4dpI8kImHqO+c9GZtoTmM4V93AqwGFiBs7PPA1SCMC
 mwr2VfB1tssfHX4Tfk2CfyU0t7yI8mpspju9BAJH9yU2a2r4yFcqc2VpZQ5mO9Tg/KSW
 x6lCQoSeu2lppzjmeMzMsXu2qTJx8JFuZ7k2WeA6UFTNQ7PPg7UxNUVClf5MYSBvvzyk Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf6tfsecb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:34 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LDKHIe024367;
 Thu, 21 Jul 2022 13:23:33 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf6tfsebg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:33 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LDNVLJ017798;
 Thu, 21 Jul 2022 13:23:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3hbmy8xyfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:31 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LDNSU622151630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 13:23:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46CD44C044;
 Thu, 21 Jul 2022 13:23:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3732C4C040;
 Thu, 21 Jul 2022 13:23:27 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 13:23:27 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Subject: [PATCH v3 01/14] dump: Introduce GuestPhysBlock offset and length
 filter functions
Date: Thu, 21 Jul 2022 13:22:43 +0000
Message-Id: <20220721132256.2171-2-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721132256.2171-1-frankja@linux.ibm.com>
References: <20220721132256.2171-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BSOaMnDc7bkkH0ZdZyE1QucwQOR0k9Vm
X-Proofpoint-GUID: O93Gp2aj9fEs7skJjkKkeQa5MngapNyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_17,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=768 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207210053
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

As the code is used in multiple places in dump/dump.c we should
introduce functions that calculate the filtered length and offset of a
GuestPhysBlock so we can use them in the next patch.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 include/sysemu/dump.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index ffc2ea1072..2b39abeeae 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -203,4 +203,41 @@ typedef struct DumpState {
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
 #endif
-- 
2.34.1


