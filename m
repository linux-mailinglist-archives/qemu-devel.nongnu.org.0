Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06183A7EB7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:10:55 +0200 (CEST)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt8qE-000241-RD
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1lt8p1-0000T7-HT; Tue, 15 Jun 2021 09:09:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25074
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1lt8oz-0001EN-7u; Tue, 15 Jun 2021 09:09:39 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15FD3Y7E066774; Tue, 15 Jun 2021 09:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=bHe4RLp6cbL4m8zFIq9L4dwowhjQd3Y0R9Jab8v9fJY=;
 b=DXx1WCX1Ao7g2no16D+M2XG1METtCygnvxzZPCwz4O0+SKTsadwMXud/ZSS/QyXdNarO
 XikiOnpUVviCH47bsENpk7+xxyf6i14c9N+ROYmHqO43mmzQCndkVM1SHf1HYsKZgeT6
 W808Fizio9CI8mO6Q61oRnccJ9RSVHsCEGL+6DnuMWsW/t6Ux0z0quF1/GJh1ZYWY7iW
 Fw2IastzosAPJC08C8HD7fZMuwGjNQ5NIRHSJOC55JlQjzAkWI0QGi4Y0J5Hwq6zYTUX
 wPOf2+lkbwWpAlbKeVIt15t+x7aQGEJd8/jxVJtQ6FQy8MKXceX6rnTt57HY6/AEJ3kk 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396sexxpyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 09:09:33 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15FD3mj8067407;
 Tue, 15 Jun 2021 09:09:32 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396sexxpwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 09:09:32 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15FD32pt032691;
 Tue, 15 Jun 2021 13:09:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 394m6hsgr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 13:09:30 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15FD9SvU20644288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 13:09:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04DBF4C052;
 Tue, 15 Jun 2021 13:09:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B75A4C040;
 Tue, 15 Jun 2021 13:09:27 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 13:09:27 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qobject: Fix maybe uninitialized in qdict_array_split
Date: Tue, 15 Jun 2021 13:09:21 +0000
Message-Id: <20210615130921.55008-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AQMCeemBHdWlz0KCviIak7_4U8Vkgve5
X-Proofpoint-ORIG-GUID: 7IFJl87Ld6ubFa7o8LF6GA7GzOKgGO6G
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=975 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, cohuck@redhat.com,
 philmd@redhat.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets make the compiler happy.
Found on gcc version 10.3.0 (Ubuntu 10.3.0-1ubuntu1)

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qobject/block-qdict.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
index 1487cc5dd8..8d0f00bc3c 100644
--- a/qobject/block-qdict.c
+++ b/qobject/block-qdict.c
@@ -224,7 +224,6 @@ void qdict_array_split(QDict *src, QList **dst)
     for (i = 0; i < UINT_MAX; i++) {
         QObject *subqobj;
         bool is_subqdict;
-        QDict *subqdict;
         char indexstr[32], prefix[32];
         size_t snprintf_ret;
 
@@ -249,14 +248,16 @@ void qdict_array_split(QDict *src, QList **dst)
         }
 
         if (is_subqdict) {
+            QDict *subqdict = NULL;
+
             qdict_extract_subqdict(src, &subqdict, prefix);
             assert(qdict_size(subqdict) > 0);
+            qlist_append_obj(*dst, QOBJECT(subqdict));
         } else {
             qobject_ref(subqobj);
             qdict_del(src, indexstr);
+            qlist_append_obj(*dst, subqobj);
         }
-
-        qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
     }
 }
 
-- 
2.30.2


