Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C92F53669E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:38:00 +0200 (CEST)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuduR-0004i5-FK
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nudsk-0003x1-0Y
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:36:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nudsi-0005OI-8C
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:36:13 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RHEEQi025017
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 17:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=EzfYsV6AlEHKAFjXxbPrdaK1EDhzGL8JEz+fWnyW/l0=;
 b=dB1zQGhbOVEUUXUnJABLOtjVV/78Ex2t/3i2YcENMalcklWhhUyAUFoOmhstem1espzs
 I7QKd9+0lDPFahZ/3DgF9vI5BKfBUycfRh4KdzhnQCTclyIC+bS4GCEXTJIg4QoY6IrZ
 Tn7cPq+htvFimN1lZZzN+saT3YhXRwC/zlkHCGYj4IMBR/c4aN6xvob3hWZwZMMwA2u4
 5WxtW2iLuAT9GBZawITU/Dgp07gnWc/LutOeAAxegb6usNXC7Pd7on+y8JgwwnjlORzx
 MLRljDusN0NbMQPpY+vJ3ydz+1cAdoEz1FgTFPWYWD9RBzgkiW+vcr07ZKFoYBJGpUVe hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb2v48ba9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 17:36:10 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24RHWKZa017606
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 17:36:10 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb2v48b9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 May 2022 17:36:10 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RHDJtS004439;
 Fri, 27 May 2022 17:31:09 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3g93v9ak3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 May 2022 17:31:09 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24RHV8IU4195156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 May 2022 17:31:08 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73E01B206A;
 Fri, 27 May 2022 17:31:08 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 668FBB2068;
 Fri, 27 May 2022 17:31:08 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 May 2022 17:31:08 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 2/2] backends/tpm: Send TPM2_Shutdown upon VM reset
Date: Fri, 27 May 2022 13:30:58 -0400
Message-Id: <20220527173058.226210-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220527173058.226210-1-stefanb@linux.ibm.com>
References: <20220527173058.226210-1-stefanb@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _Vff29IKuxb6Yyl5UxkRbZ12QPJ1L3am
X-Proofpoint-GUID: JaNvN94g3Ftq9Rf21DyOkEit2qPkdyU-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_04,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205270085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Send a TPM2_Shutdown(TPM2_SU_CLEAR) command to the TPM emulator when the
VM is reset. However, this is only necessary for a TPM 2 and only if the
TPM2_Shutdown command has not been sent by the VM as the last command as
it would do under normal circumstances. Further, it also doesn't need to
be sent if the VM was just started.

This fixes a bug where well-timed VM resets may trigger the TPM 2's
dictionary attack lockout logic due to the TPM 2 not having received a
TPM2_Shutdown command when it was reset.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2087538
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 backends/tpm/tpm_emulator.c | 35 +++++++++++++++++++++++++++++++++++
 backends/tpm/tpm_int.h      |  3 +++
 backends/tpm/trace-events   |  1 +
 3 files changed, 39 insertions(+)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 89ecb04a2a..c928d7abd1 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -389,8 +389,43 @@ err_exit:
     return -1;
 }
 
+static void tpm_emulator_send_tpm2_shutdown(TPMEmulator *tpm_emu)
+{
+    const struct tpm2_shutdown {
+        struct tpm_req_hdr hdr;
+        uint16_t shutdownType;
+    } tpm2_shutdown_clear = {
+        .hdr = {
+            .tag = cpu_to_be16(TPM2_ST_NO_SESSIONS),
+            .len = cpu_to_be32(sizeof(tpm2_shutdown_clear)),
+            .ordinal = cpu_to_be32(TPM2_CC_Shutdown),
+        },
+        .shutdownType = cpu_to_be16(TPM2_SU_CLEAR),
+    };
+    Error *local_err = NULL;
+    uint8_t result[10];
+
+    trace_tpm_emulator_send_tpm2_shutdown(tpm_emu->last_command);
+
+    if (tpm_emulator_unix_tx_bufs(tpm_emu, (uint8_t *)&tpm2_shutdown_clear,
+                                  sizeof(tpm2_shutdown_clear),
+                                  result, sizeof(result),
+                                  NULL, &local_err) < 0) {
+        error_report_err(local_err);
+    }
+}
+
 static int tpm_emulator_startup_tpm(TPMBackend *tb, size_t buffersize)
 {
+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
+
+    /* In case of VM reset we may need to send a TPM2_Shutdown command */
+    if (tpm_emu->tpm_version == TPM_VERSION_2_0 &&
+        tpm_emu->last_command != TPM_ORDINAL_NONE &&
+        tpm_emu->last_command != TPM2_CC_Shutdown) {
+        tpm_emulator_send_tpm2_shutdown(tpm_emu);
+    }
+
     return tpm_emulator_startup_tpm_resume(tb, buffersize, false);
 }
 
diff --git a/backends/tpm/tpm_int.h b/backends/tpm/tpm_int.h
index ba6109306e..2730d4ff02 100644
--- a/backends/tpm/tpm_int.h
+++ b/backends/tpm/tpm_int.h
@@ -64,6 +64,7 @@ struct tpm_resp_hdr {
 /* TPM2 defines */
 #define TPM2_ST_NO_SESSIONS       0x8001
 
+#define TPM2_CC_Shutdown          0x00000145
 #define TPM2_CC_ReadClock         0x00000181
 #define TPM2_CC_GetCapability     0x0000017a
 
@@ -71,6 +72,8 @@ struct tpm_resp_hdr {
 
 #define TPM2_PT_MAX_COMMAND_SIZE  0x11e
 
+#define TPM2_SU_CLEAR             0x0
+
 #define TPM_RC_INSUFFICIENT       0x9a
 #define TPM_RC_FAILURE            0x101
 #define TPM_RC_LOCALITY           0x907
diff --git a/backends/tpm/trace-events b/backends/tpm/trace-events
index 3298766dd7..cd16d41804 100644
--- a/backends/tpm/trace-events
+++ b/backends/tpm/trace-events
@@ -31,3 +31,4 @@ tpm_emulator_set_state_blobs_error(const char *msg) "error while setting state b
 tpm_emulator_set_state_blobs_done(void) "Done setting state blobs"
 tpm_emulator_pre_save(void) ""
 tpm_emulator_inst_init(void) ""
+tpm_emulator_send_tpm2_shutdown(uint32_t ord) "Sending TPM2_Shutdown(TPM2_SU_CLEAR); last ordinal from VM was: 0x%08x"
-- 
2.35.3


