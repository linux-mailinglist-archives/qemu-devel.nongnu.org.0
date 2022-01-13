Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E148DE5D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:49:54 +0100 (CET)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n866b-0002lV-HO
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:49:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nh-0006Xd-Gs; Thu, 13 Jan 2022 14:30:22 -0500
Received: from [2607:f8b0:4864:20::32a] (port=41798
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nd-00058i-VU; Thu, 13 Jan 2022 14:30:20 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 a12-20020a0568301dcc00b005919e149b4cso7485600otj.8; 
 Thu, 13 Jan 2022 11:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zgRnhO5u0t+HTfNq/02WdH6b2f2UZL9WiKitZMCU0r0=;
 b=LJDvl/6I72sIPMieLa+WAhYYxcFnhLjIjZywYWk4DqDa6FiMHMo+x5L9zYEy+aqasU
 R5yr0oO1TksULjL1nSe70XQt7OCadCwmPPhEzNusMMmWjeJyF+KXStxpZVr75gVct1Ne
 p9v+PQvldwBKw0ecTgJRbsb5Mz5xmXOk76zCZ7iqVu6O8dv3yqvqtSZfESQXndD7Bctw
 csXN16+Jd2NFHSGWe0NLww2Eez7mG6TFp1yCTx8+Mc1HGBL3QIccVXW7zxa0eOOpzpsM
 m281bsG7NQvOuS8LJb0jadsiOAzNxkVMR8uhyDJ/iuuoqWxq60gJJ40uLNiTtiaWSvSv
 rEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zgRnhO5u0t+HTfNq/02WdH6b2f2UZL9WiKitZMCU0r0=;
 b=MS4l4YGQDXdfE2zvfY/891f2ZAGiUmesh2j9KRe59WgyU5kkzow365HmHqKgCaIC8a
 amgfCW1+SXglinBdkDLYO9QiMN+zqlZAERPdUIg/Vii1OQIDgOePkb7sVp50kJmkSKka
 L6pEVUVbZgdgP3PsmG8WRpjf4iWW6xfJ8T8t6UgqIKXBfmU0qWm3/0xephDKMl4cb/1u
 D+X0ZoRouGsNn48IzPJz7FGyRQJBP/DWXWh1J1NfPLT2+3fTy3bnbvHk3IHIACh7DzNN
 IxyNT3W4wwKuxzxS+bT5U3kqF8ElIodM+TW0xbIAuh5YGpW6TefaHjbdEhV/zAkrGBn5
 LReg==
X-Gm-Message-State: AOAM530CWhFblpcWVVlcJ5+3Bev/iA/PYgiKL+Su0hT24ukHkhOpQqRX
 SwISKEUzvS/bcH7+l/Y25n8XP3foATxJtbt9
X-Google-Smtp-Source: ABdhPJw91TJXQABIx5bwiDdTn7w5xXbI2PcwaN3HLH0/XkucaWQnqqAAUMTAMlWNK5i4N4NVXkG5rQ==
X-Received: by 2002:a9d:37a2:: with SMTP id x31mr4134622otb.51.1642102216383; 
 Thu, 13 Jan 2022 11:30:16 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:16 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/17] ppc/pnv: change pnv_pec_stk_update_map() to use PnvPHB4
Date: Thu, 13 Jan 2022 16:29:43 -0300
Message-Id: <20220113192952.911188-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113192952.911188-1-danielhb413@gmail.com>
References: <20220113192952.911188-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32a.google.com
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

stack->nest_regs_mr wasn't migrated to PnvPHB4 together with phb->nest_regs[] in
the previous patch. We were unable to cleanly convert its write MemoryRegionOps,
pnv_pec_stk_nest_xscom_write(), to use PnvPHB4 instead of PnvPhb4PecStack due to
pnv_pec_stk_update_map() using a stack. Thing is, we're now able to convert
pnv_pec_stk_update_map() because of what the did in previous patch.

The need for this intermediate step is a good example of the interconnected
relationship between stack and phb that we aim to cleanup.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 916a7a3cf0..0f4464ec67 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -893,10 +893,10 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
     pnv_phb4_check_all_mbt(phb);
 }
 
-static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
+static void pnv_pec_stk_update_map(PnvPHB4 *phb)
 {
+    PnvPhb4PecStack *stack = phb->stack;
     PnvPhb4PecState *pec = stack->pec;
-    PnvPHB4 *phb = stack->phb;
     MemoryRegion *sysmem = get_system_memory();
     uint64_t bar_en = phb->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
@@ -1046,7 +1046,7 @@ static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
         break;
     case PEC_NEST_STK_BAR_EN:
         phb->nest_regs[reg] = val & 0xf000000000000000ull;
-        pnv_pec_stk_update_map(stack);
+        pnv_pec_stk_update_map(phb);
         break;
     case PEC_NEST_STK_DATA_FRZ_TYPE:
     case PEC_NEST_STK_PBCQ_TUN_BAR:
-- 
2.33.1


