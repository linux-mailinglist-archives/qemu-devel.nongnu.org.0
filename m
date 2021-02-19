Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E68A31FBD5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:18:20 +0100 (CET)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Xv-0001ik-6X
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73s-0002lX-JH
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:16 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73Q-0003eQ-Av
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:16 -0500
Received: by mail-wr1-x435.google.com with SMTP id a4so6663388wro.8
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hW6NWM9nxIp2NHn3uTePVNYECZHKfxs/17qf7kFubg4=;
 b=Ob1xp9NU47jaz+Y0lDxQFURRxnJNpi1p1aB6YNv+/6WyCobBxScM5nz2IOlC/b4dqi
 WXQ+bZdmyTav3zS1Lh7rK4QfQd03HJXBNJMHWni1jiA6SojfKa/PE7tnC3PvmcqRpQTu
 xODucm0HA9oCKXGseDNKl3zsQYi9zRYWW3fNQjkvtsYv7Vw13AmlzxWzIKN5N/xlXf7y
 befj7SpttiPS3aKYIUGUa4vwgaRAKeGqmt8OGtkGN7+1gN7sW9+vyMTr9mw6Tsy5UMD9
 rmFlPD3l+30Kx/yAUSvuRXwbj2Lk3WDoeLPpa5zGEoOqBOZo0SrpAnb1VlAqBkQFjRTi
 7+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hW6NWM9nxIp2NHn3uTePVNYECZHKfxs/17qf7kFubg4=;
 b=gT/hOq3L3Ll3HQFFoA38fjEYip1qK/E8B23gBJKIRyRhen/rnbjaPl11J32OJ2P+no
 Hg1LxB7luz+GDHsMKk7AJwxPQZB4HLL53fmOGAP0VmysOwLMwU3jWpuQGu3+KEHbyo3v
 dVdDNkFPa+cgrO10IKpvF9Riew+f7SSFffdYGPqFiyhzqasTvE/cxvvheAcVIsimeZY8
 6maIC3E5Vwu2h8xpXzWEAAgzMjB3cnQP67w38jZRv55GNcB6cwpRqzbJFt0QlyFcXy4w
 UvdXXKjgLVQU5t8JVaVY8Cd+84osmXxLS9g4376ALXHQJtwB1k4c10cklWwo9kffZueW
 frdQ==
X-Gm-Message-State: AOAM530qWEUj5Pc2JsXqsKs3CYD2jczrbdbdBDjKtPGvr/2kQGO+I0RA
 aTz4wzlqJb46N8p9OkZIzN8RO5Dd8NaZNw==
X-Google-Smtp-Source: ABdhPJwNgCxfaoG5gq2K/ECRqsfFaQ7ckgu2A5WQTEgW6hfj+LVS3ArdKsqfoyrnd5IzfXshHMjTsw==
X-Received: by 2002:adf:fb51:: with SMTP id c17mr9774726wrs.145.1613746006899; 
 Fri, 19 Feb 2021 06:46:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 36/44] hw/arm/mps2-tz: Make UART overflow IRQ board-specific
Date: Fri, 19 Feb 2021 14:46:09 +0000
Message-Id: <20210219144617.4782-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The AN547 puts the combined UART overflow IRQ at 48, not 47 like the
other images. Make this setting board-specific.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index aca8efba6cf..779fdb9a544 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -111,6 +111,7 @@ struct MPS2TZMachineClass {
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
     int numirq; /* Number of external interrupts */
+    int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     const RAMInfo *raminfo;
     const char *armsse_type;
 };
@@ -760,7 +761,7 @@ static void mps2tz_common_init(MachineState *machine)
                             &error_fatal);
     qdev_realize(DEVICE(&mms->uart_irq_orgate), NULL, &error_fatal);
     qdev_connect_gpio_out(DEVICE(&mms->uart_irq_orgate), 0,
-                          get_sse_irq_in(mms, 47));
+                          get_sse_irq_in(mms, mmc->uart_overflow_irq));
 
     /* Most of the devices in the FPGA are behind Peripheral Protection
      * Controllers. The required order for initializing things is:
@@ -1036,6 +1037,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->numirq = 92;
+    mmc->uart_overflow_irq = 47;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
     mps2tz_set_default_ram_info(mmc);
@@ -1059,6 +1061,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->numirq = 92;
+    mmc->uart_overflow_irq = 47;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1082,6 +1085,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 10;
     mmc->fpgaio_has_switches = true;
     mmc->numirq = 95;
+    mmc->uart_overflow_irq = 47;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
-- 
2.20.1


