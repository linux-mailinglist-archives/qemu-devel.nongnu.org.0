Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0828F4C0048
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:42:58 +0100 (CET)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZBh-0000cg-3E
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:42:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7Y-0003e4-Hb; Tue, 22 Feb 2022 12:38:40 -0500
Received: from [2a00:1450:4864:20::52f] (port=39646
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7X-0002nR-03; Tue, 22 Feb 2022 12:38:40 -0500
Received: by mail-ed1-x52f.google.com with SMTP id u18so38756108edt.6;
 Tue, 22 Feb 2022 09:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EeijvT97pxct3XtQrY7wd6pgmajnCOIp6/PW1V9+uSs=;
 b=OprOH5JVGbyK8c7bBVByBfVFT/LN7rbx7Kte5uco2bCfziq9kJRWhcHDllj3kOhEA4
 uI0toyOS/qmKtn7Em1YCvNeoEc4ungXNDFxk6/LPCXQeZC9Pzg901WB35PaM/ClirZeM
 OPAEGn7aL9MPf5EldgXjvPcYB0vFcmjavxjJFNjbyYTzKjY/DQ+TnyF5x3EBRmI2Dn2I
 WpEV5rBX9GdKVQQQ4zugGKWIwTf3VX60Vo8pesr06t4vtpntNmghCukr222hQZL/Ii/2
 kiVB4ucvYsu355iPkjRyJ/lD5xsVjqk6PkxvzHEf0Vha5Ta9Ho03TGE2wCU2Y44n08e/
 c1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeijvT97pxct3XtQrY7wd6pgmajnCOIp6/PW1V9+uSs=;
 b=efRW07JVOUX/Bjj5ZAt/RuCy2ZtI+CDsXD+KLDAYv+zXgipN87m4SvvQUzuvT3JbzW
 4T3PyKXPaJ8kmNtccnepQToUaAJ8pjSrA4qTwNnPQ5rxVo3ZKNMnj2ky/QHIZujmTAP/
 g6Oh84zIryLG5cz9RYO/3AznJujFrF2dvQEsUPVcw0z86R9oaG/7vC+AZwpkVuimPR7V
 JIWOsQERq2ly+WcH3ZTC64F1ak0LicfiZAB9m7VaGOtTDgTAjxawkKhZZNoG8xkc7e0y
 /8Zq9x/U3/OI/JGf8xQ+MXH1PnHwln0ExlG11TWuwn4mqrih3sg4IYAodp126qOIs6O2
 1deA==
X-Gm-Message-State: AOAM5338kKYjJshzp0IWpAWvcRxdseKIPu0r5kOqVnF9ShSJSBdv7oVi
 NTGrui2GDQJEKRZIAxGDNV/euMU9q2s=
X-Google-Smtp-Source: ABdhPJynBDcvBlFxZwnQfR9wCQwXMkDGBlSeEYVeYOUIieeUUIN4B1m5G4YycceOOueuO1e5SgBrnA==
X-Received: by 2002:a05:6402:440b:b0:410:5fb4:7225 with SMTP id
 y11-20020a056402440b00b004105fb47225mr27067778eda.216.1645551517234; 
 Tue, 22 Feb 2022 09:38:37 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:36 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/22] hw/block/fdc-isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:07 +0100
Message-Id: <20220222173819.76568-11-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "open list:Floppy" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/block/fdc-isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index ab663dce93..fa20450747 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -94,7 +94,7 @@ static void isabus_fdc_realize(DeviceState *dev, Error **errp)
                              isa->iobase, fdc_portio_list, fdctrl,
                              "fdc");
 
-    isa_init_irq(isadev, &fdctrl->irq, isa->irq);
+    fdctrl->irq = isa_get_irq(isadev, isa->irq);
     fdctrl->dma_chann = isa->dma;
     if (fdctrl->dma_chann != -1) {
         IsaDmaClass *k;
-- 
2.35.1


