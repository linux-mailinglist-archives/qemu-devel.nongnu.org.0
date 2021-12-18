Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA71479AF8
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 14:15:19 +0100 (CET)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myZYU-0001oV-MT
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 08:15:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOg-0005UK-Qj; Sat, 18 Dec 2021 08:05:10 -0500
Received: from [2a00:1450:4864:20::430] (port=46995
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOe-0003E3-Oa; Sat, 18 Dec 2021 08:05:10 -0500
Received: by mail-wr1-x430.google.com with SMTP id i22so9312299wrb.13;
 Sat, 18 Dec 2021 05:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/1cFQTZGSmutFWyDr1r0PKcIlyY0ksRKQJO1ZCewVA=;
 b=HI1A2NgnIVCuzXwDavJARF8J3mH+LCFBBl1keRinrAJSUQuEagYX5kVJ/+hQGxWZqI
 S/jgykCdIUYD8hm5pKIFXmHXQjSz7Wflx4rtPK8acRNsXfTW66uO49rnTT1BYOpMYJ91
 wK+G3BDaUfXSZGocRDvK7qlf9D5tK/tsKLaYiHoISPkOC4NppAqojRpW24NrjbOMMhUr
 DfzYY9L5lEyhQLUJmVfrcAMYO8xfiA68hCNU1a0dTdveeZqgX5W1VDF5GTXoGYx2vaPk
 +x6VFlH8c/0XYvHBsEcc/0G3RZp/pTERQk31Y/HmnQn3yCGKtaE6GKzgZchI1CVJZUP6
 F2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8/1cFQTZGSmutFWyDr1r0PKcIlyY0ksRKQJO1ZCewVA=;
 b=W9DDOcYOQ6CnKvoalwWhvlAwhQ9oEOgX0I48FCh/WOMGn+LKtyo41klJLeEP0Sf9hH
 OqLOJ2atmONPawofOEkoCcWHmemmoKgzgCZd5BkuGPXWu/7A01N50BIF7yqgDUaU+4/y
 AWhW6tZeAgR7/nw4lM+ZqxORmbD0ZaUAQs7YH0EHsE27mFS83v3YGSksR+F6I2gRsLkf
 rmyzjHYeEcMR4udMNgNTwpeUNsRUyPiEOtRrexVaqRDnEr5V1t/qwJ+h5ySC0UKRUMLJ
 lRan1xR+DG5n+0d8TjhTbwhNyVRpSz710+//N7QL4j7BCyQDcXtfz1zo1UuBluck2Pmi
 DzeA==
X-Gm-Message-State: AOAM533xpZ29sArHpHqlnxbEhbgoGouqZdUuJ+oHRF7dJ1I0BfQWXVca
 TdrQ5aJoRh5K1X7dThga4ndULR/IOoU=
X-Google-Smtp-Source: ABdhPJzinvdzh16oEvDcoKPyGLRL4VlpZWXSHHQeFx8690Y3ZRi0z4BitHYtQ/sL/2YBJelq3ljFvw==
X-Received: by 2002:adf:d843:: with SMTP id k3mr466019wrl.303.1639832703030;
 Sat, 18 Dec 2021 05:05:03 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m17sm9929469wrw.11.2021.12.18.05.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 05:05:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] hw/input/pckbd: Open-code i8042_setup_a20_line()
 wrapper
Date: Sat, 18 Dec 2021 14:04:37 +0100
Message-Id: <20211218130437.1516929-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218130437.1516929-1-f4bug@amsat.org>
References: <20211218130437.1516929-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the named GPIO lines are a "public" interface to the device,
we can directly call qdev_connect_gpio_out_named(), making it
consistent with how the other A20 input source (port92) is wired.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/input/i8042.h | 1 -
 hw/i386/pc.c             | 3 ++-
 hw/input/pckbd.c         | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 1d90432daef..1cd53b8d221 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -21,6 +21,5 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                    MemoryRegion *region, ram_addr_t size,
                    hwaddr mask);
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
-void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
 #endif /* HW_INPUT_I8042_H */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a2ef40ecbc2..e2f7cd4aec6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1045,7 +1045,8 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
     port92 = isa_create_simple(isa_bus, TYPE_PORT92);
 
     a20_line = qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2);
-    i8042_setup_a20_line(i8042, a20_line[0]);
+    qdev_connect_gpio_out_named(DEVICE(i8042),
+                                I8042_A20_LINE, 0, a20_line[0]);
     qdev_connect_gpio_out_named(DEVICE(port92),
                                 PORT92_A20_LINE, 0, a20_line[1]);
     g_free(a20_line);
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index baba62f357a..7fd4477d742 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -680,11 +680,6 @@ void i8042_isa_mouse_fake_event(ISAKBDState *isa)
     ps2_mouse_fake_event(s->mouse);
 }
 
-void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out)
-{
-    qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_out);
-}
-
 static const VMStateDescription vmstate_kbd_isa = {
     .name = "pckbd",
     .version_id = 3,
-- 
2.33.1


