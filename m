Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8E32B914
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 17:08:56 +0100 (CET)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHU3S-0005CA-JI
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 11:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lHU2U-0004ZS-6a; Wed, 03 Mar 2021 11:07:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lHU2Q-0003sY-Di; Wed, 03 Mar 2021 11:07:53 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123G3qC6179913; Wed, 3 Mar 2021 11:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=kA/LcFPCM/nVgIlcuRQp5qRSfo63xfC3htARS0aWN5g=;
 b=o964Dx/prIfI7JVNOHjA9V6k8Ys2yExh5x1TvJ0zyRI42WQhRmUuOChOePH0epVQcq43
 U9HqaW0PoJAufULCbOjwPLFCAG52tRud793bUkhIWCApGCPu7lSR9c8c6Q9OrQvIp4nq
 EC9Cr8jt4ea3gsm6AkMXAnFbdgWPEUtnAcrWhmrizvuT3duOG3229ikOlK/0sLbsDoeY
 3bT2USKHhrLKNEcyl6PfLUsp6g9Z6kYR/b2lwfQpUp1WIo3ImdjKcOi9CNzle2voXMQo
 dwDg7Sz0WebDWfjWdI+QcdX+MMF9t24irpX+ko3t6Ytej0oDivqUNPKnTm0628SrWPKb eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372cmfjsnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 11:07:47 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 123G4Q0h188046;
 Wed, 3 Mar 2021 11:07:47 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372cmfjskj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 11:07:47 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 123FvXmY022614;
 Wed, 3 Mar 2021 16:07:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 371162j08f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 16:07:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 123G7g3M41156936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 16:07:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DAFA4C044;
 Wed,  3 Mar 2021 16:07:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0523B4C052;
 Wed,  3 Mar 2021 16:07:42 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  3 Mar 2021 16:07:41 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id AD8DFE1BF9; Wed,  3 Mar 2021 17:07:41 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2] vfio-ccw: Do not read region ret_code after write
Date: Wed,  3 Mar 2021 17:07:39 +0100
Message-Id: <20210303160739.2179378-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030120
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
determine if an error had occurred or not.

If they are not equal, this is a failure and the errno is used to
determine exactly how things failed. An errno of zero is possible
(though unlikely) in this situation and would be translated to a
successful operation.

If they ARE equal, the ret_code field is read from the region to
determine how to proceed. While the kernel sets the ret_code field
as necessary, the region and thus this field is not "written back"
to the user. So the value can only be what it was initialized to,
which is zero.

So, let's convert an unexpected length with errno of zero to a
return code of -EFAULT, and explicitly set an expected length to
a return code of zero. This will be a little safer and clearer.

Suggested-by: Matthew Rosato <mjrosato@linux.ibm.com>
Signed-off-by: Eric Farman <farman@linux.ibm.com>
---

Notes:
    Changes v1->v2:
     - Add code to handle an unexpected length being returned,
       but errno is not set. [CH]
    
    v1: https://lore.kernel.org/qemu-devel/cc440ee8-28c5-3208-19db-ebb48ea60e9d@linux.ibm.com/

 hw/vfio/ccw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index bc78a0ad76..b2df708e4b 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -104,9 +104,9 @@ again:
             goto again;
         }
         error_report("vfio-ccw: write I/O region failed with errno=%d", errno);
-        ret = -errno;
+        ret = errno ? -errno : -EFAULT;
     } else {
-        ret = region->ret_code;
+        ret = 0;
     }
     switch (ret) {
     case 0:
@@ -192,9 +192,9 @@ again:
             goto again;
         }
         error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
-        ret = -errno;
+        ret = errno ? -errno : -EFAULT;
     } else {
-        ret = region->ret_code;
+        ret = 0;
     }
     switch (ret) {
     case 0:
@@ -232,9 +232,9 @@ again:
             goto again;
         }
         error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
-        ret = -errno;
+        ret = errno ? -errno : -EFAULT;
     } else {
-        ret = region->ret_code;
+        ret = 0;
     }
     switch (ret) {
     case 0:
-- 
2.25.1


