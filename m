Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9B31E5E00
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 13:14:07 +0200 (CEST)
Received: from localhost ([::1]:39742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeGUA-00075V-MP
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 07:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jeGLU-0005wh-3u
 for qemu-devel@nongnu.org; Thu, 28 May 2020 07:05:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57535
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jeGLJ-0006qG-Fl
 for qemu-devel@nongnu.org; Thu, 28 May 2020 07:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590663895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvgscpl/ug0EhOZFSapnCmqCdDrH7i6DVH0Hl3rM9oE=;
 b=J4rZm87NsHmUXElq46RfNEr4yspPUm/B1mx2AuOX8FxX7IN5F22YkB7pqKg8Igs0XJ5XuE
 hkgCyCo+Vqo+/Oe9GXRCAr9VXwUph8Ks6j+2tmq23Zucj5D4eOmY+0R6j6k7GrqBE38xWu
 UICC80sjhu0x6pzLUJWMmu5yrGaJZuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-mwtVeu1dP-mYa0lJeoRnyA-1; Thu, 28 May 2020 07:04:50 -0400
X-MC-Unique: mwtVeu1dP-mYa0lJeoRnyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C99601009441
 for <qemu-devel@nongnu.org>; Thu, 28 May 2020 11:04:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71D83768B0;
 Thu, 28 May 2020 11:04:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3666C11358D6; Thu, 28 May 2020 13:04:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/24] sd: Hide the qdev-but-not-quite thing created by
 sd_init()
Date: Thu, 28 May 2020 13:04:43 +0200
Message-Id: <20200528110444.20456-24-armbru@redhat.com>
In-Reply-To: <20200528110444.20456-1-armbru@redhat.com>
References: <20200528110444.20456-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 01:51:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 260bc9d8aa "hw/sd/sd.c: QOMify" QOMified only the device
itself, not its users.  It kept sd_init() around for non-QOMified
users.

More than four years later, three such users remain: omap1 (machines
cheetah, sx1, sx1-v1) and omap2 (machines n800, n810) are not
QOMified, and pl181 (machines integratorcp, realview-eb,
realview-eb-mpcore, realview-pb-a8 realview-pbx-a9, versatileab,
versatilepb, vexpress-a15, vexpress-a9) is not QOMified properly.

The issue I presently have with this: an "sd-card" device should plug
into an "sd-bus" (its DeviceClass member bus_type says so), but
sd_init() leaves it unplugged.  This is normally a bug (I just fixed
some instances), and I'd like to assert proper pluggedness to prevent
regressions.  However, the qdev-but-not-quite thing returned by
sd_init() would fail the assertion.  Meh.

Make sd_init() hide it from QOM/qdev.  Visible in "info qom-tree",
here's the change for cheetah:

     /machine (cheetah-machine)
       [...]
       /unattached (container)
         [...]
         /device[5] (serial-mm)
           /serial (serial)
           /serial[0] (qemu:memory-region)
    -    /device[6] (sd-card)
    -    /device[7] (omap-gpio)
    +    /device[6] (omap-gpio)
         [rest of device[*] renumbered...]

Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/sd/sd.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 3c06a0ac6d..7070a116ea 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -83,6 +83,10 @@ enum SDCardStates {
 struct SDState {
     DeviceState parent_obj;
 
+    /* If true, created by sd_init() for a non-qdevified caller */
+    /* TODO purge them with fire */
+    bool me_no_qdev_me_kill_mammoth_with_rocks;
+
     /* SD Memory Card Registers */
     uint32_t ocr;
     uint8_t scr[8];
@@ -129,6 +133,8 @@ struct SDState {
     bool cmd_line;
 };
 
+static void sd_realize(DeviceState *dev, Error **errp);
+
 static const char *sd_state_name(enum SDCardStates state)
 {
     static const char *state_name[] = {
@@ -590,7 +596,7 @@ static void sd_cardchange(void *opaque, bool load, Error **errp)
 {
     SDState *sd = opaque;
     DeviceState *dev = DEVICE(sd);
-    SDBus *sdbus = SD_BUS(qdev_get_parent_bus(dev));
+    SDBus *sdbus;
     bool inserted = sd_get_inserted(sd);
     bool readonly = sd_get_readonly(sd);
 
@@ -601,19 +607,17 @@ static void sd_cardchange(void *opaque, bool load, Error **errp)
         trace_sdcard_ejected();
     }
 
-    /* The IRQ notification is for legacy non-QOM SD controller devices;
-     * QOMified controllers use the SDBus APIs.
-     */
-    if (sdbus) {
-        sdbus_set_inserted(sdbus, inserted);
-        if (inserted) {
-            sdbus_set_readonly(sdbus, readonly);
-        }
-    } else {
+    if (sd->me_no_qdev_me_kill_mammoth_with_rocks) {
         qemu_set_irq(sd->inserted_cb, inserted);
         if (inserted) {
             qemu_set_irq(sd->readonly_cb, readonly);
         }
+    } else {
+        sdbus = SD_BUS(qdev_get_parent_bus(dev));
+        sdbus_set_inserted(sdbus, inserted);
+        if (inserted) {
+            sdbus_set_readonly(sdbus, readonly);
+        }
     }
 }
 
@@ -697,6 +701,7 @@ SDState *sd_init(BlockBackend *blk, bool is_spi)
 {
     Object *obj;
     DeviceState *dev;
+    SDState *sd;
     Error *err = NULL;
 
     obj = object_new(TYPE_SD_CARD);
@@ -707,13 +712,24 @@ SDState *sd_init(BlockBackend *blk, bool is_spi)
         return NULL;
     }
     qdev_prop_set_bit(dev, "spi", is_spi);
-    object_property_set_bool(obj, true, "realized", &err);
+
+    /*
+     * Realizing the device properly would put it into the QOM
+     * composition tree even though it is not plugged into an
+     * appropriate bus.  That's a no-no.  Hide the device from
+     * QOM/qdev, and call its qdev realize callback directly.
+     */
+    object_ref(obj);
+    object_unparent(obj);
+    sd_realize(dev, &err);
     if (err) {
         error_reportf_err(err, "sd_init failed: ");
         return NULL;
     }
 
-    return SD_CARD(dev);
+    sd = SD_CARD(dev);
+    sd->me_no_qdev_me_kill_mammoth_with_rocks = true;
+    return sd;
 }
 
 void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
-- 
2.21.3


