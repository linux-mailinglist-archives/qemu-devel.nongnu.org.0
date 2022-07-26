Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19874580FFB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:33:27 +0200 (CEST)
Received: from localhost ([::1]:41632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGwQ-0007Us-6C
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGn3-0004Az-Tj; Tue, 26 Jul 2022 05:23:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGn0-0005Y8-DI; Tue, 26 Jul 2022 05:23:44 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q8lFYn014879;
 Tue, 26 Jul 2022 09:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/ejzETTvvstJB7+FkXZKzk+iZVxTBvrWgAs9MT4fj3o=;
 b=c9UgrUqg7p5qmJqGtC/xipUytDcdzNLmVnNuKDe/dAYJpJ+LJrbTs+00JdprjF86YoPr
 sAPQkSLllu0V6KlsA9H6lIgFvFzzPY3cdJNzVblvuGGHXz8smdUGlTTIjb5jHSPJto0L
 PAL47UP+rRjmWtE2x542zawZnXAKzWtEBrkpf8ILf/6D3gBdfH+wvcnBWcY+CfC+GOa0
 M6O5WuwYb+68O1Dr+AEGoVIzqp/nJ7K1tHdEViXT6u7L7D2TQxWRwHX6zrvpBM2Ubiu9
 YKgBi1ltK/nYfpZ1n0a7pzEIK3gN4WAsDfaIowM4IWROERTVGC8mMiu/ZtBG9QAFvjf8 vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjd2j91c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:41 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26Q9KPqM038242;
 Tue, 26 Jul 2022 09:23:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjd2j91bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26Q9L7K5007688;
 Tue, 26 Jul 2022 09:23:38 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tbjfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26Q9NZL014549290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 09:23:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6923AA4054;
 Tue, 26 Jul 2022 09:23:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F15BA405B;
 Tue, 26 Jul 2022 09:23:34 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 09:23:34 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v4 05/17] dump: Cleanup and annotate guest memory related
 DumpState struct members
Date: Tue, 26 Jul 2022 09:22:36 +0000
Message-Id: <20220726092248.128336-6-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726092248.128336-1-frankja@linux.ibm.com>
References: <20220726092248.128336-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RoFKsUgNBF6lDXZ8SeTw5yYJ8QX2Hvvm
X-Proofpoint-GUID: Y9QQ6Lx8bfM8sK9xJ6iY6FqW4xq1CvoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 bulkscore=0 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

We can safely remove next_block and start as both of them aren't used
anymore due to the block iteration re-work.

Also we add comments to the remaining guest memory related struct
members and a comment on top to group them.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 include/sysemu/dump.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 6ce3c24197..24ebb02660 100644
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
-- 
2.34.1


