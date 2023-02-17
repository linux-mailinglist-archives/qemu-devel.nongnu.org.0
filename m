Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4598069B191
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT46v-0005os-Pu; Fri, 17 Feb 2023 12:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pT46g-0005Tt-PK
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:01:11 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pT46b-0000AK-Go
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:01:10 -0500
Received: from sas1-2d2912cdb877.qloud-c.yandex.net
 (sas1-2d2912cdb877.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:280d:0:640:2d29:12cd])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 610745EE02;
 Fri, 17 Feb 2023 20:01:00 +0300 (MSK)
Received: from antonkuchin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:7313::1:33])
 by sas1-2d2912cdb877.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 d0qKL50Sl4Y1-okhr4jJG; Fri, 17 Feb 2023 20:00:59 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676653259; bh=ElC44zDuXKHsXhZI+PshUzHKnTsHBHxKXXZurHdcMeg=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=cVQOCsMN9xu2ne/YnXgcAWm31e4lGq7v2S4bcOGp6E8VzIqx5tfRJkxikNb5fCy6z
 761tfj73ybSHrhfkjLIQm/ZZkdbivz5Srn+6g2c61sn3rEQTKPJ2XsghY34miH08gA
 N+uqTEEoaFxPn/yE06bLFMbtIhCxkeGVK+WYOvYE=
Authentication-Results: sas1-2d2912cdb877.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Anton Kuchin <antonkuchin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 virtio-fs@redhat.com, Eric Blake <eblake@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>
Subject: [PATCH v3 1/1] vhost-user-fs: add migration type property
Date: Fri, 17 Feb 2023 19:00:38 +0200
Message-Id: <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Migration of vhost-user-fs device requires transfer of FUSE internal state
from backend. There is no standard way to do it now so by default migration
must be blocked. But if this state can be externally transferred by
orchestrator give it an option to explicitly allow migration.

Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
---
 hw/core/qdev-properties-system.c    | 10 +++++++++
 hw/virtio/vhost-user-fs.c           | 32 ++++++++++++++++++++++++++++-
 include/hw/qdev-properties-system.h |  1 +
 include/hw/virtio/vhost-user-fs.h   |  2 ++
 qapi/migration.json                 | 16 +++++++++++++++
 5 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index d42493f630..d9b1aa2a5d 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -1143,3 +1143,13 @@ const PropertyInfo qdev_prop_uuid = {
     .set   = set_uuid,
     .set_default_value = set_default_uuid_auto,
 };
+
+const PropertyInfo qdev_prop_vhost_user_migration_type = {
+    .name = "VhostUserMigrationType",
+    .description = "none/external",
+    .enum_table = &VhostUserMigrationType_lookup,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
+    .realized_set_allowed = true,
+};
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 83fc20e49e..7deb9df5ec 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -298,9 +298,35 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
     return &fs->vhost_dev;
 }
 
+static int vhost_user_fs_pre_save(void *opaque)
+{
+    VHostUserFS *fs = opaque;
+    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
+
+    switch (fs->migration_type) {
+    case VHOST_USER_MIGRATION_TYPE_NONE:
+        error_report("Migration is blocked by device %s", path);
+        break;
+    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
+        return 0;
+    default:
+        error_report("Migration type '%s' is not supported by device %s",
+                     VhostUserMigrationType_str(fs->migration_type), path);
+        break;
+    }
+
+    return -1;
+}
+
 static const VMStateDescription vuf_vmstate = {
     .name = "vhost-user-fs",
-    .unmigratable = 1,
+    .minimum_version_id = 0,
+    .version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+   .pre_save = vhost_user_fs_pre_save,
 };
 
 static Property vuf_properties[] = {
@@ -309,6 +335,10 @@ static Property vuf_properties[] = {
     DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
                        conf.num_request_queues, 1),
     DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
+    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
+                         VHOST_USER_MIGRATION_TYPE_NONE,
+                         qdev_prop_vhost_user_migration_type,
+                         VhostUserMigrationType),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 0ac327ae60..1a67591590 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -22,6 +22,7 @@ extern const PropertyInfo qdev_prop_audiodev;
 extern const PropertyInfo qdev_prop_off_auto_pcibar;
 extern const PropertyInfo qdev_prop_pcie_link_speed;
 extern const PropertyInfo qdev_prop_pcie_link_width;
+extern const PropertyInfo qdev_prop_vhost_user_migration_type;
 
 #define DEFINE_PROP_PCI_DEVFN(_n, _s, _f, _d)                   \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pci_devfn, int32_t)
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 94c3aaa84e..821b2a121c 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -19,6 +19,7 @@
 #include "hw/virtio/vhost-user.h"
 #include "chardev/char-fe.h"
 #include "qom/object.h"
+#include "qapi/qapi-types-migration.h"
 
 #define TYPE_VHOST_USER_FS "vhost-user-fs-device"
 OBJECT_DECLARE_SIMPLE_TYPE(VHostUserFS, VHOST_USER_FS)
@@ -40,6 +41,7 @@ struct VHostUserFS {
     VirtQueue **req_vqs;
     VirtQueue *hiprio_vq;
     int32_t bootindex;
+    VhostUserMigrationType migration_type;
 
     /*< public >*/
 };
diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..78feb20ffc 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -2178,3 +2178,19 @@
   'data': { 'job-id': 'str',
             'tag': 'str',
             'devices': ['str'] } }
+
+##
+# @VhostUserMigrationType:
+#
+# Type of vhost-user device migration.
+#
+# @none: Migration is not supported, attempts to migrate with this device
+#        will be blocked.
+#
+# @external: Migration stream contains only virtio device state,
+#            daemon state should be transferred externally by orchestrator.
+#
+# Since: 8.0
+##
+{ 'enum': 'VhostUserMigrationType',
+  'data': [ 'none', 'external' ] }
-- 
2.37.2


