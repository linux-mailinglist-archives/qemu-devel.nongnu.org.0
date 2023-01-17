Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F266DD3B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:10:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkn6-0007fu-2J; Tue, 17 Jan 2023 07:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pHkmT-0007dY-QE
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:09:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pHkmP-0003cc-9d
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:09:31 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HBnVh4006352; Tue, 17 Jan 2023 12:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Qai9JFuXcDiloSoxoQq6GbQx0DJ0H/16ML7a3Vx+tNk=;
 b=Oe/ZyDBUyhu4tcsBjkb0AFnG0p/tAVyj1e27ddxXZ0bzRHOLw78rV0zFEgA+P6ntArlu
 cPMhWkcNK+46fspz4V9WqkxTtdmgBxGZPPn07oQxzzSwBZrbdjYfG757wrgcjTreE3YH
 JYAnKuuP1lmNgQnD9hKyg5SKcSBRdmuCL4rFHZmKuiZYNTRDgsABf0s06Kt8m5y9OYDW
 mUnUgb6dSP1Dg/n7tbdKSsny6re0WSdsvsABms/tpGWnx5rXiRWg+ouxAnyRvG/JPt9I
 xn3m5S8lyoyQfyLEOf02PHWQTSaD7l9nigSDJPd8alud9Z8ejWh/Fxgy1lVnpgQ738yu 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5pegy29c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:09:23 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HBH4CA004194;
 Tue, 17 Jan 2023 12:09:23 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5pegy296-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:09:23 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HBokjZ014458;
 Tue, 17 Jan 2023 12:09:22 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3n3m16y1gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:09:22 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30HC9LK82425380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jan 2023 12:09:21 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 592CB58055;
 Tue, 17 Jan 2023 12:09:21 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D428F5805B;
 Tue, 17 Jan 2023 12:09:20 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jan 2023 12:09:20 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v1 1/2] tests/qtest: Poll on waitpid() for a while before
 sending SIGKILL
Date: Tue, 17 Jan 2023 07:09:14 -0500
Message-Id: <20230117120915.2362119-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117120915.2362119-1-stefanb@linux.ibm.com>
References: <20230117120915.2362119-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sJB8YlSlvBi9vvnY1Z7ZIS7J9Vb22DTA
X-Proofpoint-ORIG-GUID: uTbyUXjc--4Ki4bLUX_8JtkMRo0FHHkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=866 lowpriorityscore=0 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170100
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

To prevent getting stuck on waitpid() in case the target process does
not terminate on SIGTERM, poll on waitpid() for 30s and if the target
process has not changed state until then send a SIGKILL to it.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230112143413.3979057-1-stefanb@linux.ibm.com
[PMM: changed TFR to RETRY_ON_EINTR]
---
 tests/qtest/libqtest.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 5cb38f90da..6b2216cb20 100644
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
+        pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
+    }
 
-    pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
     assert(pid == s->qemu_pid);
 #else
     DWORD ret;
-- 
2.39.0


