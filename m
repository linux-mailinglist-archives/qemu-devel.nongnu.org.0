Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EBF68019C
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 22:35:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMFJw-0002PG-4V; Sun, 29 Jan 2023 16:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pMFJu-0002Oh-Lz
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 16:34:38 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pMFJt-0001Lu-7e
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 16:34:38 -0500
Received: by mail-ed1-x52a.google.com with SMTP id x7so6027530edr.0
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 13:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0s4LRa/makxygYBgDhNmGrmQZc7h77dDyIM/yLM5Qg=;
 b=bLbGj0DkYKgkMmiKnZnDbcMbIYgHf/1aZid7c9bml2Caz6F3MR9abbzJwI/xEbWnZz
 yEg2uSRqpldrWC6wIkl0vTuHer7TG3VsEXwQ/DUg0p2xw4zbA9JYAUHEv5WgGfEdOkhK
 AFDYcQTzAC3bPb8+py3m+cz4166JfgkN4AWqAXsZMabidtBSHvf8mL3fLRNGqh9klcLv
 f22gBAk9JwQdarVVtZWrDdMjlgkIxt0q28Sk5bXlTGeaE2CK9KYP8R4ho9b4qbCwtO0N
 s2xGsk82cxUPTIhwAAoyDFZH9ahg3K+Knw44BkWU/ilR9lC3QXTkT8CkBR6JCiJ2TRpo
 Nqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0s4LRa/makxygYBgDhNmGrmQZc7h77dDyIM/yLM5Qg=;
 b=EwgcAl2/QJEPkRGjEuo3JWg8smZQbJu4HUSLDI/RBWNj2ELMggbUMS2Fg1H7ULnS/I
 y1wIBkw6gCev7WmhhGvCYg7I+OKKTCSkez5Uk4sPtLP/7zeLQcmjKwyI89ANk8bsujyE
 rZpAQO6u+3xG4flcoAGbie2MhpQeOkQqJQkfBSSP98p+VKo/0P70nnfxIS5ckPtzd7/d
 O17c2ahOtCHW5CIQoOqASmVyFS/CamtsGt/43Olz1C+vPXN4lNtiF/uFoVQeQY7+rRYl
 7s89mzQ/WXhKF95JuUhp6wAx4TVTjmws9mJ2M+9bXz2y88uNyOYRIZ4nuvnjTuW4YI1c
 QWiw==
X-Gm-Message-State: AFqh2kr7ocZNxAn3D2TsBMoeMGvJJDsheuXO6vpGOocPd6x/jixa2ioo
 YXjD1tOeOfkFiRjbLeh/ZsXo8tJuSag=
X-Google-Smtp-Source: AMrXdXuCOsmHoG4D7DUz0e+PP5SOsiqyphrt8PUjgQwGU6/WSO/4os43dRtQzdjaTTdcdNCeoMllOA==
X-Received: by 2002:a05:6402:1946:b0:48b:c8de:9d20 with SMTP id
 f6-20020a056402194600b0048bc8de9d20mr53795428edz.32.1675028075809; 
 Sun, 29 Jan 2023 13:34:35 -0800 (PST)
Received: from localhost.localdomain ([46.183.103.17])
 by smtp.gmail.com with ESMTPSA id
 d1-20020aa7d681000000b0049be07c9ff5sm5831220edr.4.2023.01.29.13.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 13:34:35 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/3] hw/isa/vt82c686: Allow PM controller to switch to ACPI
 mode
Date: Sun, 29 Jan 2023 22:34:17 +0100
Message-Id: <20230129213418.87978-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129213418.87978-1-shentey@gmail.com>
References: <20230129213418.87978-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Adds missing functionality the real hardware supports.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2189be6f20..b0765d4ed8 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -37,6 +37,9 @@
 #include "qemu/timer.h"
 #include "trace.h"
 
+#define ACPI_ENABLE 0xf1
+#define ACPI_DISABLE 0xf0
+
 #define TYPE_VIA_PM "via-pm"
 OBJECT_DECLARE_SIMPLE_TYPE(ViaPMState, VIA_PM)
 
@@ -50,6 +53,19 @@ struct ViaPMState {
     qemu_irq irq;
 };
 
+static void via_pm_apm_ctrl_changed(uint32_t val, void *arg)
+{
+    ViaPMState *s = arg;
+
+    /* ACPI specs 3.0, 4.7.2.5 */
+    acpi_pm1_cnt_update(&s->ar, val == ACPI_ENABLE, val == ACPI_DISABLE);
+    if (val == ACPI_ENABLE || val == ACPI_DISABLE) {
+        return;
+    }
+
+    qemu_log_mask(LOG_UNIMP, "%s: unimplemented value 0x%x", __func__, val);
+}
+
 static void pm_io_space_update(ViaPMState *s)
 {
     uint32_t pmbase = pci_get_long(s->dev.config + 0x48) & 0xff80UL;
@@ -193,7 +209,7 @@ static void via_pm_realize(PCIDevice *dev, Error **errp)
     memory_region_add_subregion(pci_address_space_io(dev), 0, &s->smb.io);
     memory_region_set_enabled(&s->smb.io, false);
 
-    apm_init(dev, &s->apm, NULL, s);
+    apm_init(dev, &s->apm, via_pm_apm_ctrl_changed, s);
 
     memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s, "via-pm", 128);
     memory_region_add_subregion(pci_address_space_io(dev), 0, &s->io);
-- 
2.39.1


