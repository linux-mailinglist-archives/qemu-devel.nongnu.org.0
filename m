Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D9AF81F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 10:39:42 +0200 (CEST)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7yA9-00067D-48
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 04:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvo-0007X1-5A
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvn-0006T8-5A
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:24:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44654)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvm-0006Sg-Vp
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:24:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id k6so11297426wrn.11
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 01:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=JhWZs3kYQOWNeKlb2pNkOyfw/b4rNeIZqwng3Q4zhcI=;
 b=JmtN2VKcN//7eHqucT+t4BPfWMNn5X9lnItNl/AeZkgsjNVUQNNhU0K+WaFe78574H
 5BB/4czriSYAnHxv5KC/pU0yLKqN0XLBMlkzDpLlxAceaZR8CV2tklGcvgwO/dpRSBQs
 8UcI/S3tUe8SAQKpqC8q9Iwo5EZzkki0LuD0y4q1NVfGKEIAbBz0toi/B3BAiWq8B+hy
 njIkIgLEQRJz3pADSNOdWfn0aJnAXVLE3HdSkOLqbCmTdngx+Kl1qNs3o1iBD+XoFyv0
 YMyL4mGwc3FNfjIyqq+sVXvbUC/P7mwRtvpnsuDEvunlAr3kHc952yU53m61dI8y2hrw
 dilA==
X-Gm-Message-State: APjAAAWNZ+tYRTUmeZyrP402XPMZuT5aoMWVquNHmyQMNT2KQ+kBzEM5
 r8gLQxjSBKyxJJpmb0PaBitA+Q==
X-Google-Smtp-Source: APXvYqzlnc+gSSy/GNPrH+PSb/iYULk/PXbNQ8Mk70Oaj5xbwlAvH3mZ73UihGSr+hbyQCqSsvlh2w==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr31265090wrn.142.1568190289848; 
 Wed, 11 Sep 2019 01:24:49 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id 17sm14025065wrl.15.2019.09.11.01.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:49 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:37 -0700
Message-Id: <20190910190513.21160-12-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: [Qemu-devel] [PULL 11/47] riscv: Resolve full path of the given
 bios image
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
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

At present when "-bios image" is supplied, we just use the straight
path without searching for the configured data directories. Like
"-bios default", we add the same logic so that "-L" actually works.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 10f7991490..2e92fb0680 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -72,14 +72,14 @@ void riscv_find_and_load_firmware(MachineState *machine,
         firmware_filename = riscv_find_firmware(default_machine_firmware);
     } else {
         firmware_filename = machine->firmware;
+        if (strcmp(firmware_filename, "none")) {
+            firmware_filename = riscv_find_firmware(firmware_filename);
+        }
     }
 
     if (strcmp(firmware_filename, "none")) {
         /* If not "none" load the firmware */
         riscv_load_firmware(firmware_filename, firmware_load_addr);
-    }
-
-    if (!strcmp(machine->firmware, "default")) {
         g_free(firmware_filename);
     }
 }
-- 
2.21.0


