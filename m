Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFD11FAD0C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 11:49:06 +0200 (CEST)
Received: from localhost ([::1]:33860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl8DJ-0003sf-8Y
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 05:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl8A9-0000ov-TA; Tue, 16 Jun 2020 05:45:49 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl8A8-00024v-Ed; Tue, 16 Jun 2020 05:45:49 -0400
Received: by mail-wm1-x343.google.com with SMTP id d128so2379389wmc.1;
 Tue, 16 Jun 2020 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bx4xNdWeU6C7TR4mll2UBf3V29qn2VJEgsPuF0yeqI4=;
 b=CLL75c8uzvdrd26sq1LzFvBCsCuUU33kDB6iXE3xilPTMwirEr4kW8CNn/jDDjuxyZ
 PJwuJs/EQ0FeZjw1zBXFQ54qVBo6sAW4QeNvDsYELmVm8pdsypsFmQ8Xr/0cm+9uH14r
 a3h+Aela2G4l3o1pc7GsnN8eFSKvq1SUDttd9reUAHL79vhfYTz80BvBD/1t42yWk1AA
 jXPxk7g6LR9AQZtns2iTT2ppd4SoD3Nqv5FaleAAj3zQ4d2jPuJus+QFL0w1soNLNyEC
 VVEiUjDRtQu7bMuFObW8D4/0WuEXiJJQgPjIw4xvllval466C+DPc71iHNcb4m4dM7pE
 FmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Bx4xNdWeU6C7TR4mll2UBf3V29qn2VJEgsPuF0yeqI4=;
 b=A57BVKQ3yidfFd9YB6/89J8kp583CIVFE+vAhvNHvzf9mYs1kCtMVl72Gzfb8JSW0E
 w4/DtD1sz/V5fx9DoDzyid9j5RWcTj4FrvQsUYkVCYlCrmXH6cAT4NIikpuyLlmrFoaQ
 5sGk8xxMnrNaItNenIEwtU+DlVI7E90yhthA3cEOe5OHmxSOdVME8BWUIP+vQUevqkLC
 +8q2uKEa9a4eUDZ6vfE3y5em3eqsMhuXS4jqgiNkF1hg4IQDCIReU2ZyRNeAXiGT8jL8
 7nuddDCafT7tOi+4aCrxSbcAoTHIIMxo1ZooWRN5JtLAx2xPMEM0wcrMh9SlrmtGYof0
 UEHA==
X-Gm-Message-State: AOAM533yzvM3rPL5nYPC5F0rmWJf3YAw23lYjAfP7QEK5Uus7JotiylJ
 WD6kSbIsL79KSYxAAU/9rLnzPV07
X-Google-Smtp-Source: ABdhPJxbhSF8DGknQMoNW6WPUKmcJzJhHB1NirO5EATbNDXVlvXpYHE1rPnk604ZhzEzEiAhb+oSlA==
X-Received: by 2002:a1c:3c1:: with SMTP id 184mr2243919wmd.40.1592300746586;
 Tue, 16 Jun 2020 02:45:46 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o82sm3254017wmo.40.2020.06.16.02.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 02:45:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/misc/pca9552: Trace LED On/Off events
Date: Tue, 16 Jun 2020 11:45:41 +0200
Message-Id: <20200616094542.25415-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200616094542.25415-1-f4bug@amsat.org>
References: <20200616094542.25415-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/pca9552.c    | 7 +++++++
 hw/misc/trace-events | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index cac729e35a..a3d0decbff 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -17,6 +17,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
+#include "trace.h"
 
 #define PCA9552_LED_ON   0x0
 #define PCA9552_LED_OFF  0x1
@@ -45,9 +46,15 @@ static void pca9552_update_pin_input(PCA9552State *s)
         switch (config) {
         case PCA9552_LED_ON:
             s->regs[input_reg] |= 1 << input_shift;
+            if (input_shift < s->nr_leds) {
+                trace_pca9552_led_set(input_shift, true);
+            }
             break;
         case PCA9552_LED_OFF:
             s->regs[input_reg] &= ~(1 << input_shift);
+            if (input_shift < s->nr_leds) {
+                trace_pca9552_led_set(input_shift, false);
+            }
             break;
         case PCA9552_LED_PWM0:
         case PCA9552_LED_PWM1:
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 5561746866..ed80d0d1be 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -206,3 +206,6 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
 # grlib_ahb_apb_pnp.c
 grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
 grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
+
+# pca9552.c
+pca9552_led_set(unsigned id, bool state) "LED#%d state:%u"
-- 
2.21.3


