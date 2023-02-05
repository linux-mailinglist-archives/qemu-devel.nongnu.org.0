Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B99868AF43
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObu8-0001KR-FU; Sun, 05 Feb 2023 05:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtX-0000zE-M9; Sun, 05 Feb 2023 05:05:15 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtU-0005JB-VE; Sun, 05 Feb 2023 05:05:11 -0500
Received: by mail-oi1-x22e.google.com with SMTP id s17so7599577ois.10;
 Sun, 05 Feb 2023 02:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiCleTy8543Mmcc9cjgIqcXCXs8OIrvQc5QWbgPOzFM=;
 b=Wf4Z+oTEnFNGKKrc9ijb6qQB0xZbMjWXUnQftWtpbW/Zyi6CAVERrQMjSvAzhDY7di
 UPm+t4i+SBY1W/pfty6iucjeLdMfewmQDD8K8AFlhSc2xd0xg6cwsuINiGYD6dg15GE2
 0pODhQoEfHeXVCFAleCWyYfctyI7VGs3DsIDULQ8DMWn51V2+BTyMtABu6zmXbrth2qn
 T1B/FjEHMwxxQU4rXj3dj04XdkYdvN0g+rPdMj6tE6JpONq4jnFYdcneGmkaYBQf5u+1
 mjfzvOHpHG7AsR7yiYjXWeMVlodnjSo8WDDlCo6K2pGFS/N3I9fBsemNX62aebrnVlO+
 vk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xiCleTy8543Mmcc9cjgIqcXCXs8OIrvQc5QWbgPOzFM=;
 b=LCyKYndF4rqTCOKu90/3F5oHQH4z6LU7Ojj6OrfU8NDIDlZqxXn6jD0F8c9yw34Afl
 Ilo+iAyNl5z3eMgUojBefZQ40MQTtRkGCUQEi/5U3WGbB+NONNbSnC6fyw/qHcevrFbk
 J2wZEUL0CkGVeRH5hLsfZWUVu/13jbXdj7kPBZRFLcmKCBqzOZCteEOHiq7VlgAsopY9
 sX5zg0xuXoZh5W3RNkhYifRNB5nk+UvQ9nwH86eMSTZOSS7GPlVJxuoKBQsUPaPKbW9o
 VYKv0k+N06cyQNydRGHiHDJKPvW/Ud5LGVB5oSmEHaoK0qc+/uHZv6JlBVlsz+gQS/W+
 ugqg==
X-Gm-Message-State: AO0yUKWxT2zX0LIsvvKJEcYTX/IUrtSHzPKnOeL8ad5m1FF34nl7Bc+O
 fc6wWoHKRtkpP0u61l8/4tU6U50WAdw=
X-Google-Smtp-Source: AK7set9ERYhFtF4Vg7mvwUOz/0uI8IuY3HBXo7F2VDXElKgI+sL3LoAW5WgQ/wTKwCHdc7jnoDShjA==
X-Received: by 2002:a05:6808:3ae:b0:360:fd4c:11ab with SMTP id
 n14-20020a05680803ae00b00360fd4c11abmr7332137oie.1.1675591507305; 
 Sun, 05 Feb 2023 02:05:07 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:07 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 06/16] hw/ppc/e500{,
 plat}: Drop redundant checks for presence of platform bus
Date: Sun,  5 Feb 2023 07:04:39 -0300
Message-Id: <20230205100449.2352781-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

This is a follow-up on commit 47a0b1dff7e9 'hw/ppc/mpc8544ds: Add
platform bus': Both mpc85xx boards now have a platform bus
unconditionally.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20230125130024.158721-3-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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


