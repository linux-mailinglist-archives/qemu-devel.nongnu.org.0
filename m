Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CB53C35F9
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:55:50 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2HCg-0001EJ-1f
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7d-0006ln-7c
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7b-0001N4-JI
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d2so17307302wrn.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y5KSWA1vpNfd6M+9kKkYOA/X1eCKYfSslffBBwebk8k=;
 b=u42PE4D/A64yM3hVVOsKQ6T9Ox3DEH4QSxhPeKCdkKcJ5CV8jm4xpopXdCyDxiciQn
 l0BoezHDLZRRCZC9jh0d6r4Hawepz5MSXWQaPbWUW2ww4NV6JssMhRosFtugUMEM3gBK
 gtw29zXQAjb0w2MmATHWsrGncWPLlws/B6EWqZpIItFZ821bN+CcSL/WPx0osecu0d8k
 B2cKFfNWHJtX9lvqVn442gtoK8OK5+Z7A5/8Y5WNvz+vflUYgAbMMg5r6x46IdSgSJaW
 Hr/Z9fZBiaxAsQ/TidCKnWii3HAv/tRe2x7U1ndGHOiuJHkm7KHZ7aOkVq1+r5umAWsd
 5AJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y5KSWA1vpNfd6M+9kKkYOA/X1eCKYfSslffBBwebk8k=;
 b=GcGUlnn9lWkEhTUr0fKiHH6O465NiXhhtI4dcv9FUv39OkL6xI2ItRi+oTz65a2K42
 l2n4WDUUGn8jY4uNSz0zmHA+r21qWFrxmJbeL8v3goFs2YDU0gL/VC4XJcVZobZhc4z+
 wrtMcSFthZZy17JJ4CNOpRSOSaPG0zE9UnTSfuHNOGFK5w7AX9Ezxjay2EDetR2cnweg
 /D2Deckk2/2/QumAcjMV4wxOysifJoCRtNoDny7/BaZJxvKVM3Xk0GKnlAi9WPrFyOjH
 DhoNp/RpzbJueZQl+M9RgAtdkfA3X9T+k2sSzG5A9jFbVdr5iVWyJDpYOyZMnRzDhaWm
 hyyg==
X-Gm-Message-State: AOAM532Q45Nxrq05FbfkztrdedPc3ymbZ8efAoaf1uVFDwE9ORidmin2
 /OMUnM1BgorK1YzHk1SUds6xzskxCxrUdQ==
X-Google-Smtp-Source: ABdhPJzHusJlhsRGpTqFNpxpqY9393zpSLuZAKBdsFH0AdwK8KmCcY1fnZ64NcHMbizOeT+hXu+eMw==
X-Received: by 2002:adf:dc8b:: with SMTP id r11mr50164893wrj.363.1625939434077; 
 Sat, 10 Jul 2021 10:50:34 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x8sm1465068wrt.93.2021.07.10.10.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 10:50:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [NOTFORMERGE PATCH v3 8/8] dp8393x: don't force 32-bit register access
Date: Sat, 10 Jul 2021 19:49:54 +0200
Message-Id: <20210710174954.2577195-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710174954.2577195-1-f4bug@amsat.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
---
 hw/net/dp8393x.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index a9224a5bc88..71c82a07c23 100644
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


