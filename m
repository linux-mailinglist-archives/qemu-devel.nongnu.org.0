Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FB66B2E5
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 18:21:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH6gW-0003cJ-Jx; Sun, 15 Jan 2023 12:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pH6gN-0003bw-Rh
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 12:20:36 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pH6gK-00055B-Ox
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 12:20:35 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id B172B5E5B3;
 Sun, 15 Jan 2023 20:09:25 +0300 (MSK)
Received: from antonkuchin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b6bd::1:19])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 39mGhR0RfOs1-cOmVk46c; Sun, 15 Jan 2023 20:09:24 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1673802564; bh=gYBigg0oZoGfpt5W5DeIaCno9S/czkxTzwzpov2eMTQ=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=A5Lgc5q07ISAmQwKstUoLUdcwRRgqvuHXxQbg6/hW82UsqFThYwgjnEg7B9fZxHs5
 9JG45l3qTLOBCl7F/bBHCE4pf6PLsvS0R3qR3THAh4BIh/mEUhySxCxolAQ482eVl/
 h+/ohCI+2P45mEATci5l2Dkr/hwo4oqcHPhvtQBo=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Anton Kuchin <antonkuchin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: virtio-fs@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 yc-core@yandex-team.ru, "Michael S. Tsirkin" <mst@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>
Subject: [PATCH] vhost-user-fs: add capability to allow migration
Date: Sun, 15 Jan 2023 19:09:03 +0200
Message-Id: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
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

Now any vhost-user-fs device makes VM unmigratable, that also prevents
qemu update without stopping the VM. In most cases that makes sense
because qemu has no way to transfer FUSE session state.

But we can give an option to orchestrator to override this if it can
guarantee that state will be preserved (e.g. it uses migration to
update qemu and dst will run on the same host as src and use the same
socket endpoints).

This patch keeps default behavior that prevents migration with such devices
but adds migration capability 'vhost-user-fs' to explicitly allow migration.

Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
---
 hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
 qapi/migration.json       |  7 ++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index f5049735ac..13d920423e 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -24,6 +24,7 @@
 #include "hw/virtio/vhost-user-fs.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
+#include "migration/migration.h"
 
 static const int user_feature_bits[] = {
     VIRTIO_F_VERSION_1,
@@ -298,9 +299,31 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
     return &fs->vhost_dev;
 }
 
+static int vhost_user_fs_pre_save(void *opaque)
+{
+    MigrationState *s = migrate_get_current();
+
+    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
+        error_report("Migration of vhost-user-fs devices requires internal FUSE "
+                     "state of backend to be preserved. If orchestrator can "
+                     "guarantee this (e.g. dst connects to the same backend "
+                     "instance or backend state is migrated) set 'vhost-user-fs' "
+                     "migration capability to true to enable migration.");
+        return -1;
+    }
+
+    return 0;
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
diff --git a/qapi/migration.json b/qapi/migration.json
index 88ecf86ac8..9a229ea884 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -477,6 +477,11 @@
 #                    will be handled faster.  This is a performance feature and
 #                    should not affect the correctness of postcopy migration.
 #                    (since 7.1)
+# @vhost-user-fs: If enabled, the migration process will allow migration of
+#                 vhost-user-fs devices, this should be enabled only when
+#                 backend can preserve local FUSE state e.g. for qemu update
+#                 when dst reconects to the same endpoints after migration.
+#                 (since 8.0)
 #
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
@@ -492,7 +497,7 @@
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
            'validate-uuid', 'background-snapshot',
-           'zero-copy-send', 'postcopy-preempt'] }
+           'zero-copy-send', 'postcopy-preempt', 'vhost-user-fs'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.34.1


