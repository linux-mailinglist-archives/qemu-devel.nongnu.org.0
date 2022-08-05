Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A34658A924
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:59:33 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJu7A-0006Au-5C
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoV-0007Xz-9y
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:21 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:36792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoT-0001fF-PP
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:14 -0400
Received: by mail-vk1-xa32.google.com with SMTP id v13so1004453vke.3
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=INBPRigKq6rQycZXT1hbwZRQNiwpBIXBjyHgz1OYCoA=;
 b=MuMHRqoafB01CWP/F7unJvmj5K/Sq2uLwahO/khD5dDNgm3yYJtnINT2mGcpOdfIig
 0VNdkgsz5MXNJGb2YR0+giTlGdKk7SaCWJdu66q2srzMUVxLg1t6TT6L8pgoH50g6Nt9
 JJh+5XAenqAKS/4dHws28aoXbfAJVtxEp84HLeYZlgjXl7vyyYivdsg/HrSjexHntqID
 U0zgYngmbBYra+01MocKEgEeZleUGmK+pR0hABcuuIhyHrm68PCamM9AdCv6spPdd7XU
 UBlKmFUlzBvvPjCo4LzMMJ8FJBE3OfgbQxwzvogrmFrZC8rvJPEasIN5LGlNF7fDmaoJ
 Ej3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=INBPRigKq6rQycZXT1hbwZRQNiwpBIXBjyHgz1OYCoA=;
 b=TJW1JtDSpi5vSUnVkWQYZ/F1f4Fjr5bc8fYS8SUwhNmksjbhtwAofZPPz63NLsL5a6
 RYYn8yd3GVHyX363WAlx/9sxgVvkfvnk/B22mcNkGc41l1TCTjVtNXowy4Et2ouhP5jF
 kZr1uPbF6mj1xun6G88aMuzpyV2Utbf0ETnLlzTYjAr4B5PJbg+H1AolVKCAW0kiz/hf
 ArGVgLj6bttHOqzwUMDJs+BgkoXviuGugV2NTbnIPV4Fkqq0YjCwQrROBlBBjVOKPqrC
 9UOJBAluTdL8QhUii4yMWkv1bd3dsRjg2PJY125Esf0P1FcckmgtRoc6u4faIWOaBvJz
 C8Kw==
X-Gm-Message-State: ACgBeo1IecBiKcpZa347FrkCEahDiCVBKlbxIJhJiUeFKyCRUgt2lUL2
 sWKA17KY/+N74kFDq2jOZ6Tu1I6Uc7w=
X-Google-Smtp-Source: AA6agR61ZExdF7CnYCQ8YLgE+jybh8clfXipnwwjkh5TC5ja+3bwptUZDQHYRLHgCwp9hBpLwHiWWQ==
X-Received: by 2002:a1f:2452:0:b0:377:7b38:9b59 with SMTP id
 k79-20020a1f2452000000b003777b389b59mr2682381vkk.23.1659692412740; 
 Fri, 05 Aug 2022 02:40:12 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH for-7.2 v2 09/20] hw/ppc: set machine->fdt in pnv_reset()
Date: Fri,  5 Aug 2022 06:39:37 -0300
Message-Id: <20220805093948.82561-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
all powernv machines.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d3f77c8367..f5162f8b7b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -608,7 +608,11 @@ static void pnv_reset(MachineState *machine)
     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
     cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
 
-    g_free(fdt);
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' commands.
+     */
+    machine->fdt = fdt;
 }
 
 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
-- 
2.36.1


