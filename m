Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4518485AD1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:38:32 +0100 (CET)
Received: from localhost ([::1]:59768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DzM-0002Zv-1b
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:38:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dle-0002UX-6H; Wed, 05 Jan 2022 16:24:22 -0500
Received: from [2607:f8b0:4864:20::92d] (port=42948
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dlc-0007v6-LZ; Wed, 05 Jan 2022 16:24:21 -0500
Received: by mail-ua1-x92d.google.com with SMTP id p1so811731uap.9;
 Wed, 05 Jan 2022 13:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9Q1u8SzKZ0QZBKF0N4rYW/8kiyx8nmSXiHS8XOo4yQ=;
 b=P67xv+jGNJjbu9GOPGX6ILUVBtB3wCMq5xqbUWvYQelWsbbFJddtfRbH+AG0ix1N/P
 1jDo7/2q+xqP6Ee9NnFOaor4hyf6DvYVnAjOskZgSFUYUrml25h8d2OD/0hq1MPFiZMe
 3u6Zc2nAPIAKVHRZj12ncIiXC5x2oJnQttJi7zJLxXpP4MwaLQIY2W9r64A5uFHYptcV
 G3X7zh87n2S0jxgQmMb1h6V+rGkVPPrVZ+Z+KvuH+pluiNBkubwVKhvOA3K6tasGZ1wN
 c6J8cDahOR8a5N1WQmhGS69XNWToql9TLVlW//l76G2c+k0Gx6EaBFGrEwsLmZDOFHIb
 cSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9Q1u8SzKZ0QZBKF0N4rYW/8kiyx8nmSXiHS8XOo4yQ=;
 b=qOikYwBqAEMGmIA0vcNlVVrT0jALZGAJwgwXCN4labxIFTg9XMxQLt4ojT1pFfwUBd
 bTKlFe59/zsU1rrNURqZ0E4xWntVNyRtrYQg6/CD8RN5v/wTfX50v/WyrFCXrnZYSkWQ
 mbXMzPf0z22cv7lpEIosRSdZC5eXJvM6V8MjKJ4tz7ZbgBbyE0wG3fzj92/KPpiYlk/k
 W+qRRO9iuiS/XUSN+zye+IY8iRAtwSMeBeiYFnCCQoHrPS/XG28xoVNkSpDgHJJtitE/
 2A29Wgd1wXLx9LmBG6FxDfL+8ptppF6Opmvy//oPqxYSDkmT9dpA45e6u2migVHZsnX4
 ukOg==
X-Gm-Message-State: AOAM530lW8MTO6796tHQETkSMAwz+xNPKVWVm/vnOY6LAYWBJDb7OZI4
 W5aKI6iBnASDNtus5pH4ZAFkdbOFF6Q=
X-Google-Smtp-Source: ABdhPJzSI9/g/ByIiNPZ9RwTX4Qckw22rNJPfCzvwlPswHTcFHAi44P43Zba2WwEXrgzwDcAsEM1ug==
X-Received: by 2002:ab0:3730:: with SMTP id s16mr4683384uag.83.1641417859367; 
 Wed, 05 Jan 2022 13:24:19 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:19 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/18] pnv_phb4_pec: use pnv_phb4_pec_get_phb_id() in
 pnv_pec_dt_xscom()
Date: Wed,  5 Jan 2022 18:23:33 -0300
Message-Id: <20220105212338.49899-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92d.google.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
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
index e47d19dfff..0675fc55bc 100644
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


