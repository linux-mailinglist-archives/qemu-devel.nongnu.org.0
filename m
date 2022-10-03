Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3A5F379F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:24:29 +0200 (CEST)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSvM-000196-B7
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7c-0001zg-Az; Mon, 03 Oct 2022 16:33:05 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7a-00041r-Cp; Mon, 03 Oct 2022 16:33:03 -0400
Received: by mail-ed1-x531.google.com with SMTP id s2so5583712edd.2;
 Mon, 03 Oct 2022 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eAlyMl96H2pV22ChIyNGkXL0GG14b7EvJvI2aiGT+SQ=;
 b=Zs5qkgs4lfhxOoXERq6ub2FHeKLjQ1nMHBRC8Gpsic0N/3xAd2y8m2arcdWa1UkOGQ
 W3vkkjVhCbwQy5DsmQrKliOJxfCSaQM3FUZWziQaF+iFjdqI2EnJySarCFHcZcvcjhZj
 7xI24oz1FHqTw0xB2vwJqQXDSG00VStYFAlmNnIXNHjbCD332PvhZNJkjybFHyB29OoE
 JZAWXTM30RWFALaZIHstKApLS2IaSiM0RtuATaH/kGADx72jFkpsmhaRX3SJ8OHdop0A
 soWz4ngU0A7LnhMrQ2KNIJhjRwB6SYaP9g+WbmTy9+AJaN/h5ktzE+dPsFMDRxhLjqWX
 jbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eAlyMl96H2pV22ChIyNGkXL0GG14b7EvJvI2aiGT+SQ=;
 b=c8SG7Oxg6+GlQbMNlKHDU5kFfUZMJCoDebUt1hLTSFx4SWR2m9yQH2KhUJSLLHqss0
 U8ZPMXkSOd3P4H/qfx78LBKUkAr8lNO+cgSY3EJmKsZpweFl/cXKGr3L6w20qJHs8YPO
 sS3L7jnjqxDMSWZKx4G+/OFW+WM3RYfLIDU8T7+IYsSt75zxdICpeGPS2PQsu8dEo76E
 BJkS1+eNJe0RM2Eq7F7e1ABCWqs8MqXA1HRzfx2b+VjsgPOLT+EggS56wS2nXJo+OgQp
 svpIwLqa+USJCYSzPFJj9AcKAtJYG2VmY8b+7CjpdVEJ7VO4zK29Hvn++6aI5ficP6HR
 pCQg==
X-Gm-Message-State: ACrzQf2H7v8lua5ckFZrGPQ42p3uN/j/h9LOU98WQpyNbgQ20KAxymmm
 mi5sB5mqsEmKZfUJAriF+PGh11Lc8AI=
X-Google-Smtp-Source: AMsMyM66Sq3zjTTtoTLMTkyGJsBF0DgKr2Ln4Ck41wlr2/ljknGbgJBj7rPgqj3jzS9WJ8UfsTh5fQ==
X-Received: by 2002:a05:6402:500d:b0:459:3e56:e6f9 with SMTP id
 p13-20020a056402500d00b004593e56e6f9mr1819756eda.367.1664829179533; 
 Mon, 03 Oct 2022 13:32:59 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:32:59 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 02/13] hw/gpio/meson: Introduce dedicated config switch for
 hw/gpio/mpc8xxx
Date: Mon,  3 Oct 2022 22:31:31 +0200
Message-Id: <20221003203142.24355-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Having a dedicated config switch makes dependency handling cleaner.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/gpio/Kconfig     | 3 +++
 hw/gpio/meson.build | 2 +-
 hw/ppc/Kconfig      | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index f0e7405f6e..d2cf3accc8 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -8,6 +8,9 @@ config PL061
 config GPIO_KEY
     bool
 
+config GPIO_MPC8XXX
+    bool
+
 config GPIO_PWR
     bool
 
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 7bd6a57264..b726e6d27a 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -1,5 +1,5 @@
-softmmu_ss.add(when: 'CONFIG_E500', if_true: files('mpc8xxx.c'))
 softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
+softmmu_ss.add(when: 'CONFIG_GPIO_MPC8XXX', if_true: files('mpc8xxx.c'))
 softmmu_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
 softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
 softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 22a64745d4..791fe78a50 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -124,6 +124,7 @@ config E500
     imply AT24C
     imply VIRTIO_PCI
     select ETSEC
+    select GPIO_MPC8XXX
     select OPENPIC
     select PLATFORM_BUS
     select PPCE500_PCI
-- 
2.37.3


