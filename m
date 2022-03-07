Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96084CFBB2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:43:21 +0100 (CET)
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRApk-0005qE-OP
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:43:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALr-00032T-JB
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:27 -0500
Received: from [2a00:1450:4864:20::429] (port=45681
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALo-0004J3-Tx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id p9so22348005wra.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m5DGgo+E7BroNY51ivtexNtcI1JQgvQ9mCnqaaS1YQ8=;
 b=Ms5zq5cos4yjabzeyCR8vXS9YSWh+AlAkrqentH/zydV9NXu/aueDL91yEqb8qoZeC
 XA6ib9Dfr8/RhbExHQ6oHMd1KdS28QfHOhYjtBBoOn78nKT6li10jNMHTaOayDhYGEiy
 B+LtG/QODNxuaXe3XQsOvblX3evegG8uLhWrGA3O/FGZO7PO7gPpEdv6oHiGcSswawoS
 wKL3G6/2q52kFgQqgqewt+myY92no6dDl3dJeTXgpDhzrMKixe2wSUKP3zGv7Tq3SSlV
 aw64ja3T1sordpSFi6S98zszv37dUvqgcfam+sn+mq0ym9tcGvlxmlIVIOQDQ6KkcEti
 unVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5DGgo+E7BroNY51ivtexNtcI1JQgvQ9mCnqaaS1YQ8=;
 b=J849pmy1jCBnyG17MjJNvihg9rl4Ga+ckclNtXub8wgrBse+nLFjBS2N0YMRXqi/YJ
 nT30PdI4ylxn4kpCYLGp5vjAmCPyPoETPsQh57cA8kYSB00w1aC1Z5nYE2iygbnWLy5+
 KleQKTottg32VlD842elW4c7/DWPJ7TJJQXHp82dMMozx71b3tE7j162JH4i9FJgLWwm
 we6VsAPW/zfh6MDQaSZMoXHXwVaSlQJOh3IXsfQ1IY9asz44HDqyMBeLAmRprXE+RoBv
 FCQlECguXpws6IOGSMusYQVOi9E530MeL0IOWP+OYYh8E7go3y0BoUmAF1RFDKzt5xRO
 t2cg==
X-Gm-Message-State: AOAM5303J3AReZfcWMkVbOWa8L2N+qxjPucZG0R89QoJmCwOZhurnl54
 qBiqMnDbu1z0E1MCksrUx1RDU+HIgjE=
X-Google-Smtp-Source: ABdhPJy2pc/2Jog6rL2FzmKDnO8QHRy9mDyQRB3Qw2KlG2xHSBaAbq0FrQVv1Pe92ejsC0pcgL4aXA==
X-Received: by 2002:a5d:64af:0:b0:1f1:e6e5:c7cb with SMTP id
 m15-20020a5d64af000000b001f1e6e5c7cbmr5064929wrp.642.1646647943222; 
 Mon, 07 Mar 2022 02:12:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5006000000b001e75916a7c2sm10852834wrt.84.2022.03.07.02.12.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/16] hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved
 during migration
Date: Mon,  7 Mar 2022 11:11:54 +0100
Message-Id: <20220307101207.90369-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Based on commit e735b55a8c11dd455e31ccd4420e6c9485191d0c:

  piix_pci: eliminate PIIX3State::pci_irq_levels

  PIIX3State::pci_irq_levels are redundant which is already tracked by
  PCIBus layer. So eliminate them.

The IRQ levels in the PCIBus layer are already preserved during
migration. By reusing them and rather than having a redundant implementation
the bug is avoided in the first place.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220217101924.15347-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index c7480bd019..4cbd0911f5 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1006,14 +1006,11 @@ static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
     }
 }
 
-static int pci_irq_levels[4];
-
 static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
     qemu_irq *pic = opaque;
-
-    pci_irq_levels[irq_num] = level;
+    PCIBus *bus = pci_get_bus(piix4_dev);
 
     /* now we change the pic irq level according to the piix irq mappings */
     /* XXX: optimize */
@@ -1023,7 +1020,7 @@ static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
         pic_level = 0;
         for (i = 0; i < 4; i++) {
             if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_irq_levels[i];
+                pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
         qemu_set_irq(pic[pic_irq], pic_level);
-- 
2.34.1


