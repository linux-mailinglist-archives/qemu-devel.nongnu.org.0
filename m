Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E179C55041E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:05:31 +0200 (CEST)
Received: from localhost ([::1]:45734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WGg-000329-Vj
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDk-0007tI-KR; Sat, 18 Jun 2022 07:02:30 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:45725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDh-0005gL-Li; Sat, 18 Jun 2022 07:02:27 -0400
Received: by mail-oi1-x230.google.com with SMTP id u9so8219829oiv.12;
 Sat, 18 Jun 2022 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Od0dwdhBZFFqDJ9QGyRexIDSgMlssXKwCdn0x95W1pI=;
 b=D5hUKjP/XPrAAsoeXLgOl5z56NsmP1X4yYsKa3BwblR3EkpbB8ZsXs43U4diRcpMgN
 GDwK+WQO362GACYF0hR1ItH5bgo/CqEGjde/oGjMqkFiTdoaVi2HTPiC1ktb8YPfb6Iy
 JcyPX7RUoxFCovPUFFXpU/0c2/fHE+lHjYlYEgaB4W8/QM7McIRwyq1HBFRDx0u4ZLHK
 ntKqOG7RbK6ZpxdkX0HHMWfIB+ICpECd/rpc9ZgfevMvbzpfaKRAU39pl4ZUBSdPhV/+
 Vc63mH5n4FMcnEyGvnZATaZSkgdYI0ARmPBKj7vybw6txi4FoJgaii4+Rzfh/d8maHsE
 Wnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Od0dwdhBZFFqDJ9QGyRexIDSgMlssXKwCdn0x95W1pI=;
 b=hqXVbQaVvSOYlQ8PpP6WbH2F7lusG1B70ZUGbmnDSzqGH994gVhcUy1JfsivxgT+6N
 xygjxI+/ewXOqbMw3OdIM9u3b5uacG+qNZMOluRNmGtPDH1/8hWJcgVttfJS+7iLxCz5
 d+2593+cGHe83GJSw+MBCujPeZThYkSOlx6H1BtXVzCOOaI8ivh0mocrquNvjE1EUEZI
 VVjX0BJJ26hSyghNFhvK60xw1di/6oNm345muQPcNFbcKJF6IlTWyYD3QE3UrEwZXSth
 rRHIgLjOyWe7KM6F+MrmXZP/1o8Psk20urVjnG9ZkaggZlXgiFgw0TTe9RDC5AzGp3tt
 FNSw==
X-Gm-Message-State: AOAM532EG53ODdBUXwlKn6jxsANQHZcT2TpnX0hLIlbZi52j03nI4wlL
 dUZWM1jPwuR+tvVW47jLC/65HiEAmwM=
X-Google-Smtp-Source: ABdhPJx/7sGWXpcdmFcT+dONF3jirzhrcBotcOF9qfbrhDdpcAOfvlLGI8WNAva4gdBcT5818MaMzw==
X-Received: by 2002:a05:6808:158e:b0:32f:471a:ca7d with SMTP id
 t14-20020a056808158e00b0032f471aca7dmr12514606oiw.236.1655550144342; 
 Sat, 18 Jun 2022 04:02:24 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 7/9] ppc/pnv: make pnv_chip_power8_pic_print_info() use
 chip8->phbs[]
Date: Sat, 18 Jun 2022 08:02:00 -0300
Message-Id: <20220618110202.87735-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618110202.87735-1-danielhb413@gmail.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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

It's inneficient to scroll all child objects when we have all PHBs
available in chip8->phbs[].

pnv_chip_power8_pic_print_info_child() ended up folded into
pic_print_info() for simplicity.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 08136def8e..2a9067687b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -652,25 +652,19 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
     return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
 }
 
-static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
-{
-    Monitor *mon = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
-
-    if (phb3) {
-        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
-        ics_pic_print_info(&phb3->lsis, mon);
-    }
-    return 0;
-}
-
 static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv8Chip *chip8 = PNV8_CHIP(chip);
+    int i;
 
     ics_pic_print_info(&chip8->psi.ics, mon);
-    object_child_foreach(OBJECT(chip),
-                         pnv_chip_power8_pic_print_info_child, mon);
+
+    for (i = 0; i < chip8->num_phbs; i++) {
+        PnvPHB3 *phb3 = &chip8->phbs[i];
+
+        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
+        ics_pic_print_info(&phb3->lsis, mon);
+    }
 }
 
 static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
-- 
2.36.1


