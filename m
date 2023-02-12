Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20055693AA8
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLD4-0006Gc-HD; Sun, 12 Feb 2023 17:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLD1-00067V-IE
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:35 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCy-00043x-JK
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so10070099wma.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrL23td/SqJ6TLHwH0jeBHZYA8cTqwvHD0D623uYOIU=;
 b=MNgJspn57gMkvwsch+RFDPlSuN/JfbQ/fdnXWXUbOuptJdsT9VswvTqLOFlRV+rr1L
 woNcXV9rvE2RZOl8bPdMAsMXRVF0+SqFK49IzS7wKRNNHfw15cxspRH7GpewLxAtjXir
 tJK8xRu63cwKJdsO1WjDpHUVY4I1ApVA9vS31B4Gu/3jw4GQkl1mbzHMgwLcmqNheMqj
 uF2XPDiDNwcd7TK0QEsrB5ZvOdlkOhwEKB45Sb6gUYATBeO6w6VkK3gMv4qF3VAA8KXP
 7RfPLARRj+HFWfW70+sIa715wY711/tTmmbfOQrJrm9I1AgaqxxfDPcqc21VTTaEOcvp
 oqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XrL23td/SqJ6TLHwH0jeBHZYA8cTqwvHD0D623uYOIU=;
 b=s+MUgGSZvN9t8fPWGwDBO7XNLEq6RtHFhs0uTk9BN9U+p5Ff+TeLROSwK9HyBhTgXX
 7nQH1ANYIKgNBQhrhTTAf3qmDLXLhCm7V87V0BDYn3O+FN1A7Aov2ZpIH5JpjWpPpEFH
 pnw61LmbD0CWb3R1rbvZhmp5Vn6GnbUshMEPiDmIcK5nhojbBpIpm2yyYL0t7p33sY+w
 iMx42t5MasrdK6z7Y0Mk5OO5MWWmhEP4rOiyEgnCsRkqcXNcL8RZY6Yths5fIulb4PcQ
 FGdIZgxLAObkhr2TUBeF+nVrWFwYO6vr9mR1kLL0LsI/ot97DsTmNbH/RKToK9gkprKg
 viUg==
X-Gm-Message-State: AO0yUKXw89ezQrLTzmU9M/V8dp1G7m+1iCKDK1r66V4PmziQN9C846/M
 GF5qdmkwupgGXeO28y1ZiYnJaUhyNJ0pmYgr
X-Google-Smtp-Source: AK7set+c/XYq3NIOdhdkYduN9CxUkYhxMmQ7712agZfVzn0/VF9VTkKTd9ZfgqbfSvCLkLeKVV5/ew==
X-Received: by 2002:a05:600c:4b28:b0:3df:eecc:de2b with SMTP id
 i40-20020a05600c4b2800b003dfeeccde2bmr21474402wmp.11.1676242351109; 
 Sun, 12 Feb 2023 14:52:31 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c129-20020a1c3587000000b003dc1a525f22sm12635748wma.25.2023.02.12.14.52.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 08/19] hw/net/eepro100: Introduce TYPE_EEPRO100 QOM abstract
 parent
Date: Sun, 12 Feb 2023 23:51:33 +0100
Message-Id: <20230212225144.58660-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Have all the EEPRO100-based devices share a common (abstract)
QOM parent.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/eepro100.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index dc07984ae9..dac42ba17b 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -235,8 +235,14 @@ typedef enum {
     ru_ready = 4
 } ru_state_t;
 
-typedef struct {
+#define TYPE_EEPRO100 "eepro100"
+OBJECT_DECLARE_SIMPLE_TYPE(EEPRO100State, EEPRO100)
+
+struct EEPRO100State {
+    /*< private >*/
     PCIDevice dev;
+    /*< public >*/
+
     /* Hash register (multicast mask array, multiple individual addresses). */
     uint8_t mult[8];
     MemoryRegion mmio_bar;
@@ -279,7 +285,7 @@ typedef struct {
     /* Quasi static device properties (no need to save them). */
     uint16_t stats_size;
     bool has_extended_tcb_support;
-} EEPRO100State;
+};
 
 /* Word indices in EEPROM. */
 typedef enum {
@@ -2082,21 +2088,27 @@ static void eepro100_class_init(ObjectClass *klass, void *data)
     k->subsystem_id = info->subsystem_id;
 }
 
+static const TypeInfo eepro100_info = {
+    .name          = TYPE_EEPRO100,
+    .parent        = TYPE_PCI_DEVICE,
+    .class_init    = eepro100_class_init,
+    .abstract      = true,
+    .instance_size = sizeof(EEPRO100State),
+    .instance_init = eepro100_instance_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
 static void eepro100_register_types(void)
 {
-    size_t i;
-    for (i = 0; i < ARRAY_SIZE(e100_devices); i++) {
-        TypeInfo type_info = {};
-        E100PCIDeviceInfo *info = &e100_devices[i];
+    type_register_static(&eepro100_info);
 
-        type_info.name = info->name;
-        type_info.parent = TYPE_PCI_DEVICE;
-        type_info.class_init = eepro100_class_init;
-        type_info.instance_size = sizeof(EEPRO100State);
-        type_info.instance_init = eepro100_instance_init;
-        type_info.interfaces = (InterfaceInfo[]) {
-            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-            { },
+    for (size_t i = 0; i < ARRAY_SIZE(e100_devices); i++) {
+        TypeInfo type_info = {
+            .name   = e100_devices[i].name,
+            .parent = TYPE_EEPRO100,
         };
 
         type_register(&type_info);
-- 
2.38.1


