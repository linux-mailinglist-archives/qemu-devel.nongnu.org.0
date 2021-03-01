Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA96328F6E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 20:53:16 +0100 (CET)
Received: from localhost ([::1]:36526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGobS-0004Xu-Kx
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 14:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lGoaE-0003k8-SV; Mon, 01 Mar 2021 14:51:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lGoaD-0001fT-0t; Mon, 01 Mar 2021 14:51:58 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121JX7NX112575; Mon, 1 Mar 2021 14:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=C705TNmhbOr5e0uDGT6dLz9jVkpTvzWz8GCOttJJK0w=;
 b=tW6KqUzX/QK/VPkVy7TT65Vvv4egr428++J7dJAbEoPPsR3Urs9VAqamDyGI8mdAAaBt
 PRrtqQcXLKmHUf7Iv0IphwI7033V9zmojBdfrIM64EaozK7M07XXdy7Rk5rhqSd1HWxM
 hdiAx89fdlPe4FXq8GEXOySd16FX4MoB+xmYI7stfgnuxh762I6Ie9S605/9yzzjBX+Y
 dati1345iKBpyX41Bds1TwmWYjNg07bHdnUMVAqOGTe/uXINhzh2mrSnt0lkyOk/g2VV
 GFoFm6sSgOiuTG14QiS4nuEUTkPCkHI9lqivdPHZEF3aMoKe7qZejSI4N+ZW3mCsmP2m ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3713uv5rpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 14:51:52 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 121JXRGk114446;
 Mon, 1 Mar 2021 14:51:52 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3713uv5rnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 14:51:52 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 121JnDQM003981;
 Mon, 1 Mar 2021 19:51:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 370c59s7sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 19:51:50 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 121JplZ548890348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Mar 2021 19:51:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2094DA4051;
 Mon,  1 Mar 2021 19:51:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F150A4040;
 Mon,  1 Mar 2021 19:51:47 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  1 Mar 2021 19:51:47 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id A2192E06D4; Mon,  1 Mar 2021 20:51:46 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] vfio-ccw: Do not read region ret_code after write
Date: Mon,  1 Mar 2021 20:51:43 +0100
Message-Id: <20210301195143.4106604-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_13:2021-03-01,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=997
 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010156
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A pwrite() call returns the number of bytes written (or -1 on error),
and vfio-ccw compares this number with the size of the region to
determine if an error had occurred or not. If they are equal, the
code reads the ret_code field from the region. However, while the
kernel sets the ret_code field as necessary, the region and thus
this field is not "written back" to the user. So the value can only
be what it was initialized to, which is zero.

Not harming anything, but it's a puzzle. Let's avoid the confusion
and just set the return code to zero for this case.

Suggested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/vfio/ccw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index bc78a0ad76..bfd5fd07a5 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -106,7 +106,7 @@ again:
         error_report("vfio-ccw: write I/O region failed with errno=%d", errno);
         ret = -errno;
     } else {
-        ret = region->ret_code;
+        ret = 0;
     }
     switch (ret) {
     case 0:
@@ -194,7 +194,7 @@ again:
         error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
         ret = -errno;
     } else {
-        ret = region->ret_code;
+        ret = 0;
     }
     switch (ret) {
     case 0:
@@ -234,7 +234,7 @@ again:
         error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
         ret = -errno;
     } else {
-        ret = region->ret_code;
+        ret = 0;
     }
     switch (ret) {
     case 0:
-- 
2.25.1


