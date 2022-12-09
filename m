Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D309E6484D1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:16:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3f6U-0004xB-Eh; Fri, 09 Dec 2022 10:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6R-0004uF-Cs
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:56 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6O-0008BK-04
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id u12so5499786wrr.11
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KLG0xoWyhhBW457w36XngZbKe3qdM+Ngb1nAJqophKg=;
 b=We5OO8WGgk3OHfscabDzU4Z+6VSJRt9eWXkDMTBwSFMonWU6rdGG61v8AB/V/L8luk
 zfRhilsHISj4NqNPOEoYUg7RFO/nV6xtT6mFc7NbcogabSm7V0pRC1HHb3T4A7jMVjWM
 LCUOxaSk39EC7TkTAA2os1MpDjnobP4i0l5ON5B5l0wrBW6YRCq8PWqOFp8cggRSpVnT
 1jAdghcjF6TvRFF7xeyR7HQJp8FEEU9j344eRBm0lcv3V4/diye7eyfqwkSMdE6vXFwe
 nKSobNB/50ylPr+1ni1J8+AHWft3+CSiFtlTSw/DnQ7XnEKzg8Wm10eBDmILJOolbikD
 1LgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KLG0xoWyhhBW457w36XngZbKe3qdM+Ngb1nAJqophKg=;
 b=bagEzM6clceBVt2QLBwGfWGQHP/GQq6vGpBx9pz7WwQveDpiZ5JiMP2QVqPEHFJuiv
 rrMmJM1GgQD4C0vZOKRSyuVbyo2dBLm+DRAPNd8XHCVnO3qIt2m3+8fOJ5hFQm7iAE9z
 36JOMk+WYAkJbPwgNehDl5BLCxGjZzlrl2jVSLHOrek+aQnhob3KvpO/4EnlGrlawozD
 V1xDBQLGigmjF8s5oy+i6tbiZF9YrNkAeVYhMqSQIJJdMqYE5RUyCURASUCzQDu1VjXC
 5V1IByWKX940jI4OmYNn565miR1/LU5vljOvPbf//OHU+bef67IGJrRTx7qPSUKYQJdN
 33Hw==
X-Gm-Message-State: ANoB5pn7KYbRwvy+2jiGHe+tFq6/kS0xs1LV8nPIzTq57guM1obgWy17
 aiitsU5tLfwb+kikSSn2lmv28jPtorQCWEmxkA8=
X-Google-Smtp-Source: AA0mqf7KTolED3NukMSBOYFAqg4LiphIzSkg8f9Qhul4FzwznqLhFphmkVzTL2udc62ILm1LeAWgZg==
X-Received: by 2002:a5d:68cb:0:b0:242:6f93:d558 with SMTP id
 p11-20020a5d68cb000000b002426f93d558mr4119540wrw.67.1670598950359; 
 Fri, 09 Dec 2022 07:15:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d4-20020adfe2c4000000b00236488f62d6sm1611230wrj.79.2022.12.09.07.15.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 07:15:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH-for-8.0 3/7] hw/mips/gt64xxx_pci: Manage endian bits with the
 RegisterField API
Date: Fri,  9 Dec 2022 16:15:29 +0100
Message-Id: <20221209151533.69516-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209151533.69516-1-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/gt64xxx_pci.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 1b9ac7f792..8c9ec80f7c 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
+#include "hw/registerfields.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/misc/empty_slot.h"
@@ -41,6 +42,9 @@
 #define GT_CPU                  (0x000 >> 2)
 #define GT_MULTI                (0x120 >> 2)
 
+REG32(GT_CPU,                   0x000)
+FIELD(GT_CPU,                   Endianess,      12, 1)
+
 /* CPU Address Decode */
 #define GT_SCS10LD              (0x008 >> 2)
 #define GT_SCS10HD              (0x010 >> 2)
@@ -210,6 +214,13 @@
 #define GT_PCI0_CFGADDR         (0xcf8 >> 2)
 #define GT_PCI0_CFGDATA         (0xcfc >> 2)
 
+REG32(GT_PCI0_CMD,              0xc00)
+FIELD(GT_PCI0_CMD,              MByteSwap,      0,  1)
+FIELD(GT_PCI0_CMD,              SByteSwap,      16, 1)
+REG32(GT_PCI1_CMD,              0xc80)
+FIELD(GT_PCI1_CMD,              MByteSwap,      0,  1)
+FIELD(GT_PCI1_CMD,              SByteSwap,      16, 1)
+
 /* Interrupts */
 #define GT_INTRCAUSE            (0xc18 >> 2)
 #define GT_INTRMASK             (0xc1c >> 2)
@@ -983,15 +994,17 @@ static const MemoryRegionOps isd_mem_ops = {
 static void gt64120_reset(DeviceState *dev)
 {
     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
+#if TARGET_BIG_ENDIAN
+    unsigned cpu_le = 0;
+#else
+    unsigned cpu_le = 1;
+#endif
 
     /* FIXME: Malta specific hw assumptions ahead */
 
     /* CPU Configuration */
-#if TARGET_BIG_ENDIAN
     s->regs[GT_CPU]           = 0x00000000;
-#else
-    s->regs[GT_CPU]           = 0x00001000;
-#endif
+    s->regs[GT_CPU] = FIELD_DP32(s->regs[GT_CPU], GT_CPU, Endianess, cpu_le);
     s->regs[GT_MULTI]         = 0x00000003;
 
     /* CPU Address decode */
@@ -1098,11 +1111,11 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_TC_CONTROL]    = 0x00000000;
 
     /* PCI Internal */
-#if TARGET_BIG_ENDIAN
     s->regs[GT_PCI0_CMD]      = 0x00000000;
-#else
-    s->regs[GT_PCI0_CMD]      = 0x00010001;
-#endif
+    s->regs[GT_PCI0_CMD] = FIELD_DP32(s->regs[GT_PCI0_CMD],
+                                              GT_PCI0_CMD, MByteSwap, cpu_le);
+    s->regs[GT_PCI0_CMD] = FIELD_DP32(s->regs[GT_PCI0_CMD],
+                                              GT_PCI0_CMD, SByteSwap, cpu_le);
     s->regs[GT_PCI0_TOR]      = 0x0000070f;
     s->regs[GT_PCI0_BS_SCS10] = 0x00fff000;
     s->regs[GT_PCI0_BS_SCS32] = 0x00fff000;
@@ -1119,11 +1132,11 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_PCI0_SSCS10_BAR] = 0x00000000;
     s->regs[GT_PCI0_SSCS32_BAR] = 0x01000000;
     s->regs[GT_PCI0_SCS3BT_BAR] = 0x1f000000;
-#if TARGET_BIG_ENDIAN
     s->regs[GT_PCI1_CMD]      = 0x00000000;
-#else
-    s->regs[GT_PCI1_CMD]      = 0x00010001;
-#endif
+    s->regs[GT_PCI1_CMD] = FIELD_DP32(s->regs[GT_PCI1_CMD],
+                                              GT_PCI1_CMD, MByteSwap, cpu_le);
+    s->regs[GT_PCI1_CMD] = FIELD_DP32(s->regs[GT_PCI1_CMD],
+                                              GT_PCI1_CMD, SByteSwap, cpu_le);
     s->regs[GT_PCI1_TOR]      = 0x0000070f;
     s->regs[GT_PCI1_BS_SCS10] = 0x00fff000;
     s->regs[GT_PCI1_BS_SCS32] = 0x00fff000;
-- 
2.38.1


