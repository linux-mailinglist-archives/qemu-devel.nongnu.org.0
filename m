Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ED33C894F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:05:31 +0200 (CEST)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iKA-0005QF-8v
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8c-0007aY-Uj; Wed, 14 Jul 2021 12:53:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8a-00013f-Jb; Wed, 14 Jul 2021 12:53:34 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGY0sC022734; Wed, 14 Jul 2021 12:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=Om+2yd3RqTsM+JJ1iyi3UXUMSxGSRwSo2PebIbS2oI8=;
 b=T7kS++FWDUTkl0T1MXCHc/YVSvY66Vkt/jvtmwv6I4MH8HHQosYFrtK2RPykf84/IG2f
 FayTgaEqskP7pp9fzi0q9mOHpyorFSisUCgjfSMk3v2c53p5a/ldpKfVCcBC8EiKPp6T
 yGxkUA+lpbmw1tmz+Y++jE6ODId5d57UiyQjLEY4YC+lpZZDn7FVfUYrrSNttWRPd2bW
 4T8cAqwRTEUdvqMK6AaQBjOLLatMyX8nN4jAM4AzxpxN7Hvs4fi5ekpfqP+7ycpInWoB
 BlEFSb53QXgXBkMxRAE/WlJBPkpxMbBgm4G+Z4d75zugS86e3VPFeT9ZnsehrS1TO3lv 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sc8ka4jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:30 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGYIbp024266;
 Wed, 14 Jul 2021 12:53:30 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sc8ka4hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:29 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGrRBE019653;
 Wed, 14 Jul 2021 16:53:27 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 39q3689va1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16EGrNCM28442982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:53:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD01CA405F;
 Wed, 14 Jul 2021 16:53:23 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A240A405B;
 Wed, 14 Jul 2021 16:53:23 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:23 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 8/9] s390x: numa: define drawers and books for NUMA
Date: Wed, 14 Jul 2021 18:53:15 +0200
Message-Id: <1626281596-31061-9-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PMFLLcm3oQIvK8gDGswwfO9mNiQAZohu
X-Proofpoint-ORIG-GUID: WDh3DdtaU-fNYs99EA0KcwYbj_1WENCo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140099
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

S390 uses 5 levels of CPU topology, we implement the four lower levels:
drawers, books, sockets and cores.

Until now drawers and books were not defined, this patch add the
definition for drawers and books to the machine.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/core/machine.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 6f59fb0b7f..a193ffcd3b 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -692,6 +692,16 @@ void machine_set_cpu_numa_node(MachineState *machine,
             return;
         }
 
+        if (props->has_drawer_id && !slot->props.has_drawer_id) {
+            error_setg(errp, "drawer-id is not supported");
+            return;
+        }
+
+        if (props->has_book_id && !slot->props.has_book_id) {
+            error_setg(errp, "book-id is not supported");
+            return;
+        }
+
         /* skip slots with explicit mismatch */
         if (props->has_thread_id && props->thread_id != slot->props.thread_id) {
                 continue;
@@ -705,6 +715,14 @@ void machine_set_cpu_numa_node(MachineState *machine,
                 continue;
         }
 
+        if (props->has_drawer_id && props->drawer_id != slot->props.drawer_id) {
+                continue;
+        }
+
+        if (props->has_book_id && props->book_id != slot->props.book_id) {
+                continue;
+        }
+
         if (props->has_socket_id && props->socket_id != slot->props.socket_id) {
                 continue;
         }
-- 
2.25.1


