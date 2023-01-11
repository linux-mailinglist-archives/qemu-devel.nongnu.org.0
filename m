Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD7E666192
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:17:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFebx-0002Vj-61; Wed, 11 Jan 2023 12:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFebv-0002Sz-HS
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:09:59 -0500
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFebu-00068c-3l
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:09:59 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 m23-20020a4abc97000000b004bfe105c580so4197286oop.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ee4ykpWvS9vCAX6jduEVuqgjn4tTXtGMZ/j/etyizQI=;
 b=Xciz4c5//fY9jmbrOEF5QX5b82dLRCI5F+p3/ta4URE5gBffRmwupyU0Wq+aWSzXHM
 7PZoYri9UJAGP9ozujEbvWMdtBPzEhN8QIHiAlPWGdvq7KL0zuLV07npdIifrok86xKr
 S9T4Js8yoI2WDfW/raqdgPbg1hp48waIxB1UG1TnPyP7A2yo6AaTRnmCZROdIahnkDgI
 jNtNpyHg4WRVeUM1+dljIhpAJFnwbMgTnF3nQUUp/rFdeETTZ/84FSjDYACgG8VODPOD
 AJTYhuaFXD3YNlzc32b3OCAE/xZ7zcpQeycHZZl35pHDEhDt3hMYV9W0Fjij7nbLLxkA
 9Agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ee4ykpWvS9vCAX6jduEVuqgjn4tTXtGMZ/j/etyizQI=;
 b=RSZr/GR3pfb61iyW+l0HeIq3CnG7F2DAyUKdclm5JGY8gjYPsCRL6WjOfSLhZJ5GIn
 9S5VSz9yCoGdKmBvrvSx49NYy/xYEB14rwji6VRO4h372ffHeGfCzVx9X4IZ9/Gjp8bU
 kfifiQu369Na5f6CFyJ/f0BZMRM3tKdXBu/wiVk0EyhcVLDfcZazBvalZ8U2wtQut5m/
 WaXugT6ja0DvUguCYITiMsu6jOZdoxBBZygr/h8XOI0D0JFBaizdFbnWAJZemXQ0OzDk
 uDCDCK4dpMq3Vt8GR0fvgc2RS96lTNpvjRSItkQo+Zv+F6pC2389SIDlSk6c5QS4U/ZH
 pc+w==
X-Gm-Message-State: AFqh2krhnWOqUW/Fcm9AMnBV2qinUtODYRN7Hwk4CmG1mdo8WeaGM4Z1
 pq3K+IEVFjQOl1dIe3nSASnMUVhhUykHp5zGWk4=
X-Google-Smtp-Source: AMrXdXuRKJEuzXU5ClXUt6z7xQTvD/jJq/aFi1pBpKC9s2BLFCsvzGgsNpZlmrRt+ERoEtBceyF4xA==
X-Received: by 2002:a4a:3712:0:b0:4c9:f4e1:afe0 with SMTP id
 r18-20020a4a3712000000b004c9f4e1afe0mr16481964oor.1.1673456996582; 
 Wed, 11 Jan 2023 09:09:56 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:09:56 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 01/10] hw/riscv/spike.c: simplify create_fdt()
Date: Wed, 11 Jan 2023 14:09:39 -0300
Message-Id: <20230111170948.316276-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
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

'mem_size' and 'cmdline' are unused.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index c517885e6e..4a66016d69 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -49,7 +49,6 @@ static const MemMapEntry spike_memmap[] = {
 };
 
 static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline,
                        bool is_32_bit, bool htif_custom_base)
 {
     void *fdt;
@@ -299,8 +298,7 @@ static void spike_board_init(MachineState *machine)
     }
 
     /* Create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]), htif_custom_base);
+    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]), htif_custom_base);
 
     /* Load kernel */
     if (machine->kernel_filename) {
-- 
2.39.0


