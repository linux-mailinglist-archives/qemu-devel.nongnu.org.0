Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDC74C00DD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 19:02:11 +0100 (CET)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZUI-000863-6j
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 13:02:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7j-0004Hu-6A
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:51 -0500
Received: from [2a00:1450:4864:20::52c] (port=33478
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7h-0002sL-Nl
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:50 -0500
Received: by mail-ed1-x52c.google.com with SMTP id s14so21356574edw.0
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbYju84CvG42z6Al6B5zdxO5OIvmYAHPnRzWM1yGA1k=;
 b=YoW7kJcCorEdQCp1iPYE1Ic31GloCvkqII6d6X+FlyJgFnEBz6zBvynec7gpi+Z+U4
 xvbM+3dtBx8w6/chaBf908/umrQf85bBlt98ICDtzZs7te7fcVrZTLDFwtKfySzxjUUo
 QXX+XDCIO2PTZjijd4sxvdXYXVstqo5OvIIb1rNjwb8voEcO429WKcLJyUPft3ySUcxv
 DN4hKIQTpWVH40KkOAV+Tk5obduqu3ghrVHAxs2mjcEILH7zJjIXJbqufySqokA0efaj
 klnbazxWKP5b/fqyNcRt5RvracAPCRYf0w8+xQPPSUErGsbs0+s8QUFafERSijeoyAvB
 y/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbYju84CvG42z6Al6B5zdxO5OIvmYAHPnRzWM1yGA1k=;
 b=q+1J46UhNtnAWVehjpS9/zzJ5TmnBZo0Qbyo644NrI5H7Rt4Iy7f2rftJaSVswdbI9
 UGA1F8yJC83s9PzRUHYwXF3wnCmnOJMuVhERDXzeeJc1Fm+OpAHbVnlup7v2+OV5q2Mk
 5ZHFuTLlOLfPoixnQuT22n9HIbRzzAzoQUS+VtgZDjpEz32GfSZzGozaiN2g+Iq5nbiJ
 CkLKV2oavWJz4ab7l0l8xCmCUDtvs6aYaJ9VF7GyL3n26NwSasVVllCM4eQOXJ6OncoW
 LigGMVVHvlnPXZX1j2VmSlG2Zn1GX/nj3OkAJAcVeL3QiBVnqBC1YysUU0zpT4xOqBV2
 BR3g==
X-Gm-Message-State: AOAM530C6hNWPNoWxq4pKsIVSsQyRYTegSbrCQuzaz+jAaJDdTF1QYaQ
 0aYgaWN8L4VWKS5Jo81VM7SraDicdUA=
X-Google-Smtp-Source: ABdhPJy0Q2gD9TF5eP9Ov24y9VQyqtxvLw/2Wdn6ZOnzU/F4cUuY1EKwFIAE5QQv8VTn3qdCbUpFQg==
X-Received: by 2002:a05:6402:42c6:b0:412:8cbc:8f3d with SMTP id
 i6-20020a05640242c600b004128cbc8f3dmr27986588edc.310.1645551527224; 
 Tue, 22 Feb 2022 09:38:47 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/22] hw/isa/isa-bus: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:18 +0100
Message-Id: <20220222173819.76568-22-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index c64a14120b..1e8c102177 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -92,8 +92,7 @@ void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
 {
-    qemu_irq irq;
-    isa_init_irq(isadev, &irq, isairq);
+    qemu_irq irq = isa_get_irq(isadev, isairq);
     qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
 }
 
-- 
2.35.1


