Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FD662198
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:30:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQj-00043v-II; Mon, 09 Jan 2023 04:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQg-00041g-CU
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQd-0005X7-UX
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:53 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso6100555wms.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvquKJo5kaY1zgQryRGVpaPOLLzwnxxyM3RwhB/Stuo=;
 b=qJ/L/mGOhcUGaMMHLzNnPOcFwLD8NaBXIhfwQAYAUDnykLgrt0YTjfFZUyh6ynbsMb
 KeIcdlWhlOoOIFJ6iBKzFxbVXLDujnFMjdo0kGnE6zoCqo3rgpfF7fElBogJmPJQ4Faz
 V8aAoNUQrTu9hHk33Xa2WHSjk+DJig+01NV4HFfpi7124f594YTC8iNqqAfJMt0n4KIf
 t8pnGVDB3QsQdeaVD+d4G24ZEbPJOM9YUJL2frQlDUFF6vxCQzTuxYnxmR3mFLjQcZfR
 10+9oj39m+EWla99AZONe3urrwbt+8dDH1JomydDcr1KrBsum7n3Tp28HFPZyfEithix
 bUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvquKJo5kaY1zgQryRGVpaPOLLzwnxxyM3RwhB/Stuo=;
 b=X1KdH+A2JgiBQQk605Sbwj0YN55vJymkKJFXZj56WxR3qo88RFGpPbaEUpRK9Dz+d4
 kPaX7pMl/WulE6+tF8DOhqi3Rd2MPEe7tkYO5q/EIFrSmAibfQyGuSGSWR/1GJ6NshZM
 j96iB1emyju8T3aLcchpm0dXLpu9cz55Iz08suIWO7r3Qq91ybYpVHpFsbDFLoT41xN/
 efSx/lvHHykLH9fH4GV3vF3iLSAGq/zSwcRxmzKIqt+funEQUprGKVNbdMKZYWqG+USM
 YO6gSg1bxrMkd5l0E7kCxb5qwiNXAte7n/glc/mAq3QN/CEJLSJxta5Qil1eg1Rfl7Ax
 mEaQ==
X-Gm-Message-State: AFqh2kpFumXHjODB7/3UDODvj35g212y/ZkP3SnaTAlXWv1kvvKP5MxX
 SLrAWOa7InA6EWvcNXCrU2eTlW0hZLhhFya7
X-Google-Smtp-Source: AMrXdXs0a4lyh9LpwU6LEMRaXVI1KU1xDIPnmU0NSKHUuO+24nQiwKpFELMqfnhQohlq3dCu8TTB5g==
X-Received: by 2002:a05:600c:5008:b0:3cf:6f4d:c25d with SMTP id
 n8-20020a05600c500800b003cf6f4dc25dmr45672643wmr.21.1673256410043; 
 Mon, 09 Jan 2023 01:26:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003d9f14e9085sm2167906wms.17.2023.01.09.01.26.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/9] hw/arm/musicpal: Convert TYPE_MUSICPAL_KEY from SysBus to
 QDev
Date: Mon,  9 Jan 2023 10:26:14 +0100
Message-Id: <20230109092617.80224-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Nothing in TYPE_MUSICPAL_KEY access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 13f4dbdbc3..b496ff8a22 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1068,7 +1068,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(musicpal_key_state, MUSICPAL_KEY)
 
 struct musicpal_key_state {
     /*< private >*/
-    SysBusDevice parent_obj;
+    DeviceState parent_obj;
     /*< public >*/
 
     uint32_t kbd_extended;
@@ -1187,7 +1187,7 @@ static void musicpal_key_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo musicpal_key_info = {
     .name          = TYPE_MUSICPAL_KEY,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_DEVICE,
     .instance_size = sizeof(musicpal_key_state),
     .instance_init = musicpal_key_init,
     .class_init    = musicpal_key_class_init,
@@ -1301,7 +1301,7 @@ static void musicpal_init(MachineState *machine)
     i2c = (I2CBus *)qdev_get_child_bus(i2c_dev, "i2c");
 
     lcd_dev = sysbus_create_simple(TYPE_MUSICPAL_LCD, MP_LCD_BASE, NULL);
-    key_dev = sysbus_create_simple(TYPE_MUSICPAL_KEY, -1, NULL);
+    key_dev = qdev_create_simple(TYPE_MUSICPAL_KEY, &error_fatal);
 
     /* I2C read data */
     qdev_connect_gpio_out(i2c_dev, 0,
-- 
2.38.1


