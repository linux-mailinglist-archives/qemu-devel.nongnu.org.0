Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FECC32EFF3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:23:33 +0100 (CET)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDEi-0008Fp-AP
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCb-0006c2-TV
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:22 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCa-0007Fe-Iz
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id l12so2717428wry.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHShbnL609j0MJwdNHwq2VVMU06lFz5d39e3YBTfjlM=;
 b=t2QvGL/fUV8WMz/TEXngi7meDFvL+PTNNNLHCxnpiVfd8QksSwyKa1Nqf0amOdu/jb
 m1nOo3js3mwz3o6J+Wbg0cS9s9nqY086tQdc/ycdn2U0ZEmaAZ6GXNGMIux2a+jdYj5Y
 JR+KCgkOvsKQ9sERI59eWAImE7Y1XmE0unbaotDF7VgCejQDnvDc6mlXOsH3CCSd86IO
 8tL1n+2wgLJNx+ueFR4L7a2nyKuSgJ/Uu8Jg/lo1xmXXX5P5SV7DGUSjJRoYtI4vsnD4
 LNwv8AiSngBDQmsJ+bCAc9Pflv2CeysSml7B9hA0uu7ekBmmoNVWI8QcSprYbpUnkwFt
 7UmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fHShbnL609j0MJwdNHwq2VVMU06lFz5d39e3YBTfjlM=;
 b=udW7gY4Xtca8tnrw/s3faKWWUsE9l0IxEmFUC5qoKq+GJ0VbvO3L+Hyg1rjYYvV6zZ
 blmBElWLct4e+UNRFxdXBBB7exhD+2SFwIrFDeZN7SLr1sPo+UzbjtymUEpe/hg4OqPP
 ejkEQiW/BKK2N/g9+r07Hj7vLayLsOWeqTkU8UQCbYQt6sXw7JhWUuwm7+4oxPtAisTD
 vCI2EEFuxEB1alXmEjaRNt5My/sF2rc5RSJfjGg3jkfLnqqz7Ff8EEhjfRhS+W+jZRwd
 D3d7cMtQLH3KM68qsy4JcTUYYagO+Iwuzx7DIlu0tMooyxbIN49NFbcq6CbG02szMO2I
 XVgA==
X-Gm-Message-State: AOAM531w+hptn5hLRedKp16JkrdYLmDIl/WGwjlwJ9fwhq0vxtXr9e9z
 avjBSwkEbp5oUY4YJjXpugwELWdGkTY=
X-Google-Smtp-Source: ABdhPJxYaYHsMWLVOa/RlkupvG2ev+qVey1GEs4vvZL/yBRPzxyLs4c70zIgsNzkwCgUiNj85MMvDg==
X-Received: by 2002:adf:a406:: with SMTP id d6mr10274176wra.141.1614961278887; 
 Fri, 05 Mar 2021 08:21:18 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h62sm5259597wmf.37.2021.03.05.08.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:21:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/mips/gt64xxx: Simplify ISD MemoryRegion read/write
 handlers
Date: Fri,  5 Mar 2021 17:21:03 +0100
Message-Id: <20210305162107.2233203-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305162107.2233203-1-f4bug@amsat.org>
References: <20210305162107.2233203-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ISD MemoryRegion is implemented for 32-bit accesses.
Simplify it by setting the MemoryRegionOps::impl min/max
access size fields.

Since the region is registered with a size of 0x1000 bytes,
we can remove the hwaddr mask.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 6eb73e77057..99b1690af19 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -385,13 +385,12 @@ static void gt64120_writel(void *opaque, hwaddr addr,
 {
     GT64120State *s = opaque;
     PCIHostState *phb = PCI_HOST_BRIDGE(s);
-    uint32_t saddr;
+    uint32_t saddr = addr >> 2;
 
     if (!(s->regs[GT_CPU] & 0x00001000)) {
         val = bswap32(val);
     }
 
-    saddr = (addr & 0xfff) >> 2;
     switch (saddr) {
 
     /* CPU Configuration */
@@ -695,9 +694,8 @@ static uint64_t gt64120_readl(void *opaque,
     GT64120State *s = opaque;
     PCIHostState *phb = PCI_HOST_BRIDGE(s);
     uint32_t val;
-    uint32_t saddr;
+    uint32_t saddr = addr >> 2;
 
-    saddr = (addr & 0xfff) >> 2;
     switch (saddr) {
 
     /* CPU Configuration */
@@ -976,6 +974,10 @@ static const MemoryRegionOps isd_mem_ops = {
     .read = gt64120_readl,
     .write = gt64120_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
 };
 
 static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
-- 
2.26.2


