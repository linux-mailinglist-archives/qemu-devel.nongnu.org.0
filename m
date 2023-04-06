Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D06D9C94
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:45:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRmO-00060f-Qm; Thu, 06 Apr 2023 11:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkRmM-00060C-8I
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:44:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkRmG-00067s-T2
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:44:01 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336FUI4H028681; Thu, 6 Apr 2023 15:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=sef23KaLtxX1x8HTw2669bbpH0x9UNzrjKpMNuP7XBk=;
 b=Zr00K3xHy15cxMvvt9rC/3ab+gIutvKiArCrnFzx/aJmrh1SlLQoLGOvr+OLdYk8ye1W
 L0zXz1bksfjC6V134YnR7FQVcdCqYVyCqzgaO6MPqJwqacjEvSo+gyb1hCBsXq/PNfzD
 rGpyfaP8eowXh5nnocmkMOXWh5ETOLZMVYaoXKxG7Lwn2ABc0XN88ZtLvxi0btmMFMec
 lfyfmcHQralMITOuRsLqt6osOBeSxXyzBRQmwxZZ6wf2t3JKxlVmG78JwaZQXHmSnoLk
 l3CpUQkXHmM1Esjsh4m19Uv434inURIcrexr7Czs1CZumeJazNtKfV2HBYAVyY1REODi YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psyt4jb63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 15:43:53 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336FeIrf018113;
 Thu, 6 Apr 2023 15:43:53 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psyt4jb5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 15:43:53 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 336DEWRS016957;
 Thu, 6 Apr 2023 15:43:52 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ppc89a5bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 15:43:52 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336Fhohi37814822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 15:43:50 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99C305805E;
 Thu,  6 Apr 2023 15:43:50 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DDB958059;
 Thu,  6 Apr 2023 15:43:50 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 15:43:49 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, marcandre.lureau@gmail.com, armbru@redhat.com,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] util/error: Fix use-after-free errors reported by Coverity
Date: Thu,  6 Apr 2023 11:43:47 -0400
Message-Id: <20230406154347.4100700-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JE1Y1XDdTeEz-w1ujvaR6rhI2WSbVCaZ
X-Proofpoint-ORIG-GUID: _geEAQA4sIk4tvc7gsxBojgIRIXr2M8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_09,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=836 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060138
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix use-after-free errors in the code path that called error_handle(). A
call to error_handle() will now either free the passed Error 'err' or
assign it to '*errp' if '*errp' is currently NULL. This ensures that 'err'
either has been freed or is assigned to '*errp' if this function returns.
Adjust the two callers of this function to not assign the 'err' to '*errp'
themselves, since this is now handled by error_handle().

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 util/error.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/util/error.c b/util/error.c
index 5537245da6..e5e247209a 100644
--- a/util/error.c
+++ b/util/error.c
@@ -46,6 +46,10 @@ static void error_handle(Error **errp, Error *err)
     }
     if (errp == &error_warn) {
         warn_report_err(err);
+    } else if (errp && !*errp) {
+        *errp = err;
+    } else {
+        error_free(err);
     }
 }
 
@@ -76,7 +80,6 @@ static void error_setv(Error **errp,
     err->func = func;
 
     error_handle(errp, err);
-    *errp = err;
 
     errno = saved_errno;
 }
@@ -289,11 +292,6 @@ void error_propagate(Error **dst_errp, Error *local_err)
         return;
     }
     error_handle(dst_errp, local_err);
-    if (dst_errp && !*dst_errp) {
-        *dst_errp = local_err;
-    } else {
-        error_free(local_err);
-    }
 }
 
 void error_propagate_prepend(Error **dst_errp, Error *err,
-- 
2.39.1


