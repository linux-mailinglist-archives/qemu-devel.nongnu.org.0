Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5E5A9D87
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:53:11 +0200 (CEST)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnRG-00040m-W2
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1z-0001uu-Ac
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1x-0001VT-J2
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:02 -0400
Received: by mail-ed1-x52d.google.com with SMTP id b16so23297092edd.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Lk5BY/vi+uufGxfeaoPsPFkaEoogAtEkcyasHy2Pd/s=;
 b=T/VT8ej2MA+bhgjSNhcAaLTUCsOeH4BnvgFqhXJRk+38MWqFya/yFnToyKgca8MX2T
 lIdFBGu4i4v05f8AhfZhLW/qrvcY+K116o8C+OheOcvV3yZlkk0mO2lBBzc6OKB/EU+E
 BSCGtWt1C5UDdab14C7KirnMxCTE3jb7hGMOdsso81Y5t5mUd45cvxcn8MFboHWCHEPP
 3JR0AIVflOC21PSzpiFJSgLP4nHuVQpfn5rkZZGRqaX6K/RhV1AJFRXSR8enbCNGPTVY
 GgmfSB4fHjWsCEQLXzz3mOzXWl+HGF2JflOIE+NJHyEJsssr1um0u355yvHxsToEx6aO
 N11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Lk5BY/vi+uufGxfeaoPsPFkaEoogAtEkcyasHy2Pd/s=;
 b=qVw3o1ZsnC4nEEgWB2sLT4uywx7uhFsuBx1y365SLByrUXEJN00mgxQU3UYybBxHP5
 6yPZoy4SkAgvK74zujA7nzH/0MJWQ8zHVKH8/ybK8GL2jRBwgf5a8xoDUW1Yvf2lCTuP
 W1szPqG1IwRfVnPcUujZfd4bXLbLyo2TryG3dYJBIZpFu27bFXoMT1ZzU8Dq7OfG9bHX
 cPrZe2EwqbyIIi97WuTF96vJTfigvncAUxkqdWXA5YOh7t3XIGJl5xPtxWYq0rPNwqwr
 XbLzhbERhLD+C3qmpeiWW/aVA/cBEvU8WMaFEc9CY8y4LrPcW+7HLuXPUqplPoKxcRUs
 A+/A==
X-Gm-Message-State: ACgBeo0cmyPvRgBGX9KdvFRRqmCsf4zGVKBfTYVflHtlmPaHylBODZqs
 l9GjD9KTrssQ0MN6LTpiXLDHmtCah20=
X-Google-Smtp-Source: AA6agR5VBymWPOCnwVkwqPO/hgGuMq6/MiGuvLjXFnnv751pHnCDEd2cZa7ABCkEqE0SYO/h4UU0ag==
X-Received: by 2002:a05:6402:5cd:b0:446:5965:f4af with SMTP id
 n13-20020a05640205cd00b004465965f4afmr29444178edx.12.1662049620117; 
 Thu, 01 Sep 2022 09:27:00 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:59 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 13/42] hw/isa/piix3: Add size constraints to rcr_ops
Date: Thu,  1 Sep 2022 18:25:44 +0200
Message-Id: <20220901162613.6939-14-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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

According to the PIIX3 datasheet, the reset control register is one byte in size.
Moreover, PIIX4 has it, so add it to PIIX3 as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index b54ff1c948..c8c2dd6048 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -290,7 +290,11 @@ static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned len)
 static const MemoryRegionOps rcr_ops = {
     .read = rcr_read,
     .write = rcr_write,
-    .endianness = DEVICE_LITTLE_ENDIAN
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
 };
 
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
-- 
2.37.3


