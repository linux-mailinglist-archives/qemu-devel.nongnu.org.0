Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01949370F07
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:33:57 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldImq-0002kK-3W
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldIkc-0001FJ-AJ; Sun, 02 May 2021 16:31:38 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldIkZ-0007nA-4c; Sun, 02 May 2021 16:31:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so2346969wmh.4; 
 Sun, 02 May 2021 13:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CsWZi4ds50E4Jo0anUjFufYBOCfHF4O32gPt5S3V5lE=;
 b=S2a+xmaJzy34mwsn6r7cIGug3mlA6tjsje6sjwhkbMFNsvfZjTT1jKx+tdLiGKgAZW
 9xyUAKx4/C07T+E0e7G0QVkwu0qq5pyC0bEmrTS4BwD4cfnksy+5f1WmL/Im+ZjVCYw5
 TVg06qJ+iM8G1iU7hWjcYtamwIe+jWLBG/5Avg4wjiTSWrYB015SX23XYDDUUcH7aPW3
 ys6Zi03ZwGyF0k+GIAl/wl0A9V3OXZafn5XrxhfIb01m6sOj7m9j/uUsGjVuJp8DcG6C
 hcz3R5GLilRuVbkPdHXbu5mCD+R/0bZ8y9406yfchkMoQ+eaWztR8IG6MIg7VKQmNKvg
 symg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CsWZi4ds50E4Jo0anUjFufYBOCfHF4O32gPt5S3V5lE=;
 b=fsbsauEMq7V9f+sMbMUUbjdxfbdFlO3V+7W7J//ikKZgy13FaM1aF1g+d+Begpg4lF
 UeYIhNHV7O+B3MLqUuXGn+vrywoyVBTnywvx4NZtCuGOho5x2OQm639CK79WbFHQBZXL
 MUIq/QI7/OxPPbn1wTlTDr1LNbnzvGRBZTavGfMqYZOU9KCURd25xFQHRC4733fiP2qH
 QW7sHEAzrS3HtBAslXSTb7MakbvtxosKI4Cdb5GzkOIu4volEmVTjG4RJtFfTVizBY1+
 IVLJieYzUVk9vFSgvmMuHeHGwyw/M4nSTZzC/hH+Uvb8eiP6o02Ix1mq1IaiJ5z9Fd7l
 dQHA==
X-Gm-Message-State: AOAM530jFN4q7ZtEgsNVnKss/EPKZnQeJQYcbDroea9kNWL+KEasleBG
 bUCeragrYWOyh+Dzsh3c+PDwBYiVYt900rWV
X-Google-Smtp-Source: ABdhPJwqV5quI4JHldwGxJIb8B+bep04X/jcrD9m0HCJPtdhjeXHj8VtbJw0bNVfJ6AKU+EgfZLhJw==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr18362163wme.30.1619987488935; 
 Sun, 02 May 2021 13:31:28 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id d5sm10359858wrv.43.2021.05.02.13.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 13:31:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] hw/block/nand: Register machine reset handler
Date: Sun,  2 May 2021 22:31:19 +0200
Message-Id: <20210502203121.630944-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502203121.630944-1-f4bug@amsat.org>
References: <20210502203121.630944-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TYPE_NAND device is bus-less, thus isn't reset automatically.
Register a reset handler to get reset with the machine.

Fixed: 7426aa72c36 ("nand: Don't inherit from Sysbus")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/nand.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 8bc80e35144..8ec656659f5 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -24,6 +24,7 @@
 #include "hw/qdev-properties-system.h"
 #include "hw/block/flash.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/reset.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -364,6 +365,11 @@ static const VMStateDescription vmstate_nand = {
     }
 };
 
+static void nand_reset_handler(void *dev)
+{
+    device_cold_reset(DEVICE(dev));
+}
+
 static void nand_realize(DeviceState *dev, Error **errp)
 {
     int pagesize;
@@ -423,6 +429,13 @@ static void nand_realize(DeviceState *dev, Error **errp)
     }
     /* Give s->ioaddr a sane value in case we save state before it is used. */
     s->ioaddr = s->io;
+
+    qemu_register_reset(nand_reset_handler, dev);
+}
+
+static void nand_unrealize(DeviceState *dev)
+{
+    qemu_unregister_reset(nand_reset_handler, dev);
 }
 
 static Property nand_properties[] = {
@@ -437,6 +450,7 @@ static void nand_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = nand_realize;
+    dc->unrealize = nand_unrealize;
     dc->reset = nand_reset;
     dc->vmsd = &vmstate_nand;
     device_class_set_props(dc, nand_properties);
-- 
2.26.3


