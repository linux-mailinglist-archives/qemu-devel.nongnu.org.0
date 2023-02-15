Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17A6980BC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:20:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKUj-0001ui-Qy; Wed, 15 Feb 2023 11:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKUI-0000ha-Te
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:18:39 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKUF-0008Mn-5r
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:18:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id h16so19693751wrz.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LD5rkStWhPsurn1HFD1lkjNNWwxHwIUi8eBD9zvn0TM=;
 b=XSChZ2nMwIzsB5p0YpRdaMZsowG2sBThm/BC3chOHJkyrE4vMqA84gjrQFlr86F/NF
 zW7IfukolAc6XzUH/UW1XsWEGgNDSVTtKBcn3MdIiusnPvmHmvot8rNs52uuqaRMMGQt
 meZxR/QvJEmdeZSD98kus/EO38Jb/T1uDSajgQQReof2S9NkDuwP4TkUElmC1altLJQK
 r8XwtByVio/KBwPlvjacxkQGKf0tNxSm7aougdvHDYc+c/Vzoiq6iEhqYH/gGknxMHTh
 BK716bKLBBkk89Xhg+q1fbT6/mVTsGfzFUDxuhvB7uoffYGCwi1Bply1EFzymO5H6Keb
 OY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LD5rkStWhPsurn1HFD1lkjNNWwxHwIUi8eBD9zvn0TM=;
 b=Yx7Mn42El4iztJey/UrycHARamZtbfCgo2XTSZgiL/gpaErlESM184TuZPyJ4jaekQ
 SpnHQuboza4uO4YlVRVRs1bxh7LXkbTc1QjdYd2WGgVYDziYDhvPvu58o3cQEJqSV1ZL
 qdPSRJKBrqgESHThS5qm5N+Hp4Qb17bFn6y0rUizgG7rQtjgPxcloY7j9llvdOPEzfkE
 dx1+C5FyMuEcm0eOPDZQCtJ5dfasRDd3WdD28c8fAujqesvk3kvNuO+RHjF7oHmfJX/X
 pKKSg2ndnT5aI3FKPkLXG6vJIr3UY4JDN6HcCQcQEcSOFJO3q0U5vR+RAemwiOF8jcFl
 0kqg==
X-Gm-Message-State: AO0yUKUwOPQSg0oHesq0ALCFSq8a7NZ5w9FsVcZNwR051M+FhKTA8yY4
 elTMQGmd/zezLTDUq5d6X5XaTkmjlwwg1vAz
X-Google-Smtp-Source: AK7set8ZPY79P9dscey1eCHNF6ptWLOae0Emb8s5D04SaThPpRs5iWFpfZWwOagko2YeGPvZY4VEzw==
X-Received: by 2002:adf:f5c2:0:b0:2c5:4c6f:27cc with SMTP id
 k2-20020adff5c2000000b002c54c6f27ccmr2035776wrp.44.1676477902107; 
 Wed, 15 Feb 2023 08:18:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600011c400b002c556f36116sm8783409wrx.66.2023.02.15.08.18.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:18:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 18/18] hw/isa: Remove empty ISADeviceClass structure
Date: Wed, 15 Feb 2023 17:16:41 +0100
Message-Id: <20230215161641.32663-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

ISADeviceClass is an empty class and just increase code
complexity. Remove it, directly embedding DeviceClass in
classes expanding TYPE_ISA_DEVICE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c                  | 1 -
 hw/rtc/m48t59-isa.c               | 2 +-
 include/hw/isa/i8259_internal.h   | 2 +-
 include/hw/isa/isa.h              | 6 +-----
 include/hw/isa/superio.h          | 2 +-
 include/hw/timer/i8254_internal.h | 2 +-
 6 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index f44817b88b..1276f31826 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -221,7 +221,6 @@ static const TypeInfo isa_device_type_info = {
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
index c9954a7d99..411d12330b 100644
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


