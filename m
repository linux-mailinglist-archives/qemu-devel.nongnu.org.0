Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852932FB79
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:46:54 +0100 (CET)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ8n-0004PB-A8
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzP-0000ZB-PU
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:11 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzM-0008J6-Ga
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:10 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e10so5847167wro.12
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VEfG+VEgtzOXP1KKQgBSYNnUGOLnqfQoGKifvKY+0q0=;
 b=PpgfGtQigXp99MT8VS2kheBcAuuz2fJiSdB9ui4aaq8nCYjrUdKOsVeAa7wTx0Nzm7
 EBEN0f9V9LlkBGmJHXW84V0O9NG10xFN8bwEUDu/nFeGYKV68EJvcK3YK/RkhYeOMS1Z
 khbweV5zOVamGLCAJm1C7k1mgI7ymO1hJkQvLM9H5yotcyawcYcshNp954vgy+5MzXWa
 rsP9ahdGm7BlJxJORRL+6PlH5SFghe+zcbjoq6bKJaQ69Rwl/n8IBmZDe4UJh4JAYBJN
 nNCOaWw/n0X1YYdWDbMQ79PhHvZdOvkuhtRqDhFz9+ZiKg3u5wVq1xaOGkVSEDkYI0rp
 TTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VEfG+VEgtzOXP1KKQgBSYNnUGOLnqfQoGKifvKY+0q0=;
 b=WehxPmHwMYip7SqE6Vf8ancnGoKuWORGL5DYOlMLDzNXF8VpAjsBVtrfrA/cC6MpE2
 34DjDLapcRty9EkVrKFnQ+pdQ/NLWvlJG0XqFIq0otFw+4htzTz2OAz7lyu3UkJJUTMo
 fSpljJ4iDrD0j0+zNGuEftonwZw0y/2Q45E+SJcoDZOajdA5ibTyc72WDnSC0gT8P58Z
 x0LrPpDydsJtj3ei6NS1aHiJc52WLA96JfusGOxLUykzLrOvMmWOdp/5mGS9IoYdD5Da
 NjBWDOlqD66/PLJm88arwJmMVGKtvwNL9yIINYdGqos3xiC6ph97dQaxPkmfkSZRWx5o
 Kexw==
X-Gm-Message-State: AOAM532N080SLVrPD+gegBLmTnc5NG6wdj1q+A0TES+zdDXf2rJiwLFn
 eRa7oAD/DW6t/f6+pWOrXSWIje9N2J4=
X-Google-Smtp-Source: ABdhPJyrSwEa8C4r8tPFRJUiLSfIl3EbO2/wXiYUiFiOA0uQ0iHVq2vJqoZxgzrkki6wjkgchHtS1A==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr15098901wra.288.1615045027082; 
 Sat, 06 Mar 2021 07:37:07 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c35sm8732533wmp.3.2021.03.06.07.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:37:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/14] hw/char: Introduce SH_SCI Kconfig entry
Date: Sat,  6 Mar 2021 16:36:16 +0100
Message-Id: <20210306153621.2393879-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'SH4' config for architecture
specific features. Add more fine-grained selection by adding
a CONFIG_SH_SCI selector for the SH4 serial controller.

Add the missing MAINTAINERS entries.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210222141514.2646278-5-f4bug@amsat.org>
---
 MAINTAINERS         | 2 ++
 hw/char/Kconfig     | 3 +++
 hw/char/meson.build | 2 +-
 hw/sh4/Kconfig      | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26c9454823a..8405741e910 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1397,6 +1397,7 @@ R2D
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
+F: hw/char/sh_serial.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
 F: include/hw/sh4/sh_intc.h
@@ -1405,6 +1406,7 @@ Shix
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
+F: hw/char/sh_serial.c
 F: hw/sh4/shix.c
 F: hw/intc/sh_intc.c
 F: include/hw/sh4/sh_intc.h
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 939bc447588..f6f4fffd1b7 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -50,6 +50,9 @@ config SCLPCONSOLE
 config TERMINAL3270
     bool
 
+config SH_SCI
+    bool
+
 config RENESAS_SCI
     bool
 
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 196ac91fa29..afe9a0af88c 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -31,7 +31,7 @@
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
 softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_serial.c'))
+softmmu_ss.add(when: 'CONFIG_SH_SCI', if_true: files('sh_serial.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
 
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index c2008c6a0d2..47240aa97b7 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -20,6 +20,7 @@ config SHIX
 config SH7750
     bool
     select SH_INTC
+    select SH_SCI
 
 config SH4
     bool
-- 
2.26.2


