Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD9332949
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:55:36 +0100 (CET)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdln-00010p-E9
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdJt-00042C-QT
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:46 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdJs-00061I-Bg
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:45 -0500
Received: by mail-ej1-x633.google.com with SMTP id hs11so28189040ejc.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHShbnL609j0MJwdNHwq2VVMU06lFz5d39e3YBTfjlM=;
 b=mRFpumqGEVNpA5+uXsEp9koWeDRufmAAmXZLwzLV4Tcrstu4LRzGsDsi/TQ2PctIKW
 vA8Ywtru2zNvPspdE6H7pZ/CczkY7uqubKdER+cw5H22hwIv70KPaDz772uYmY/Jq4I/
 BxoFUF6gveqgNtgf6bTcmtbbi/nE1fvXnzamkSlTzOjdOHX91JTmnIdXpFjlbKxklBcS
 Gf/bQToSM6vq3jLhWhWwvLs+tItMpO8yXlBTxl/6WLZ/Muggr4uaXhmSQNaRK1qF2W69
 kK4RpaqnGSwjJ7EFzmFOvkmpuRNbRj63+CnX++ZHkYXtTjbmEYfQjaPKj21TmFSfZC+2
 r52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fHShbnL609j0MJwdNHwq2VVMU06lFz5d39e3YBTfjlM=;
 b=de8uKM3MN0Xh28+9W5M7GiIOHw1+e094ABdtFThNvnKDVcm/Yb9I2QEIvycMi3bY4j
 FtNBb5P6/eoPm6aArzh6ugSeLl1xZ5f7lpP0IBxITcs7qnXXXdWhUyEAfvFcg6ghYSrC
 ImIf92JYsvgVkULMNJ7SIrM6imct6EtIOWPMS/AXlWhGDz0ju/9FlIolRJuNfIZhWUox
 MvChiys6wLfuQHl9wN/BMI1AoDhEQP2cS1mQ0ASkeLuntrYkTjCl4V3X6SYbXHLN08aP
 27dlCBA1VVSkDNktXzGuc4Eqrqvg5AV4MhUWz3OrZA6cldViT/lyxEW1m/X7pj1C/fa+
 VRYw==
X-Gm-Message-State: AOAM532avM2HkdN+9n3/OZ9gUO+tsdBLVPMic8VdczK/tprZkAdgb/C2
 94ZZjxdpP4aJmuJEH1J7ug3APBkBmg0=
X-Google-Smtp-Source: ABdhPJyY2xGphduKpgVYRaWxoNMhcq+mwZrwrSUUsvqT+POJQ06HZtvvr+/I9AgxZOE8TDIE/Pbd1w==
X-Received: by 2002:a17:906:1a44:: with SMTP id
 j4mr20957347ejf.401.1615300002725; 
 Tue, 09 Mar 2021 06:26:42 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n2sm8340751ejl.1.2021.03.09.06.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:26:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 2/6] hw/mips/gt64xxx: Simplify ISD MemoryRegion
 read/write handlers
Date: Tue,  9 Mar 2021 15:26:26 +0100
Message-Id: <20210309142630.728014-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309142630.728014-1-f4bug@amsat.org>
References: <20210309142630.728014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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


