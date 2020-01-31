Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0509C14ECD2
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 14:02:56 +0100 (CET)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixVwk-0007WP-JX
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 08:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixVvP-0005rm-8W
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 08:01:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixVvN-0007vR-S5
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 08:01:30 -0500
Received: from relay.sw.ru ([185.231.240.75]:59604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixVvN-0007rU-Ki
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 08:01:29 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixVvI-0000zU-8u; Fri, 31 Jan 2020 16:01:24 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/11] hw/sd/ssi-sd: fix error handling in ssi_sd_realize
Date: Fri, 31 Jan 2020 16:01:11 +0300
Message-Id: <20200131130118.1716-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200131130118.1716-1-vsementsov@virtuozzo.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's wrong to use same err object as errp parameter for several
function calls without intermediate checking for error: we'll crash if
try to set err object twice.

Fix that, using new ERRP_AUTO_PROPAGATE macro.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/sd/ssi-sd.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 91db069212..bc44e1a0f5 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -241,10 +241,10 @@ static const VMStateDescription vmstate_ssi_sd = {
 
 static void ssi_sd_realize(SSISlave *d, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     ssi_sd_state *s = FROM_SSI_SLAVE(ssi_sd_state, d);
     DeviceState *carddev;
     DriveInfo *dinfo;
-    Error *err = NULL;
 
     qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
                         DEVICE(d), "sd-bus");
@@ -254,14 +254,26 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
     dinfo = drive_get_next(IF_SD);
     carddev = qdev_create(BUS(&s->sdbus), TYPE_SD_CARD);
     if (dinfo) {
-        qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
+        qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), errp);
+        if (*errp) {
+            goto fail;
+        }
+    }
+
+    object_property_set_bool(OBJECT(carddev), true, "spi", errp);
+    if (*errp) {
+        goto fail;
     }
-    object_property_set_bool(OBJECT(carddev), true, "spi", &err);
-    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
-    if (err) {
-        error_setg(errp, "failed to init SD card: %s", error_get_pretty(err));
-        return;
+
+    object_property_set_bool(OBJECT(carddev), true, "realized", errp);
+    if (*errp) {
+        goto fail;
     }
+
+    return;
+
+fail:
+    error_prepend(errp, "failed to init SD card: ");
 }
 
 static void ssi_sd_reset(DeviceState *dev)
-- 
2.21.0


