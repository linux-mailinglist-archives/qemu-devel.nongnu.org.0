Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0791866DD3C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:10:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkmV-0007dx-Lo; Tue, 17 Jan 2023 07:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pHkmT-0007da-SG
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:09:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pHkmP-0003d2-9a
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:09:31 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30H9ZiJa031299; Tue, 17 Jan 2023 12:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=20yzxFbAxzkRe5ZKVCtsuJr39a4thwEEsb9Ymt2MXxg=;
 b=DAysycJ9PTnzWFEpvAP01lGOs53hZ1pnT1aDPE0E0RzC4ajUIqTdqWDkidEBQYj85eAS
 1OGvHKrHvg2FFNWNXKM9yibL1VEN6L6aaSMDDvEahVaj8UtwZk39urdJAyQLIxPldBqH
 3JZZZjqgRXHhGS/kwdBBbsyZfIX6UVJuen2+Ts2XMZv+g0enPgYj24/q6Uk94XU9xd+M
 FveE95BCHYGKeR2uUNnBVYV1owvKwYJNVIXRVSzvzR4L97Uyno4iQxtvu2KcSAm2QIlo
 87ZPrmIX2CawiBP8+Ll2bTToOMlwHjrY3ye9LAWBxKWO+wAKR1PD+zfuqTsQsogTXzy5 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5pwbxfj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:09:24 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HBgCGX018160;
 Tue, 17 Jan 2023 12:09:24 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5pwbxfhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:09:24 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HBmeqH013734;
 Tue, 17 Jan 2023 12:09:23 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3n3m16y1h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:09:23 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30HC9MpB50725210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jan 2023 12:09:22 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03B1658063;
 Tue, 17 Jan 2023 12:09:22 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EF7A58059;
 Tue, 17 Jan 2023 12:09:21 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jan 2023 12:09:21 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v1 2/2] tests/qtest/tpm-emu: Avoid hangs using abort handlers
 closing channels
Date: Tue, 17 Jan 2023 07:09:15 -0500
Message-Id: <20230117120915.2362119-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117120915.2362119-1-stefanb@linux.ibm.com>
References: <20230117120915.2362119-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bXHrydYTKm5WtxoKN-psHCT1ue7sVbQM
X-Proofpoint-ORIG-GUID: D9B5oDcO1ExcYjE9XfLbGt7t2yGMR9UO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170100
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

Install abort handlers that close the TPM control and data channels in
case an abort occurs. The purpose of this is to have QEMU terminate
under abnormal test case failures to resolve intermittent hangs on s390x
hosts running TPM tests for QEMU/x86_64.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230111134547.3959604-1-stefanb@linux.ibm.com
---
 tests/qtest/tpm-emu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 2994d1cf42..73e0000a2c 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -36,11 +36,18 @@ void tpm_emu_test_wait_cond(TPMTestState *s)
     g_mutex_unlock(&s->data_mutex);
 }
 
+static void tpm_emu_close_ioc(void *ioc)
+{
+    qio_channel_close(ioc, NULL);
+}
+
 static void *tpm_emu_tpm_thread(void *data)
 {
     TPMTestState *s = data;
     QIOChannel *ioc = s->tpm_ioc;
 
+    qtest_add_abrt_handler(tpm_emu_close_ioc, ioc);
+
     s->tpm_msg = g_new(struct tpm_hdr, 1);
     while (true) {
         int minhlen = sizeof(s->tpm_msg->tag) + sizeof(s->tpm_msg->len);
@@ -77,6 +84,7 @@ static void *tpm_emu_tpm_thread(void *data)
                           &error_abort);
     }
 
+    qtest_remove_abrt_handler(ioc);
     g_free(s->tpm_msg);
     s->tpm_msg = NULL;
     object_unref(OBJECT(s->tpm_ioc));
@@ -99,6 +107,7 @@ void *tpm_emu_ctrl_thread(void *data)
     qio_channel_wait(QIO_CHANNEL(lioc), G_IO_IN);
     ioc = QIO_CHANNEL(qio_channel_socket_accept(lioc, &error_abort));
     g_assert(ioc);
+    qtest_add_abrt_handler(tpm_emu_close_ioc, ioc);
 
     {
         uint32_t cmd = 0;
@@ -190,6 +199,7 @@ void *tpm_emu_ctrl_thread(void *data)
         }
     }
 
+    qtest_remove_abrt_handler(ioc);
     object_unref(OBJECT(ioc));
     object_unref(OBJECT(lioc));
     return NULL;
-- 
2.39.0


