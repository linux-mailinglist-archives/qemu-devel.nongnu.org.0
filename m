Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4D667886
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyfE-0003ns-S8; Thu, 12 Jan 2023 09:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFyet-0003fC-Ut
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:34:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFyeq-0002aK-Is
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:34:22 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CEK7QR027607; Thu, 12 Jan 2023 14:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=HSM/AJz2kGWPrQiiWz1+SRaycGiRwPQnbtcg+oknzpo=;
 b=R5IImGK6cyTxMIKjApT2VpiDbVJMRg2j32oOktm+i4vN1D8N5LlzhfiGxJtTdZ9d4DuA
 OBjwUfHc7kSnrf3cZI58/uFUdYOyNquX0AcqRBJIJDqqthuP2UJc9zhxpgbSMpv+5alz
 g1y4RtO4TzDN6aqP7OEabp+aGb0En8umM2/Hx+liCHtGnDnonISR/zdIUuxQdivJ7tVr
 1KMuzU1f9d0XwXa7De3tKkWY5NrkqsiFWbNxJLhocXkGL62iePBauAxPoJ2rBFWDXDri
 pYfyCsSA11oqPMrRR/Av/xzQ9h3W2y7vhrwRUZE9lX3cKqnFSSoYYiqC1vkWaODpx6I4 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2kvmrc0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 14:34:18 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30CEKLIg027904;
 Thu, 12 Jan 2023 14:34:18 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2kvmrbyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 14:34:18 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30CE2fcU013176;
 Thu, 12 Jan 2023 14:34:17 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3n1k93st74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 14:34:17 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30CEYGxO918102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Jan 2023 14:34:16 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EC7E58056;
 Thu, 12 Jan 2023 14:34:16 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 015285804E;
 Thu, 12 Jan 2023 14:34:16 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 12 Jan 2023 14:34:15 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2] tests/qtest: Poll on waitpid() for a while before sending
 SIGKILL
Date: Thu, 12 Jan 2023 09:34:13 -0500
Message-Id: <20230112143413.3979057-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1Oaxib3TMNbxe_2Ex3UIBa3DdZbkrhXl
X-Proofpoint-GUID: 0oZyrfHFRtOQsUhPEM3jXTiLeZ-8VwF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxlogscore=794 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120105
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
not terminate on SIGTERM, poll on waitpid() for 30s and if the target
process has not changed state until then send a SIGKILL to it.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/libqtest.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 2fbc3b88f3..0150946ebb 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -49,6 +49,8 @@
 # define DEV_NULL   "nul"
 #endif
 
+#define WAITPID_TIMEOUT 30
+
 typedef void (*QTestSendFn)(QTestState *s, const char *buf);
 typedef void (*ExternalSendFn)(void *s, const char *buf);
 typedef GString* (*QTestRecvFn)(QTestState *);
@@ -202,8 +204,24 @@ void qtest_wait_qemu(QTestState *s)
 {
 #ifndef _WIN32
     pid_t pid;
+    uint64_t end;
+
+    /* poll for a while until sending SIGKILL */
+    end = g_get_monotonic_time() + WAITPID_TIMEOUT * G_TIME_SPAN_SECOND;
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


