Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C466219F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:32:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQn-00045H-U0; Mon, 09 Jan 2023 04:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQk-00044f-Hf
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:58 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQi-0005YD-Pp
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id ay40so5791106wmb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EouopIgVYZtvVCTsoAMyIu+cUbTHPHVNWqQu8tPr5Qw=;
 b=kOMIPKjIi3FNcnslzUZQhtZfSYLSsI12tzIw9Che8aYFnOdoYvQ0uFpnUEXdXAGPhO
 OrldrqSx9hBl3N5+JeTXBE4FZnxBXogaBE2wb6JZSYH+hEieZMERD51vh+ta6rIIClIv
 YQKQ3mkTgcQUcHpYONhG8QColJGLoGV5KQ90V1wEw9kmCMiWRp3ytPE9P8NCJk7e5CF1
 3xsdIBy+cbpGy+meUODID/pQ7QTefnzyx5GkP1EBampShj2klE8+2f7tXCjaoxv4tTPb
 D/Sm5xFVRKDGPwyJlnWDrdG8JNo+41dinCTfwRxvq693mUyxDDG3lSY/ycdPFRLG7fkT
 f/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EouopIgVYZtvVCTsoAMyIu+cUbTHPHVNWqQu8tPr5Qw=;
 b=5QDiXzlgDrMrUN2LKe6Z0VD4rGrK25+6zJhVlmUZv3uW3B2J15egh559/lGYglRxaT
 c5ErFPV3qjgMHS6lL4rSuyDfC+slKxE7a1mTrp+Ha7DZTQ5eiFIxpukTo3zjaWVnL2HF
 +9JogRXW2l0eNSZNuqDV9xjALiebwgPHCR2oSk8ZHWwOUuS80j+XH761VIog7zypHQ2+
 4ZPbsGvzyI7aW3YJZhQVzPKt7aFWV7AMQpB8kECqhu0AVUCe0ut1LGPWIW0vNCp5pb3D
 dQTUJx8TSmcHXgPD2uPyMDF0Iil4dok2WPkoRoC0gNf4Vc/9XmRwo7n7XVkLR9khOUnp
 PUaQ==
X-Gm-Message-State: AFqh2kpR94SaEUARhY078hqU5BZJ7/S29Gxiutf7OyoiW/DK4JWRQwZ3
 ZC/xEmQ/m8MDCPFgD2lzm3OTSAWdkSyr2gBl
X-Google-Smtp-Source: AMrXdXtKEF+9vOONF1gtkycqc9oaPTR/4Cqfd1t0HUshgy+1U5iFHNeka55qVXjq8g+CTsTjeL2qjg==
X-Received: by 2002:a05:600c:3ba4:b0:3d9:f135:677 with SMTP id
 n36-20020a05600c3ba400b003d9f1350677mr1455755wms.13.1673256415151; 
 Mon, 09 Jan 2023 01:26:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm16662570wmq.20.2023.01.09.01.26.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:54 -0800 (PST)
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
Subject: [PATCH 7/9] hw/arm/spitz: Convert TYPE_SPITZ_KEYBOARD from SysBus to
 QDev
Date: Mon,  9 Jan 2023 10:26:15 +0100
Message-Id: <20230109092617.80224-8-philmd@linaro.org>
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

Nothing in TYPE_SPITZ_KEYBOARD access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/spitz.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 5aab0b8565..6605d658ed 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -260,8 +260,10 @@ static const int spitz_gpiomap[5] = {
 OBJECT_DECLARE_SIMPLE_TYPE(SpitzKeyboardState, SPITZ_KEYBOARD)
 
 struct SpitzKeyboardState {
-    SysBusDevice parent_obj;
+    /*< private >*/
+    DeviceState parent_obj;
 
+    /*< public >*/
     qemu_irq sense[SPITZ_KEY_SENSE_NUM];
     qemu_irq gpiomap[5];
     int keymap[0x80];
@@ -514,7 +516,7 @@ static void spitz_keyboard_register(PXA2xxState *cpu)
     DeviceState *dev;
     SpitzKeyboardState *s;
 
-    dev = sysbus_create_simple(TYPE_SPITZ_KEYBOARD, -1, NULL);
+    dev = qdev_create_simple(TYPE_SPITZ_KEYBOARD, &error_fatal);
     s = SPITZ_KEYBOARD(dev);
 
     for (i = 0; i < SPITZ_KEY_SENSE_NUM; i ++)
@@ -1193,7 +1195,7 @@ static void spitz_keyboard_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo spitz_keyboard_info = {
     .name          = TYPE_SPITZ_KEYBOARD,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_DEVICE,
     .instance_size = sizeof(SpitzKeyboardState),
     .instance_init = spitz_keyboard_init,
     .class_init    = spitz_keyboard_class_init,
-- 
2.38.1


