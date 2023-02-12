Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4C693A8F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:48:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRL8V-0001PR-4F; Sun, 12 Feb 2023 17:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8T-0001P6-8U
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:53 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8R-0003K1-Hu
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:52 -0500
Received: by mail-wr1-x436.google.com with SMTP id h16so10411916wrz.12
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9E9FEd3Tu+4S+Gw8JExKzSs7Qwdz1/Mjy+Z3v6Jr7cU=;
 b=CT0ICUD7yUsLLt1k58jhfr/5JwMrCOVnKcoEVcIU9XhTJtp65CZlwuHTLui1EDRE7D
 kSmHJS8D79SGfKEm8EiDJusd1m4+yNsx5RUX7wpi6PLtK0GtMfbquYcykeVBDO7K3qaZ
 JUZ8yVlrqMunBNNFYwEkr8vli8R4r3WB6GsrRiVa8d82nXuRj0cBLI4XqEboNno5B/f/
 ivcUtcZ6IHvGDuKXTILhCxfhu1cnPRoFoFY0vnxbf/3SLekyCWX+hbi4MqjoEUrwht9f
 CQE7+VQ8/7ndhxCgGGo9ulK1AHG5BSvbpw1m8Z1N4XhhyOv4OZXoRynP7hdbX51WxL/8
 Q0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9E9FEd3Tu+4S+Gw8JExKzSs7Qwdz1/Mjy+Z3v6Jr7cU=;
 b=EWs21O8nEuOf+0D+4TOJkJitDD3m4QbRvGaTkYzb2d5PRGItabMbwpXD67x7jGsTuu
 Tnok15T7fAR8Sj91LOWTR0XWwMoXu+NFzlhguo/RufWxk5yUDOUp1m7Sr32dTxQaL4SB
 6zj1hQm5Giitcm8RVD+N2uCTh758fcBML0X2CBk2PImPtX09kl2yjXcv83rY3RON04H9
 /pmIHVHibymHTEsdyOm7ZEFtX2yx+eCJHvo/ql5q+Fafagf8q//Ed/GCaeTjjzT8gAWX
 TG6YzE5FJtl94Gw+QpkU8G6CTUaZZim/ElAr1voBCmcr5WC7lM88Wbu7ANwOkiIGsFmv
 bYwQ==
X-Gm-Message-State: AO0yUKVuLvuqUYffcBxIDrqRazrz6XZpP8nhHMwTUSQR+cJ9Ag2zQIM/
 RhGz6eXgRQPgml0vjPjRy+lO9CH29+UupUQA
X-Google-Smtp-Source: AK7set+W43yobp3iVhR993oFloJE37NOIfaaO/6zaackYFj5ok9z28q8MGYHNWF4iT5mCR1sgXAR3A==
X-Received: by 2002:adf:de8d:0:b0:2c5:4c64:d35b with SMTP id
 w13-20020adfde8d000000b002c54c64d35bmr5781611wrl.15.1676242069025; 
 Sun, 12 Feb 2023 14:47:49 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c445200b003de77597f16sm13141561wmn.21.2023.02.12.14.47.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:47:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/4] hw: Use qdev_get_parent_bus() in
 qdev_get_own_fw_dev_path_from_handler()
Date: Sun, 12 Feb 2023 23:47:29 +0100
Message-Id: <20230212224730.51438-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212224730.51438-1-philmd@linaro.org>
References: <20230212224730.51438-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

No need to pass 'dev' and 'dev->parent_bus' when we can
retrieve 'parent_bus' with qdev_get_parent_bus().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-fw.c      | 9 +++++----
 include/hw/qdev-core.h | 2 +-
 softmmu/bootdevice.c   | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/core/qdev-fw.c b/hw/core/qdev-fw.c
index a31958355f..c2df1f4796 100644
--- a/hw/core/qdev-fw.c
+++ b/hw/core/qdev-fw.c
@@ -41,9 +41,10 @@ static char *bus_get_fw_dev_path(BusState *bus, DeviceState *dev)
     return NULL;
 }
 
-static char *qdev_get_fw_dev_path_from_handler(BusState *bus, DeviceState *dev)
+static char *qdev_get_fw_dev_path_from_handler(DeviceState *dev)
 {
     Object *obj = OBJECT(dev);
+    BusState *bus = qdev_get_parent_bus(dev);
     char *d = NULL;
 
     while (!d && obj->parent) {
@@ -53,11 +54,11 @@ static char *qdev_get_fw_dev_path_from_handler(BusState *bus, DeviceState *dev)
     return d;
 }
 
-char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev)
+char *qdev_get_own_fw_dev_path_from_handler(DeviceState *dev)
 {
     Object *obj = OBJECT(dev);
 
-    return fw_path_provider_try_get_dev_path(obj, bus, dev);
+    return fw_path_provider_try_get_dev_path(obj, qdev_get_parent_bus(dev), dev);
 }
 
 static int qdev_get_fw_dev_path_helper(DeviceState *dev, char *p, int size)
@@ -67,7 +68,7 @@ static int qdev_get_fw_dev_path_helper(DeviceState *dev, char *p, int size)
     if (dev && dev->parent_bus) {
         char *d;
         l = qdev_get_fw_dev_path_helper(dev->parent_bus->parent, p, size);
-        d = qdev_get_fw_dev_path_from_handler(dev->parent_bus, dev);
+        d = qdev_get_fw_dev_path_from_handler(dev);
         if (!d) {
             d = bus_get_fw_dev_path(dev->parent_bus, dev);
         }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f5b3b2f89a..93718be156 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -774,7 +774,7 @@ bool bus_is_in_reset(BusState *bus);
 BusState *sysbus_get_default(void);
 
 char *qdev_get_fw_dev_path(DeviceState *dev);
-char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev);
+char *qdev_get_own_fw_dev_path_from_handler(DeviceState *dev);
 
 void device_class_set_props(DeviceClass *dc, Property *props);
 
diff --git a/softmmu/bootdevice.c b/softmmu/bootdevice.c
index 2106f1026f..7834bf3333 100644
--- a/softmmu/bootdevice.c
+++ b/softmmu/bootdevice.c
@@ -214,7 +214,7 @@ static char *get_boot_device_path(DeviceState *dev, bool ignore_suffixes,
 
     if (!ignore_suffixes) {
         if (dev) {
-            d = qdev_get_own_fw_dev_path_from_handler(dev->parent_bus, dev);
+            d = qdev_get_own_fw_dev_path_from_handler(dev);
             if (d) {
                 assert(!suffix);
                 s = d;
-- 
2.38.1


