Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EFB265BD8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 10:44:47 +0200 (CEST)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGefm-0004je-Gr
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 04:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kGeba-00066j-Kr; Fri, 11 Sep 2020 04:40:26 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:39040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kGebY-0002HJ-5g; Fri, 11 Sep 2020 04:40:26 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id E9C7A2E151C;
 Fri, 11 Sep 2020 11:40:21 +0300 (MSK)
Received: from sas2-32987e004045.qloud-c.yandex.net
 (sas2-32987e004045.qloud-c.yandex.net [2a02:6b8:c08:b889:0:640:3298:7e00])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 ZUoWb9HaSG-eLvCpdS8; Fri, 11 Sep 2020 11:40:21 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1599813621; bh=D4Nsg0a1pfHGE+qyxWzMMbjCATY+spUvhi/yRnuNDuk=;
 h=In-Reply-To:In-Reply-To:Message-Id:References:References:Date:
 Subject:To:From:Cc;
 b=rsPmZXam/+kiUbDFGHxEzC/OydldrfFsIebHZvaTIss92K1QJS59SAGSjR8Ci6zd5
 4Yvgd2ISpogu99Na5mA3JVlG89eJBpOALl6iP2EiDO9W1L2rXbGcvoFI7rsDY8vIit
 Qwz3qXTseaRfKsS2+AkzbJIEm7Kl6x8ed/UwIUO0=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:7216::1:a])
 by sas2-32987e004045.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 v35icu4tRa-eKlWnbKK; Fri, 11 Sep 2020 11:40:21 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Dima Stepanov <dimastep@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/7] tests/qtest/vhost-user-test: add support for the
 vhost-user-blk device
Date: Fri, 11 Sep 2020 11:39:47 +0300
Message-Id: <a01fc8f1480e3a9dd29cb3736fadc5a9a4b497a5.1599813294.git.dimastep@yandex-team.ru>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1599813294.git.dimastep@yandex-team.ru>
References: <cover.1599813294.git.dimastep@yandex-team.ru>
In-Reply-To: <cover.1599813294.git.dimastep@yandex-team.ru>
References: <cover.1599813294.git.dimastep@yandex-team.ru>
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=dimastep@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 04:40:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, stefanha@gmail.com, jasowang@redhat.com,
 dgilbert@redhat.com, mreitz@redhat.com, fengli@smartx.com,
 yc-core@yandex-team.ru, pbonzini@redhat.com, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add vhost_user_ops structure for the vhost-user-blk device class. Add
the test_reconnect and test_migrate tests for this device.

Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 tests/qtest/vhost-user-test.c | 139 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 3df5322..a8af613 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -24,6 +24,7 @@
 #include "libqos/libqos.h"
 #include "libqos/pci-pc.h"
 #include "libqos/virtio-pci.h"
+#include "libqos/virtio-blk.h"
 
 #include "libqos/malloc-pc.h"
 #include "hw/virtio/virtio-net.h"
@@ -31,6 +32,7 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_net.h"
+#include "standard-headers/linux/virtio_blk.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/vfs.h>
@@ -43,6 +45,7 @@
                         " -numa node,memdev=mem"
 #define QEMU_CMD_CHR    " -chardev socket,id=%s,path=%s%s"
 #define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce"
+#define QEMU_CMD_BLKCHR " -chardev socket,id=chdev0,path=%s%s"
 
 #define HUGETLBFS_MAGIC       0x958458f6
 
@@ -55,6 +58,7 @@
 #define VHOST_USER_PROTOCOL_F_MQ 0
 #define VHOST_USER_PROTOCOL_F_LOG_SHMFD 1
 #define VHOST_USER_PROTOCOL_F_CROSS_ENDIAN   6
+#define VHOST_USER_PROTOCOL_F_CONFIG 9
 
 #define VHOST_LOG_PAGE 0x1000
 
@@ -78,6 +82,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_PROTOCOL_FEATURES = 16,
     VHOST_USER_GET_QUEUE_NUM = 17,
     VHOST_USER_SET_VRING_ENABLE = 18,
+    VHOST_USER_GET_CONFIG = 24,
+    VHOST_USER_SET_CONFIG = 25,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -99,6 +105,14 @@ typedef struct VhostUserLog {
     uint64_t mmap_offset;
 } VhostUserLog;
 
+#define VHOST_USER_MAX_CONFIG_SIZE 256
+typedef struct VhostUserConfig {
+    uint32_t offset;
+    uint32_t size;
+    uint32_t flags;
+    uint8_t region[VHOST_USER_MAX_CONFIG_SIZE];
+} VhostUserConfig;
+
 typedef struct VhostUserMsg {
     VhostUserRequest request;
 
@@ -114,6 +128,7 @@ typedef struct VhostUserMsg {
         struct vhost_vring_addr addr;
         VhostUserMemory memory;
         VhostUserLog log;
+        VhostUserConfig config;
     } payload;
 } QEMU_PACKED VhostUserMsg;
 
@@ -137,6 +152,7 @@ enum {
 
 enum {
     VHOST_USER_NET,
+    VHOST_USER_BLK,
 };
 
 typedef struct TestServer {
@@ -166,12 +182,15 @@ struct vhost_user_ops {
     int type;
     void (*append_opts)(TestServer *s, GString *cmd_line,
             const char *chr_opts);
+    void (*driver_init)(void *obj, QGuestAllocator *alloc);
 
     /* VHOST-USER commands. */
     void (*set_features)(TestServer *s, CharBackend *chr,
             VhostUserMsg *msg);
     void (*get_protocol_features)(TestServer *s,
             CharBackend *chr, VhostUserMsg *msg);
+    void (*get_config)(TestServer *s, CharBackend *chr,
+            VhostUserMsg *msg);
 };
 
 static const char *init_hugepagefs(void);
@@ -194,6 +213,14 @@ static void append_vhost_net_opts(TestServer *s, GString *cmd_line,
                            chr_opts, s->chr_name);
 }
 
+static void append_vhost_blk_opts(TestServer *s, GString *cmd_line,
+                             const char *chr_opts)
+{
+    g_string_append_printf(cmd_line, QEMU_CMD_BLKCHR,
+                           s->socket_path,
+                           chr_opts);
+}
+
 static void append_mem_opts(TestServer *server, GString *cmd_line,
                             int size, enum test_memfd memfd)
 {
@@ -425,6 +452,12 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
         break;
 
+    case VHOST_USER_GET_CONFIG:
+        if (s->vu_ops->get_config) {
+            s->vu_ops->get_config(s, chr, &msg);
+        }
+        break;
+
     default:
         break;
     }
@@ -727,6 +760,9 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
     guint8 *log;
     guint64 size;
 
+    if (s->vu_ops->driver_init) {
+        s->vu_ops->driver_init(obj, alloc);
+    }
     if (!wait_for_fds(s)) {
         return;
     }
@@ -796,6 +832,24 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
     g_string_free(dest_cmdline, true);
 }
 
+static void vu_blk_driver_init(void *obj, QGuestAllocator *alloc)
+{
+    QVirtioBlk *blk_if;
+    QVirtioDevice *dev;
+    QVirtQueue *vq;
+    uint64_t features;
+
+    blk_if = obj;
+    dev = blk_if->vdev;
+    features = qvirtio_get_features(dev);
+    qvirtio_set_features(dev, features);
+
+    vq = qvirtqueue_setup(dev, alloc, 0);
+    g_assert(vq);
+
+    qvirtio_set_driver_ok(dev);
+}
+
 static void wait_for_rings_started(TestServer *s, size_t count)
 {
     gint64 end_time;
@@ -857,12 +911,21 @@ static void test_reconnect(void *obj, void *arg, QGuestAllocator *alloc)
 {
     TestServer *s = arg;
     GSource *src;
+    int nq;
 
+    if (s->vu_ops->driver_init) {
+        s->vu_ops->driver_init(obj, alloc);
+    }
     if (!wait_for_fds(s)) {
         return;
     }
 
-    wait_for_rings_started(s, 2);
+    nq = 1;
+    if (s->vu_ops->type == VHOST_USER_NET) {
+        /* tx and rx queues */
+        nq = 2;
+    }
+    wait_for_rings_started(s, nq);
 
     /* reconnect */
     s->fds_num = 0;
@@ -872,7 +935,7 @@ static void test_reconnect(void *obj, void *arg, QGuestAllocator *alloc)
     g_source_attach(src, s->context);
     g_source_unref(src);
     g_assert(wait_for_fds(s));
-    wait_for_rings_started(s, 2);
+    wait_for_rings_started(s, nq);
 }
 
 static void *vhost_user_test_setup_connect_fail(GString *cmd_line, void *arg)
@@ -960,6 +1023,56 @@ static void vu_net_get_protocol_features(TestServer *s, CharBackend *chr,
     qemu_chr_fe_write_all(chr, (uint8_t *)msg, VHOST_USER_HDR_SIZE + msg->size);
 }
 
+static void vu_blk_set_features(TestServer *s, CharBackend *chr,
+        VhostUserMsg *msg)
+{
+    if (s->test_flags == TEST_FLAGS_DISCONNECT) {
+        qemu_chr_fe_disconnect(chr);
+        s->test_flags = TEST_FLAGS_BAD;
+    }
+}
+
+static void vu_blk_get_protocol_features(TestServer *s,
+        CharBackend *chr, VhostUserMsg *msg)
+{
+    /* send back features to qemu */
+    msg->flags |= VHOST_USER_REPLY_MASK;
+    msg->size = sizeof(m.payload.u64);
+    msg->payload.u64 = 1 << VHOST_USER_PROTOCOL_F_LOG_SHMFD;
+    msg->payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_CONFIG;
+    if (s->queues > 1) {
+        msg->payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_MQ;
+    }
+    qemu_chr_fe_write_all(chr, (uint8_t *)msg, VHOST_USER_HDR_SIZE + msg->size);
+}
+
+static void vu_blk_get_config(TestServer *s, CharBackend *chr,
+        VhostUserMsg *msg)
+{
+    VhostUserConfig *config;
+    struct virtio_blk_config *blk_config;
+
+    config = &msg->payload.config;
+    memset(config, 0, sizeof(*config));
+    config->size = sizeof(*blk_config);
+
+    blk_config = (struct virtio_blk_config *)&config->region;
+    /*
+     * Represent 128Mb test disk, with no real backend, just
+     * to test vhost-user functionality.
+     */
+    blk_config->capacity = 262144;
+    blk_config->size_max = 0x20000;
+    blk_config->seg_max = 0x7e;
+    blk_config->blk_size = 512;
+    blk_config->min_io_size = 0x1;
+    blk_config->num_queues = 0x1;
+
+    msg->size = sizeof(*config) - sizeof(config->region) + config->size;
+    msg->flags |= VHOST_USER_REPLY_MASK;
+    qemu_chr_fe_write_all(chr, (uint8_t *)msg, VHOST_USER_HDR_SIZE + msg->size);
+}
+
 /* Each VHOST-USER device should have its ops structure defined. */
 static struct vhost_user_ops g_vu_net_ops = {
     .type = VHOST_USER_NET,
@@ -970,6 +1083,17 @@ static struct vhost_user_ops g_vu_net_ops = {
     .get_protocol_features = vu_net_get_protocol_features,
 };
 
+static struct vhost_user_ops g_vu_blk_ops = {
+    .type = VHOST_USER_BLK,
+
+    .append_opts = append_vhost_blk_opts,
+    .driver_init = vu_blk_driver_init,
+
+    .set_features = vu_blk_set_features,
+    .get_protocol_features = vu_blk_get_protocol_features,
+    .get_config = vu_blk_get_config,
+};
+
 static void register_vhost_user_test(void)
 {
     QOSGraphTestOptions opts = {
@@ -1015,5 +1139,16 @@ static void register_vhost_user_test(void)
     qos_add_test("vhost-user/multiqueue",
                  "virtio-net",
                  test_multiqueue, &opts);
+    opts.edge.extra_device_opts = NULL;
+
+    /* vhost-user-blk tests */
+    opts.arg = &g_vu_blk_ops;
+    opts.before = vhost_user_test_setup_reconnect;
+    qos_add_test("reconnect", "vhost-user-blk",
+                 test_reconnect, &opts);
+
+    opts.before = vhost_user_test_setup_memfd;
+    qos_add_test("migrate", "vhost-user-blk",
+                 test_migrate, &opts);
 }
 libqos_init(register_vhost_user_test);
-- 
2.7.4


