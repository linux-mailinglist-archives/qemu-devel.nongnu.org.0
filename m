Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD4A6A43BF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe9N-0006Zx-4x; Mon, 27 Feb 2023 09:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9K-0006Sy-P9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:42 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9I-0000Aj-Tq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:42 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso2263791wmo.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RTRtgDksnMT+B/aM1t2yk3AWqylUm8qIOLRO646lQk0=;
 b=O6e/HmWzPwB+SZrfQwIrCEKvLelVPNyPMANr81I1m2nytFbLckBaFJtdsAj1xM8FBV
 vfDFKwtaDApxVd4dhx5zL5VnLLIUr/o7aIvcGzVQ4IoLlyySK1soVYvhu75gesh1wMh+
 QkFOkTaFLeSy4EjnzB2p1YY5DG1QfloPYWgakUuq2ew+w87EBAgp5YtAWWNUhI447zWj
 Sapy75QkB2kUcEhaNL7pxZj/STxNsiCuy0t391G5UwAqSXZRnIRsXAadsoatEJvgBCGp
 Bj+AsbaV7Ucd0AuwP8I2d9uha2V7IvmHT67eoNXGm/C/Hjfv0ec/xiEHPgmcCdTS5Tk7
 slUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTRtgDksnMT+B/aM1t2yk3AWqylUm8qIOLRO646lQk0=;
 b=BU7lccc/vhTfaiGXIdljHZGxNuxDJ6GmZMU/FA8X4+3kkwPIq/zK/aMFCOzHU4qkK8
 wypd6Z0zMSrezyGVZZqujhU1h+ESGo1yB7m21S73qiuJA4+b9JxJxhL82ULAHrNfIu5X
 0g93QkvEzGoy8sN5Jf2oCq94NDEMkQKqkwEi1HGn3NtIpK4u4jpw9Fa631lB3osprjOC
 moVl3B3+csQpO84NmqBCQxzn7jMNalIhNEiuua14fcYfS97AGpZuxF5ngKRtLl2uFd8r
 2teHSGTjVDk/rRF8zqW+X94gGSDvPJaZHWsbb6iUjGYO9k2pQUq9R/CbU6CpOkNRLmF+
 ecwQ==
X-Gm-Message-State: AO0yUKUnE7VDFlWGQhLOmnW5J+6RHRqyOkzoob6R/qZ8vWVQ1AUKkOEo
 GwIZa1LIt/pPKTz/3onexroECkC/3+v1P48o
X-Google-Smtp-Source: AK7set8Wfbl2jUtbghDQKAh0qBHAqzCk/6uUzkYiE31yHOwNEkhN3WOu01ph9LSqNx/8U4Nc7z4n+A==
X-Received: by 2002:a05:600c:492f:b0:3e2:6ec:7fbe with SMTP id
 f47-20020a05600c492f00b003e206ec7fbemr18220269wmp.40.1677506799472; 
 Mon, 27 Feb 2023 06:06:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c359400b003daf7721bb3sm13710134wmq.12.2023.02.27.06.06.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 058/126] hw/isa: Remove empty ISADeviceClass structure
Date: Mon, 27 Feb 2023 15:01:05 +0100
Message-Id: <20230227140213.35084-49-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
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

ISADeviceClass is an empty class and just increase code
complexity. Remove it, directly embedding DeviceClass in
classes expanding TYPE_ISA_DEVICE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20230215161641.32663-19-philmd@linaro.org>
---
 hw/isa/isa-bus.c                  | 1 -
 hw/rtc/m48t59-isa.c               | 2 +-
 include/hw/isa/i8259_internal.h   | 2 +-
 include/hw/isa/isa.h              | 6 +-----
 include/hw/isa/superio.h          | 2 +-
 include/hw/timer/i8254_internal.h | 2 +-
 6 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index f155b80010..845686cb12 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -213,7 +213,6 @@ static const TypeInfo isa_device_type_info = {
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(ISADevice),
     .abstract = true,
-    .class_size = sizeof(ISADeviceClass),
     .class_init = isa_device_class_init,
 };
 
diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index e61f7ec370..5bb46f2383 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -47,7 +47,7 @@ struct M48txxISAState {
 };
 
 struct M48txxISADeviceClass {
-    ISADeviceClass parent_class;
+    DeviceClass parent_class;
     M48txxInfo info;
 };
 
diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index d272d879fb..155b098452 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -35,7 +35,7 @@
 OBJECT_DECLARE_TYPE(PICCommonState, PICCommonClass, PIC_COMMON)
 
 struct PICCommonClass {
-    ISADeviceClass parent_class;
+    DeviceClass parent_class;
 
     void (*pre_save)(PICCommonState *s);
     void (*post_load)(PICCommonState *s);
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 25acd5c34c..7195bfb96c 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -11,7 +11,7 @@
 #define ISA_NUM_IRQS 16
 
 #define TYPE_ISA_DEVICE "isa-device"
-OBJECT_DECLARE_TYPE(ISADevice, ISADeviceClass, ISA_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(ISADevice, ISA_DEVICE)
 
 #define TYPE_ISA_BUS "ISA"
 OBJECT_DECLARE_SIMPLE_TYPE(ISABus, ISA_BUS)
@@ -48,10 +48,6 @@ struct IsaDmaClass {
                              void *opaque);
 };
 
-struct ISADeviceClass {
-    DeviceClass parent_class;
-};
-
 struct ISABus {
     /*< private >*/
     BusState parent_obj;
diff --git a/include/hw/isa/superio.h b/include/hw/isa/superio.h
index b9f5c19155..0dc45104d4 100644
--- a/include/hw/isa/superio.h
+++ b/include/hw/isa/superio.h
@@ -44,7 +44,7 @@ typedef struct ISASuperIOFuncs {
 
 struct ISASuperIOClass {
     /*< private >*/
-    ISADeviceClass parent_class;
+    DeviceClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
 
diff --git a/include/hw/timer/i8254_internal.h b/include/hw/timer/i8254_internal.h
index a9a600d941..1761deb4cf 100644
--- a/include/hw/timer/i8254_internal.h
+++ b/include/hw/timer/i8254_internal.h
@@ -58,7 +58,7 @@ struct PITCommonState {
 };
 
 struct PITCommonClass {
-    ISADeviceClass parent_class;
+    DeviceClass parent_class;
 
     void (*set_channel_gate)(PITCommonState *s, PITChannelState *sc, int val);
     void (*get_channel_info)(PITCommonState *s, PITChannelState *sc,
-- 
2.38.1


