Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15D4609A29
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:02:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgjs-0001xE-7z
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4U-00070e-5l; Sat, 22 Oct 2022 11:05:58 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4S-00022R-NP; Sat, 22 Oct 2022 11:05:57 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z97so16067004ede.8;
 Sat, 22 Oct 2022 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhL+s2XxnSnUyjtcmi53XqolC/lv7/2Xksgo6ny9BDs=;
 b=OvNyTTFpqelgJINOPLULD9ZVMb1A1t2ub/dpH80HNuFItQoolPgZgmKRhZbtY6GP/5
 EsNf2c3Rps84Hd535VQOoBtlK0u6uHc3Fb+eHY/crl5rE3HDtSVD+gpU/Tqtm4C5gdFH
 Nt9Z4jcrounWxhozo8c5ZK+vnKdkQjsFnezmD+7Rlj8V58Kkue8GvUhUoGxp38tVJURp
 sWIPTpPROsGRos8SFT8ECIbdCSHdFijWx5QHSOzt6y5cJE4otrdDpBsi1jgxDwWq69Uy
 3MHpzhRCTll7JiDM3SfqA4/G3RTZ0fPrbZ11+HRONhfS+bnlcg2RGa43z4nWR8/jAFn5
 80KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhL+s2XxnSnUyjtcmi53XqolC/lv7/2Xksgo6ny9BDs=;
 b=Lz3Zsosw7H1B/yKLYf5vNO1GkrWrHi6jCkm9kG+UurOLq4kV/UkG/IpSm0Ztu/1TVL
 Bh9d/j6xfcEe97izKEu8TAi62qjG0VwMV7sYLnZfn8Tm7lxueSEEkWyblaNSpRt/f3eP
 OdZjnCc5v6a9fkGk774KbWr6rbYnYjndatfpmBJkdoR8gi4Vab+shlpYimLjkFDCqVd1
 hUZitXClahgM+rlFTlc/5WUsSjlb2L09G7GAPJx0MowsrztJyHQJzU8rF20lYjMCId4v
 k/aerpKBii2KvGxJXtr1CizJRJ+TXTy28Ki+rU8/6CmTP/IkF6/yqbgplBSTOQuswAsW
 nITg==
X-Gm-Message-State: ACrzQf1Qi2WIUDWam30SRF2KL/+cFKfNXLM9B91ws0rJEBwW2/SnpmVV
 N7NCPIgwxU/OPotX5mWsHgiwzExqcwomCw==
X-Google-Smtp-Source: AMsMyM4DlHwCvP39dzlpqD3SYniNoUB/ufYhfXbrx15EezSKkQEsUXJ7ct6EOuIqQsXz68hwYGcWDQ==
X-Received: by 2002:a17:906:7621:b0:750:c4a3:8fcd with SMTP id
 c1-20020a170906762100b00750c4a38fcdmr21274632ejn.180.1666451154636; 
 Sat, 22 Oct 2022 08:05:54 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:05:53 -0700 (PDT)
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
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/43] hw/isa/piix3: Remove extra ';' outside of functions
Date: Sat, 22 Oct 2022 17:04:28 +0200
Message-Id: <20221022150508.26830-4-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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

Fixes the "extra-semi" clang-tidy check.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 44a9998752..04895ce2e5 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -375,7 +375,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
-};
+}
 
 static void piix3_class_init(ObjectClass *klass, void *data)
 {
@@ -410,7 +410,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      */
     pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
                  piix3, XEN_PIIX_NUM_PIRQS);
-};
+}
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
@@ -418,7 +418,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 
     k->config_write = piix3_write_config_xen;
     k->realize = piix3_xen_realize;
-};
+}
 
 static const TypeInfo piix3_xen_info = {
     .name          = TYPE_PIIX3_XEN_DEVICE,
-- 
2.38.1


