Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5B9489B8A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:46:59 +0100 (CET)
Received: from localhost ([::1]:40138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vwo-00014M-W4
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:46:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkT-000252-PJ; Mon, 10 Jan 2022 09:34:13 -0500
Received: from [2607:f8b0:4864:20::936] (port=41480
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkS-0007QC-6P; Mon, 10 Jan 2022 09:34:13 -0500
Received: by mail-ua1-x936.google.com with SMTP id p37so23736161uae.8;
 Mon, 10 Jan 2022 06:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3C1zrddImej8jguoemBCC5arck5ZAaTyqBGfpj5lCI=;
 b=bmx3g7aeNu/jEWe3IgAHZXig5hu79LsnoIyzkhzqSxnV+n43/cMk2BDreoaV1dkEio
 bplj9p7qGnuTHxuS88rjJfa2RRjp+Ou08D2uGffHaylbbY7DwdgBgZvp8PxTUEF5qmBJ
 7q01GwF+PLQUrnPJ2WnazyEfzzaOAJXPJ7XiKqCNwn6f6i89fo/o/4YhHZ8eweXtdq1H
 hVkxTb/NugGm1UOumGsAGW2HcEF4UwstgXwgOi0y7RApoqYW+1P0g6bg57R/2k0S/psI
 BRbxPymwOhj1JI/gC0dLJ44rwEDcYATOYWzCFi+2phbZEJWgaqVWr3QlEDhR1b+i3HJQ
 Yw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3C1zrddImej8jguoemBCC5arck5ZAaTyqBGfpj5lCI=;
 b=Eowly1r6mbqW3yCdT1mCR4hw6kotpnKf557DT+CFr3tHcZQuXnoAikPVPkS6xALhUb
 /Xa8M8EKJPwK0EuThePZHozfPNIQs7/VgZTFs/RiDdxB6qKPjtP0F6BBGDWL6hkEg7sv
 Lk1WYMVSKRSCCh54D0zJk/iP8V6Oem4odDum8i1p5DHV1LVqiJ9yCXUtdQB2Kx7kZhiS
 PLwhuLfH+IvG6nKZfphiFSRN9K+eHvmdhQjOX2QplxyF5sazkppD5VUMp/euvr+hlwHR
 9zh4J6y/JKJztW9fTvZJRzlhsHiTGMQpUvKhNhLp2OTXiGvcqpwzidFazEthWvkAQiI7
 RSaw==
X-Gm-Message-State: AOAM5305jx3+2+2N5Bpf1mkjNYEC+c+fvY9n51mlwbjCNagAswruhE5E
 00saQEdbcgQIM7wt53TG8B3BBwn8WMlXHMHq
X-Google-Smtp-Source: ABdhPJxrdJyuKPauBOLimJd44v34122RMYaNAon95nRCicF4ew5e67itYQMSs6HJlHrBXCL43SM+Iw==
X-Received: by 2002:ab0:6c4c:: with SMTP id q12mr6504413uas.112.1641825250890; 
 Mon, 10 Jan 2022 06:34:10 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:34:10 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/10] pnv_phb4.c: check stack->phb not NULL in
 phb4_update_regions()
Date: Mon, 10 Jan 2022 11:33:44 -0300
Message-Id: <20220110143346.455901-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
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

The last step before enabling user creatable pnv-phb4 devices still has
to do with specific XSCOM initialization code in pnv_phb4_stk_realize().

'stack->nest_regs_mr' is being init regardless of the existence of
'stack->phb', which is verified only when trying to realize the phb.
Its MemoryRegionOps,'pnv_pec_stk_nest_xscom_ops', uses
pnv_pec_stk_nest_xscom_write() as a write callback. When trying to write
the PEC_NEST_STK_BAR_EN reg, pnv_pec_stk_update_map() is called. Inside
this function, pnv_phb4_update_regions() is called twice. This function
uses stack->phb to manipulate memory regions of the phb.

When enabling user creatable phb4s, a stack that doesn't have an
associated phb (i.e. will have stack->phb = NULL) will cause a SIGINT
during boot in pnv_phb4_update_regions(). To deal with this we have
some options, including:

- check for stack->phb being not NULL in pnv_phb4_update_regions();

- change the order of the XSCOM initialization to avoid initializing
'stack->nest_regs_mr' if 'stack->phb' is NULL. This can have unintended
side-effects: there are several other regs that are being read/written
in these memory regions, and we would forbid all read/write operations
in these regs because of writes in PEC_NEST_STK_BAR_EN being problematic;

- move the XSCOM init code to phb4_realize() like the previous patch
did with 'stack->phb_regs_mr'. Besides having the same potential side
effects than the previous alternative, a lot of code would need to be
moved from pnv_phb4_pec.c to pnv_phb4.c because all the memory region
code is static.

Being the option that is less intrusive and innocus of the alternatives,
this patch keeps the XSCOM initialization as is in
pnv_phb4_stk_realize() and check for 'stack->phb' being NULL in
pnv_phb4_update_regions().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 152911a285..fc23a96b7f 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1472,6 +1472,17 @@ void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 {
     PnvPHB4 *phb = stack->phb;
 
+    /*
+     * This will happen when there's no phb associated with the stack.
+     * pnv_pec_stk_realize() will init the nested xscom address space
+     * (stack->nest_regs_mr) that uses pnv_phb4_update_regions(), via
+     * pnv_pec_stk_update_map(), which in turn is the write callback of
+     * the PEC_NEST_STK_BAR_EN reg in pnv_pec_stk_nest_xscom_write().
+     */
+    if (!stack->phb) {
+        return;
+    }
+
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
         memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
-- 
2.33.1


