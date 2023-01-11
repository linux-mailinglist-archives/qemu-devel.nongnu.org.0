Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2956665C8C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 14:32:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFbC1-00068S-Kg; Wed, 11 Jan 2023 08:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFbBd-00066T-6P
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:30:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFbBb-0003Ei-CI
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:30:36 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30BC3Axh029735; Wed, 11 Jan 2023 13:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=D+AUJC8kTsW38o6MHD1WkpXRzIYwWycy59RGfvk7EKs=;
 b=eHnG/i9nKUhyTJDov+LTwUemUvCMkaYBnNnpy3mT1BK15y/HXmvUbU/ZesP1WE+YHgt4
 edx/uvkDdYh4qaWS//NyhHRFQ66X2WjOXaIMnn+v7bjqlSLuSaxFNvc5AM1Cnor9aHGf
 zLilwMNTzlu7hLwx4e4lsX9VcM3aK3ieNaZQIYnhosQRskTIhF3faST6CM7FwW3uneh/
 IDIUBzDTiP7k5zMz2wdJVs5VVC1wbwhqk9qijhXN+FUqqPFzGfAOeeEV90vMVTkuuWXJ
 L/ScnfZREKXsd+8BKNLTqYbsVhnhgmlvjKjpZJm782KTJSA5Ae5M9n6SGh34z5CM2cVE Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1thuw2ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 13:30:33 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30BD7mUv025852;
 Wed, 11 Jan 2023 13:30:32 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1thuw2mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 13:30:32 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30BCS8SF001836;
 Wed, 11 Jan 2023 13:30:32 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3n1kmaav84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 13:30:32 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30BDUV0T36504304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 13:30:31 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBB5158059;
 Wed, 11 Jan 2023 13:30:30 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86C9458057;
 Wed, 11 Jan 2023 13:30:30 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 13:30:30 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] tests/qtest/tpm-emu: Avoid hangs using abort handlers closing
 channels
Date: Wed, 11 Jan 2023 08:30:23 -0500
Message-Id: <20230111133023.3958587-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4bBJBLcPacAv8FSjzeNCLCcYUFecRYsk
X-Proofpoint-GUID: cax3hTKWhIyne3deEf76IscsUO3DgN_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_05,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110092
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

Install abort handlers that close the TPM control and data channels in
case an abort occurs. The purpose of this is to have QEMU terminate
under abnormal test case failures to resolve intermittent hangs on s390x
hosts running TPM tests for QEMU/x86_64.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/qtest/tpm-emu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 2994d1cf42..5740cab950 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -36,11 +36,18 @@ void tpm_emu_test_wait_cond(TPMTestState *s)
     g_mutex_unlock(&s->data_mutex);
 }
 
+static void tpm_emu_close_data_ioc(void *ioc)
+{
+    qio_channel_close(ioc, NULL);
+}
+
 static void *tpm_emu_tpm_thread(void *data)
 {
     TPMTestState *s = data;
     QIOChannel *ioc = s->tpm_ioc;
 
+    qtest_add_abrt_handler(tpm_emu_close_data_ioc, ioc);
+
     s->tpm_msg = g_new(struct tpm_hdr, 1);
     while (true) {
         int minhlen = sizeof(s->tpm_msg->tag) + sizeof(s->tpm_msg->len);
@@ -77,12 +84,18 @@ static void *tpm_emu_tpm_thread(void *data)
                           &error_abort);
     }
 
+    qtest_remove_abrt_handler(ioc);
     g_free(s->tpm_msg);
     s->tpm_msg = NULL;
     object_unref(OBJECT(s->tpm_ioc));
     return NULL;
 }
 
+static void tpm_emu_close_ctrl_ioc(void *ioc)
+{
+    qio_channel_close(ioc, NULL);
+}
+
 void *tpm_emu_ctrl_thread(void *data)
 {
     TPMTestState *s = data;
@@ -99,6 +112,7 @@ void *tpm_emu_ctrl_thread(void *data)
     qio_channel_wait(QIO_CHANNEL(lioc), G_IO_IN);
     ioc = QIO_CHANNEL(qio_channel_socket_accept(lioc, &error_abort));
     g_assert(ioc);
+    qtest_add_abrt_handler(tpm_emu_close_ctrl_ioc, ioc);
 
     {
         uint32_t cmd = 0;
@@ -190,6 +204,7 @@ void *tpm_emu_ctrl_thread(void *data)
         }
     }
 
+    qtest_remove_abrt_handler(ioc);
     object_unref(OBJECT(ioc));
     object_unref(OBJECT(lioc));
     return NULL;
-- 
2.39.0


