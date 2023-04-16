Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847926E3D0B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 02:57:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poD9l-0002Ei-PA; Sun, 16 Apr 2023 20:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdv-0000CL-M9
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 19:18:47 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdu-0004Jr-5a
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 19:18:47 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 z11-20020a17090abd8b00b0024721c47ceaso10388285pjr.3
 for <qemu-devel@nongnu.org>; Sun, 16 Apr 2023 16:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681687124; x=1684279124; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lkMTJk/R4h3ZuX//c3Vqt9RB669sJkJVDW6sx3Bzylk=;
 b=AJeYhp7vereMhFBjn7XDNU7rkIYTgp1TmihspRoAzewwFE/f1Qnr8KApnpPF4EbUgX
 538q5beeni/AqD/n5pw9XaGbC634pThxK3IokmSS4iJ+ZqvLvmmI1l/x6SFzhg5SWV2I
 /poSBgg/1RDtVsCOCN1RMHAY/fews8yaEKDHNHXZMYB/W2pXbzucrN98FGIIIDYw2UOE
 s65RIJOTG78YvwUaDbrhyYW9WmF28E2wuN8sItquWmGnnP2BvM7Qrkirr6gay4vD23Eb
 DtInHdl+cMVmLLbdVZqEWKz3VGC7afckMbtQlAOpjVy75MLkWrNmm3NnUi470LapCUeF
 250A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681687124; x=1684279124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkMTJk/R4h3ZuX//c3Vqt9RB669sJkJVDW6sx3Bzylk=;
 b=LsyuT87fJsD8IbtNqdZhv11Cg0Xa/SY/6WEJ6ZWjAa5ljlECbCiZij9WnhIyoXmpa7
 7N4bbW+e+WFI/T/nSInrSZEYnT7Ig7TBQCbJIbPaX7kYjW72ffeGPrgo8BBBBBqC91AT
 OAD/60tVnR0E6+rQrjFagM9tWiXQO6dfbz43MTS2DjOOYlGHgMxyfeepTOkZZLbZ4CAm
 JOk9oOtCvNHVKTFP3tjmw6nsuoRT6VcNnjVmnUjjuF39h3xEsOJwsaOt4kdyZ8vZr484
 DIOnyMS9f3xKiwqGpOTUEh4OCPAuP6cQa9+auZwEpmMHWsjx9DuRIrhg0GcMj9cfsO6+
 rOGg==
X-Gm-Message-State: AAQBX9exriKHV4ATA4/u2SYi/RM3olb1YaA9vnichfZM5gVv6ZkYXND6
 J+JEbNjBxnCf5dYkdilr0FJy4w==
X-Google-Smtp-Source: AKy350bSHYroTuPNyLC1kJQ6qb1rQsRULtyvGfW95t1lXOAKcf9Tws71WnQcuBM+MJIh07RnciauDw==
X-Received: by 2002:a17:902:c949:b0:1a6:87d8:b8fd with SMTP id
 i9-20020a170902c94900b001a687d8b8fdmr13223900pla.5.1681687124594; 
 Sun, 16 Apr 2023 16:18:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:1800:f680:20ea:ba1c:5673:16e6])
 by smtp.gmail.com with ESMTPSA id
 jl3-20020a170903134300b001a6b02659c0sm3087847plb.159.2023.04.16.16.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 16:18:44 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 8/8] hw/riscv: virt: initialize the CBQRI example SoC
Date: Sun, 16 Apr 2023 16:20:50 -0700
Message-Id: <20230416232050.4094820-9-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416232050.4094820-1-dfustini@baylibre.com>
References: <20230416232050.4094820-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=dfustini@baylibre.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 Apr 2023 20:55:43 -0400
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

From: Nicolas Pitre <npitre@baylibre.com>

Initialize an example SoC that instantiates CBQRI capacity and bandwidth
controllers with specific parameters for testing purposes.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Note: this solution is not flexible enough for upstream inclusion.
Future work will allow CBQRI controllers to be configured by command
line options, and the controller will only be instantiated if the user
specifies a valid configuration.

 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16f0..38edc4b91c93 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -34,6 +34,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
+#include "hw/riscv/cbqri.h"
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
@@ -1519,6 +1520,8 @@ static void virt_machine_init(MachineState *machine)
     }
     virt_flash_map(s, system_memory);
 
+    example_soc_cbqri_init();
+
     /* load/create device tree */
     if (machine->dtb) {
         machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
-- 
2.34.1


