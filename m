Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE6665CE3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 14:48:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFbQy-0003D1-9T; Wed, 11 Jan 2023 08:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFbQk-0003Bn-Ei
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:46:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFbQY-0005uS-H5
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:46:06 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30BDMaUJ026027; Wed, 11 Jan 2023 13:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Y5zftxIMFSR8nVe3CDIIKGak8IABrGwzm15s8w/K6cA=;
 b=OnGvN62LPYUnFdDIlSktUKSRQU8kDlOGFbk8cCiYL5H6sckoGzRJJj5s6bULXRPrZWV3
 st4dtyFZXwNiRd+Y9Ijcddm5e5bhGk8/F5xJdivbtRWC6cHFVau8pIMDWuwfqyOjrx0Y
 aEUyD1M9DM67PCTmDhsxhrYkB8BX4J1ALd4QmH1RYFn0uecZzY04pbzVtL/VL8DqRgGW
 H14Vov0ezyhLfI/GqV7EiaNsoUwZXJA+Mgww16z3dRDXjFe6eyf5hkFuGy1aqk86wpBR
 8CU0fwGVKMfHk2JG5hXe+g+nibdmoDROsD6y3XK/SaEoX3s1VpyC2Z4kBjLot4Dp4B+H Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1wxj0g1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 13:45:59 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30BDf56g003516;
 Wed, 11 Jan 2023 13:45:58 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1wxj0g1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 13:45:58 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30BCodNW019887;
 Wed, 11 Jan 2023 13:45:58 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3n1k83usew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 13:45:57 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30BDjuol33555152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 13:45:56 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 581D758064;
 Wed, 11 Jan 2023 13:45:56 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE63258054;
 Wed, 11 Jan 2023 13:45:55 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 13:45:55 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2] tests/qtest/tpm-emu: Avoid hangs using abort handlers
 closing channels
Date: Wed, 11 Jan 2023 08:45:47 -0500
Message-Id: <20230111134547.3959604-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nkHfrazOTxwZefX3OsYuJZgLkb0y6LMu
X-Proofpoint-ORIG-GUID: mCrNbmvWMZykrObfF3mbEBIeHvL94oDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_06,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110092
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

Install abort handlers that close the TPM control and data channels in
case an abort occurs. The purpose of this is to have QEMU terminate
under abnormal test case failures to resolve intermittent hangs on s390x
hosts running TPM tests for QEMU/x86_64.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
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


