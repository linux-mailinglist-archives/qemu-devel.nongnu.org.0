Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3386949D355
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:18:24 +0100 (CET)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCokJ-0003HO-BF
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:18:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCogy-0000AW-Ip; Wed, 26 Jan 2022 15:14:56 -0500
Received: from [2607:f8b0:4864:20::c29] (port=45793
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCogw-0005cY-Dr; Wed, 26 Jan 2022 15:14:56 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so169133oor.12; 
 Wed, 26 Jan 2022 12:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6F05X4t3TrvsOS8j/hixhUd8PUo4aWTVi/iorHUtvnQ=;
 b=d6fLHWlmscGVnRd+Qz+mL99VXA91f/B7qyqb8YOmOggPcrMXgK7/iRwtJC8pulkafy
 nw0Yi3p1/1nZHJCVEjihc8YRDEYSN5k/glH1D+wa/5fFayLCcNHTiO4tJIanLGbfbizd
 u5gl0Oe+RO0Sv8B+gKs+y8GpsD74bTcC2NadSReAuyRImHCzBR9dgkgguZEofNcexGpu
 +WOPu159xu4Y6NJjZOCuTkhmFElIMdIpeF+k71OXrrB3D1Z9LgA1uLoH9wEtrtlh8lgJ
 E4agII/uw6u08fUWftKceSF+ykzGXs9/O69AJxuAUjg6i3HSw3Gh2N435CyGQ4P3CqlI
 FCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6F05X4t3TrvsOS8j/hixhUd8PUo4aWTVi/iorHUtvnQ=;
 b=nr8/hMTGeFejgAtS5E95UwPiURVxndM3Szhz4vzEH+NIl3pv6yGBw8XTN8dso/xlLt
 iVlzcDlSMXOJprk40PUcwd+fe4byW+xTLd4OJ9uxpU0yRIGf7DxlC4v65zwA4PkyCHp4
 EuqqZgiH2P4SNn/jJfQpgT8PAOd2+vCwYr+nl0vvix6pfX7qXrX1KAHoAhCdcUzCTsHa
 Io/vNrVB5nrLBaBZingGa1gPXzIqxaG32JcmmGTiMgz/EsN4waBnWPki+F/dmeTSj+0T
 DInP9nUVya7KbMI3eAewf1he63v+yRpeki4SLE3bQzBY/7/ideGJHz56ttkgRwyFn6H1
 ITvQ==
X-Gm-Message-State: AOAM5311lklARTWxyDpGfll5Cpy4So/9vWnmpta/pRoDRj92dtiK+xuH
 d/dx5hM9Qt79czAm/0oDYIF+8TnegJM=
X-Google-Smtp-Source: ABdhPJyWkx76cg4x9o5gh5zHEpMevtLu4bLVYpy64zCg6t+ujEXFUGMweD/r+6GHn8g9upwSVt2I/A==
X-Received: by 2002:a05:6820:151b:: with SMTP id
 ay27mr415358oob.14.1643228090914; 
 Wed, 26 Jan 2022 12:14:50 -0800 (PST)
Received: from rekt.COMFAST (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id s11sm5587021otq.69.2022.01.26.12.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:14:50 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] ppc/pnv: use a do-while() loop in
 pnv_phb4_translate_tve()
Date: Wed, 26 Jan 2022 17:14:38 -0300
Message-Id: <20220126201438.822457-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126201438.822457-1-danielhb413@gmail.com>
References: <20220126201438.822457-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc29.google.com
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
 hw/pci-host/pnv_phb4.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a78add75b0..88a1479831 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1261,13 +1261,21 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
         /* Top level table base address */
         base = tta << 12;
 
+        /*
+         * There were reports of compilers complaining about 'taddr'
+         * being used uninitialized in pnv_phb3_translate_tve(), and
+         * the same scenario is happening here. Initialize 'taddr'
+         * just in case.
+         */
+        taddr = base;
+
         /* Total shift to first level */
         sh = tbl_shift * lev + tce_shift;
 
         /* TODO: Limit to support IO page sizes */
 
         /* TODO: Multi-level untested */
-        while ((lev--) >= 0) {
+        do {
             /* Grab the TCE address */
             taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
             if (dma_memory_read(&address_space_memory, taddr, &tce,
@@ -1288,7 +1296,7 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
             }
             sh -= tbl_shift;
             base = tce & ~0xfffull;
-        }
+        } while ((lev--) >= 0);
 
         /* We exit the loop with TCE being the final TCE */
         tce_mask = ~((1ull << tce_shift) - 1);
-- 
2.34.1


