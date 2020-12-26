Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E22E2E4C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 15:08:18 +0100 (CET)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktAEy-00034I-R8
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 09:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6u2-0002E1-Ff; Sat, 26 Dec 2020 05:34:26 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6tz-0004nZ-Br; Sat, 26 Dec 2020 05:34:26 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D30X23sWGzhslr;
 Sat, 26 Dec 2020 18:33:22 +0800 (CST)
Received: from DESKTOP-EDHIELA.china.huawei.com (10.174.187.50) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 18:34:02 +0800
From: g00517791 <gaojinhao@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
Subject: [PATCH 2/8] virtio-net: Fix memory leak of vmstate_virtio_net_rss
Date: Sat, 26 Dec 2020 18:33:41 +0800
Message-ID: <20201226103347.868-3-gaojinhao@huawei.com>
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

When VM migrate VMState of virtio-net-device/rss, the field(rss_data.
indirections_table) of virtio-net-device/rss having a flag of VMS_ALLOC
needs to allocate memory. If the dst doesn't free memory which has bee
n allocated for SaveStateEntry of virtio-net-device/rss before dst loads
device state, it may result that the pointer of rss_data.indirections_table
is overlaid when vm loads. We add the pre_load func to free memory, which
prevents memory leak.

Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
---
 hw/net/virtio-net.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 044ac95f6f..102e51f32f 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2957,11 +2957,22 @@ static bool virtio_net_rss_needed(void *opaque)
     return VIRTIO_NET(opaque)->rss_data.enabled;
 }
 
+static int virtio_net_rss_pre_load(void *opaque)
+{
+    VirtIONet *n = VIRTIO_NET(opaque);
+
+    g_free(n->rss_data.indirections_table);
+    n->rss_data.indirections_table = NULL;
+    n->rss_data.indirections_len = 0;
+    return 0;
+}
+
 static const VMStateDescription vmstate_virtio_net_rss = {
     .name      = "virtio-net-device/rss",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = virtio_net_rss_needed,
+    .pre_load = virtio_net_rss_pre_load,
     .fields = (VMStateField[]) {
         VMSTATE_BOOL(rss_data.enabled, VirtIONet),
         VMSTATE_BOOL(rss_data.redirect, VirtIONet),
-- 
2.23.0


