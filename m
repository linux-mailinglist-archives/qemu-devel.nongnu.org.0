Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B995668D0FE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:52:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIlG-00039l-Dq; Tue, 07 Feb 2023 02:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlD-000382-Av
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlA-0000sd-O3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675756283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUvHDYpmaI9EGczbKmNcseCpKI9Ekgw2DDW4KTVl1Hc=;
 b=G0R5jrrVeCcUFs97S/wx5SFQdpSRO6GkeAK2Hp4/OPtUHdViKZjgr2V0gGHH4uM1XEkhEE
 Q82THFp/EWHFFACfo82RxvAdmqONHCA+/JFubTGYaMHq4Uid1a1pZv4HhKqWqa9Eyy5tQH
 fr9fl737y5anWtxyYcFmWN50XukyWl4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-f8M2wHhWN3yg-RyqILUC1w-1; Tue, 07 Feb 2023 02:51:18 -0500
X-MC-Unique: f8M2wHhWN3yg-RyqILUC1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E4B6101B453;
 Tue,  7 Feb 2023 07:51:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F13232166B2A;
 Tue,  7 Feb 2023 07:51:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B7B3921E6A20; Tue,  7 Feb 2023 08:51:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, jiri@resnulli.us,
 jasowang@redhat.com, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 zhanghailiang@xfusion.com, quintela@redhat.com, dgilbert@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com
Subject: [PATCH 01/12] error: Drop superfluous #include "qapi/qmp/qerror.h"
Date: Tue,  7 Feb 2023 08:51:04 +0100
Message-Id: <20230207075115.1525-2-armbru@redhat.com>
In-Reply-To: <20230207075115.1525-1-armbru@redhat.com>
References: <20230207075115.1525-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 authz/listfile.c               | 1 -
 backends/cryptodev-vhost.c     | 1 -
 backends/rng.c                 | 1 -
 backends/vhost-user.c          | 1 -
 block/backup.c                 | 1 -
 block/commit.c                 | 1 -
 block/mirror.c                 | 1 -
 block/stream.c                 | 1 -
 hw/core/machine.c              | 1 -
 hw/i386/pc.c                   | 1 -
 hw/i386/x86.c                  | 1 -
 hw/misc/xlnx-zynqmp-apu-ctrl.c | 1 -
 migration/colo.c               | 1 -
 migration/migration-hmp-cmds.c | 1 -
 qga/main.c                     | 1 -
 softmmu/qtest.c                | 1 -
 target/i386/monitor.c          | 1 -
 target/i386/sev-sysemu-stub.c  | 1 -
 target/i386/sev.c              | 1 -
 util/qemu-config.c             | 1 -
 20 files changed, 20 deletions(-)

diff --git a/authz/listfile.c b/authz/listfile.c
index da3a0e69a2..45a60e987d 100644
--- a/authz/listfile.c
+++ b/authz/listfile.c
@@ -30,7 +30,6 @@
 #include "qapi/qapi-visit-authz.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qobject.h"
-#include "qapi/qmp/qerror.h"
 #include "qapi/qobject-input-visitor.h"
 
 
diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
index 572f87b3be..74ea0ad63d 100644
--- a/backends/cryptodev-vhost.c
+++ b/backends/cryptodev-vhost.c
@@ -28,7 +28,6 @@
 
 #ifdef CONFIG_VHOST_CRYPTO
 #include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
 #include "hw/virtio/virtio-crypto.h"
 #include "sysemu/cryptodev-vhost-user.h"
diff --git a/backends/rng.c b/backends/rng.c
index 6c7bf64426..9bbd0c77b6 100644
--- a/backends/rng.c
+++ b/backends/rng.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "sysemu/rng.h"
 #include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "qemu/module.h"
 #include "qom/object_interfaces.h"
 
diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index 7bfcaef976..0596223ac4 100644
--- a/backends/vhost-user.c
+++ b/backends/vhost-user.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
 #include "qom/object_interfaces.h"
 #include "sysemu/vhost-user-backend.h"
diff --git a/block/backup.c b/block/backup.c
index 824d39acaa..5b8863b88c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -22,7 +22,6 @@
 #include "block/block-copy.h"
 #include "block/dirty-bitmap.h"
 #include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "qemu/cutils.h"
 #include "sysemu/block-backend.h"
 #include "qemu/bitmap.h"
diff --git a/block/commit.c b/block/commit.c
index 41e3599281..387a720d03 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -18,7 +18,6 @@
 #include "block/block_int.h"
 #include "block/blockjob_int.h"
 #include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "qemu/ratelimit.h"
 #include "qemu/memalign.h"
 #include "sysemu/block-backend.h"
diff --git a/block/mirror.c b/block/mirror.c
index ab326b67c9..0f6551cf5b 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -21,7 +21,6 @@
 #include "block/dirty-bitmap.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "qemu/ratelimit.h"
 #include "qemu/bitmap.h"
 #include "qemu/memalign.h"
diff --git a/block/stream.c b/block/stream.c
index 8744ad103f..e77a033233 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -16,7 +16,6 @@
 #include "block/block_int.h"
 #include "block/blockjob_int.h"
 #include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/ratelimit.h"
 #include "sysemu/block-backend.h"
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f7761baab5..89bf690365 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "qemu/option.h"
 #include "qemu/accel.h"
-#include "qapi/qmp/qerror.h"
 #include "sysemu/replay.h"
 #include "qemu/units.h"
 #include "hw/boards.h"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969..a7a2ededf9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -92,7 +92,6 @@
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
-#include "qapi/qmp/qerror.h"
 #include "e820_memory_layout.h"
 #include "fw_cfg.h"
 #include "trace.h"
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index eaff4227bd..48be7a1c23 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -28,7 +28,6 @@
 #include "qemu/datadir.h"
 #include "qemu/guest-random.h"
 #include "qapi/error.h"
-#include "qapi/qmp/qerror.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-visit-machine.h"
diff --git a/hw/misc/xlnx-zynqmp-apu-ctrl.c b/hw/misc/xlnx-zynqmp-apu-ctrl.c
index 20de23cf67..3d2be95e6d 100644
--- a/hw/misc/xlnx-zynqmp-apu-ctrl.c
+++ b/hw/misc/xlnx-zynqmp-apu-ctrl.c
@@ -18,7 +18,6 @@
 #include "hw/register.h"
 
 #include "qemu/bitops.h"
-#include "qapi/qmp/qerror.h"
 
 #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
 
diff --git a/migration/colo.c b/migration/colo.c
index 232c8d44b1..0716e64689 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -33,7 +33,6 @@
 #include "net/colo.h"
 #include "block/block.h"
 #include "qapi/qapi-events-migration.h"
-#include "qapi/qmp/qerror.h"
 #include "sysemu/cpus.h"
 #include "sysemu/runstate.h"
 #include "net/filter.h"
diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index ef25bc8929..72519ea99f 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -23,7 +23,6 @@
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qmp/qerror.h"
 #include "qapi/string-input-visitor.h"
 #include "qapi/string-output-visitor.h"
 #include "qemu/cutils.h"
diff --git a/qga/main.c b/qga/main.c
index 85b7d6ced5..2b992a55b3 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -24,7 +24,6 @@
 #include "qapi/qmp/qjson.h"
 #include "guest-agent-core.h"
 #include "qga-qapi-init-commands.h"
-#include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
 #include "channel.h"
 #include "qemu/cutils.h"
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index d3e0ab4eda..34bd2a33a7 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -28,7 +28,6 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
-#include "qapi/qmp/qerror.h"
 #include "qom/object_interfaces.h"
 #include CONFIG_DEVICES
 #ifdef CONFIG_PSERIES
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index ad5b7b8bb5..6512846327 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,7 +28,6 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qmp/qerror.h"
 #include "sysemu/kvm.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 7a29295d1e..96e1c15cc3 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -15,7 +15,6 @@
 #include "monitor/monitor.h"
 #include "monitor/hmp-target.h"
 #include "qapi/qapi-commands-misc-target.h"
-#include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
 #include "sev.h"
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 32f7dbac4e..0ec970496e 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -34,7 +34,6 @@
 #include "monitor/monitor.h"
 #include "monitor/hmp-target.h"
 #include "qapi/qapi-commands-misc-target.h"
-#include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/i386/pc.h"
 #include "exec/address-spaces.h"
diff --git a/util/qemu-config.c b/util/qemu-config.c
index d63f27438d..42076efe1e 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -2,7 +2,6 @@
 #include "block/qdict.h" /* for qdict_extract_subqdict() */
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc.h"
-#include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 #include "qemu/error-report.h"
-- 
2.39.0


