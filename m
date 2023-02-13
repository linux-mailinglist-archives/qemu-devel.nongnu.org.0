Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAA694263
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:11:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVnp-0005cW-Uw; Mon, 13 Feb 2023 05:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnn-0005af-5g
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:16 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnk-0003Uc-Ru
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so8566769wms.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZL+Bp8uavCHtbQrBbmxFnoeXirx45v+Dj9xYJzTDeg=;
 b=mexQoVgwoSQuueyuYWZ4fjYZWsc91Qg1sjG5uSvGkq3+KUR12HiwOvKduID2Oe8lA7
 okDW24Ysa2a06DouOdKw23Xmwi6LG8/LeYZKnjb/P0dkQjIQwyMCRt8UD3A8I6OCV9NB
 XUgkML/Qra3KpeuHfxHNxFW5MVI2s99hHVPWWDofyAVkxZuc5t28HykSPEIkSCeBiROQ
 6ni6sW3D/amcNW49Fdzo8T1jiX1EdgECfXPbrNRp85jDtR42qE6p5Clm+9jWY9nUUsBq
 vGCMZOPRHe1Jr9pq3GiyHE9I63+zu3bezCeBTVgK+0N0bzTO19vYzBGq0jdQNgUyWRCM
 5QQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZL+Bp8uavCHtbQrBbmxFnoeXirx45v+Dj9xYJzTDeg=;
 b=KII/UyX9/ceI6mOCsEzjVrtDxLnYMsjMTdRsUPgCyw9SEwRWE0Gx/+ytydDvkn1Nuu
 eSx+r47Xt71d/N1iYQty95cvweU24qpcFTWp52MJVQuYpnXK0/Axe8dbsr9fQP4Puh4U
 w4SHRhsCMNBMgE05xtm49cdyylcoX75tvTFkPN45l/5T37JsgNjFvDS7MkfnWygWq+3K
 6lWeELSGE0yZhjoTsDC+EU75jOqU6WBHRkznrY3zRRCsZaLM8mevZGpzbMjSyWzTjiFW
 TGdu51jeWeMCx1EvGHIULu7f65yqxpI514juv6h7aEE0kPUXwDJBAJ+iFEdx7EfKFoN/
 gsTw==
X-Gm-Message-State: AO0yUKWNnERQzxRUNNxYtXa/nxN2SFVb/iuFA3ZChSB2z9Z+372shQls
 pV5w5BFY40bykvWrkeCHfr4Yuo3FNsOYluuJ
X-Google-Smtp-Source: AK7set/ZGHnrE4CRB2i9sEIRHyE340h/ZXwO1ExCLVvGcX2ltiDQeTxi0HnWDx0Q9HG8LKn9fP9aPw==
X-Received: by 2002:a05:600c:43d3:b0:3da:1357:4ca2 with SMTP id
 f19-20020a05600c43d300b003da13574ca2mr20544534wmn.11.1676283070236; 
 Mon, 13 Feb 2023 02:11:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a5d6252000000b002c3dc4131f5sm10248084wrv.18.2023.02.13.02.11.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:11:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/7] hw/net/eepro100: Pass E100PCIDeviceInfo as class init
 data
Date: Mon, 13 Feb 2023 11:10:45 +0100
Message-Id: <20230213101048.94519-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213101048.94519-1-philmd@linaro.org>
References: <20230213101048.94519-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

QOM already provides the TypeInfo::class_data to set
class-specific data. Use it instead of reinventing the
wheel with eepro100_get_class_by_name(). This finishes
the QDev conversion started 12 years ago in commit
40021f0888 ("pci: convert to QEMU Object Model").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/eepro100.c | 63 +++++++++++++++--------------------------------
 1 file changed, 20 insertions(+), 43 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 722fb55e4a..ab20558a18 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -242,6 +242,8 @@ struct EEPRO100Class {
     /*< private >*/
     PCIDeviceClass parent_class;
     /*< public >*/
+
+    const E100PCIDeviceInfo *info;
 };
 
 struct EEPRO100State {
@@ -338,8 +340,6 @@ static const uint16_t eepro100_mdi_mask[] = {
     0xffff, 0xffff, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
 };
 
-static E100PCIDeviceInfo *eepro100_get_class(EEPRO100State *s);
-
 /* Read a 16 bit control/status (CSR) register. */
 static uint16_t e100_read_reg2(EEPRO100State *s, E100RegisterOffset addr)
 {
@@ -489,8 +489,9 @@ static void eepro100_fcp_interrupt(EEPRO100State * s)
 static void e100_pci_reset(DeviceState *dev)
 {
     EEPRO100State *s = EEPRO100(dev);
-    E100PCIDeviceInfo *info = eepro100_get_class(s);
-    uint32_t device = s->device;
+    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
+    const E100PCIDeviceInfo *info = ek->info;
+    uint32_t device = info->device;
     uint8_t *pci_conf = s->dev.config;
 
     TRACE(OTHER, logout("%p\n", s));
@@ -1847,11 +1848,11 @@ static NetClientInfo net_eepro100_info = {
 static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 {
     EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
-    E100PCIDeviceInfo *info = eepro100_get_class(s);
+    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
 
     TRACE(OTHER, logout("\n"));
 
-    s->device = info->device;
+    s->device = ek->info->device;
 
     /* Add 64 * 2 EEPROM. i82557 and i82558 support a 64 word EEPROM,
      * i82559 and later support 64 or 256 word EEPROM. */
@@ -2028,32 +2029,19 @@ static E100PCIDeviceInfo e100_devices[] = {
     }
 };
 
-static E100PCIDeviceInfo *eepro100_get_class_by_name(const char *typename)
+static void eepro100_class_init(ObjectClass *klass, void *data)
 {
-    E100PCIDeviceInfo *info = NULL;
-    int i;
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    EEPRO100Class *ek = EEPRO100_CLASS(klass);
+    const E100PCIDeviceInfo *info = data;
 
-    /* This is admittedly awkward but also temporary.  QOM allows for
-     * parameterized typing and for subclassing both of which would suitable
-     * handle what's going on here.  But class_data is already being used as
-     * a stop-gap hack to allow incremental qdev conversion so we cannot use it
-     * right now.  Once we merge the final QOM series, we can come back here and
-     * do this in a much more elegant fashion.
-     */
-    for (i = 0; i < ARRAY_SIZE(e100_devices); i++) {
-        if (strcmp(e100_devices[i].name, typename) == 0) {
-            info = &e100_devices[i];
-            break;
-        }
-    }
-    assert(info != NULL);
-
-    return info;
-}
-
-static E100PCIDeviceInfo *eepro100_get_class(EEPRO100State *s)
-{
-    return eepro100_get_class_by_name(object_get_typename(OBJECT(s)));
+    dc->desc = info->desc;
+    k->device_id = info->device_id;
+    k->revision = info->revision;
+    k->subsystem_vendor_id = info->subsystem_vendor_id;
+    k->subsystem_id = info->subsystem_id;
+    ek->info = info;
 }
 
 static Property e100_properties[] = {
@@ -2065,8 +2053,6 @@ static void eepro100_base_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-    E100PCIDeviceInfo *info;
-
 
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     device_class_set_props(dc, e100_properties);
@@ -2076,17 +2062,6 @@ static void eepro100_base_class_init(ObjectClass *klass, void *data)
     k->romfile = "pxe-eepro100.rom";
     k->realize = e100_nic_realize;
     k->exit = pci_nic_uninit;
-
-    info = eepro100_get_class_by_name(object_class_get_name(klass));
-    if (!info) {
-        /* base class */
-        return;
-    }
-    dc->desc = info->desc;
-    k->device_id = info->device_id;
-    k->revision = info->revision;
-    k->subsystem_vendor_id = info->subsystem_vendor_id;
-    k->subsystem_id = info->subsystem_id;
 }
 
 static const TypeInfo eepro100_base_info = {
@@ -2111,6 +2086,8 @@ static void eepro100_register_types(void)
         TypeInfo type_info = {
             .name   = e100_devices[i].name,
             .parent = TYPE_EEPRO100,
+            .class_init    = eepro100_class_init,
+            .class_data = (void *)&e100_devices[i],
         };
 
         type_register(&type_info);
-- 
2.38.1


