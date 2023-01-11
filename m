Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96C66663F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 23:32:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFjcC-00025G-9n; Wed, 11 Jan 2023 17:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFjc6-00024y-VB
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 17:30:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFjc5-0001Lb-1Z
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 17:30:30 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30BLiHYs012999; Wed, 11 Jan 2023 22:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Zx5Dbl1p7gojt9nQooYrDy8JuNDcwiq7x3HDncJ4+io=;
 b=BPtHGMmpUP6W5Cv4wXUAs4PzUj8nHEq4m5oXSvkSGVbJpKeMbhJiOdkTC+JpMNVap1O6
 SAz0yPZty7y7tBZLsXZpDVDCK/XWycMr7T4mN5IPiheH/aWC3NTXgCCrtSBxzv/F1ReX
 5dBhzD3uTflt/ne3D/mzP8YyCyipEBVPB45FeQ43g/fI5yioVooPoRgZO6NwR/8pogUK
 f/x86zwztufMMxc9nLpB4XQvWj97QgI0NhiWxRyXxOIJXAMt+b3yIh2e5/ceTErxwwJ+
 qE/modjqNnLZbVLIUYytVUIQpEAmIXN3yCiX7i8abg340hn0xMjUZgBfUa7WR+A9eSsa WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n259g90v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 22:30:23 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30BMSUcD012276;
 Wed, 11 Jan 2023 22:30:23 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n259g90uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 22:30:23 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30BLj9LJ001738;
 Wed, 11 Jan 2023 22:30:22 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3n1kmadhdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 22:30:22 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30BMULnk62521736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 22:30:21 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5BB35803F;
 Wed, 11 Jan 2023 22:30:21 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56D465805A;
 Wed, 11 Jan 2023 22:30:21 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 22:30:21 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] tests/qtest: Poll on waitpid() for a while before sending
 SIGKILL
Date: Wed, 11 Jan 2023 17:30:18 -0500
Message-Id: <20230111223018.3965423-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FUWR-vD8Jz5k1zu4Cv4680jMFrP1KJZb
X-Proofpoint-ORIG-GUID: by-zvTD4aUT0Wwo97Sc7hcSIiC-jY5kG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_10,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=652
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110162
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

To prevent getting stuck on waitpid() in case the target process does
not terminate on SIGTERM, poll on waitpid() for 10s and if the target
process has not changed state until then send a SIGKILL to it.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/qtest/libqtest.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 2fbc3b88f3..362b1f724f 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -202,8 +202,24 @@ void qtest_wait_qemu(QTestState *s)
 {
 #ifndef _WIN32
     pid_t pid;
+    uint64_t end;
+
+    /* poll for 10s until sending SIGKILL */
+    end = g_get_monotonic_time() + 10 * G_TIME_SPAN_SECOND;
+
+    do {
+        pid = waitpid(s->qemu_pid, &s->wstatus, WNOHANG);
+        if (pid != 0) {
+            break;
+        }
+        g_usleep(100 * 1000);
+    } while (g_get_monotonic_time() < end);
+
+    if (pid == 0) {
+        kill(s->qemu_pid, SIGKILL);
+        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
+    }
 
-    TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
     assert(pid == s->qemu_pid);
 #else
     DWORD ret;
-- 
2.39.0


