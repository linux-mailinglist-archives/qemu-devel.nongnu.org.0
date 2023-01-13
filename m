Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F88669DA8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:24:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMFm-0001IB-Mn; Fri, 13 Jan 2023 10:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFk-0001GV-Tb
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:00 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFj-0005li-BU
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:00 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso13305054wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGCOa5oMG6crU1pmMt6tVFXX/xHui00CJSxQwvzSIuo=;
 b=V1RvXB7EgIq0a8MNr6MJH5VxJ8s6NkXf0AioHhUiivOz/Db3Nt58cb8kF45dLq9/Ev
 arHKHSanLoTzfw958qpSO/iS6Tm2xNGO/eq228zo4g1lBIzSPJihy/QHIkzYV8Lgwz2r
 jI97yXbKEuyT1Zkxwyy9r8JkHHQ8EvUxz49L83hf/cSfNc3grJmFUK9gkggxCuyInJqj
 8aaXGI3WM7ed3KZ7NYIUxJJn8tEKoe/7zJTEQIVkEzWH9erjpotNuhBO8ntgQBHtn3CQ
 86FQAXUlVuK5MB8x7aFf199wCyclw8V0/7h/8IBptMzDFd9J6OgPwN7wMJcCZG+ZXqSV
 yOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGCOa5oMG6crU1pmMt6tVFXX/xHui00CJSxQwvzSIuo=;
 b=XhpqZ5Mo4RExnSGVY/A8X7d8pHNy2VD8R9ZIDzxlb2L9SdRutc9a9hKDzzLCGNThYN
 xjTmyC1mvDDdzWmxmxDdz09C2mCg3PiGqlPL3HbqjmlPbIFu11hnlBI25uBsd7CWoMmR
 Y6jprmKoG8oFBrtNXdIfR5v28wc8bzTu28UtLf6gZA7MXfbG0lwCY0er2N0CO5qnUCG1
 kJ9MxLRWOPWoegxlWRnE6h0DmKbceRESo9UgBIaNxeb7MjcO43swOX0V8WmZ46wNgJJX
 0aUnEwuE5+5yMAMe7m8g4B3AIdPnwUFaoQd5JiTIX/YANxhYy0vEeb9KoHRFJm0ELnwS
 hvfQ==
X-Gm-Message-State: AFqh2korRJTFhdcpPqsJSF4mnZEkI7BC0Xp7Eknthke4pkMBVdd84KX9
 tcT7OyWmnF9XUIsgnIJewljZVXJnQWp7iZCN
X-Google-Smtp-Source: AMrXdXs9l4kEUUpAem4jX/A0giQuViIvWUSD2lmvAOaXC8OBj2CQ+KujD9VEJnLR44CgOJGzlD8jKQ==
X-Received: by 2002:a05:600c:4f41:b0:3d9:f806:2f89 with SMTP id
 m1-20020a05600c4f4100b003d9f8062f89mr11405792wmq.41.1673624758473; 
 Fri, 13 Jan 2023 07:45:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003d34faca949sm25255510wmb.39.2023.01.13.07.45.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:45:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/46] hw/mips/Kconfig: Introduce CONFIG_GT64120 to select
 gt64xxx_pci.c
Date: Fri, 13 Jan 2023 16:44:51 +0100
Message-Id: <20230113154532.49979-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221209151533.69516-2-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/Kconfig     | 6 ++++++
 hw/mips/meson.build | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 725525358d..d6bbbe7069 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -1,5 +1,6 @@
 config MALTA
     bool
+    select GT64120
     select ISA_SUPERIO
 
 config MIPSSIM
@@ -59,3 +60,8 @@ config MIPS_BOSTON
 
 config FW_CFG_MIPS
     bool
+
+config GT64120
+    bool
+    select PCI
+    select I8259
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index dd0101ad4d..6ccd385df0 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -2,7 +2,8 @@ mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
-mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
+mips_ss.add(when: 'CONFIG_MALTA', if_true: files('malta.c'))
+mips_ss.add(when: 'CONFIG_GT64120', if_true: files('gt64xxx_pci.c'))
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
 
 if 'CONFIG_TCG' in config_all
-- 
2.38.1


