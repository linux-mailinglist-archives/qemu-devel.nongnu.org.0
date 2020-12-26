Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0332E2E59
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 15:12:58 +0100 (CET)
Received: from localhost ([::1]:40388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktAJV-0007xQ-G6
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 09:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6u2-0002ED-RI; Sat, 26 Dec 2020 05:34:26 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6tz-0004ol-Cz; Sat, 26 Dec 2020 05:34:26 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D30XK15ZvzhvJN;
 Sat, 26 Dec 2020 18:33:37 +0800 (CST)
Received: from DESKTOP-EDHIELA.china.huawei.com (10.174.187.50) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 18:34:07 +0800
From: g00517791 <gaojinhao@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
Subject: [PATCH 8/8] dbus-vmstate: Fix memory leak of dbus_vmstate
Date: Sat, 26 Dec 2020 18:33:47 +0800
Message-ID: <20201226103347.868-9-gaojinhao@huawei.com>
X-Mailer: git-send-email 2.29.2.windows.2
In-Reply-To: <20201226103347.868-1-gaojinhao@huawei.com>
References: <20201226103347.868-1-gaojinhao@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.50]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=gaojinhao@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

When VM migrate VMState of dbus_vmstate, the field(data) of
dbus_vmstate having a flag of VMS_ALLOC needs to allocate memory.
If the dst doesn't free memory which has been allocated for
SaveStateEntry of dbus_vmstate before dst loads device state, it may
result that the pointer of data is overlaid when vm loads. We add
the pre_load func to free memory, which prevents memory leak.

Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
---
 backends/dbus-vmstate.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index bd050e8e9c..c13fbee760 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -366,10 +366,21 @@ static int dbus_vmstate_pre_save(void *opaque)
     return 0;
 }
 
+static int dbus_vmstate_pre_load(void *opaque)
+{
+    DBusVMState *self = DBUS_VMSTATE(opaque);
+
+    g_free(self->data);
+    self->data = NULL;
+    self->data_size = 0;
+    return 0;
+}
+
 static const VMStateDescription dbus_vmstate = {
     .name = TYPE_DBUS_VMSTATE,
     .version_id = 0,
     .pre_save = dbus_vmstate_pre_save,
+    .pre_load = dbus_vmstate_pre_load,
     .post_load = dbus_vmstate_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(data_size, DBusVMState),
-- 
2.23.0


