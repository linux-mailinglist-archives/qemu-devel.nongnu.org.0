Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C83697AB7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFwu-0000Ji-IC; Wed, 15 Feb 2023 06:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwr-0000CW-Kt
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwp-0003Un-VE
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so18779984wrv.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KWBMTPBOXVEPBtL+jKysUaPYg0aeu32TIgmDoExenEI=;
 b=TKP16wvAMif3HO7BeuBC2yNApYdP09tbUWagscNS3w6/9ugaogdAKUu6DLERK8nGtk
 EI2rja5zxSvRdhkOuPtvkcbr6AWQ86fxv7pc+yTFBiiRqhapcGLseLUSs2zBezxkUjC+
 ctEdHOVtEtRTcimVFMLxF+eyTSUimIxTMMM2an4npjGOVkVxLeuNFAHXdgzHJosMDUJr
 iRKcUPlpTNHNblkQg+RdtjoOjlJQTQxdJCXkw9DVomNHh69u1qe++h6HDUP3Tl/k/H7u
 VKMRrMMis3TxWTr9RZw+PZohq/rrdO3BhRkLkAAg7QYhVmGsQXxqu5uyhn3SxSSSpcpx
 rR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWBMTPBOXVEPBtL+jKysUaPYg0aeu32TIgmDoExenEI=;
 b=bB9eqly+gZbv/c6EqOec7ev8xWH6sDP1vLKOSHvbZlncJBFKWd7kkWAKpyr/b9SjaB
 Rzmpe+4jn40UA1clMTEWjHHDVO/HH+xMQKvrLdvgEzGXBgYgKdCHe1zGmPBNPrhEp/XV
 DwUl2p79DB6WUUXZKBtt+/aUQb0KYXjhOfsgCBvjcI2ui5vW0N6Y8rlN+566P0l4EqPj
 b0Y2L1UPkLMvWMfnASJ0mDeZtavz3AACDQ0AseGchTxKRNDFdTXihAwDfb26sws7bK4o
 miBO/4GV/TiceAPo3o7bjFihBBI49bq05GDozkTbgr5C2VSyzOMpcOBIGlYBn6FWbSyA
 1ygQ==
X-Gm-Message-State: AO0yUKWzgiBkRFxQzq/c2h9mw6dzGNXJLQASpoPuQSQGmDdQKRi+FP8C
 fxlj1lLrgMPKRRgtpfN7LrJe9GSovCN5rDt0
X-Google-Smtp-Source: AK7set8DtVyd6eS4Oa/xCdRE1Ak78IiiSO2St5A78PqgiBFdPc3YCINSdmtpEcufpMDouUW6kiwv3w==
X-Received: by 2002:adf:de04:0:b0:2c5:5954:cb7b with SMTP id
 b4-20020adfde04000000b002c55954cb7bmr1148358wrm.34.1676460458519; 
 Wed, 15 Feb 2023 03:27:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d534f000000b002c55306f6edsm9388712wrv.54.2023.02.15.03.27.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/20] hw/ide/isa: Remove intermediate ISAIDEState::irq
 variable
Date: Wed, 15 Feb 2023 12:26:57 +0100
Message-Id: <20230215112712.23110-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The intermediate ISAIDEState::irq variable just add noise, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/isa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 5c3e83a0fc..ad47e0899e 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -45,7 +45,6 @@ struct ISAIDEState {
     uint32_t  iobase;
     uint32_t  iobase2;
     uint32_t  irqnum;
-    qemu_irq  irq;
 };
 
 static void isa_ide_reset(DeviceState *d)
@@ -73,8 +72,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    s->irq = isa_get_irq(isadev, s->irqnum);
-    ide_init2(&s->bus, s->irq);
+    ide_init2(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
 }
-- 
2.38.1


