Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0449E26B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:32:43 +0100 (CET)
Received: from localhost ([::1]:36362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3xC-0000te-K2
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:32:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD3nn-0007YV-Qd; Thu, 27 Jan 2022 07:22:59 -0500
Received: from [2607:f8b0:4864:20::92d] (port=40788
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD3ne-0000tH-Od; Thu, 27 Jan 2022 07:22:52 -0500
Received: by mail-ua1-x92d.google.com with SMTP id w21so4352408uan.7;
 Thu, 27 Jan 2022 04:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AnYdSqtWh8YSOTM4yovN8mr2dsQxFa5GK4o/J4pGf7w=;
 b=Od+aB2Fho58WbyK7BSOIy5RLmBLZt/SMNP2OV7bBWmD/WnA4YxdI9qmLMnX9UYMnTg
 XcnuPwkbl6ZSiSHmxVlxAYtPj6MBKiVQqtbbOv/yB4YyRorWL4N+lpv2UL5VfnrUBVNV
 GUJvzQni9QovlAU3x1W1JmAGDLblMbAKJpvp/mhoD+FVMcFGvLdJ0Fg7EgiMaoBIPC1m
 N18+C9d+YhjhxchIyKt7BMisOOhpVLb5i3WY2IETpJi0oe/t17Eh9XwEHgWymxd7lSZS
 Zq5hG8TXELd9GzeIDlSyVZ/dnVLB7+9ubPFrDUCst/mNup/pp/SHEQCN918xHHD9htXy
 pIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AnYdSqtWh8YSOTM4yovN8mr2dsQxFa5GK4o/J4pGf7w=;
 b=Zci/1JdYniMnp27730FPIS/Z6zL+ybWgN9bYdZmaCmo5UCcxM8+qN5TgdV1Imjs6LY
 K1evgyO+Mpk8PDnfV1uJPY/ce0MtspFLzN/PkPV3jMe1jBrBklWlgZBYYOu/9vXSJQOS
 JKyOzdkQPDdKOmDV1AT0mW8FQsISrCkL+N3bONkXhvF5fPe37BzISI3QUkgFH70xKJTD
 eSs2NVGvi5b4OeHQztf720kLFOU4FW/PGgy1/7ycScdmS/lYXD1Im3lD6/NSHZr6s0Cb
 SlJUe4RhKUgoJe5tUZJQ9VDeFqYEscgLIspXe9V9s6QDfcLoZec6UQ0eQVMNmjiRTycU
 lsag==
X-Gm-Message-State: AOAM531QMxeQvLhrwIy3gp8pHYiH0gv39oucUpuQgn6N8/syhNKbGH00
 fken5sLeblNtCHaMnDDpn0Swxj/1iRk=
X-Google-Smtp-Source: ABdhPJys8EPa1PxjpFXc5xMTtPFL6cET1HqDIp3oKdZbDYJmv2weuyz2PbW3xVEiu5Rqx6EjYvzbPw==
X-Received: by 2002:a67:d594:: with SMTP id m20mr1360084vsj.3.1643286165810;
 Thu, 27 Jan 2022 04:22:45 -0800 (PST)
Received: from rekt.COMFAST (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id e14sm520724vsu.3.2022.01.27.04.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:22:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] ppc/pnv: use a do-while() loop in
 pnv_phb4_translate_tve()
Date: Thu, 27 Jan 2022 09:22:34 -0300
Message-Id: <20220127122234.842145-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127122234.842145-1-danielhb413@gmail.com>
References: <20220127122234.842145-1-danielhb413@gmail.com>
MIME-Version: 1.0
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
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

pnv_phb4_translate_tve() is quite similar to pnv_phb3_translate_tve(),
and that includes the fact that 'taddr' can be considered uninitialized
when throwing the "TCE access fault" error because, in theory, the loop
that sets 'taddr' can be skippable due to 'lev' being an signed int.

No one complained about this specific case yet, but since we took the
time to handle the same situtation in pnv_phb3_translate_tve(), let's
replicate it here as well.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a78add75b0..b6c74553fa 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1267,7 +1267,9 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
         /* TODO: Limit to support IO page sizes */
 
         /* TODO: Multi-level untested */
-        while ((lev--) >= 0) {
+        do {
+            lev--;
+
             /* Grab the TCE address */
             taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
             if (dma_memory_read(&address_space_memory, taddr, &tce,
@@ -1288,7 +1290,7 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
             }
             sh -= tbl_shift;
             base = tce & ~0xfffull;
-        }
+        } while (lev >= 0);
 
         /* We exit the loop with TCE being the final TCE */
         tce_mask = ~((1ull << tce_shift) - 1);
-- 
2.34.1


