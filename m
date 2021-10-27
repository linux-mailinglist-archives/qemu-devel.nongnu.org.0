Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB9043CB36
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:54:22 +0200 (CEST)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjNk-0005IA-TZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mfijV-000265-WC
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:12:54 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mfijU-0005ec-1H
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:12:45 -0400
Received: by mail-ed1-x534.google.com with SMTP id y12so10487720eda.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dRkYjCM4oe/5PiNgXD9yEIB03XmryZs6h1ddz3hgXi4=;
 b=eVvHRyLrtHGPkShE0MQ/La8Uwyh97XgYrElll8riPUFtnvsmZu87zKThdRsiyKWH2C
 0bjRGWHOcRSy1kCzBfGmwZZ8L0NR48/FQnY+Ltq2uTVu44f9FiZ5OjetrBrLwg2QtmkE
 7ThxX1lwS8RXaXKyNIOEMJRHOzZNkFkD3sg3rTnQnOI6ErrV1q+1pivsuZU3/JO4U9o5
 Pa1D665+sWLkMQxoGHW+8mKnd6xpWQN6xqbDzlqSaVVJXQ2nX2K3i1y/uvEk7GZ4VoQc
 4nrk4l3Zs8qNIblLT0Lrkp4+gKFEqxV4kspIzlB8VXWHPgNmGWS4Fak/Kh0qgGVaHnDr
 uNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dRkYjCM4oe/5PiNgXD9yEIB03XmryZs6h1ddz3hgXi4=;
 b=UEj3UGQkXxV5nuXnDjo3YA6j8RsJW6/wPpiYmqmGCg4UiHEl/UtpFrdHRHacZUUxa8
 dxQU9iZa8q446CshaJn39j/I3HC74BhV3qNffSEhdKWp4/y8Ohips6m2xbI0+67aOW4Z
 Lbrzsb5D9jB3l4qNpt8jSFq0+43KuRg5WPWY0zwDkkd8qtmT9Q030jZUDzUZ9kLlj39G
 qAZMdsFL/r8x7gtc2MfqjQFLvzYUwrjrw8qRwvBAsN/zpAGhP+wx3Ch59o6vsiHg+Qnr
 nehsoR9HYkUZMv3DB2GcrXnYDmHcNd10scxRJdkygPMFQwjXngvgmpQq/g82vqw5j1MX
 iujg==
X-Gm-Message-State: AOAM531wgJXsPmMeWX373UPPq66wEOBP+Bc0v4RwSdskkroIfWoW45Od
 2yPiKqrZJGm5I1Z1aCbMB2fgPN1X7e0=
X-Google-Smtp-Source: ABdhPJykxgWfIwmuzTtzJyoKJTllTpOrmGnkgPQN2sWISRYXCgFtXfVyaECRkZc7F2sX6BjmxsIolQ==
X-Received: by 2002:a17:907:72d0:: with SMTP id
 du16mr38876609ejc.226.1635340361612; 
 Wed, 27 Oct 2021 06:12:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p26sm12716943edu.57.2021.10.27.06.12.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 06:12:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] watchdog: add information from -watchdog help to -device
 help
Date: Wed, 27 Oct 2021 15:12:37 +0200
Message-Id: <20211027131239.802564-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027131239.802564-1-pbonzini@redhat.com>
References: <20211027131239.802564-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
index 4ff19c714b..0dae5b6f6c 100644
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
index 3df99ce9fc..87dd87e801 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -162,6 +162,7 @@ static void qdev_print_devinfos(bool show_no_user)
         [DEVICE_CATEGORY_SOUND]   = "Sound",
         [DEVICE_CATEGORY_MISC]    = "Misc",
         [DEVICE_CATEGORY_CPU]     = "CPU",
+        [DEVICE_CATEGORY_WATCHDOG]= "Watchdog",
         [DEVICE_CATEGORY_MAX]     = "Uncategorized",
     };
     GSList *list, *elt;
-- 
2.31.1



