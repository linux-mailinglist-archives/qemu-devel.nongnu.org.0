Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880E57313F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:36:44 +0200 (CEST)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXrP-0000gu-IY
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZX-0005dW-KI
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:16 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZV-0004nk-Ig
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:15 -0400
Received: by mail-ej1-x62f.google.com with SMTP id z23so1959259eju.8
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9XQpAVVa+3dtCEcvCfjqa0rHoodOeuf9kZTm/epB7Ms=;
 b=DOlnRLFpHP/71kzJ5QngmoyjxKkX5i7lGHP98UO50uzjy04nDbZhsA80JfySe8F4+j
 aL7ak6oG5pACbYZJSn9Om7EGkA71oZFduOjVIMzQtueVuiJEYdmzXIW98RazXv8CrmEp
 uBNtaSBXJNHo/fby0iYYJcLuSmLc7NlQZrHsjBJ3xb19zLgN50jChyF2DQ4CdRkwc4Fg
 ogwNmZBoTGY/4TLBkg1c8blF00z3FWHxvL63KY/nX8JCO1HQKPNhK4te6n6KsmX0zTS7
 s92xc2GP8fkOPwNU/xZ9hllZYK4mT4NeV5K91lAA1wnhNrimbo4kLwBy2RkJwa/iJqbl
 s5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9XQpAVVa+3dtCEcvCfjqa0rHoodOeuf9kZTm/epB7Ms=;
 b=rYLd63KpTkqhsMdxPXGsy61STGjc8qMESb3BvZxTVJOX3gZMifX8M4EszTZ3LLvkrJ
 2FVZGEbmOrCFf3qoDGHkFywJMfoqfd4rerbsn3fvY4t5lZsMXWURf4ZoBOrLYhjO26nn
 7f1L0kOBFrWGPY7L2t4jLxRDqvnUhqSkfpJKD87eHgFb+MC/W+LZwTUcEBW3wfVbJInR
 cMNQVDK+7kfXCL9CJ08eRjDRueIcD+mBG6IkQ/b8j/CciInfTlrnbIjNglN03O4fAMLt
 gv/qOpG43k2afnmPweq57uJvnK40obr+nUpJRibwzTTLv5PdHTdK1B72Z7nVOsYY67qx
 o2cw==
X-Gm-Message-State: AJIora+GQt/xowDIpZT8F/FDyM7FB3ys/PtczeySATd1eDqIh/HvKmaA
 8fOYzvfiiedBTUnkkgLPMf230xaH6Uw=
X-Google-Smtp-Source: AGRyM1tYAt0erS8+iRcfvJcRmStKvTX+JRKRguTYIcRrqQ0B+AvqK6SvWB1eJnn2gp2wYEupyk2C+Q==
X-Received: by 2002:a17:907:7255:b0:718:cbb7:4b5c with SMTP id
 ds21-20020a170907725500b00718cbb74b5cmr2221355ejc.231.1657700291866; 
 Wed, 13 Jul 2022 01:18:11 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:11 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 02/11] hw/i386/pc_piix: Allow for setting properties before
 realizing PIIX3 southbridge
Date: Wed, 13 Jul 2022 10:17:26 +0200
Message-Id: <20220713081735.112016-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patches will need to take advantage of it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7ad677e967..f129da29ac 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -209,7 +209,8 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
-- 
2.37.1


