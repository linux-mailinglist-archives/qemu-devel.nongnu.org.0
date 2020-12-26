Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E42E2E4D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 15:08:18 +0100 (CET)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktAEy-00034B-Uf
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 09:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6u5-0002F3-5J; Sat, 26 Dec 2020 05:34:29 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6u3-0004oc-5O; Sat, 26 Dec 2020 05:34:28 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D30X74PLtzhyV3;
 Sat, 26 Dec 2020 18:33:27 +0800 (CST)
Received: from DESKTOP-EDHIELA.china.huawei.com (10.174.187.50) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 18:34:06 +0800
From: g00517791 <gaojinhao@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
Subject: [PATCH 7/8] tpm_emulator: Fix memory leak of vmstate_tpm_emulator
Date: Sat, 26 Dec 2020 18:33:46 +0800
Message-ID: <20201226103347.868-8-gaojinhao@huawei.com>
X-Mailer: git-send-email 2.29.2.windows.2
In-Reply-To: <20201226103347.868-1-gaojinhao@huawei.com>
References: <20201226103347.868-1-gaojinhao@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.50]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=gaojinhao@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 26 Dec 2020 09:05:46 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, wanghaibin.wang@huawei.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jinhao Gao <gaojinhao@huawei.com>

When VM migrate VMState of tpm-emulator, the fields(state_blobs.
permanent.buffer, state_blobs.volatil.buffer and state_blobs.savestate.
buffer) of tpm-emulator having a flag of VMS_ALLOC need to allocate
memory. If the dst doesn't free memory which has been allocated for
SaveStateEntry of tpm-emulator before dst loads device state, it may
result that the pointers of state_blobs.permanent.buffer, state_blobs.
volatil.buffer and state_blobs.savestate.buffer are overlaid when vm
loads. We add the pre_load func to free memory, which prevents memory
leak.

Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
---
 backends/tpm/tpm_emulator.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc193..7ffa95dbce 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -857,6 +857,18 @@ static int tpm_emulator_pre_save(void *opaque)
     return tpm_emulator_get_state_blobs(tpm_emu);
 }
 
+static int tpm_emulator_pre_load(void *opaque)
+{
+    TPMBackend *tb = opaque;
+    TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
+    TPMBlobBuffers *state_blobs = &tpm_emu->state_blobs;
+
+    tpm_sized_buffer_reset(&state_blobs->volatil);
+    tpm_sized_buffer_reset(&state_blobs->permanent);
+    tpm_sized_buffer_reset(&state_blobs->savestate);
+    return 0;
+}
+
 /*
  * Load the TPM state blobs into the TPM.
  *
@@ -883,6 +895,7 @@ static const VMStateDescription vmstate_tpm_emulator = {
     .name = "tpm-emulator",
     .version_id = 0,
     .pre_save = tpm_emulator_pre_save,
+    .pre_load = tpm_emulator_pre_load,
     .post_load = tpm_emulator_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(state_blobs.permanent_flags, TPMEmulator),
-- 
2.23.0


