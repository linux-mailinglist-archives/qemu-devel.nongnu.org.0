Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DD6621D8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:42:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQi-00042j-40; Mon, 09 Jan 2023 04:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQa-0003yl-TF
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQY-0005ST-0h
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id az7so7490393wrb.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tSzFCO6NQ+8ffmrsTTKi/Gp5LFSgKmeeId0+ZsrnMi8=;
 b=NA4pyZmn8lwtpKLMWJt/dLIt57NJE11fKCEwfPFiR84zmGfxBXs5eBwzzx//MEZS8h
 2tq8QUeTwZ8F1mK+osyn6jFfbQRTdWg+6B4fSaUQMaYaw0GPJ7EmBpakBdgIZbYnN9Od
 waX/Swm9YTTSVs6pBNRUZmKt5LyIALAWSn8ntfC/uJhVQblwxK2bEQ2eYrP4/PTlivkm
 0aci5qiRF4NBa9V33voy71WEFS36+0CO3gXEjwU+YVWVuDPryA2qwf5G+HhiJOIQQCpG
 oi7ADqlnHtfNU4pLqts5KHwmUyQ75lfquo1hqrj5cmO+Vtz56bAHIBPzojhVI5ibFYtH
 +YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSzFCO6NQ+8ffmrsTTKi/Gp5LFSgKmeeId0+ZsrnMi8=;
 b=fAM2u2HbQcv0qcArRPLDo+Sl6n4MKozuPwbmO+6yqr+kWBfEmb6xEouGx6jclrAiJe
 7h29Mdwcjp0D9nAN9fwWBzjiJBwhnEeCbLs4XNSIPWu7X4/Mf4/94l/1tQGUFraO9P/M
 0hg+4gm5h1CcqXiIwBktZv++iA/WAMvY6RX97j4T1VjaS/iJfZ6n2SwGaT8ZBY6U/Biy
 sEeOa9VHQGV9Cd/Pj40cYJbR4O77CXggdoXYdMJcVj1WUAspkJhDEvnbhy/hSOk9YId6
 mrgoq5oYcOdoKs3suIUm2l80EjHRtd9O1nPm2E1gHyktv54TPh9sE+WvEaiZUUYBPCYf
 T3QA==
X-Gm-Message-State: AFqh2kr2QGfHBHGM5p8DDh5i9No18YJjrVVgS1JzU39OQtU4SmleDR4P
 FbdG+x3l/90kZW87NiGNtZjZsAYWpjtuE+6I
X-Google-Smtp-Source: AMrXdXtJyUGAWC9FWg+/5wMd7H0+k9wcTeCJjKjE+L/eZZJ7Nnxe/U8pzhkmRWVB91QpNrbOS8MtXQ==
X-Received: by 2002:adf:e80e:0:b0:242:368:7665 with SMTP id
 o14-20020adfe80e000000b0024203687665mr40647874wrm.60.1673256405038; 
 Mon, 09 Jan 2023 01:26:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm8092385wrb.107.2023.01.09.01.26.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:44 -0800 (PST)
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
Subject: [PATCH 5/9] hw/arm/palm: Convert TYPE_PALM_MISC_GPIO from SysBus to
 QDev
Date: Mon,  9 Jan 2023 10:26:13 +0100
Message-Id: <20230109092617.80224-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Drop the pointless PalmMiscGPIOState structure definition,
since it defaults to the size of the parent's type.

Nothing in TYPE_PALM_MISC_GPIO access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/palm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 68e11dd1ec..912164e93f 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -134,10 +134,6 @@ static void palmte_button_event(void *opaque, int keycode)
 #define TYPE_PALM_MISC_GPIO "palm-misc-gpio"
 OBJECT_DECLARE_SIMPLE_TYPE(PalmMiscGPIOState, PALM_MISC_GPIO)
 
-struct PalmMiscGPIOState {
-    SysBusDevice parent_obj;
-};
-
 static void palmte_onoff_gpios(void *opaque, int line, int level)
 {
     switch (line) {
@@ -174,8 +170,7 @@ static void palm_misc_gpio_init(Object *obj)
 
 static const TypeInfo palm_misc_gpio_info = {
     .name = TYPE_PALM_MISC_GPIO,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(PalmMiscGPIOState),
+    .parent = TYPE_DEVICE,
     .instance_init = palm_misc_gpio_init,
     /*
      * No class init required: device has no internal state so does not
@@ -187,7 +182,7 @@ static void palmte_gpio_setup(struct omap_mpu_state_s *cpu)
 {
     DeviceState *misc_gpio;
 
-    misc_gpio = sysbus_create_simple(TYPE_PALM_MISC_GPIO, -1, NULL);
+    misc_gpio = qdev_create_simple(TYPE_PALM_MISC_GPIO, &error_fatal);
 
     omap_mmc_handlers(cpu->mmc,
                     qdev_get_gpio_in(cpu->gpio, PALMTE_MMC_WP_GPIO),
-- 
2.38.1


