Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF595B5FA1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 19:54:49 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXndw-0001wd-O3
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 13:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oXnXF-0003SE-Bc
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 13:47:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oXnXC-0000fM-K3
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 13:47:53 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CHbdAo018019
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 17:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=j70KhJ/wah9iEjzH7ED8i+U30hI2mpYa0SOo8seoaWI=;
 b=sstLD9P9TjVErXXIPZjJIiXEsALXsa9lgtEl5/fyYe7qvKyKTJaL2xgOJmVz42Z0bEx6
 VTzeAjjlJ407lhDvNECxyCxSsManrO9Z0okvW/+d7UQ7wnJLhGPclTie6qcc590zeSK5
 g+EuvS2BxZp9IM0pRvWnCvPOruCMoVqpNxl4iOq3pQm37udnsciTx83CNuoT2FFe6bJq
 +5ecu1CZ/+gHArOqdQEnB7LUiZGDmqOEMcwYj8+wWRymDOXDFjamB2PCBcrLuPFopEGd
 kWkZQz2tfhVD7r9KhnjUeaRPjEtXsSoIbwrna9Hr+HGhS7fVVZX4A0xkjPmbIpTp4YYo yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj8y2s0nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 17:47:47 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28CHd21L023057
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 17:47:46 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj8y2s0mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 17:47:46 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28CHaB1J002047;
 Mon, 12 Sep 2022 17:47:45 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3jgj796n6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 17:47:45 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28CHlhhr34800194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Sep 2022 17:47:43 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14BC2136053;
 Mon, 12 Sep 2022 17:47:44 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6A9213604F;
 Mon, 12 Sep 2022 17:47:43 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Sep 2022 17:47:43 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 2/2] tpm_emulator: Have swtpm relock storage upon migration
 fall-back
Date: Mon, 12 Sep 2022 13:47:41 -0400
Message-Id: <20220912174741.1542330-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220912174741.1542330-1-stefanb@linux.ibm.com>
References: <20220912174741.1542330-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r0PcmrV55bIQwK43hU5B3Fj4XvwEeh-A
X-Proofpoint-ORIG-GUID: lRnu9S8m392LtcVLL5kn-8Ja1MPQLpb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_12,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120060
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

Swtpm may release the lock once the last one of its state blobs has been
migrated out. In case of VM migration failure QEMU now needs to notify
swtpm that it should again take the lock, which it can otherwise only do
once it has received the first TPM command from the VM.

Only try to send the lock command if swtpm supports it. It will not have
released the lock (and support shared storage setups) if it doesn't
support the locking command since the functionality of releasing the lock
upon state blob reception and the lock command were added to swtpm
'together'.

If QEMU sends the lock command and the storage has already been locked
no error is reported.

If swtpm does not receive the lock command (from older version of QEMU),
it will lock the storage once the first TPM command has been received. So
sending the lock command is an optimization.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 backends/tpm/tpm_emulator.c | 60 ++++++++++++++++++++++++++++++++++++-
 backends/tpm/trace-events   |  2 ++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 87d061e9bb..bb883fe7d2 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -34,6 +34,7 @@
 #include "io/channel-socket.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
+#include "sysemu/runstate.h"
 #include "tpm_int.h"
 #include "tpm_ioctl.h"
 #include "migration/blocker.h"
@@ -81,6 +82,9 @@ struct TPMEmulator {
     unsigned int established_flag_cached:1;
 
     TPMBlobBuffers state_blobs;
+
+    bool relock_storage;
+    VMChangeStateEntry *vmstate;
 };
 
 struct tpm_error {
@@ -302,6 +306,35 @@ static int tpm_emulator_stop_tpm(TPMBackend *tb)
     return 0;
 }
 
+static int tpm_emulator_lock_storage(TPMEmulator *tpm_emu)
+{
+    ptm_lockstorage pls;
+
+    if (!TPM_EMULATOR_IMPLEMENTS_ALL_CAPS(tpm_emu, PTM_CAP_LOCK_STORAGE)) {
+        trace_tpm_emulator_lock_storage_cmd_not_supt();
+        return 0;
+    }
+
+    /* give failing side 300 * 10ms time to release lock */
+    pls.u.req.retries = cpu_to_be32(300);
+    if (tpm_emulator_ctrlcmd(tpm_emu, CMD_LOCK_STORAGE, &pls,
+                             sizeof(pls.u.req), sizeof(pls.u.resp)) < 0) {
+        error_report("tpm-emulator: Could not lock storage within 3 seconds: "
+                     "%s", strerror(errno));
+        return -1;
+    }
+
+    pls.u.resp.tpm_result = be32_to_cpu(pls.u.resp.tpm_result);
+    if (pls.u.resp.tpm_result != 0) {
+        error_report("tpm-emulator: TPM result for CMD_LOCK_STORAGE: 0x%x %s",
+                     pls.u.resp.tpm_result,
+                     tpm_emulator_strerror(pls.u.resp.tpm_result));
+        return -1;
+    }
+
+    return 0;
+}
+
 static int tpm_emulator_set_buffer_size(TPMBackend *tb,
                                         size_t wanted_size,
                                         size_t *actual_size)
@@ -843,13 +876,34 @@ static int tpm_emulator_pre_save(void *opaque)
 {
     TPMBackend *tb = opaque;
     TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
+    int ret;
 
     trace_tpm_emulator_pre_save();
 
     tpm_backend_finish_sync(tb);
 
     /* get the state blobs from the TPM */
-    return tpm_emulator_get_state_blobs(tpm_emu);
+    ret = tpm_emulator_get_state_blobs(tpm_emu);
+
+    tpm_emu->relock_storage = ret == 0;
+
+    return ret;
+}
+
+static void tpm_emulator_vm_state_change(void *opaque, bool running,
+                                         RunState state)
+{
+    TPMBackend *tb = opaque;
+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
+
+    trace_tpm_emulator_vm_state_change(running, state);
+
+    if (!running || state != RUN_STATE_RUNNING || !tpm_emu->relock_storage) {
+        return;
+    }
+
+    /* lock storage after migration fall-back */
+    tpm_emulator_lock_storage(tpm_emu);
 }
 
 /*
@@ -911,6 +965,9 @@ static void tpm_emulator_inst_init(Object *obj)
     tpm_emu->options = g_new0(TPMEmulatorOptions, 1);
     tpm_emu->cur_locty_number = ~0;
     qemu_mutex_init(&tpm_emu->mutex);
+    tpm_emu->vmstate =
+        qemu_add_vm_change_state_handler(tpm_emulator_vm_state_change,
+                                         tpm_emu);
 
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
                      &vmstate_tpm_emulator, obj);
@@ -960,6 +1017,7 @@ static void tpm_emulator_inst_finalize(Object *obj)
     tpm_sized_buffer_reset(&state_blobs->savestate);
 
     qemu_mutex_destroy(&tpm_emu->mutex);
+    qemu_del_vm_change_state_handler(tpm_emu->vmstate);
 
     vmstate_unregister(NULL, &vmstate_tpm_emulator, obj);
 }
diff --git a/backends/tpm/trace-events b/backends/tpm/trace-events
index 3298766dd7..1ecef42a07 100644
--- a/backends/tpm/trace-events
+++ b/backends/tpm/trace-events
@@ -20,6 +20,8 @@ tpm_emulator_set_buffer_size(uint32_t buffersize, uint32_t minsize, uint32_t max
 tpm_emulator_startup_tpm_resume(bool is_resume, size_t buffersize) "is_resume: %d, buffer size: %zu"
 tpm_emulator_get_tpm_established_flag(uint8_t flag) "got established flag: %d"
 tpm_emulator_cancel_cmd_not_supt(void) "Backend does not support CANCEL_TPM_CMD"
+tpm_emulator_lock_storage_cmd_not_supt(void) "Backend does not support LOCK_STORAGE"
+tpm_emulator_vm_state_change(int running, int state) "state change to running %d state %d"
 tpm_emulator_handle_device_opts_tpm12(void) "TPM Version 1.2"
 tpm_emulator_handle_device_opts_tpm2(void) "TPM Version 2"
 tpm_emulator_handle_device_opts_unspec(void) "TPM Version Unspecified"
-- 
2.37.2


