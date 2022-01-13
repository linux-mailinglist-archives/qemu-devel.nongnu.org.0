Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A3B48DE5E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:50:48 +0100 (CET)
Received: from localhost ([::1]:60394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n867T-0003l1-A6
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:50:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nb-0006Sv-Aq; Thu, 13 Jan 2022 14:30:15 -0500
Received: from [2607:f8b0:4864:20::233] (port=41694
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nZ-00057V-HC; Thu, 13 Jan 2022 14:30:14 -0500
Received: by mail-oi1-x233.google.com with SMTP id q186so9147594oih.8;
 Thu, 13 Jan 2022 11:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m0cllZJysny9gigAmbQQdknJd6aX4ieXImtqys5Fd+g=;
 b=CehLCPmEx9wF5xG+pAHznDCVdz6XVcbhE1uTxCRt4kxONQUQEbLu8TuFdeIKcdbyyE
 cXQfTUOjiT33OnEU3CTljMo4HiscVGZUQHvGezKZOvTTSM1YY7ACoPDee0MRgKCZKIsM
 lJf30aF7J5MAZa3f1cTKvITUv3vOdONbFNCie5W1kq2GgH7gzoVjH3HZALLZKa0Tago+
 tPQHHOpQMWIk66OFFaRnUYrdQiWFe87nw1RcT7sWPsFI5Ikt3F11ppEbVG9VglFqEpso
 LuygcpbB1UzicQZBzvxzxg6TCP02NIZ556IRw96t6FpyvnzVr0oUxSCR3NAa0/3qf+f0
 koMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m0cllZJysny9gigAmbQQdknJd6aX4ieXImtqys5Fd+g=;
 b=zZefu13uzXXVz6X6CmS9FrTl9YFVEuUpi19WwVvb7F+p9NJntLEyNw175g3c/b3gsU
 eVrl6Im+5Upo47j4vx8Kul0QcZvQCO12I+YwuA+fbaQVWKAbPoY4ZKwd4AoUr7uvMbue
 JdkfxiS+ohh9VnFYoCsZZFTpVb3WUMwckKGHq/X6SQ0dwUTR2oOKCejY3ZTq7wCVXB4Q
 TjLzlukO16R9WVTIrjOrsMk12RibkyCd/oEH6SQflilDiLAduFO+o0EcxweuH3xRMh6k
 gqP8bACj4GUCuxFEX4M6ZxfdlqBP/V1S1fiGBZT49j2U1wVsJ7fZjq26gzayxVkH2X3v
 DDgg==
X-Gm-Message-State: AOAM532bO8zNBDGCoCJokCLucpRhI3nqQhv8zY1n9tYrJ6pwOjTtM2n8
 Vd/1crnboVpoYtHaKx9yQj5SoYwl8FAmTvvx
X-Google-Smtp-Source: ABdhPJwjF2o2qoJyiu/F36FHJu7eccTFNOlXcyASjsqBVmsEYWiOnFrh9oDdoMBMGlA26OgHTdsDNg==
X-Received: by 2002:a05:6808:ecc:: with SMTP id
 q12mr9955062oiv.122.1642102211096; 
 Thu, 13 Jan 2022 11:30:11 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:10 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/17] ppc/pnv: change pnv_phb4_update_regions() to use PnvPHB4
Date: Thu, 13 Jan 2022 16:29:40 -0300
Message-Id: <20220113192952.911188-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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

The function does not rely on stack for anything it does anymore. This
is also one less instance of 'stack->phb' that we need to worry about.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index fbc475f27a..034721f159 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -868,10 +868,8 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
     return stack->nest_regs[reg];
 }
 
-static void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
+static void pnv_phb4_update_regions(PnvPHB4 *phb)
 {
-    PnvPHB4 *phb = stack->phb;
-
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
         memory_region_del_subregion(&phb->phbbar, &phb->mr_regs);
@@ -930,7 +928,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
     }
 
     /* Update PHB */
-    pnv_phb4_update_regions(stack);
+    pnv_phb4_update_regions(phb);
 
     /* Handle maps */
     if (!memory_region_is_mapped(&stack->mmbar0) &&
@@ -977,7 +975,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
     }
 
     /* Update PHB */
-    pnv_phb4_update_regions(stack);
+    pnv_phb4_update_regions(phb);
 }
 
 static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
-- 
2.33.1


