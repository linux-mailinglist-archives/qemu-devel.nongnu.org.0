Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494334EC4E6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:48:50 +0200 (CEST)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXkn-0002Tv-DA
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:48:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZU-0006Xi-KU
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZS-0003Nm-Qx
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:08 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UB7Zbw009893; 
 Wed, 30 Mar 2022 12:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J/pXvdpT3ijRk510GtbPUmcm/+8by8LUDmrBVKwhts4=;
 b=BjXIiVNa1wyBygh7IegYexvdNjacjzwKaRmnOVb6ZcRWIcmVEYhZKvzJdYPansNl9LmT
 Q29WGeG7/vNjqwCR4ZhSdf0YwwDZNjwwOc4yDR8nU/NO9hfq7myPXRoJj4K/dakQqaIT
 jE1gKN1zPMINl+ORffKJzPgFMJD1jbnj6iOyCxUYf4ucshPWQXHWsxIAqC2TvilJVt8w
 GRumcVIxq47PACQHB73V7QAD04sw4M9gYVzramoSiTiPz9sl3cjDSJ4z1aFeZLFebe9s
 bwGZtYfdZrMBkte5q1KYMbyhQexdB4qheRm3OhsUjpgv/eyNICXOTbrNTjsiTMpKbN7H 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f40t8wdsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:03 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UBe2t8004916;
 Wed, 30 Mar 2022 12:37:03 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f40t8wds5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:03 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UCNbQe027068;
 Wed, 30 Mar 2022 12:37:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3f3rs3kjc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:00 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22UCOx0t34210144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 12:24:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CAA452050;
 Wed, 30 Mar 2022 12:36:58 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 205585204E;
 Wed, 30 Mar 2022 12:36:58 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/9] dump: Remove the section if when calculating the
 memory offset
Date: Wed, 30 Mar 2022 12:35:58 +0000
Message-Id: <20220330123603.107120-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330123603.107120-1-frankja@linux.ibm.com>
References: <20220330123603.107120-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qm5p3O_XyI7Xh-ryiymuQbHCRzM4SdNM
X-Proofpoint-GUID: O5tFIRGP8VOU4hkNKZeQfqV4jmhFP3MQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=809 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300063
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
Cc: marcandre.lureau@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When s->shdr_num is 0 we'll add 0 bytes of section headers which is
equivalent to not adding section headers but with the multiplication
we can remove a if/else.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 dump/dump.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index cd11dec0f4..bdff651da4 100644
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


