Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE0724DE92
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 19:34:37 +0200 (CEST)
Received: from localhost ([::1]:59558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9Aw0-0001D1-Jw
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 13:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Ar4-0001C5-KI; Fri, 21 Aug 2020 13:29:30 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Ar2-0001A6-Ro; Fri, 21 Aug 2020 13:29:30 -0400
Received: by mail-wr1-x443.google.com with SMTP id 88so2661226wrh.3;
 Fri, 21 Aug 2020 10:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C3Tm4+Z7Q6QefXOq9EkMkmgI6/oXsxZYry3NIouzDNA=;
 b=rLO4jrHJsWAFfmg2Z8Errv0TBHcSlFqQUtEQ+SGmWS0RACjrZmLF8co5n0IPMVJ582
 6HErzaj5pb9jgvDqc+0e9f9iAUFbX399xrEvEnBJhmp791LxnsQ7YNbz0gADaDPpcIpr
 QIGmi+7JOjPID0AoIjxoDFYqgRfNbV0Ks8OZel74Y/8etDACe8GmyMAVIlFrpKKkUKui
 hOHIu5RicTPQkirjNQ6U86btgXHsn1RyQusuTpvNCUbzk1QCxRhPe/RIcb1oTHcH2hFx
 IwKYXIePsmSmadBtKzo6/WR8kjAilqcnFh9pxS63wYhhBxqeh7HOZd4umtxQeJGH5piJ
 kl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C3Tm4+Z7Q6QefXOq9EkMkmgI6/oXsxZYry3NIouzDNA=;
 b=E4AZcf0Kr4EA5byAtUtZiFFJxKgUR2EECtm1Lkc4TjxHdTbE8e5K5xXBozBhG0+Z9m
 3KDUq+aHjQRSv0FUICALEhKQSRkFU8DWZ/WEr1ArVFdeLWt4s77IpUk8ZuJoRmfSJBv/
 LGcY6YXXO6PA7eGsBLGouHX2SFJAAy0NpG10ij46zL5pyeRoKtpnhoMAYqcJsmdq1+JN
 FCtA42nRODRQBew2qSiBl8JMLRW3FR3V5fyOe4ORuZ1IHl2brd989aRr4qZgfIOWe5aC
 ZeusMJi5hB0fKcY1a9Ewv62zFgHd1bKIxNEnS5D1JAInHloO5G+vEKcLlH/TJen+eo2R
 NKCw==
X-Gm-Message-State: AOAM531/RtJrS12QYzyy9tQxy1K1PqWwDaPuAxO/vmwQEFQGz4uM+Kdf
 E5Y8pIfaBr3Ah0mZtfPtMKl+OAzVams=
X-Google-Smtp-Source: ABdhPJx+ieDBKktPaikWNv6XVHWQHhwzt9bfX42KsNUsgaIU8ks0HOo7m3Vj95Umvu4aGeU2wCX2+g==
X-Received: by 2002:adf:a1c6:: with SMTP id v6mr3610233wrv.197.1598030966515; 
 Fri, 21 Aug 2020 10:29:26 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/23] hw/sd/milkymist: Do not create SD card within the SD
 host controller
Date: Fri, 21 Aug 2020 19:28:58 +0200
Message-Id: <20200821172916.1260954-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SD/MMC host controllers provide a SD Bus to plug SD cards,
but don't come with SD card plugged in :) Let the machine/board
model create and plug the SD cards when required.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20200705211016.15241-5-f4bug@amsat.org>
---
 hw/lm32/milkymist.c       | 13 +++++++++
 hw/sd/milkymist-memcard.c | 55 +++++++++++++++++++++++----------------
 2 files changed, 45 insertions(+), 23 deletions(-)

diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 469e3c43225..9f8fe9fef15 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -34,6 +34,7 @@
 #include "elf.h"
 #include "milkymist-hw.h"
 #include "hw/display/milkymist_tmu2.h"
+#include "hw/sd/sd.h"
 #include "lm32.h"
 #include "exec/address-spaces.h"
 #include "qemu/cutils.h"
@@ -83,11 +84,23 @@ static void main_cpu_reset(void *opaque)
 static DeviceState *milkymist_memcard_create(hwaddr base)
 {
     DeviceState *dev;
+    DriveInfo *dinfo;
 
     dev = qdev_new("milkymist-memcard");
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
 
+    dinfo = drive_get_next(IF_SD);
+    if (dinfo) {
+        DeviceState *card;
+
+        card = qdev_new(TYPE_SD_CARD);
+        qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
+                                &error_fatal);
+        qdev_realize_and_unref(card, qdev_get_child_bus(dev, "sd-bus"),
+                               &error_fatal);
+    }
+
     return dev;
 }
 
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 747c5c6136b..e9f5db5e22d 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -66,6 +66,8 @@ enum {
 #define MILKYMIST_MEMCARD(obj) \
     OBJECT_CHECK(MilkymistMemcardState, (obj), TYPE_MILKYMIST_MEMCARD)
 
+#define TYPE_MILKYMIST_SDBUS "milkymist-sdbus"
+
 struct MilkymistMemcardState {
     SysBusDevice parent_obj;
 
@@ -253,6 +255,19 @@ static void milkymist_memcard_reset(DeviceState *d)
     }
 }
 
+static void milkymist_memcard_set_readonly(DeviceState *dev, bool level)
+{
+    qemu_log_mask(LOG_UNIMP,
+                  "milkymist_memcard: read-only mode not supported\n");
+}
+
+static void milkymist_memcard_set_inserted(DeviceState *dev, bool level)
+{
+    MilkymistMemcardState *s = MILKYMIST_MEMCARD(dev);
+
+    s->enabled = !!level;
+}
+
 static void milkymist_memcard_init(Object *obj)
 {
     MilkymistMemcardState *s = MILKYMIST_MEMCARD(obj);
@@ -266,27 +281,6 @@ static void milkymist_memcard_init(Object *obj)
                         DEVICE(obj), "sd-bus");
 }
 
-static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
-{
-    MilkymistMemcardState *s = MILKYMIST_MEMCARD(dev);
-    DeviceState *carddev;
-    BlockBackend *blk;
-    DriveInfo *dinfo;
-    Error *err = NULL;
-
-    /* Create and plug in the sd card */
-    /* FIXME use a qdev drive property instead of drive_get_next() */
-    dinfo = drive_get_next(IF_SD);
-    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
-    carddev = qdev_new(TYPE_SD_CARD);
-    qdev_prop_set_drive(carddev, "drive", blk);
-    if (!qdev_realize_and_unref(carddev, BUS(&s->sdbus), &err)) {
-        error_propagate_prepend(errp, err, "failed to init SD card");
-        return;
-    }
-    s->enabled = blk && blk_is_inserted(blk);
-}
-
 static const VMStateDescription vmstate_milkymist_memcard = {
     .name = "milkymist-memcard",
     .version_id = 1,
@@ -308,10 +302,9 @@ static void milkymist_memcard_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    dc->realize = milkymist_memcard_realize;
     dc->reset = milkymist_memcard_reset;
     dc->vmsd = &vmstate_milkymist_memcard;
-    /* Reason: init() method uses drive_get_next() */
+    /* Reason: output IRQs should be wired up */
     dc->user_creatable = false;
 }
 
@@ -323,9 +316,25 @@ static const TypeInfo milkymist_memcard_info = {
     .class_init    = milkymist_memcard_class_init,
 };
 
+static void milkymist_sdbus_class_init(ObjectClass *klass, void *data)
+{
+    SDBusClass *sbc = SD_BUS_CLASS(klass);
+
+    sbc->set_inserted = milkymist_memcard_set_inserted;
+    sbc->set_readonly = milkymist_memcard_set_readonly;
+}
+
+static const TypeInfo milkymist_sdbus_info = {
+    .name = TYPE_MILKYMIST_SDBUS,
+    .parent = TYPE_SD_BUS,
+    .instance_size = sizeof(SDBus),
+    .class_init = milkymist_sdbus_class_init,
+};
+
 static void milkymist_memcard_register_types(void)
 {
     type_register_static(&milkymist_memcard_info);
+    type_register_static(&milkymist_sdbus_info);
 }
 
 type_init(milkymist_memcard_register_types)
-- 
2.26.2


