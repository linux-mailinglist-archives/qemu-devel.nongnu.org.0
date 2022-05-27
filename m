Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E69A53669C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:34:38 +0200 (CEST)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudrB-0002rc-OS
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nudoa-0001FX-UH
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:31:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nudoY-0004lu-LP
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:31:56 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RHAEEU024651
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 17:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D6YdRQMv3VULE0nMONEX420nT6WznZDEwf3Hvi9gPEs=;
 b=WkRv7jZHznxuztGFhHcR1nPYZJ9TeB5QTujy1/0JFVW6aBKxnsER27e3gIpQtUTX+2vR
 kfbD1aBsXuYbEDQGIuFqrsv8ldE7DGu9x3YGe9GU8u5Id/Rk5d4liOzPjHI6rLsbiJc4
 DrL9pPADPiD4NVC5NSVC8ahGWNhnygchemT7giM6F0QNhOLEN8pRmPOhBbJ9VOeaYBjf
 7Q+m/omF/38sHO2KjvlqYN0y+SZvP7L65qytTHzp5NvUYiGPUb6lQsnTMdRD/zbtn7eT
 M5ldWfW+aQptyCSYfQGcbiQ6yMDkwiCDF71JIv0z9fUtkeU6k5jBlybyE+8A51HBkaXv DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb2hs8fcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 17:31:51 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24RHFGjE012145
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 17:31:50 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb2hs8f66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 May 2022 17:31:49 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RHCBYm014546;
 Fri, 27 May 2022 17:31:09 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3g93uu2j6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 May 2022 17:31:09 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24RHV89B6029950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 May 2022 17:31:08 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6520EB205F;
 Fri, 27 May 2022 17:31:08 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DDD1B206B;
 Fri, 27 May 2022 17:31:08 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 May 2022 17:31:08 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 1/2] backends/tpm: Record the last command sent to the TPM
Date: Fri, 27 May 2022 13:30:57 -0400
Message-Id: <20220527173058.226210-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220527173058.226210-1-stefanb@linux.ibm.com>
References: <20220527173058.226210-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dGtyWSWkAGwaXySSmX1R8mEUEMzOpY7s
X-Proofpoint-GUID: Lq52bIE76sRrgiHJLthjZBpRH5dp3BdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_05,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205270085
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record the last command sent to the TPM. Knowing the last command sent
to a TPM 2 will allow us to determine whether we need to send a
TPM2_Shutdown() command when the VM is reset.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 backends/tpm/tpm_emulator.c | 9 +++++++++
 backends/tpm/tpm_util.c     | 9 +++++++++
 include/sysemu/tpm_util.h   | 3 +++
 3 files changed, 21 insertions(+)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 87d061e9bb..89ecb04a2a 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -81,6 +81,8 @@ struct TPMEmulator {
     unsigned int established_flag_cached:1;
 
     TPMBlobBuffers state_blobs;
+
+    uint32_t last_command; /* last command sent to TPM */
 };
 
 struct tpm_error {
@@ -155,6 +157,12 @@ static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
 {
     ssize_t ret;
     bool is_selftest = false;
+    uint32_t command;
+
+    command = tpm_util_get_ordinal(in, in_len);
+    if (command != TPM_ORDINAL_NONE) {
+        tpm_emu->last_command = command;
+    }
 
     if (selftest_done) {
         *selftest_done = false;
@@ -910,6 +918,7 @@ static void tpm_emulator_inst_init(Object *obj)
 
     tpm_emu->options = g_new0(TPMEmulatorOptions, 1);
     tpm_emu->cur_locty_number = ~0;
+    tpm_emu->last_command = TPM_ORDINAL_NONE;
     qemu_mutex_init(&tpm_emu->mutex);
 
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index a6e6d3e72f..28284940f0 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -103,6 +103,15 @@ bool tpm_util_is_selftest(const uint8_t *in, uint32_t in_len)
     return false;
 }
 
+uint32_t tpm_util_get_ordinal(const uint8_t *in, uint32_t in_len)
+{
+    if (in_len >= sizeof(struct tpm_req_hdr)) {
+        return tpm_cmd_get_ordinal(in);
+    }
+
+    return TPM_ORDINAL_NONE;
+}
+
 /*
  * Send request to a TPM device. We expect a response within one second.
  */
diff --git a/include/sysemu/tpm_util.h b/include/sysemu/tpm_util.h
index 08f05172a7..7fc238b2a0 100644
--- a/include/sysemu/tpm_util.h
+++ b/include/sysemu/tpm_util.h
@@ -29,6 +29,9 @@ void tpm_util_write_fatal_error_response(uint8_t *out, uint32_t out_len);
 
 bool tpm_util_is_selftest(const uint8_t *in, uint32_t in_len);
 
+uint32_t tpm_util_get_ordinal(const uint8_t *in, uint32_t in_len);
+#define TPM_ORDINAL_NONE 0x0
+
 int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm_version);
 
 static inline uint16_t tpm_cmd_get_tag(const void *b)
-- 
2.35.3


