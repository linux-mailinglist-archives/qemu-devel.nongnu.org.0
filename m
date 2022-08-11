Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39A58FF3B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:23:04 +0200 (CEST)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMA1X-0000cP-EN
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tC-0005B4-PU
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tB-0005ix-1l
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id b6so9608137wmq.5
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=o35sdKqtn5jbIbu1s5da6F1VZ4Qn/nY9QWiMeYkUz1s=;
 b=TzFWo3YL42lR8zGOdU9kRM01xNmksnY4CeY+ZNZv9F/3uPY9Pip8FUlJmrelW3+qna
 c7QGgv+tA2DXzXW8b3DpYj/WyzUqwVDzu5h8M0SfMk8BL9c4A7qrhRacStNtpJO/uIG9
 81d3y4ZlmIB4ENsbAJcPORLY63FVNtOje6yqn4nODz2z7xpffmwWDUYyGeJtQ+LOa5Pb
 fXk558oKPZc6UvsoNiGv5FLPfyTG+fOhR3wjd8WWnLQqDzKGUviElDT0VooR7AXa78mI
 pKYMz+cxdXHqZBirUmHgE64ItZZSVVyxve/INvvi/h/ZDT3yATP3R+PbBNyT4w21tcOT
 GRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=o35sdKqtn5jbIbu1s5da6F1VZ4Qn/nY9QWiMeYkUz1s=;
 b=lpOqnP/+aO2XT6N0AfUEn3NekvvW+hOQ1M9odQ5BK3zoyecYlF731suAJeeG1Xyt26
 Mn4WjYCpta3nkDAS1f/v5hoQvoWAupQBpqKGry/FqMV6DhtUwAwccabucote36XHkvCg
 3U6IWyzGsZwDNYX7zZKOi37PAGEpPkh8Xfi1ua6uRoOy4xZDVqESrHipNpxvmIABWYAR
 8BB1VznBczgjYmaZYodBuLNcYGKxvgV/2VSNUbgGnxwCrPXu037eiJpLynLl6c7+YSOU
 Tv/EgPahSqKVJrbMmPNxB1KhbMl03aWzSnv5DT654dUyHitZWBnaYrk2E1KEbvt+NHuP
 HysA==
X-Gm-Message-State: ACgBeo05IuAjt1GZT0dQ9Mu0WVL3Xz8pDn5/uKms2i8hb8JW20+qS4SJ
 DW+ONcu8uVl5BmYiRKvXyBmuk66lBjQiiQ==
X-Google-Smtp-Source: AA6agR77PyVO6IcfVpv8Tfb6Z2tOSnLrRJrUw8/tUYLROz5LdgMFrm8zamOxW5fS7vO8KVQ4DSRZxQ==
X-Received: by 2002:a1c:f709:0:b0:3a0:3b29:5eb2 with SMTP id
 v9-20020a1cf709000000b003a03b295eb2mr6082287wmh.133.1660230863593; 
 Thu, 11 Aug 2022 08:14:23 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 cc11-20020a5d5c0b000000b002205ffe88edsm17062854wrb.31.2022.08.11.08.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:14:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF27D1FFBD;
 Thu, 11 Aug 2022 16:14:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH  v1 5/8] ssi: cache SSIPeripheralClass to avoid GET_CLASS()
Date: Thu, 11 Aug 2022 16:14:10 +0100
Message-Id: <20220811151413.3350684-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811151413.3350684-1-alex.bennee@linaro.org>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Investigating why some BMC models are so slow compared to a plain ARM
virt machines I did some profiling of:

  ./qemu-system-arm -M romulus-bmc -nic user \
    -drive
    file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
    -nographic -serial mon:stdio

And saw that object_class_dynamic_cast_assert was dominating the
profile times. We have a number of cases in this model of the SSI bus.
As the class is static once the object is created we just cache it and
use it instead of the dynamic case macros.

Profiling against:

  ./tests/venv/bin/avocado run \
    tests/avocado/machine_aspeed.py:test_arm_ast2500_romulus_openbmc_v2_9_0

Before: 35.565 s ±  0.087 s
After: 15.713 s ±  0.287 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>

---
v2
 - split patches
---
 include/hw/ssi/ssi.h |  3 +++
 hw/ssi/ssi.c         | 18 ++++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index f411858ab0..6950f86810 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -59,6 +59,9 @@ struct SSIPeripheralClass {
 struct SSIPeripheral {
     DeviceState parent_obj;
 
+    /* cache the class */
+    SSIPeripheralClass *spc;
+
     /* Chip select state */
     bool cs;
 };
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 003931fb50..d54a109bee 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -38,9 +38,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
     bool cs = !!level;
     assert(n == 0);
     if (s->cs != cs) {
-        SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s);
-        if (ssc->set_cs) {
-            ssc->set_cs(s, cs);
+        if (s->spc->set_cs) {
+            s->spc->set_cs(s, cs);
         }
     }
     s->cs = cs;
@@ -48,11 +47,11 @@ static void ssi_cs_default(void *opaque, int n, int level)
 
 static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev, uint32_t val)
 {
-    SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev);
+    SSIPeripheralClass *ssc = dev->spc;
 
     if ((dev->cs && ssc->cs_polarity == SSI_CS_HIGH) ||
-            (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
-            ssc->cs_polarity == SSI_CS_NONE) {
+        (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
+        ssc->cs_polarity == SSI_CS_NONE) {
         return ssc->transfer(dev, val);
     }
     return 0;
@@ -67,6 +66,7 @@ static void ssi_peripheral_realize(DeviceState *dev, Error **errp)
             ssc->cs_polarity != SSI_CS_NONE) {
         qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
     }
+    s->spc = ssc;
 
     ssc->realize(s, errp);
 }
@@ -115,13 +115,11 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
 {
     BusState *b = BUS(bus);
     BusChild *kid;
-    SSIPeripheralClass *ssc;
     uint32_t r = 0;
 
     QTAILQ_FOREACH(kid, &b->children, sibling) {
-        SSIPeripheral *peripheral = SSI_PERIPHERAL(kid->child);
-        ssc = SSI_PERIPHERAL_GET_CLASS(peripheral);
-        r |= ssc->transfer_raw(peripheral, val);
+        SSIPeripheral *p = SSI_PERIPHERAL(kid->child);
+        r |= p->spc->transfer_raw(p, val);
     }
 
     return r;
-- 
2.30.2


