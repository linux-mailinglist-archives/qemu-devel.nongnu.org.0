Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798B2E8E41
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:03:19 +0100 (CET)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAX0-0006vc-GS
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAL2-0002n2-5L
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:57 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAL0-0005oD-RV
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c124so15927959wma.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mtm6xGks3wIDWzm8K1daiyeu/mqK77Oxsfa8BCzbgxA=;
 b=iXPRz+sbgWhjjcWF59Fe0++PLdYchOLdyVW2AhUZFjAOd7C6lHL3GC4qjlX789L+aq
 5umNWyYujTSOkahM9H6AVfyXZWakaZ0JIR0njZ8peVIRzupvvQjLBMtvH60g21Jte2Hy
 aftJCwN+wg/Clz3I1F6EnQ6SBhTlq/PQgNNCp638FmaxNgKc5EOOjNjFCwFJ8WRX6/vU
 fIWEgpJ8ggdPApiXiuLDmL9ClnxLrHCHpTQeobGR5F3xr2Wb2aCVGD8T4OWVXakx4DVg
 a6dzTGMXpshEpLae/kp4xeEKgDZlCSCSiK/7Wy/EPZTTuYBxXi/ORKwIBqC6YqwdxRXZ
 95Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mtm6xGks3wIDWzm8K1daiyeu/mqK77Oxsfa8BCzbgxA=;
 b=UZP9E51DxqD2aGPu99Bv4/TS5+nYhZe6jTxjmtTPsDUEZ6BvtBVKLhmhCIZZFxmVoD
 3bpdUfHYWzAOSG5hRr8cqFi0OF1yxLBBPslE3S2hMLWWXpzi8YWNs8plurEZlqSs1c9r
 kq/eAtXKLtJUVvrvxH3ra/GhyitikVOaQm7O43csprdpBrCKr2kUqoRp7FyPKp8vEkM0
 5ISKTkpbW4pPjs2cofBL5vNis4eg1zYgE1EY18QCSK3Mxoc3VcGmWt72QRt+8e0VCLoj
 7vxgoV9qsrTzeaIJbOBdi9PnCfAI+DuQJO2vl7L5wnlI1maDiwf7I4O7jWsl+YakHMeE
 ZjIA==
X-Gm-Message-State: AOAM53237GY50Uz5i84U3omH3h0Jv6Mc0Bbyb5KkPbLdwIRe/M5fQEvz
 q03dcSWkDyGqAXQ6nYlYiZeg63fLUCU=
X-Google-Smtp-Source: ABdhPJz1NHryXW3zPKbi3hKvziZ9ZtbHNq1p7EjrCmjfLVq2LT10kebncRcNFKOzTpcbMHAZNweaBQ==
X-Received: by 2002:a1c:7dd8:: with SMTP id
 y207mr24668215wmc.181.1609707053367; 
 Sun, 03 Jan 2021 12:50:53 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id r1sm90031579wrl.95.2021.01.03.12.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:50:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/35] hw/pci-host/bonito: Use pci_config_set_interrupt_pin()
Date: Sun,  3 Jan 2021 21:49:52 +0100
Message-Id: <20210103205021.2837760-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace pci_set_byte(PCI_INTERRUPT_PIN) by
pci_config_set_interrupt_pin().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Message-Id: <20201231224911.1467352-5-f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index c2f71e5a132..2a2db7cea69 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -728,7 +728,8 @@ static void bonito_realize(PCIDevice *dev, Error **errp)
     pci_set_word(dev->config + PCI_SUBSYSTEM_ID, 0x0000);
 
     pci_set_byte(dev->config + PCI_INTERRUPT_LINE, 0x00);
-    pci_set_byte(dev->config + PCI_INTERRUPT_PIN, 0x01);
+    pci_config_set_interrupt_pin(dev->config, 0x01); /* interrupt pin A */
+
     pci_set_byte(dev->config + PCI_MIN_GNT, 0x3c);
     pci_set_byte(dev->config + PCI_MAX_LAT, 0x00);
 
-- 
2.26.2


