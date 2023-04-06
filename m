Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9EB6D9E0A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 18:57:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkSuV-0004GH-93; Thu, 06 Apr 2023 12:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkSuT-0004FJ-2t
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:56:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkSuQ-0000Yb-Hf
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:56:28 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336FV8BU008416; Thu, 6 Apr 2023 16:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=PseD9JjBXD0WaqtFHKIPDbEs3HeefOyk1JGPC70vwq4=;
 b=Azd7hcdLncxg1M4/wEZN1c7kJBCflOnb+O9x9UjpwLPjaISvyZDbEdNtHe9uJzxQFg3g
 Iaoe/VVTDbTBLoeUcU+Nb3V+70RMEz3d4ObiauW+09BxZJ6giCi2sEddr6l+k11qjkRc
 o+XcYGyiMpWtHKg3/zLwLErI9ASPD9MJvOmZf6PODKpkuCkP8xpp70XqG0j3CtJW5NLu
 352ndMiqWrYShRgXbVHI0O92k2L0oDngkWvkOuzyq4R2F6IRJ/m1pGIoBbQLCmiY6FwF
 9YtoonWFxt0Ey6NWBn7nMlmQi2aHO8XOFa4ln0gOn895X+m1ItuFLVs8zcNzXzze1o5p Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pt0n82e0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 16:56:24 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336GSb5x001055;
 Thu, 6 Apr 2023 16:56:24 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pt0n82e0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 16:56:24 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 336FVACO008617;
 Thu, 6 Apr 2023 16:56:23 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3ppc883nbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 16:56:23 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336GuM0331326962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 16:56:22 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAADF58052;
 Thu,  6 Apr 2023 16:56:22 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D21058045;
 Thu,  6 Apr 2023 16:56:22 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 16:56:22 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 1/1] util/error: Fix use-after-free errors reported by Coverity
Date: Thu,  6 Apr 2023 12:56:15 -0400
Message-Id: <20230406165615.4102782-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230406165615.4102782-1-stefanb@linux.ibm.com>
References: <20230406165615.4102782-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9d1154yNZGw-NGpEuY64FBnflAKHdBWT
X-Proofpoint-ORIG-GUID: Aw2qzO4tnr8uv-P2v0Q70rtqtVj-gGbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_10,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxlogscore=965 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060148
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fixes: commit 3ffef1a55ca3 ("error: add global &error_warn destination")
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20230406154347.4100700-1-stefanb@linux.ibm.com
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


