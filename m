Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576D5B775B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 19:08:39 +0200 (CEST)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY9Oo-0007LN-7i
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 13:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oY9Gd-0000qP-Kl
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:00:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oY9GZ-0002jk-7y
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:00:11 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DGjjQF026407;
 Tue, 13 Sep 2022 17:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=trNtXEN2C6O67IBf98ymayF7nkdL6srnuvoJ1IBjsdc=;
 b=nbysuu/gxrVNGjgIwjDwFonwyKg7tUatTriPKyoqk16zEONurC/kANi6o5iHRWj8i8NW
 DlhvXNj5oZJa4HxKVIlJW14bohEX/3wNsUxix1Yu13G52MVHaLOJQYjgunqHvFIuDAL/
 ObYzNRHfxkur6YUWQWq/twGnkLFpDVM4dNAxYcuv4MTNfFmLpQKmij1b+YMJkucbpU3c
 tQj4JCkyRRBZ1CTongso4XTvT4WaID8DJYGYpsQNd2rQX/rHWGtWsyoweh6KzqXxUY2/
 SALhjXDqPgof5tjYFfSUEf/CMW/WZTQiB9SX4ql1/CnBbILV47F3kvre0w2RmXMzTnPf uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjwnwrfjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:03 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28DGjtCB027648;
 Tue, 13 Sep 2022 17:00:03 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjwnwrfgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:03 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DGpsVq008392;
 Tue, 13 Sep 2022 17:00:01 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3jgj79d9n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28DH01i456230176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Sep 2022 17:00:01 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F392E78067;
 Tue, 13 Sep 2022 17:14:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5F6C7805E;
 Tue, 13 Sep 2022 17:14:30 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Sep 2022 17:14:30 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 4/4] tpm_emulator: Have swtpm relock storage upon migration
 fall-back
Date: Tue, 13 Sep 2022 12:59:45 -0400
Message-Id: <20220913165945.1635016-5-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913165945.1635016-1-stefanb@linux.ibm.com>
References: <20220913165945.1635016-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YufKQIVjGgCPlvHZ0yogcHl5PdwNtWow
X-Proofpoint-ORIG-GUID: uepNZe5JT4QRmDv_KoIpH3_ciu7nvdXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130075
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
Message-id: 20220912174741.1542330-3-stefanb@linux.ibm.com
---
 backends/tpm/tpm_emulator.c | 60 ++++++++++++++++++++++++++++++++++++-
 backends/tpm/trace-events   |  2 ++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 9b50c5b3e2..49cc3d749d 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -35,6 +35,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
+#include "sysemu/runstate.h"
 #include "tpm_int.h"
 #include "tpm_ioctl.h"
 #include "migration/blocker.h"
@@ -82,6 +83,9 @@ struct TPMEmulator {
     unsigned int established_flag_cached:1;
 
     TPMBlobBuffers state_blobs;
+
+    bool relock_storage;
+    VMChangeStateEntry *vmstate;
 };
 
 struct tpm_error {
@@ -303,6 +307,35 @@ static int tpm_emulator_stop_tpm(TPMBackend *tb)
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
@@ -853,13 +886,34 @@ static int tpm_emulator_pre_save(void *opaque)
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
@@ -921,6 +975,9 @@ static void tpm_emulator_inst_init(Object *obj)
     tpm_emu->options = g_new0(TPMEmulatorOptions, 1);
     tpm_emu->cur_locty_number = ~0;
     qemu_mutex_init(&tpm_emu->mutex);
+    tpm_emu->vmstate =
+        qemu_add_vm_change_state_handler(tpm_emulator_vm_state_change,
+                                         tpm_emu);
 
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
                      &vmstate_tpm_emulator, obj);
@@ -970,6 +1027,7 @@ static void tpm_emulator_inst_finalize(Object *obj)
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


