Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B074D4581
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:17:54 +0100 (CET)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGnp-0004xd-Mp
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:17:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfS-0007EQ-87
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfP-0004eG-G9
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:13 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A8sOCc004432
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fz5Hp8Y9HxNW85ul51S9UWCkXhQQuicC0Fl6x8vpC4Y=;
 b=ePw8HyfNHSNeYei+/c+kQ1KS0UHBX6UYeQZXrPVo47nly1QRWOs+ZTRSTmR8mQFCfgIL
 8EQsMG9CKpNKS9eg9cOWWTXDFMKPwnsFz2dZ9mihMpRrsHHLgADJYm7QKgJ93AOV3wSu
 rH7NkdgFGnfcBn0TEJog108ZKj2NV7Izokdr72nzRwAO0bxsyJ4aZT+wPPo9sQ+cPYD7
 6XZhuqxGcbpQtHu0jLeYM9GlR5ISzAbs96fgd5Yz7CAbEBF4y4suDae3xmaaevj11+PA
 LM+8LRy7cRYLOOH6rNB57GLkZjhylSS6QFWh6ZAZUxJ3pa+XX5Rr6yDHyPYJDfjnntOx pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3entt9r7e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:10 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AATfJW004199
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:09 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3entt9r7dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:09 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB22q4026800;
 Thu, 10 Mar 2022 11:09:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3ekyg92mge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AB94hO52035956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:09:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A78BF11C073;
 Thu, 10 Mar 2022 11:09:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 473F511C071;
 Thu, 10 Mar 2022 11:09:04 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:04 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] dump: Remove the section if when calculating the
 memory offset
Date: Thu, 10 Mar 2022 11:08:49 +0000
Message-Id: <20220310110854.2701-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310110854.2701-1-frankja@linux.ibm.com>
References: <20220310110854.2701-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K_1LG28dLpToJt12fMH-S-6MFEXjl4U8
X-Proofpoint-ORIG-GUID: f7AzXDmKn_oU9T--3pXHyMTv2qf4_Qp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=767 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When s->shdr_num is 0 we'll add 0 bytes of section headers which is
equivalent to not adding section headers but with the multiplication
we can remove a if/else.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index c5ca6027ae..316c636f24 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1808,23 +1808,15 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
-        if (s->shdr_num) {
-            s->memory_offset = sizeof(Elf64_Ehdr) +
-                               sizeof(Elf64_Phdr) * s->phdr_num +
-                               sizeof(Elf64_Shdr) * s->shdr_num + s->note_size;
-        } else {
-            s->memory_offset = sizeof(Elf64_Ehdr) +
-                               sizeof(Elf64_Phdr) * s->phdr_num + s->note_size;
-        }
+        s->memory_offset = sizeof(Elf64_Ehdr) +
+                           sizeof(Elf64_Phdr) * s->phdr_num +
+                           sizeof(Elf64_Shdr) * s->shdr_num +
+                           s->note_size;
     } else {
-        if (s->shdr_num) {
-            s->memory_offset = sizeof(Elf32_Ehdr) +
-                               sizeof(Elf32_Phdr) * s->phdr_num +
-                               sizeof(Elf32_Shdr) * s->shdr_num + s->note_size;
-        } else {
-            s->memory_offset = sizeof(Elf32_Ehdr) +
-                               sizeof(Elf32_Phdr) * s->phdr_num + s->note_size;
-        }
+        s->memory_offset = sizeof(Elf32_Ehdr) +
+                           sizeof(Elf32_Phdr) * s->phdr_num +
+                           sizeof(Elf32_Shdr) * s->shdr_num +
+                           s->note_size;
     }
 
     return;
-- 
2.32.0


