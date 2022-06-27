Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47FD55B834
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:31:40 +0200 (CEST)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jDf-0004CU-EC
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izU-0003hx-68; Mon, 27 Jun 2022 03:17:01 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izQ-0003uW-DY; Mon, 27 Jun 2022 03:16:59 -0400
Received: by mail-ej1-x633.google.com with SMTP id h23so17091560ejj.12;
 Mon, 27 Jun 2022 00:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gF4N2f/+uctQMoQqFK3rzPl6NGxOr0FFEKFIXo82HYE=;
 b=Qx9xsRNy6kp75wskT6zJ3EdKy9XlGUWJvaoC/YizSVrxIXFXq4R9wdS3lGcpX9rzRK
 6WE5Kb6T+Poa2Pk1pOM+60PkzTnESMHbKpqO5Y2DSCEtzeQjPSQQvdKzGsV9cp0XQOul
 rfanBjX9N5MqjzE3DzgBUGe3FF32U6gHWOQfCKCIA9cHNKL4/rWNCpfc/pCWQD+lb1xS
 Bkj+ZojPGHlW7TcYh7uIMbv4J6C78pMDa87Rv2/SUTCE483+IeCBGBIokEMWir/I3Lba
 kl8rSdiEFgghNng1XDfEtgKwWeT/Ni0wscahy/Mk8d9w0zB8L9mbCTlnLMdYJfFopK9K
 tByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gF4N2f/+uctQMoQqFK3rzPl6NGxOr0FFEKFIXo82HYE=;
 b=hWE+TgwOLVWAWCEnBqYV5RPRgRumWVbloalt1khuWM4DDlx4I42PnW3oa4Vba2C2/n
 a7meOXu9W37UL7DwASot10DO70JMjYghVfqQrdWakMocnHuG8oNcSEDa1uURMRB1bM+q
 NRvjdexRo7iVYCOowyWcSn5m3vokJ1zOYFx1Qnwcgv6kaXc2w+z6WrmICUgawZFLaU05
 FEjPX5wVar2VjlaTAsxfIQMLl7Wo8N0RyaHNUKtOTBK/2MwHP6AEqdj86XB+wuky86Wm
 0lDzoUjY1aeTgsCvpsHIFVuXeZ74Qj4t7fYFSi5o1EmRKl0PqK+ERVjiulZBBMls6lOj
 bctA==
X-Gm-Message-State: AJIora+SQTrVv+Y56D188nNzDBsjfg0bF7wG6w4V2Ia9ZVXy05jzD2mo
 b1uayTTF/kXZ32dxRkyTaAtaBQfOg3krLg==
X-Google-Smtp-Source: AGRyM1tq4Kr5bWUqapTvYEVGyxGtVoGqWlcr3Aogn/iUZifjFk3+Y5uM1QXuRbEApbLVRPftVcLh0g==
X-Received: by 2002:a17:906:830c:b0:726:a68b:d1bc with SMTP id
 j12-20020a170906830c00b00726a68bd1bcmr3670137ejx.305.1656314213921; 
 Mon, 27 Jun 2022 00:16:53 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:53 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, balaton@eik.bme.hu,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 10/10] hw/isa/isa-bus: Resolve isabus global
Date: Mon, 27 Jun 2022 09:16:11 +0200
Message-Id: <20220627071611.8793-11-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that only isa_bus_new() accesses the isabus global it can be removed
assuming that all call sites take care of not passing the same address
spaces twice to different isa_bus_new() invocations.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 5518db93cd..783506685d 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -26,8 +26,6 @@
 #include "hw/isa/isa.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-static ISABus *isabus;
-
 static char *isabus_get_fw_dev_path(DeviceState *dev);
 
 static void isa_bus_class_init(ObjectClass *klass, void *data)
@@ -53,10 +51,8 @@ static const TypeInfo isa_bus_info = {
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
                     MemoryRegion *address_space_io, Error **errp)
 {
-    if (isabus) {
-        error_setg(errp, "Can't create a second ISA bus");
-        return NULL;
-    }
+    ISABus *isabus;
+
     if (!dev) {
         dev = qdev_new("isabus-bridge");
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-- 
2.36.1


