Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7866F205499
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 16:28:42 +0200 (CEST)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnjuj-00087s-Gi
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 10:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnjpu-0001o4-2M
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:23:42 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56096
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnjpn-0007jt-3W
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592922214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzGTCuv62dGXjoqG/dxgPQGfQJ3gb0Hc/Prq5bnFGaY=;
 b=Y8eW1UObNq8JhZyw9B/BxNlzBznRcvC5Eg64mbvCD7InrYSgihm9LiTHFHHY8n8XjSHH26
 Dk6wGIDbZRQm470j6B6eTdgWWG8I+ThWD4fllLBi/ua8DDm6eE3FN2kvijKeYfBd/XQfZW
 042VaUse07IuKnlh/OteAKZt9yhAvhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-eE8ZgLcuO2GYUuWvb0NoHQ-1; Tue, 23 Jun 2020 10:23:32 -0400
X-MC-Unique: eE8ZgLcuO2GYUuWvb0NoHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DBB01005513;
 Tue, 23 Jun 2020 14:23:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2D295DA27;
 Tue, 23 Jun 2020 14:23:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6EDE9113847D; Tue, 23 Jun 2020 16:23:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] sd/pxa2xx_mmci: Don't crash on pxa2xx_mmci_init() error
Date: Tue, 23 Jun 2020 16:23:25 +0200
Message-Id: <20200623142326.2349416-16-armbru@redhat.com>
In-Reply-To: <20200623142326.2349416-1-armbru@redhat.com>
References: <20200623142326.2349416-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On error, pxa2xx_mmci_init() reports to stderr and returns NULL.
Callers don't check for errors.  Machines akita, borzoi, mainstone,
spitz, terrier, tosa, and z2 crash shortly after, like this:

    $ qemu-system-aarch64 -M akita -drive if=sd,readonly=on
    qemu-system-aarch64: failed to init SD card: Cannot use read-only drive as SD card
    Segmentation fault (core dumped)

Machines connex and verdex reach the check for orphaned drives first:

    $ aarch64-softmmu/qemu-system-aarch64 -M connex -drive if=sd,readonly=on -accel qtest
    qemu-system-aarch64: failed to init SD card: Cannot use read-only drive as SD card
    qemu-system-aarch64: -drive if=sd,readonly=on: machine type does not support if=sd,bus=0,unit=0

Make pxa2xx_mmci_init() fail cleanly right away.

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200622094227.1271650-16-armbru@redhat.com>
---
 hw/sd/pxa2xx_mmci.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 3407617afc..68bed24480 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -18,7 +18,6 @@
 #include "hw/arm/pxa.h"
 #include "hw/sd/sd.h"
 #include "hw/qdev-properties.h"
-#include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -483,7 +482,6 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
     DeviceState *dev, *carddev;
     SysBusDevice *sbd;
     PXA2xxMMCIState *s;
-    Error *err = NULL;
 
     dev = qdev_new(TYPE_PXA2XX_MMCI);
     s = PXA2XX_MMCI(dev);
@@ -496,16 +494,9 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
 
     /* Create and plug in the sd card */
     carddev = qdev_new(TYPE_SD_CARD);
-    qdev_prop_set_drive_err(carddev, "drive", blk, &err);
-    if (err) {
-        error_reportf_err(err, "failed to init SD card: ");
-        return NULL;
-    }
-    qdev_realize_and_unref(carddev, qdev_get_child_bus(dev, "sd-bus"), &err);
-    if (err) {
-        error_reportf_err(err, "failed to init SD card: ");
-        return NULL;
-    }
+    qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+    qdev_realize_and_unref(carddev, qdev_get_child_bus(dev, "sd-bus"),
+                           &error_fatal);
 
     return s;
 }
-- 
2.26.2


