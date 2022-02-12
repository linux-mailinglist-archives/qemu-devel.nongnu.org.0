Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD94B34CB
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 12:47:00 +0100 (CET)
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIqrj-0006F6-Cg
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 06:46:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIqgu-0006lY-9O
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 06:35:48 -0500
Received: from [2a00:1450:4864:20::52f] (port=38541
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIqgs-0005bW-Cf
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 06:35:47 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g7so4049050edb.5
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 03:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jayhIIJozMhMTxnS3EacI646wOAHDq5Mf0vul/q8lwg=;
 b=mr/FFNd8sEZXmvNKWPZOd2PJfIdIJrbjNvtxxED7GImXmmOMz8ejqGkRSFzFIF3cVS
 EjK94YmlcmOWvQo4YDwFlxZAL23nEjXe5eZWxJO+bYMJIUzRVwGbCg709Kps7t+75hok
 SdEe4QnZQcae0SGr6RAMwSGWDtoWCX41/QzwdQSQBxRSJjaTNRRjJo5m0vZUThsuhnm+
 OmKYbDz1j2XXofl0EpUdRGXVeS5YAVlb4UjNFPc5AkiahEk8XTXfO41vspqgifyMsf6o
 i82cMI70mFivM0HGFJTKaN8qn4KXGDVoKCq/4C1fd8a2oFIO3QHvqGk1zURU/ZvvVhfu
 eu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jayhIIJozMhMTxnS3EacI646wOAHDq5Mf0vul/q8lwg=;
 b=BUFXFOio4mopQWXfKzICm6fiS7uDhVXF54JZVMtxjp84fqSjauZKH5qlidx/z9yqi6
 AizpO7Z3W1wfFAWY1WNGAla/kyfqUmNbtcIBz9efjhIit4bFJpkaZmQ2gDM9YFhHKplk
 MLmsMPqPtOrWa4TKi1G5S7+DIvIl4hDzIngga8eCXXDDKcPk1CtqguqhNXksOS0NzQ+W
 FuO/xK2lm684VPsmPNlIddd1DRuxUuY2UYWVqSFO7YsGt8dtuAc8lzEUdttcCklA0mzs
 tFhUyzc/kn21ND0whjLFElMivxfMeHYWhkqdSUJUCFtl+8m5Pwp39OZpc7l1HtlMocnh
 gFYQ==
X-Gm-Message-State: AOAM531edGrH4JT/thc4SoJYvAu+Av7x3+w321iDWH5K1CyoxkXVCPQI
 WzTC3JZQ8iI2y4aJaIDUv3UVtDxeTiIJtocTzhA=
X-Google-Smtp-Source: ABdhPJxFKLV+NfhF+a+GYZUmxzKcW0NgDJKvN+0aEUptqNF0F9D4zkXAWqHR5KEBwF6BSfaVj8po7w==
X-Received: by 2002:a05:6402:2920:: with SMTP id
 ee32mr6310037edb.310.1644665744927; 
 Sat, 12 Feb 2022 03:35:44 -0800 (PST)
Received: from osoxes.fritz.box (i577BC145.versanet.de. [87.123.193.69])
 by smtp.gmail.com with ESMTPSA id z14sm889288edc.62.2022.02.12.03.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 03:35:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] isa/piix4: Fix PCI IRQ levels to be preserved in
 VMState
Date: Sat, 12 Feb 2022 12:35:18 +0100
Message-Id: <20220212113519.69527-5-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220212113519.69527-1-shentey@gmail.com>
References: <20220212113519.69527-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that pci_irq_levels[] is part of PIIX4State, the PCI IRQ levels can
be saved and restored via the VMState mechanism. This fixes migrated VMs
to start with PCI IRQ levels zeroed, which is a bug.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 964e09cf7f..a9322851db 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -45,7 +45,7 @@ struct PIIX4State {
     qemu_irq *isa;
     qemu_irq i8259[ISA_NUM_IRQS];
 
-    int pci_irq_levels[PIIX_NUM_PIRQS];
+    int32_t pci_irq_levels[PIIX_NUM_PIRQS];
 
     RTCState rtc;
     /* Reset Control Register */
@@ -128,12 +128,14 @@ static int piix4_ide_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_piix4 = {
     .name = "PIIX4",
-    .version_id = 3,
+    .version_id = 4,
     .minimum_version_id = 2,
     .post_load = piix4_ide_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, PIIX4State),
         VMSTATE_UINT8_V(rcr, PIIX4State, 3),
+        VMSTATE_INT32_ARRAY_V(pci_irq_levels, PIIX4State,
+                              PIIX_NUM_PIRQS, 4),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.35.1


