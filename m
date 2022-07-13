Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06228573717
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 15:17:35 +0200 (CEST)
Received: from localhost ([::1]:35304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBcFC-0007oU-48
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 09:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc51-000881-Ol; Wed, 13 Jul 2022 09:07:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc4z-0006A9-H3; Wed, 13 Jul 2022 09:07:03 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DCax5C013812;
 Wed, 13 Jul 2022 13:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/obWW9C/3ISK457ZTmY2hYYNPgAmwWa/803T7R5TLDA=;
 b=SMUsiGORLYDCjmIVaSxlUeZwRCsKVm9aJSRuQqbV6+ug1KDq0kGeEydq9XH3ldlgiOfc
 iO6cIK1dJ1Y4Zdl8bHUh8fGuiB17zZ58yjkiV5EmuYBjVVhGDdsMmwV0xPLbqvzDqLUE
 L5SITPHeK0Nw1qyr0GRvcmGYKGMzOCQNwpJOV4vY6nhlC7dnaOaNMzNQyV7r5R2TqPbm
 JAVqSNQ6WQOxLJdYmu06q0Brl9kSKz6p0tTaAxEuKh+4rp0kUWEBFTh9Df7OxebzuRhc
 6H63+a2rxbrifhtILhhUWuMPzGbyTLNhbSKUaZU/waNfcO89CtjzJWk7fC+c2v72WGFI Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9x0ms1u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:58 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DCpgbJ019319;
 Wed, 13 Jul 2022 13:06:58 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9x0ms1rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DCo8fI010333;
 Wed, 13 Jul 2022 13:06:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3h8rrn2m3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26DD6ooB13042158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 13:06:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E05B8AE045;
 Wed, 13 Jul 2022 13:06:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0E10AE04D;
 Wed, 13 Jul 2022 13:06:49 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 13:06:49 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 richard.henderson@linaro.org
Subject: [PATCH v2 04/11] dump: Reorder struct DumpState
Date: Wed, 13 Jul 2022 13:03:15 +0000
Message-Id: <20220713130322.25517-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713130322.25517-1-frankja@linux.ibm.com>
References: <20220713130322.25517-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: chL1boRsgmK5cCvD2BMZ7FI8vivpIuxk
X-Proofpoint-GUID: hwfk_yRNlmcCGxkAo3kqkljexcG5HewE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_01,2022-07-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxlogscore=869 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130053
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

Let's move ELF related members into one block and guest memory related
ones into another to improve readability.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/sysemu/dump.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index bd49532232..8379e29ef6 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -154,15 +154,8 @@ typedef struct DumpState {
     GuestPhysBlockList guest_phys_blocks;
     ArchDumpInfo dump_info;
     MemoryMappingList list;
-    uint32_t phdr_num;
-    uint32_t shdr_num;
     bool resume;
     bool detached;
-    ssize_t note_size;
-    hwaddr shdr_offset;
-    hwaddr phdr_offset;
-    hwaddr section_offset;
-    hwaddr note_offset;
     hwaddr memory_offset;
     int fd;
 
@@ -171,6 +164,16 @@ typedef struct DumpState {
     int64_t begin;             /* Start address of the chunk we want to dump */
     int64_t length;            /* Length of the dump we want to dump */
 
+    /* Elf dump related data */
+    uint32_t phdr_num;
+    uint32_t shdr_num;
+    uint32_t sh_info;
+    ssize_t note_size;
+    hwaddr shdr_offset;
+    hwaddr phdr_offset;
+    hwaddr note_offset;
+    hwaddr section_offset;
+
     void *elf_header;
     void *elf_section_hdrs;
     uint64_t elf_section_data_size;
-- 
2.34.1


