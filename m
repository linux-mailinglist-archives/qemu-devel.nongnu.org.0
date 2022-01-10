Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F0F489B65
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:38:29 +0100 (CET)
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6voa-0005bI-Ca
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:38:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkL-0001Wd-5Z; Mon, 10 Jan 2022 09:34:05 -0500
Received: from [2607:f8b0:4864:20::935] (port=37693
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkJ-0007O6-Lv; Mon, 10 Jan 2022 09:34:04 -0500
Received: by mail-ua1-x935.google.com with SMTP id o1so23754229uap.4;
 Mon, 10 Jan 2022 06:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0oN2w73WESlKXqxKPwBqz4xm5odRb3BaP9Ogz2Myi2k=;
 b=mP1hhV7vk/fGQ55HQ0J40Gm6I810Z066bLvKENvv8fQfdnN3UdJ5OduL2WA//JHUeA
 OmlQ1AGDOXBW4xQTonosjbT7wpHBEZxSx7v4hIW82paBnEqii5uf2QbOuECLF59zrfrz
 zve7PbnXanSPbedJtwSEspICORsw1dJq5J0rhnhQrwnqU5T4N3M25Y1gEXIQoisMkMvy
 Lpo5pcKjTRFVVzi9t6QVawxS/0QHVqvwgQsdpK4pt9thrK01BDbPbA5y5Rio6Z/caGF0
 cmL/U9k0jr8XwfzNpiHtz0uifUxDQ84VRSS5sxLD+f1xtXkYoRMfFaE2fB1SHlYDQShO
 bnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0oN2w73WESlKXqxKPwBqz4xm5odRb3BaP9Ogz2Myi2k=;
 b=vf7p2ATXLiKpx7BKpc07ri7FWyD+jC+nsz3mouvCdtFBQqBJMwCmkdl/k9wy28ayhZ
 B1qx54U7LacaOLwoa2cxEQTosiHVY9rKPGijX+uaIh/k7UCh+o8B+9cqwCZ/EJoPmgZ7
 rJbpHoNCHzy17Dxg80rGXQ3MveWMwvYNd8+y2HCAwp19fT5xDIIBfY5qMmOChXOZQv6/
 d0Qew1Yjrjxb9ESasWMQPyvA5r7OR/X1ihYPCobn7lhUrTGAuIDPFp5qrmw2PLkNVmLH
 k8yCYL4CvJl7gTu2Ov4UDnJuKVsqx9iS2owijjR4xUh5ZLUg4modLESVO7Q4FOzXCfxG
 xRag==
X-Gm-Message-State: AOAM530X1zQoaZgYXs0lK5qmxkrt0Ald/IOcotD+2L1KV2D7ZxZNbNge
 A0gXJnPsmklox24VY45TyohVCTNVYnu0CoKQ
X-Google-Smtp-Source: ABdhPJzcqAU+uVAyheOpMhO6EUl+uOk3llSo/aiaMGKsBwk2Y04VBmBLAINoa+84JPWsboEfo8563Q==
X-Received: by 2002:a67:d78a:: with SMTP id q10mr23587039vsj.49.1641825241225; 
 Mon, 10 Jan 2022 06:34:01 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:34:00 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/10] pnv_phb4_pec: use pnv_phb4_pec_get_phb_id() in
 pnv_pec_dt_xscom()
Date: Mon, 10 Jan 2022 11:33:39 -0300
Message-Id: <20220110143346.455901-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Relying on stack->phb to write the xscom DT of the PEC is something that
we won't be able to do with user creatable pnv-phb4 devices.

Hopefully, this can be done by using pnv_phb4_pec_get_phb_id(), which is
already used by pnv_pec_realize() to set the phb-id of the stack. Use
the same idea in pnv_pec_dt_xscom() to write ibm,phb-index without the
need to accessing stack->phb, since stack->phb is not granted to be !=
NULL when user creatable phbs are introduced.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 513a698e17..1f264d0a9c 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -449,8 +449,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
                       pecc->compat_size)));
 
     for (i = 0; i < pec->num_stacks; i++) {
-        PnvPhb4PecStack *stack = &pec->stacks[i];
-        PnvPHB4 *phb = &stack->phb;
+        int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
         int stk_offset;
 
         name = g_strdup_printf("stack@%x", i);
@@ -460,7 +459,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
         _FDT((fdt_setprop(fdt, stk_offset, "compatible", pecc->stk_compat,
                           pecc->stk_compat_size)));
         _FDT((fdt_setprop_cell(fdt, stk_offset, "reg", i)));
-        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb->phb_id)));
+        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb_id)));
     }
 
     return 0;
-- 
2.33.1


