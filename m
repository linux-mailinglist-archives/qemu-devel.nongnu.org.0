Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC39660982E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 04:23:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgqm-0002p6-5B
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4f-00074D-2y; Sat, 22 Oct 2022 11:06:09 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4d-00024P-Kk; Sat, 22 Oct 2022 11:06:08 -0400
Received: by mail-ed1-x534.google.com with SMTP id e18so16102332edj.3;
 Sat, 22 Oct 2022 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYMDu5mDtutX+XNVdVht0ydVyFdG15WL8sqXmNN4tBA=;
 b=HptB+jNrTG3gUDRS+yjnYBx9LlNe/Kni/LyiGjFBv/Pz6g4bbFD35oBF0lvpmBE0qB
 kXvdZSLDGbsebi9xAIWIMQlYFzhhjxXLFiU4nspKAWXcC/+0iAHTN6jaZ0SV77W3E44J
 1lQt1iDe2Xzt6l+6sc1Em6T6M30UXZCKozcEz06WPA5p7kkDhvSpqZZ7eTGRlSFVFm66
 1Zfcf/ZhuYCrxhrtFN6cCLF0jB0x0n31rKgels0BNjkeVzTr3EkEFwwetLKveYDHJyCb
 e8mOhhMsvxaIsXMbW3ODqpk+E3F+McOlwmukslABilxDl70C4rj1o4P10+8uTfJc7c78
 NM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYMDu5mDtutX+XNVdVht0ydVyFdG15WL8sqXmNN4tBA=;
 b=juUTxlQEyFgwr1u+MDoUIi/8cKd+hDXlYroDCUSDP80jZbs3k03VGamInQzmTX1VmV
 BHdMd7lwxFVzvWc3vSSOFwd5uNG0vmuq69cj8VhlLe/THWlUrPRVq1SvOr1fBnI0tq0g
 DZ6CcmgaOb5gfIKovmv0jMh0MG+mip8ePToYFSgooA4kRvjfHT0cNG56fYujy12S1CBu
 Cvb/1nbFz7Ek2dT1vVGHwfsMHULwh8ehxUvaAiFE/eFyzkR97xku7EZPwmFXa+abhkbF
 8cKg7RK/fvB4Wrjn05StgyRov85+WgAtuM9xgHVCuI9/78uZzl6MDo2zG6rNYRO7MCP5
 Y8Eg==
X-Gm-Message-State: ACrzQf2IChNL8lezmw9FfMOJzvCUccyQ6m/xeRoU9n+wo2DwRwbC6RoU
 y1Fq5jcp4mc/qLw4EbTDefwkKi8mzU+kyQ==
X-Google-Smtp-Source: AMsMyM40/y0MNwVHIF20gdocya9iuXBTPTIihe/L3TaEATLx8J30/CnGZpfSMdfWACzPWx8FZBxSQw==
X-Received: by 2002:a17:906:844f:b0:78d:8bd1:ee8c with SMTP id
 e15-20020a170906844f00b0078d8bd1ee8cmr21102605ejy.262.1666451164562; 
 Sat, 22 Oct 2022 08:06:04 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:03 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 06/43] hw/isa/piix3: Prefer pci_address_space() over
 get_system_memory()
Date: Sat, 22 Oct 2022 17:04:31 +0200
Message-Id: <20221022150508.26830-7-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

get_system_memory() accesses global state while pci_address_space() uses
whatever has been passed to the device instance, so avoid the global.
Moreover, PIIX4 uses pci_address_space() here as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 723ad0a896..0bea4aefe7 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -301,7 +301,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
     ISABus *isa_bus;
 
-    isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
+    isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
     if (!isa_bus) {
         return;
-- 
2.38.1


