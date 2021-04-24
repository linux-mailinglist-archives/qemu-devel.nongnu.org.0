Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB53D36A235
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:48:56 +0200 (CEST)
Received: from localhost ([::1]:47680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLSi-0007Wr-2v
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3U-0000Ck-IT; Sat, 24 Apr 2021 12:22:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3T-0004Ma-5a; Sat, 24 Apr 2021 12:22:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id p6so44746223wrn.9;
 Sat, 24 Apr 2021 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4+QISpS2fmofHFusvT0iZzLeTqf48stVhGPP0rBj26c=;
 b=X9aNCpiU5uRRiB4ZvEDKILDSMIgY4GeFiCX/xw971wZzOSpY8Wsc5uyf8DvE63kKEO
 y3Ca1JRzH0MZ+qeYaWuyDw+Bczl+VD+LDFZbivN+YnBS6xFt1YFg5/7pQLWfe3qnLTNL
 JFLJYPoLYYEWaSPjkvdVaqrWcJRHYav3pLjhCWQkYzTmQT63Wb9D6KeCTIvqrqpWFx0P
 x8hiXo18CnpQN2qW+S5ZQNVL4QduF9E1v36ey08dsUFAN5i2nhcMB4olJGO3UltO/AuK
 EgKA0OkUBHn+7KZoZG7YZ8fBSYCnXoiVjeu3W2+Gitv3Tg3L04eU3TsI3eDXTrK29u3B
 esgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4+QISpS2fmofHFusvT0iZzLeTqf48stVhGPP0rBj26c=;
 b=gUu5KLruo/TvfyjhgZeH5zmkGR9LHFy/0mDmCV5IoIg7BEnkaQpu8bYx3gODkE+eHT
 KbBZSKp1mn2q542wQtQHTnQiwyrMYCDLsopDxHP9FX8rs9JJZmCGCSr9uCtYZhMklgMq
 oXX/Nbe5mYzdFZA6KPC1KLjuXLcmaFz3Opmd08LpjRYl5b1zaTOO/RKJ334vAIBteC9u
 dm/TRZBPcT4egDgN/8CynpwwGYdCRsW5fCkI57qW+m7uCEEeAT+PH5f493dBPsLwb6wn
 lkhdwMEMm6Xe1UOP88fe9bdoU3mv2jYzBCM6wM28zYzLp+jniv3LFwrUz7gVCknSk1dG
 NCjQ==
X-Gm-Message-State: AOAM531c7MeBJGtpjkUOARgTudwxo7gUfcHiWGuO+WhDNa1M6KVjP1AI
 sjofOtXBQ7avQXJtKkp6ZxjAZCShcz24Yw==
X-Google-Smtp-Source: ABdhPJyuZ+sG+ybj1josEculdM6x9EeSooAh2Xzwzi65A6hWq2uNmqbmRZcYRivUF80+l5FPA67jNw==
X-Received: by 2002:a05:6000:23c:: with SMTP id
 l28mr11521347wrz.79.1619281368579; 
 Sat, 24 Apr 2021 09:22:48 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u14sm12782211wrq.65.2021.04.24.09.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:22:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/block/nand: Register machine reset handler
Date: Sat, 24 Apr 2021 18:22:27 +0200
Message-Id: <20210424162229.3312116-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424162229.3312116-1-f4bug@amsat.org>
References: <20210424162229.3312116-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
index 8bc80e35144..d3fb5107bfe 100644
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
+    device_legacy_reset(DEVICE(dev));
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


