Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF002E827E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:51:04 +0100 (CET)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6md-0002Uj-CE
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lA-0000ml-0L
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:32 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6l8-0006KE-HZ
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:31 -0500
Received: by mail-wr1-x429.google.com with SMTP id c5so21032226wrp.6
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y8tdHrr32AcTrGaePHWGuuNZrRgCCpLKfmCaddeiLIU=;
 b=tIoU2fNFWfJO1TdguFoffRALA2Mb9w9Ky+qqy+g7/FpgFpR5M8vSjzYKPmH9FKTwWr
 ProVR81wDZWA9Yh0mtYGNs8iCvLsxYKRDkJzFPc7FxgVFRAe/CSLEOKy+76sW7/+kRqK
 BWgYCw2zLQluoNFOJ6S1eWOxKzYQGwlrhTr5KC+9nsg/anKu0bYgVAqS8xykIMM7uuc7
 u8ON5KEeQ5nASfND2R6mXA/g0h2fBrW5g98i5L/MTiDmg9wo94KtEyde0upUW2Ofisj3
 obQ7YUfN1ZHoe/AMChh54/yd1wSOYYkc+hSLOeUuGY1wGaTx6h9WLt9hG6T/giZq2sU1
 3p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y8tdHrr32AcTrGaePHWGuuNZrRgCCpLKfmCaddeiLIU=;
 b=p95PBwf+Mv4HQNoIeoWgf35W+OyZ+tlZsHRp2K+re7T99y9KnDnqMKpkHpTzfXvM8y
 xDIqG289p89+8d07iCsPXU+Z2HpqELCsRO8w3RugiOsh5ArxzAPgLQBxnZ9WeAc3ej1P
 8vF4X+aifv601slfg26MtsPYm26ttx1z2wQc66AsnCLyO9nmYfYrX1FYfEzzpd72v2wV
 GzjuRVtMTXXw3SXXADAJS0DqJuLucwwkpPxmKfIlM2cp4R7Uml5eoF8t+aaW9FBdf68X
 nbk/F9UW08ovMRzg3n32ShCT7J5e3nlQ/Z9syuon2olrusZF5zp/DP2tZL4iGgl/6fTj
 Embg==
X-Gm-Message-State: AOAM5302hPUN7/3WTQzwqzjw1rvahEVwRh/kVuaySoNmWa/5gaLtWQJe
 T/27voXhZiHG6E9hxr07NXVWpS5I3ek=
X-Google-Smtp-Source: ABdhPJxl9Q0YxAwCTFKUW23rLMeEBfzrJOCLpgLuNLWHTkRvOxFwYb0NnDOpnmJ0tn/p8ACf5xxC4A==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr66459196wrr.326.1609454969088; 
 Thu, 31 Dec 2020 14:49:29 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id o13sm49363262wrh.88.2020.12.31.14.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/18] hw/pci-host/bonito: Use PCI_DEVFN() macro
Date: Thu, 31 Dec 2020 23:48:56 +0100
Message-Id: <20201231224911.1467352-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the PCI_DEVFN() macro to replace the '0x28' magic value,
this way it is clearer we access PCI function #0 of slot #5.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index efeba29011f..4c903d4f682 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -626,7 +626,7 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
     phb->bus = pci_register_root_bus(dev, "pci",
                                      pci_bonito_set_irq, pci_bonito_map_irq,
                                      dev, &bs->pci_mem, get_system_io(),
-                                     0x28, 32, TYPE_PCI_BUS);
+                                     PCI_DEVFN(5, 0), 32, TYPE_PCI_BUS);
 
     for (size_t i = 0; i < 3; i++) {
         char *name = g_strdup_printf("pci.lomem%zu", i);
-- 
2.26.2


