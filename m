Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518936AFAB3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:48:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh2g-0002HL-UV; Tue, 07 Mar 2023 18:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2c-00025L-RM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:23 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2a-0002lv-HJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:22 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h11so13782060wrm.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xvj99jsqKpWqw2VGx7NNL/c4aCRXSRyUMEP0I5BD120=;
 b=tk5tpBGXCQOJEbWnjDZLm3IYxOrBV0aglKCQriBhh19w/RZSMBaRTQA93vUB7GG4f+
 YJc9OIpmhDhRO0F6Nz7BxUZ096rqgz7Y4HM9BNjy+j3TbcNetgquNoNrk8rgj6NCGffI
 cczyHeFQgrIKqxhRy5F3PiKgwGv5fX7yMaA9l+qIby1TozuqM/TW8fNc/JP2aUO/mxzF
 St4pdTKW2zCzpxnsPtc2FEEMMXoWtGViEmd/PQpZhX/9Q27A+izXmf+mBssh2ENrgmxd
 EHc+JO94oqxZIKHIfOPumHBbyoB+9uYWY93ZXmxdeInbdvqoLD0n1tIQViF6tUkaSrki
 VVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xvj99jsqKpWqw2VGx7NNL/c4aCRXSRyUMEP0I5BD120=;
 b=LsHVqTVVQSgGHZCJsZfLehekUhCH9V5Q8uQ4d7z+rhEIVrCEJEiM7F0FujoTLqZfKV
 xRf/WdyKvCvCcczPn2W6Y0R1x6V2Q9YtfE4UaFh14eb5IQ9hOwMNMjFtDag1LRUKs/xe
 J1rrsdqpsKhd0nq28EYSHhsNkMDD8e7fP8UzV8tVPQPf/Jq/x43nXCTnCfI5tN8qxpbL
 4dlJtS4CD2GUKFaZ4HkYPpQoknha2gv0TrQz84+gg2e8Oep0ZkUpBG2p1eHnquXWoeDF
 hPxwjX1LO4ncY7BUq04jWeIOyGtGkSjQcAAfwfgWmAMpMGZK3vugD+Y1Ze//KBfKDfvc
 FT0A==
X-Gm-Message-State: AO0yUKUeDTwzFrAbkoN0YLjsBRixRb/eQl3gXWPCwk+7pxoHSph2N7II
 rqYPRi2E4W3GjKcKTYmPvbMVxnqkbg+sOpkHyEA=
X-Google-Smtp-Source: AK7set/2rPmjEDnm1Oqiu1p5hSqKSRltc3dqeWt5fRSlveFGOsRfqP4UsntKlxkJ5t+yX+GVB38Ibw==
X-Received: by 2002:adf:ea47:0:b0:2cb:4df5:932d with SMTP id
 j7-20020adfea47000000b002cb4df5932dmr9905820wrn.22.1678232898702; 
 Tue, 07 Mar 2023 15:48:18 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 j18-20020a5d6052000000b002c53f6c7599sm13407673wrt.29.2023.03.07.15.48.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:48:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Rene Engel <ReneEngel80@emailn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 11/20] hw/display/sm501: Add debug property to control pixman
 usage
Date: Wed,  8 Mar 2023 00:47:02 +0100
Message-Id: <20230307234711.55375-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Add a property to allow disabling pixman and always use the fallbacks
for different operations which is useful for testing different drawing
methods or debugging pixman related issues.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Message-Id: <61768ffaefa71b65a657d1365823bd43c7ee9354.1678188711.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/sm501.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 17835159fc..dbabbc4339 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -465,6 +465,7 @@ typedef struct SM501State {
     uint32_t last_width;
     uint32_t last_height;
     bool do_full_update; /* perform a full update next time */
+    uint8_t use_pixman;
     I2CBus *i2c_bus;
 
     /* mmio registers */
@@ -827,7 +828,7 @@ static void sm501_2d_operation(SM501State *s)
                 de = db + (width + (height - 1) * dst_pitch) * bypp;
                 overlap = (db < se && sb < de);
             }
-            if (overlap) {
+            if (overlap && (s->use_pixman & BIT(2))) {
                 /* pixman can't do reverse blit: copy via temporary */
                 int tmp_stride = DIV_ROUND_UP(width * bypp, sizeof(uint32_t));
                 uint32_t *tmp = tmp_buf;
@@ -852,13 +853,15 @@ static void sm501_2d_operation(SM501State *s)
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
@@ -891,7 +894,7 @@ static void sm501_2d_operation(SM501State *s)
             color = cpu_to_le16(color);
         }
 
-        if ((width == 1 && height == 1) ||
+        if (!(s->use_pixman & BIT(0)) || (width == 1 && height == 1) ||
             !pixman_fill((uint32_t *)&s->local_mem[dst_base],
                          dst_pitch * bypp / sizeof(uint32_t), 8 * bypp,
                          dst_x, dst_y, width, height, color)) {
@@ -2035,6 +2038,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 
 static Property sm501_sysbus_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
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
2.38.1


