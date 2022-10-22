Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB87C609852
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 04:48:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgnE-0002MR-Qh
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4a-00072J-LT; Sat, 22 Oct 2022 11:06:04 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4Z-00023s-7D; Sat, 22 Oct 2022 11:06:04 -0400
Received: by mail-ed1-x534.google.com with SMTP id m16so15998494edc.4;
 Sat, 22 Oct 2022 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uX6RSTfRaf07nsOqTQPiiSP6v8L6Z8I07u4DqsFmNRo=;
 b=Pq/Ui5/xxiWYGmeu0t8Poo/cyBkBU9UlhZlp7pMKnYYMIR/lHUpTPTjhqj6ElV6YZ7
 eQ1s4rwvmdYuj6jw3dthaD7StB/McY7JJswaDq5wQxiLPlll/GNJ1oBuiWixCwdH7TWS
 PVAC6AnzoRp8vSbd+Tk5g6vfnybLk9Fh/RxUc2E5pp5vMwQhQjaUPFR2ee//4ludch39
 3DgmNZZe/3g3xCC/cHYn65EGxKdzAh2ReMaWgGVryO9YS6F67NubPTvXu72omxtjIati
 Jpq3tfgdf/nVo21ddcoyOmpHpGpwN8Gbrzspe0bUc6ClJX2asMZ21h0N3cgqy1SEVX88
 WvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uX6RSTfRaf07nsOqTQPiiSP6v8L6Z8I07u4DqsFmNRo=;
 b=VfXRJLf4nW4UTmDTJ7x8N10lfAixIR6YQBp+WYpN7OUI2vss+pobDVd4OHyn/zYckZ
 0rdIpLF57FyWmvRFL+2J6U4Fz6cgn7NPp6NQJ/GsDurwcleSwJvA33O+NfkE3SKH/XH/
 7t9a2I5SqdFPrLxqZWK9iXizHjTFHTbLte15sLZ7uX75nEj7qf3ymZaBxpBsdfZ0Vhyt
 u9IiEWt7ZyyHNKlPSgUkUDqgN8Hq2M4lDZCnzk7Ct3DmOI80ZgJiWnr6c7ITGMlZHvJL
 ZNg2ZkPXSAXByQtmD2CcqdE7VBNAvRUl7FiwlwaiuNBTS7CYo2XWsBwbfQxztksqRBh+
 pqrw==
X-Gm-Message-State: ACrzQf2mig9O+eEyhBl/v+mzk6dXpCmiuOdsjwajZOsEcAm00XmTd7ES
 xLo97MlFNt8jxgQC7oPpGon7N2SyovoPmA==
X-Google-Smtp-Source: AMsMyM7NucFIJxQj9aYKz/jYjzNLaXVdA0Blj7bQBtRkkJCzF+DaDkYhxLCHP3+gAJuQ/05MvElJAw==
X-Received: by 2002:a17:907:7e87:b0:78e:1a4:130 with SMTP id
 qb7-20020a1709077e8700b0078e01a40130mr20823066ejc.101.1666451158886; 
 Sat, 22 Oct 2022 08:05:58 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:05:56 -0700 (PDT)
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
Subject: [PATCH v2 04/43] hw/isa/piix3: Add size constraints to rcr_ops
Date: Sat, 22 Oct 2022 17:04:29 +0200
Message-Id: <20221022150508.26830-5-shentey@gmail.com>
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

According to the PIIX3 datasheet, the reset control register is one byte in size.
Moreover, PIIX4 has it, so add it to PIIX3 as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 04895ce2e5..72dbf688d9 100644
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
2.38.1


