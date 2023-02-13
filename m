Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617FD693EC9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSxc-0001R0-Ah; Mon, 13 Feb 2023 02:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxX-0001DW-OQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:07 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxV-0001ll-20
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:07 -0500
Received: by mail-wr1-x434.google.com with SMTP id r2so11040065wrv.7
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrL23td/SqJ6TLHwH0jeBHZYA8cTqwvHD0D623uYOIU=;
 b=LWxWbfPUIPzqD8om+TUcUCM4IthTRA43s8m8VW+ekjLsvBhu2aDOqgJLgpb+7fVNJC
 P4b5w2aZcqDBQmkbWcGDl+NL87/RYKvxZfNLw7crODYFdGGv3WawqTFq3YWutxc6bnJ+
 CIATB2FyLCeYVfYWE4BQuS9q0AXrae+Luw2dYDMy/QvLpfKaQ+jgBGnvwJ6gmKpqbaKq
 Yg/y/AkAQiQZttCiWKRNXk7wfT2GbEzoke6PtZz70HA9A5W9hQFwdpmwMgMPQI3/FBJL
 kmOkULLnIAX+T2Qgdi+4ba8DbkCGVs+fpHEJ3GW8TKDiHNiNySv8KUAMZ1PAEDSwTy5R
 pRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XrL23td/SqJ6TLHwH0jeBHZYA8cTqwvHD0D623uYOIU=;
 b=smEtqt0dooFRBU0B3CXZ0RSPUrm/FBCTLmPlGN8yKjuaHBZG68OD34QZZumwkiG3Ug
 dWYVjm7n00a72LNCHszmc/zclD/IDQnNo5/1r3l+DjquA2CqUk78K0mv+6g8gdOr4LpB
 96tXSFWh9MFwYvxLEQbU5fg+WimJ3oFNifSAA6Mg/lv+9JI+PFvwRaoglCGo/VokMI+8
 etGscupT6ufnNoSdKG0LvJ0eha+YcCIKMpJ+CIqJcNkPK+xBQLzNginXnOT5RKyqHpUg
 Mt42YQ9Q3GK7LkaSRzOTwG6M472LC3Rbb4CCkFMtp9Io635gB1lmyBGfaI0Ha00S85in
 ZJlw==
X-Gm-Message-State: AO0yUKWzrgRtpZ82j3IKzEx+lGzuKVJjJLTdSJZ91iSeTsPkiiMfiSZd
 5DOSFo4PAkTnZ1+a8dNrpRokecITZdpQ3crM
X-Google-Smtp-Source: AK7set+2S2xGqRInh67xIdNdobiMcWHRbGlNVEP21sfLm46I4RhZaVBE3B5wORZFn9Aoq/xloGAvdA==
X-Received: by 2002:adf:d08a:0:b0:236:695b:82d4 with SMTP id
 y10-20020adfd08a000000b00236695b82d4mr21142772wrh.30.1676272144053; 
 Sun, 12 Feb 2023 23:09:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p3-20020adff203000000b002c3f6d7d5fesm9817057wro.44.2023.02.12.23.09.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 08/19] hw/net/eepro100: Introduce TYPE_EEPRO100 QOM
 abstract parent
Date: Mon, 13 Feb 2023 08:08:09 +0100
Message-Id: <20230213070820.76881-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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


