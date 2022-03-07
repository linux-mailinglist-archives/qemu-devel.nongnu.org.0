Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436704D008B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:57:13 +0100 (CET)
Received: from localhost ([::1]:36900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDrM-00037s-Ag
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDgF-00067t-L9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:45 -0500
Received: from [2607:f8b0:4864:20::632] (port=34543
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDgD-0007IG-Kq
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:42 -0500
Received: by mail-pl1-x632.google.com with SMTP id s18so563062plp.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJh4PYyUI6xHySX36hONClAaQmYIjo+6gw5rU4C8imM=;
 b=mAoqRsx9n8IpP0CNZLDhK4DjjtG4ub6Hy8EmiTbWlxygO51MQ+f5aH56+V2izyBn2t
 jrEUyNW/gWHBNH4YyTV0xCF5Qok6uOvZY9hpnBBPCdZ3+c7SLfBzEIY52ilmi67fO+vb
 MCu28a2+p89AbXMXhnLAg/KNfhys+nT55rg0ipr+Yke6JXc2fUWL/K//7XtSPLYNmUY+
 qFWjDU16Mqa4wl+l8LgAKh+i/rvWBjouVSoytTQOzrwpBOMqf0LhZpnkFqtYfxOKt5+5
 UZE2eff3c+zvbGfD8JAvoNGb4qgqmt4NkKCHl01w1z5ZfhAuLZuNEbp1kR/ilrEBFZlM
 7DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJh4PYyUI6xHySX36hONClAaQmYIjo+6gw5rU4C8imM=;
 b=BI9kXrUKiHE2AibI9gJhumg24r3Fqe5xyWpOurE9oySTbb06kzL1jY53Xzi20W18Ba
 fp2hucLocMT4A9HQoi8/ISDVKj6Uzvs7cuL5/X7tPmKARaj0PYcWyMpwSgBWAKpH0hhZ
 6uvc4N3uhdfd5BQRb3l0dIMCrbOdcggF/bkRJ66omviynBdf+k5OCxJSsCmfzfjpxL8O
 x28kqmKzivoBHS/ZML2yu1oK+23GOW8FsCThkMvlVVFwfzDlxZoJZuo4xyDScpi4CvUo
 NTEEKQUbKOWfqsNboRPcY3raX9o7AxwlVgFJqkMyTzjnPVptamqsoBK9hl45GfyHI2W7
 ecRw==
X-Gm-Message-State: AOAM5311/O6q+ie3A6NCwnKOo8bu74OeSHOfeVkVc/gpLPb2JCKhtRUY
 KKY0teYq7zJ6CCCP/RAs1RPELyNg8t4=
X-Google-Smtp-Source: ABdhPJwiVcm8R0Q4V3tLP2plWF2aXWlyEBBCFkfbLHK6WjP6bkKr+AcCbXN1+h/Nhi12hpm2xJ1QEA==
X-Received: by 2002:a17:902:8bcc:b0:14f:2294:232e with SMTP id
 r12-20020a1709028bcc00b0014f2294232emr11941766plo.105.1646660740418; 
 Mon, 07 Mar 2022 05:45:40 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00218200b004f66d50f054sm16093113pfi.158.2022.03.07.05.45.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:45:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 12/13] hw/isa: Drop unused attributes from ISADevice
Date: Mon,  7 Mar 2022 14:43:52 +0100
Message-Id: <20220307134353.1950-13-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Now that the last users of ISADevice::isairq[] have been resolved during the
previous commits, it can be removed for good.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220301220037.76555-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/isa-bus.c     | 13 -------------
 include/hw/isa/isa.h |  2 --
 2 files changed, 15 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index af5add6a26..c64a14120b 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -87,11 +87,7 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 
 void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
 {
-    assert(dev->nirqs < ARRAY_SIZE(dev->isairq));
-    assert(isairq < ISA_NUM_IRQS);
-    dev->isairq[dev->nirqs] = isairq;
     *p = isa_get_irq(dev, isairq);
-    dev->nirqs++;
 }
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
@@ -150,14 +146,6 @@ int isa_register_portio_list(ISADevice *dev,
     return 0;
 }
 
-static void isa_device_init(Object *obj)
-{
-    ISADevice *dev = ISA_DEVICE(obj);
-
-    dev->isairq[0] = -1;
-    dev->isairq[1] = -1;
-}
-
 ISADevice *isa_new(const char *name)
 {
     return ISA_DEVICE(qdev_new(name));
@@ -244,7 +232,6 @@ static const TypeInfo isa_device_type_info = {
     .name = TYPE_ISA_DEVICE,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(ISADevice),
-    .instance_init = isa_device_init,
     .abstract = true,
     .class_size = sizeof(ISADeviceClass),
     .class_init = isa_device_class_init,
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index d4417b34b6..d80cab5b79 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -83,8 +83,6 @@ struct ISADevice {
     DeviceState parent_obj;
     /*< public >*/
 
-    int8_t isairq[2];      /* -1 = unassigned */
-    int nirqs;
     int ioport_id;
 };
 
-- 
2.34.1


