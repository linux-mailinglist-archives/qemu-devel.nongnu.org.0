Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105986A42DF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:35:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdeZ-0005F5-1D; Mon, 27 Feb 2023 08:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWddv-0004zb-IB; Mon, 27 Feb 2023 08:34:24 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWddq-0007fA-Ux; Mon, 27 Feb 2023 08:34:13 -0500
Received: by mail-ed1-x530.google.com with SMTP id o12so25781868edb.9;
 Mon, 27 Feb 2023 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyrcxGf0uGzTYvYyLp610kYB0kT0EhYYjluHCkpVk6Q=;
 b=MFdWYi5lLyOrdY3GBkz1IEQ6g7YjXGAjkoVZCHAjNLNTWbEhRITpsV6rW/OwXr8FsN
 AZMKov8q7BzNqn01cPR/6bcT9aKmKKp6unX/HQMbuIjX646bHvkGpc24m3vpWe77KsyR
 z2Q22o0CrhO7yFGof9VEejpcCiA4GojWzuozsQ3V8W8dmdzlW6UEmnhTnJFHnUZHaWeH
 gXlcDSWOc8/0K7oC5lFXf9IQT2dv02T0jJyNZMR3mn1PxY8TvP9exgwOVs+46XUefstQ
 l9k3WaslDvRdOZwCpKcsEeDx0hnIuftl95/rzZqMmen4ZplBMp94Zbn3j8sDZKay0Ac0
 qrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyrcxGf0uGzTYvYyLp610kYB0kT0EhYYjluHCkpVk6Q=;
 b=YoDbUylhaqcbLRQKXf29ebXVzABx13zUpnk7JGc+BNZeQmRfiUxfut33m4iMqBbAsY
 p2UMLlfrX1b6DZjYneB7GYK2348wu5D0Znfo88gpWmIZQINCeTayfS2GHsB0VIfqOi+D
 8oFK7WGmirk3Qb3Wv1du48T7bcPcddfwp54+NARejCKd1JG9GmgQGkNCyRvzn9PU6ytB
 02oco6GfBUk5J98mZ2zitQpKM6N3hM96mGeVGkujCW6MrUEh9zkXM1wBXgbIbgyd3wii
 Vspb5qGVh0YzKSavNtozowA4v9hTVStrtGp4/XvmMqxl1MJ4GhWuOAVXNeSUeX+VbZ4N
 nFgw==
X-Gm-Message-State: AO0yUKX8oEfiO7gjPWo6PIuk68wSTY3KAp3aocGZ7YsaGPeP8icKYTu/
 HGM0H1Yslnpd+yUj+gfBsuNoqZLSpu8=
X-Google-Smtp-Source: AK7set9H2BVUhZ1t/q1mkne4/gh3RvZTi1Sx5mqpVmqHBh+NOwgAz00gW0/EmQEJovxcZcQalirNkQ==
X-Received: by 2002:a17:906:264d:b0:8a9:e330:3a23 with SMTP id
 i13-20020a170906264d00b008a9e3303a23mr34404333ejc.26.1677504840000; 
 Mon, 27 Feb 2023 05:34:00 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a1709068a5000b008b69aa62efcsm3253603ejc.62.2023.02.27.05.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 05:33:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Huacai Chen <chenhuacai@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 3/7] hw/display/sm501: Add debug property to control pixman
 usage
Date: Mon, 27 Feb 2023 14:33:21 +0100
Message-Id: <20230227133325.22023-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227133325.22023-1-shentey@gmail.com>
References: <20230227133325.22023-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Add a property to allow disabling pixman and always use the fallbacks
for different operations which is useful for testing different drawing
methods or debugging pixman related issues.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <dfd40c3c45fa606e64c22d9010d43d3cf8bd32f8.1677445307.git.balaton@eik.bme.hu>
---
 hw/display/sm501.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 23c4418e19..f2f7f26751 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -464,6 +464,7 @@ typedef struct SM501State {
     uint32_t last_width;
     uint32_t last_height;
     bool do_full_update; /* perform a full update next time */
+    uint8_t use_pixman;
     I2CBus *i2c_bus;
 
     /* mmio registers */
@@ -826,7 +827,7 @@ static void sm501_2d_operation(SM501State *s)
                 de = db + (width + (height - 1) * dst_pitch) * bypp;
                 overlap = (db < se && sb < de);
             }
-            if (overlap) {
+            if (overlap && (s->use_pixman & BIT(2))) {
                 /* pixman can't do reverse blit: copy via temporary */
                 int tmp_stride = DIV_ROUND_UP(width * bypp, sizeof(uint32_t));
                 uint32_t *tmp = tmp_buf;
@@ -851,13 +852,15 @@ static void sm501_2d_operation(SM501State *s)
                 if (tmp != tmp_buf) {
                     g_free(tmp);
                 }
-            } else {
+            } else if (!overlap && (s->use_pixman & BIT(1))) {
                 fallback = !pixman_blt((uint32_t *)&s->local_mem[src_base],
                                        (uint32_t *)&s->local_mem[dst_base],
                                        src_pitch * bypp / sizeof(uint32_t),
                                        dst_pitch * bypp / sizeof(uint32_t),
                                        8 * bypp, 8 * bypp, src_x, src_y,
                                        dst_x, dst_y, width, height);
+            } else {
+                fallback = true;
             }
             if (fallback) {
                 uint8_t *sp = s->local_mem + src_base;
@@ -890,7 +893,7 @@ static void sm501_2d_operation(SM501State *s)
             color = cpu_to_le16(color);
         }
 
-        if ((width == 1 && height == 1) ||
+        if (!(s->use_pixman & BIT(0)) || (width == 1 && height == 1) ||
             !pixman_fill((uint32_t *)&s->local_mem[dst_base],
                          dst_pitch * bypp / sizeof(uint32_t), 8 * bypp,
                          dst_x, dst_y, width, height, color)) {
@@ -2039,6 +2042,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 static Property sm501_sysbus_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
     DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
+    DEFINE_PROP_UINT8("x-pixman", SM501SysBusState, state.use_pixman, 7),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2122,6 +2126,7 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
 
 static Property sm501_pci_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
+    DEFINE_PROP_UINT8("x-pixman", SM501PCIState, state.use_pixman, 7),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2162,11 +2167,18 @@ static void sm501_pci_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_sm501_pci;
 }
 
+static void sm501_pci_init(Object *o)
+{
+    object_property_set_description(o, "x-pixman", "Use pixman for: "
+                                    "1: fill, 2: blit, 4: overlap blit");
+}
+
 static const TypeInfo sm501_pci_info = {
     .name          = TYPE_PCI_SM501,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(SM501PCIState),
     .class_init    = sm501_pci_class_init,
+    .instance_init = sm501_pci_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
-- 
2.39.2


