Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC1444448D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:20:24 +0100 (CET)
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI3r-0000mp-Nf
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp4-0003T0-Ui
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHoz-0000Yh-Ns
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id o14so4007063wra.12
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2gcgLovYgk2FFEZHd2igMQ6F1dEK3cZxyz+kGi87HA=;
 b=NoN2YPRBqw65eTVx3AYTkpnV5uskjy3l6RCKdrDi3ZWRknF+PkJ79yHpHM8YjzWbTD
 VbGBHO1l1WdAc5d+Ra2N5VbdeHFQAW+C/nj4K9mHnRX7qmZ/e+Gnt6sd7SmhRJfuVXq7
 FJe/Fn2x9Of7VJ5an9CbWXzpcKCgigHG9G/BvikO2lwLbGXWjRHVfJ4sKqt1Zt9+TEBU
 Pisto/s1rZD6Dg3rwHQfmbJ+cW84cyr6M62CtORj2Dl9ENPRZSk0osHQEcsJzV+hG2if
 8lSIsOeVK3JptCH0YV0JdVMd1AZOC1vIb9aApojL8PFWOiomAYoB8opV8CFTPfuolHHS
 D7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r2gcgLovYgk2FFEZHd2igMQ6F1dEK3cZxyz+kGi87HA=;
 b=ppPLEN/vLdmBp7RAmoBPieI/+EWq4Q+bHjWBj49sZOPMWPU+T3Ie9nsfDvNWzgpj3u
 5l5BHIiZ8R3wa042qb1LejlCZFY0dTRlGdd3OF2jJlQDpQh1wBXDaLvCFfJsXgWCkTTq
 VpyII+B5Aj1EHSONUbw/pMFec5mZCVP0ugD49LwYuIKiqAQLyQdiiUfUguSIKtcSHc+h
 5A1NSzWVRtdAGJbiIwoVG38i0z5bSbHW8XoC/JVt2UOHLdDbqTDbKUeTRgqWUQLkxvlf
 16xwzxYDThZEHtvdkyXFNx5fjiIk/34ULcbUmiwjWC1Pebhk5nOsY4in+aSKLNdbAUSW
 fr8A==
X-Gm-Message-State: AOAM533KtPp3m+caxgeteQtymHyy6Y4+WLtjQWtiWLGYaAAVT+aKbpAD
 m9X2HyRJVAb4qLzKAH+gTofJIYC1FQo=
X-Google-Smtp-Source: ABdhPJzwPjIHfSL2PQWiAPtBYBC3iXUd7tnUhwsTxbsH8ylt/yHMsYe9Ld/9+6HV0wnuz8VClH5BMg==
X-Received: by 2002:adf:ee4b:: with SMTP id w11mr53852597wro.115.1635951900395; 
 Wed, 03 Nov 2021 08:05:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/27] watchdog: add information from -watchdog help to -device
 help
Date: Wed,  3 Nov 2021 16:04:29 +0100
Message-Id: <20211103150442.387121-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

List all watchdog devices in a separate category, and populate
their descriptions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/watchdog/sbsa_gwdt.c    | 3 ++-
 hw/watchdog/wdt_aspeed.c   | 3 ++-
 hw/watchdog/wdt_diag288.c  | 3 ++-
 hw/watchdog/wdt_i6300esb.c | 3 ++-
 hw/watchdog/wdt_ib700.c    | 3 ++-
 hw/watchdog/wdt_imx2.c     | 4 ++--
 include/hw/qdev-core.h     | 1 +
 softmmu/qdev-monitor.c     | 1 +
 8 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
index d0998f8489..e49cacd0e2 100644
--- a/hw/watchdog/sbsa_gwdt.c
+++ b/hw/watchdog/sbsa_gwdt.c
@@ -273,8 +273,9 @@ static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, void *data)
     dc->realize = wdt_sbsa_gwdt_realize;
     dc->reset = wdt_sbsa_gwdt_reset;
     dc->hotpluggable = false;
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
     dc->vmsd = &vmstate_sbsa_gwdt;
+    dc->desc = "SBSA-compliant generic watchdog device";
 }
 
 static const TypeInfo wdt_sbsa_gwdt_info = {
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 146ffcd713..6aa6f90b66 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -293,9 +293,10 @@ static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED Watchdog Controller";
     dc->realize = aspeed_wdt_realize;
     dc->reset = aspeed_wdt_reset;
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
     dc->vmsd = &vmstate_aspeed_wdt;
     device_class_set_props(dc, aspeed_wdt_properties);
+    dc->desc = "Aspeed watchdog device";
 }
 
 static const TypeInfo aspeed_wdt_info = {
diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
index e135a4de8b..9e8882a11c 100644
--- a/hw/watchdog/wdt_diag288.c
+++ b/hw/watchdog/wdt_diag288.c
@@ -122,9 +122,10 @@ static void wdt_diag288_class_init(ObjectClass *klass, void *data)
     dc->unrealize = wdt_diag288_unrealize;
     dc->reset = wdt_diag288_reset;
     dc->hotpluggable = false;
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
     dc->vmsd = &vmstate_diag288;
     diag288->handle_timer = wdt_diag288_handle_timer;
+    dc->desc = "diag288 device for s390x platform";
 }
 
 static const TypeInfo wdt_diag288_info = {
diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 4c52e3bb9e..f99a1c9d29 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -476,7 +476,8 @@ static void i6300esb_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_SYSTEM_OTHER;
     dc->reset = i6300esb_reset;
     dc->vmsd = &vmstate_i6300esb;
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
+    dc->desc = "Intel 6300ESB";
 }
 
 static const TypeInfo i6300esb_info = {
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index 177aaa503f..91d1bdc0da 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -140,7 +140,8 @@ static void wdt_ib700_class_init(ObjectClass *klass, void *data)
     dc->realize = wdt_ib700_realize;
     dc->reset = wdt_ib700_reset;
     dc->vmsd = &vmstate_ib700;
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
+    dc->desc = "iBASE 700";
 }
 
 static const TypeInfo wdt_ib700_info = {
diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index a5fb76308f..c3128370b5 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -280,8 +280,8 @@ static void imx2_wdt_class_init(ObjectClass *klass, void *data)
     dc->realize = imx2_wdt_realize;
     dc->reset = imx2_wdt_reset;
     dc->vmsd = &vmstate_imx2_wdt;
-    dc->desc = "i.MX watchdog timer";
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc = "i.MX2 watchdog timer";
+    set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
 }
 
 static const TypeInfo imx2_wdt_info = {
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 1bad07002d..72622bd337 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -26,6 +26,7 @@ typedef enum DeviceCategory {
     DEVICE_CATEGORY_SOUND,
     DEVICE_CATEGORY_MISC,
     DEVICE_CATEGORY_CPU,
+    DEVICE_CATEGORY_WATCHDOG,
     DEVICE_CATEGORY_MAX
 } DeviceCategory;
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index e49d9773d2..f8b3a4cd82 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -165,6 +165,7 @@ static void qdev_print_devinfos(bool show_no_user)
         [DEVICE_CATEGORY_SOUND]   = "Sound",
         [DEVICE_CATEGORY_MISC]    = "Misc",
         [DEVICE_CATEGORY_CPU]     = "CPU",
+        [DEVICE_CATEGORY_WATCHDOG]= "Watchdog",
         [DEVICE_CATEGORY_MAX]     = "Uncategorized",
     };
     GSList *list, *elt;
-- 
2.31.1



