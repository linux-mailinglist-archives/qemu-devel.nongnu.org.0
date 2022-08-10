Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540D58EA66
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:23:33 +0200 (CEST)
Received: from localhost ([::1]:53968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLis8-0005oE-7G
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibD-0006qn-4H; Wed, 10 Aug 2022 06:06:09 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:36745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibB-0000rY-Bc; Wed, 10 Aug 2022 06:06:02 -0400
Received: by mail-vs1-xe36.google.com with SMTP id o123so14606960vsc.3;
 Wed, 10 Aug 2022 03:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2c3cbAE/kQSn/4Qt7JvW+jb+McHEPwv0FIoI7Ak4V9o=;
 b=oeDCP2I81v+79ypfEf9TrXE9j7d5w6dOkLs8oWtYn68X6k/4nBMYbKGTRQ1MDqHUZH
 G9oJP03J8aS2NXenXgHl+1XwvTU+tOMo47FXnRODcqYHcljj+G84HGujZMb6J9RMcorc
 3coanN64bIOQvU1+1d71MVWDHODV9KpFzmfCwkt7HuxzrwYbDwHuQFOABLh8gI8IbYsT
 uwt8R4oXvHIF5Hj1bZPEM8oiPQfWW10j3T4JgqsrX7q/9jnvZ7bXnOYfELAj+xekBKev
 Fqh7ocZYUzw43O/Qlf9nWOowIfi/E8qH9Zwb5pMnHx0yrdhv97AZNR6mMruBKH4p8lrU
 jktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2c3cbAE/kQSn/4Qt7JvW+jb+McHEPwv0FIoI7Ak4V9o=;
 b=hMZCxoMneN/B/v/lB7LKDB2xaxmv8EuzRSv0tnVvIdUH2mV7hAdIJ4FZpeFyZBEvek
 kV3Pya2h9ugQRKqrrnqt4mBzn2rQSrQDqLbxDb6TprOpNz91pWwASIHZjc3rhnV8OehT
 JX8l5lcEWrHUL91ghD0KaPGaa5CMWZcgfGYvwV9kDLo0rrZVbCjIxA3FVcElrkJ7axgL
 v/71aGzvo3oMsJMomE58RO30UCYz5UKaMbr9W9S0NNkblWWbs0VsrQ6fTSM9VthKcYmt
 ElEng9egYsc1EDmYVN3i+IauNiDKtmF/pdUqJWr6djF0o69RHYio/JtwPl4j5/AJtwSI
 0YyQ==
X-Gm-Message-State: ACgBeo24M/69mSwXoqgYqfbtq2H4U9tJ/CIEQEaWeDH6ctmqKOUzKnv3
 vctBTXC2xE/TblYFtIP6o8K5fiH2EDE=
X-Google-Smtp-Source: AA6agR76xVruO4ISUeas11cNcGfDXRjcR8/5JaUBF4usKXNwP0q06qL0uhujv2TPq2Gmv5kZvwfn5Q==
X-Received: by 2002:a67:f703:0:b0:388:4bbe:536b with SMTP id
 m3-20020a67f703000000b003884bbe536bmr10397497vso.60.1660125960281; 
 Wed, 10 Aug 2022 03:06:00 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:05:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 08/11] ppc/pnv: enable user created pnv-phb powernv9
Date: Wed, 10 Aug 2022 07:05:33 -0300
Message-Id: <20220810100536.473859-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe36.google.com
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

Enable pnv-phb user created devices for powernv9 now that we have
everything in place.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c      | 2 +-
 hw/pci-host/pnv_phb4_pec.c | 6 ++++--
 hw/ppc/pnv.c               | 2 ++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index f9516fdc4a..a142b8ff8d 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -211,7 +211,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    if (phb->version == 3 && !defaults_enabled()) {
+    if (!defaults_enabled()) {
         return;
     }
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 8dc363d69c..9871f462cd 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -146,8 +146,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     pec->num_phbs = pecc->num_phbs[pec->index];
 
     /* Create PHBs if running with defaults */
-    for (i = 0; i < pec->num_phbs; i++) {
-        pnv_pec_default_phb_realize(pec, i, errp);
+    if (defaults_enabled()) {
+        for (i = 0; i < pec->num_phbs; i++) {
+            pnv_pec_default_phb_realize(pec, i, errp);
+        }
     }
 
     /* Initialize the XSCOM regions for the PEC registers */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 0d3a88578b..b6314dc961 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2134,6 +2134,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
     pmc->dt_power_mgt = pnv_dt_power_mgt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
-- 
2.36.1


