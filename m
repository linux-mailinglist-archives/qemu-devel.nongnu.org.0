Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5102E3C3B90
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 12:41:04 +0200 (CEST)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2WtT-0004gQ-C2
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 06:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2WpH-0006Xk-9s
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:43 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2WpF-0004GW-MF
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:43 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 k31-20020a05600c1c9fb029021727d66d33so7844629wms.0
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQHrIVyJXHGkbXKhjJkgDmeXIckABcf9Z2uGW8Bcsrk=;
 b=YnWfC6kmGSLD14yMHKdJVN71izMjnT7G8HrVPcZ6dKQm5tnKfo5aBeuWVnKGsRavVk
 DSvKhaLSOsz3czG2DaTmqtcXe18jtUYMaYlIPyG5eLOMyVu16DBz8zK2jPwtDYDu3RTE
 D3v3vE5iJCEpt0PKpTtJhhxNTG+4XxS5pptsPOhq5ihNskD317qVm73GIhub0UlbI8V/
 ht0HjnZaIvpz9mppjRtx8iK84CuQUnJOxIi/ex61zFHCLgeFUno0EzUIuBr8FlM3M3+h
 IFHuWJAy8g0uH2VVBcb7KAgNlyHZ+yzygDzPubps2Sougtf649OHxdJh/TLb64l66HuV
 taFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qQHrIVyJXHGkbXKhjJkgDmeXIckABcf9Z2uGW8Bcsrk=;
 b=XqcyyBGNPO7W4ETbjPWBaCcgoCoiAXtd9c+1WYZZnCo2iF7oWpSmt4ASGLowMLkid5
 /8RREUEVrTLf9axkt47s4arUnS1aiqyvmU1o5sUoJlkm9tq+BaB3yS81/RlzX6QUU3yr
 +H2/cz/OHsnvZ9AejPsL8Gn046bwAh2MJApDP1EDETm7/E5VJRxFoV5DIqeUTCwuc8id
 fBuBWF37AJSs6PX5u42QzHsD6np56E9LKx0JOg3+Zh2IKnbr5CBFNyfnIkughxpuO+ML
 3h0/wX72P899559wTquGnyyrkzutygeogWm2a3ngTSxFuSgczwYkFUNmTgoRgkMgwXq3
 tCeA==
X-Gm-Message-State: AOAM530/ld+lzAtLgZBlLFlo0TeRTEQ9qQboD0u/XzrGtrKJoEv/QKMq
 ooW7kECL54+AHRrSABqCtB85mf6hjNMqGA==
X-Google-Smtp-Source: ABdhPJzP6tHeY/Njq9hho1h/0Ifv2N6B0etrXP45aD4LUN1240Qw+Zuaa4S4qheJzbg3prqtAm/Fag==
X-Received: by 2002:a7b:cf03:: with SMTP id l3mr25864087wmg.110.1625999800268; 
 Sun, 11 Jul 2021 03:36:40 -0700 (PDT)
Received: from x1w.. (static-189-95-145-212.ipcom.comunitel.net.
 [212.145.95.189])
 by smtp.gmail.com with ESMTPSA id i2sm16896993wmq.43.2021.07.11.03.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 03:36:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] dp8393x: don't force 32-bit register access
Date: Sun, 11 Jul 2021 12:36:12 +0200
Message-Id: <20210711103612.2661521-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711103612.2661521-1-f4bug@amsat.org>
References: <20210711103612.2661521-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Finn Thain <fthain@linux-m68k.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" set .impl.min_access_size
and .impl.max_access_size to 4 to try and fix the Linux jazzsonic driver which uses
32-bit accesses.

The problem with forcing the register access to 32-bit in this way is that since the
dp8393x uses 16-bit registers, a manual endian swap is required for devices on big
endian machines with 32-bit accesses.

For both access sizes and machine endians the QEMU memory API can do the right thing
automatically: all that is needed is to set .impl.min_access_size to 2 to declare that
the dp8393x implements 16-bit registers.

Normally .impl.max_access_size should also be set to 2, however that doesn't quite
work in this case since the register stride is specified using a (dynamic) it_shift
property which is applied during the MMIO access itself. The effect of this is that
for a 32-bit access the memory API performs 2 x 16-bit accesses, but the use of
it_shift within the MMIO access itself causes the register value to be repeated in both
the top 16-bits and bottom 16-bits. The Linux jazzsonic driver expects the stride to be
zero-extended up to access size and therefore fails to correctly detect the dp8393x
device due to the extra data in the top 16-bits.

The solution here is to remove .impl.max_access_size so that the memory API will
correctly zero-extend the 16-bit registers to the access size up to and including
it_shift. Since it_shift is never greater than 2 than this will always do the right
thing for both 16-bit and 32-bit accesses regardless of the machine endian, allowing
the manual endian swap code to be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
Message-Id: <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/net/dp8393x.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 4057a263de3..45b954e46c2 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -588,15 +588,14 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
 
     trace_dp8393x_read(reg, reg_names[reg], val, size);
 
-    return s->big_endian ? val << 16 : val;
+    return val;
 }
 
-static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
+static void dp8393x_write(void *opaque, hwaddr addr, uint64_t val,
                           unsigned int size)
 {
     dp8393xState *s = opaque;
     int reg = addr >> s->it_shift;
-    uint32_t val = s->big_endian ? data >> 16 : data;
 
     trace_dp8393x_write(reg, reg_names[reg], val, size);
 
@@ -677,11 +676,16 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
     }
 }
 
+/*
+ * Since .impl.max_access_size is effectively controlled by the it_shift
+ * property, leave it unspecified for now to allow the memory API to
+ * correctly zero extend the 16-bit register values to the access size up to and
+ * including it_shift.
+ */
 static const MemoryRegionOps dp8393x_ops = {
     .read = dp8393x_read,
     .write = dp8393x_write,
-    .impl.min_access_size = 4,
-    .impl.max_access_size = 4,
+    .impl.min_access_size = 2,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.31.1


