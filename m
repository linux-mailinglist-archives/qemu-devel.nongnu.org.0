Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A88B2E2E54
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 15:10:37 +0100 (CET)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktAHE-000642-56
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 09:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6u2-0002E5-La; Sat, 26 Dec 2020 05:34:26 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6tz-0004of-5b; Sat, 26 Dec 2020 05:34:26 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D30X74gKZzhyTy;
 Sat, 26 Dec 2020 18:33:27 +0800 (CST)
Received: from DESKTOP-EDHIELA.china.huawei.com (10.174.187.50) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 18:34:04 +0800
From: g00517791 <gaojinhao@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
Subject: [PATCH 5/8] savevm: Fix memory leak of vmstate_configuration
Date: Sat, 26 Dec 2020 18:33:44 +0800
Message-ID: <20201226103347.868-6-gaojinhao@huawei.com>
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
X-Mailman-Approved-At: Sat, 26 Dec 2020 09:05:44 -0500
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

When VM migrate VMState of configuration, the fields(name and capabilities)
of configuration having a flag of VMS_ALLOC need to allocate memory. If the
src doesn't free memory of capabilities in SaveState after save VMState of
configuration, or the dst doesn't free memory of name and capabilities in post
load of configuration, it may result in memory leak of name and capabilities.
We free memory in configuration_post_save and configuration_post_load func,
which prevents memory leak.

Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
---
 migration/savevm.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 5f937a2762..13f1a5dab7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -314,6 +314,16 @@ static int configuration_pre_save(void *opaque)
     return 0;
 }
 
+static int configuration_post_save(void *opaque)
+{
+    SaveState *state = opaque;
+
+    g_free(state->capabilities);
+    state->capabilities = NULL;
+    state->caps_count = 0;
+    return 0;
+}
+
 static int configuration_pre_load(void *opaque)
 {
     SaveState *state = opaque;
@@ -364,24 +374,36 @@ static int configuration_post_load(void *opaque, int version_id)
 {
     SaveState *state = opaque;
     const char *current_name = MACHINE_GET_CLASS(current_machine)->name;
+    int ret = 0;
 
     if (strncmp(state->name, current_name, state->len) != 0) {
         error_report("Machine type received is '%.*s' and local is '%s'",
                      (int) state->len, state->name, current_name);
-        return -EINVAL;
+        ret = -EINVAL;
+        goto out;
     }
 
     if (state->target_page_bits != qemu_target_page_bits()) {
         error_report("Received TARGET_PAGE_BITS is %d but local is %d",
                      state->target_page_bits, qemu_target_page_bits());
-        return -EINVAL;
+        ret = -EINVAL;
+        goto out;
     }
 
     if (!configuration_validate_capabilities(state)) {
-        return -EINVAL;
+        ret = -EINVAL;
+        goto out;
     }
 
-    return 0;
+out:
+    g_free((void *)state->name);
+    state->name = NULL;
+    state->len = 0;
+    g_free(state->capabilities);
+    state->capabilities = NULL;
+    state->caps_count = 0;
+
+    return ret;
 }
 
 static int get_capability(QEMUFile *f, void *pv, size_t size,
@@ -515,6 +537,7 @@ static const VMStateDescription vmstate_configuration = {
     .pre_load = configuration_pre_load,
     .post_load = configuration_post_load,
     .pre_save = configuration_pre_save,
+    .post_save = configuration_post_save,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(len, SaveState),
         VMSTATE_VBUFFER_ALLOC_UINT32(name, SaveState, 0, NULL, len),
-- 
2.23.0


