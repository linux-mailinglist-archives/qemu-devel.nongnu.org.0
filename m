Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65A67B2DE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfOt-0002d2-U1; Wed, 25 Jan 2023 08:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOd-0002XJ-Uc; Wed, 25 Jan 2023 08:01:08 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOW-0007Ti-Qo; Wed, 25 Jan 2023 08:00:59 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so1155289wml.3; 
 Wed, 25 Jan 2023 05:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=syan58S3sCnjyIRk7Y6RWSpgxK4N2Gg8GaazVOwZOpQ=;
 b=ehxKewQGImTzgN1gyT5ml6LlP7kfGjnv56QNI+EiiUAaZ2ORTiaHiDDeNv6471nW8k
 0z2RzAsfPGydxFB9wmH78YKOFE6BT/i4+e64h3XLmDdsHhRwc0B2JRBDJRMfqGJNsKdd
 d6pueDtWq2l4ygpyYHRiwLZqnB8bLvv57l9j8oXtvEwiG/dr3DlhtE11YFaDVRNTMD3g
 OQP11kWtbJb1rPpcB9KKrzKcimRwYSRgQP88OGa2FDyVT1gJISHZjXrS106YbAHdLAkR
 HhH8PnEy8YncNLXx+A+uEKUHE+O2mIUgNPKMOfBaM9W11Xr8D86Kq+hVRDvXgLd8RUsj
 q3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=syan58S3sCnjyIRk7Y6RWSpgxK4N2Gg8GaazVOwZOpQ=;
 b=PcE28+Xvuf5Skp3U/aa6TsP2vsXuAKmQ8JQGYfhd/ZKooaY9hEJUd9ZiW9nosH8bZj
 Jdxw1L6WGI8rCLXY43r1gt+EwSNyb/NjBY1ma++UkYL2m1MUSfduMgDJr9Qni0lFD+d0
 J453mRiCPn1OtjoABY1aDpTUX7RkyhsQlt3uZcBQ8DXVC3JTkQKfR/PdyRWhm+VWYBKF
 SqcDgDt1ogAKcB8DTeKqKhnz8EZyeOZe7pXnC6vGhpALMTnUydaTitoxTsC2d1wuee5N
 uQt2hkr3gY9W2hbzrc4hs0WN/Fy9ATtftNSv/J6LQBtKSSAQJNwP7JNPfMyf3Odu7BNl
 /xZA==
X-Gm-Message-State: AFqh2krlaO+bd1cdwkYX9qKCKK7FHt2zlCN8fCzZ9bL5rDQSoGv05XCE
 BAJ7rbS7gn+KFOnepRIbDfljgf8ipoSVoA==
X-Google-Smtp-Source: AMrXdXuwIh1yBF/HnnHX5bRhYw4wLRF8VXpmoNUZyO+fcbCjFk+FxfEugzXbtclJofXqXymzBCzqEw==
X-Received: by 2002:a05:600c:225a:b0:3d3:5c21:dd99 with SMTP id
 a26-20020a05600c225a00b003d35c21dd99mr30951681wmm.18.1674651649554; 
 Wed, 25 Jan 2023 05:00:49 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c384f00b003d9de0c39fasm2078828wmr.36.2023.01.25.05.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 05:00:49 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/4] hw/ppc/e500{,
 plat}: Drop redundant checks for presence of platform bus
Date: Wed, 25 Jan 2023 14:00:22 +0100
Message-Id: <20230125130024.158721-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125130024.158721-1-shentey@gmail.com>
References: <20230125130024.158721-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32b.google.com
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

This is a follow-up on commit 47a0b1dff7e9 'hw/ppc/mpc8544ds: Add
platform bus': Both mpc85xx boards now have a platform bus
unconditionally.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c     | 5 ++---
 hw/ppc/e500plat.c | 9 +++------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 7239993acc..48288c0b41 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -643,9 +643,8 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
     }
     g_free(soc);
 
-    if (pms->pbus_dev) {
-        platform_bus_create_devtree(pms, fdt, mpic);
-    }
+    platform_bus_create_devtree(pms, fdt, mpic);
+
     g_free(mpic);
 
     pmc->fixup_devtree(fdt);
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index 44bf874b0f..3032bd3f6d 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -46,13 +46,10 @@ static void e500plat_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
     PPCE500MachineState *pms = PPCE500_MACHINE(hotplug_dev);
+    MachineClass *mc = MACHINE_GET_CLASS(pms);
 
-    if (pms->pbus_dev) {
-        MachineClass *mc = MACHINE_GET_CLASS(pms);
-
-        if (device_is_dynamic_sysbus(mc, dev)) {
-            platform_bus_link_device(pms->pbus_dev, SYS_BUS_DEVICE(dev));
-        }
+    if (device_is_dynamic_sysbus(mc, dev)) {
+        platform_bus_link_device(pms->pbus_dev, SYS_BUS_DEVICE(dev));
     }
 }
 
-- 
2.39.1


