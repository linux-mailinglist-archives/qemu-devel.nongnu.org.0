Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F75964ED42
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:58:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6C9x-0003sg-O0; Fri, 16 Dec 2022 09:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9p-0003kO-37; Fri, 16 Dec 2022 09:57:53 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9l-00022a-Q3; Fri, 16 Dec 2022 09:57:51 -0500
Received: by mail-ed1-x535.google.com with SMTP id r26so3930139edc.10;
 Fri, 16 Dec 2022 06:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dS5n2fq1nBhOITgWTEOZdjZdz9mPAjrDpmZNofzIba4=;
 b=pu8S5YX3Mi8K5ZwB8FDpDxnCJ4WHvXM/V1w98nDhWoQ0cI65AA2s0tUy9M9jr2Do+E
 iwIszzYChGjFM28pKjTJSC/RKfxGlbAMcc0FbhCFnsKSnRoSHiDCELM1/ADdUq+ctnPk
 1iYkwtMjw+TD9O5AF0rhUyKYYxgAttxs28I47S3Yrl3+nNyeexh1Ue60A83mAZRy7wES
 H0v3rgQ/DKYhcUciw4pBGIbBvf6Q2jZ50Xo5C9IKCRt6Oar3c9CeSIvPzImmyLWx+YsK
 rLDpoyP8A1dDN6w3vP49sbil9QdmEect078cPoPTqlmJcaOgyj0wTXusaolKxV/pEI7G
 TJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dS5n2fq1nBhOITgWTEOZdjZdz9mPAjrDpmZNofzIba4=;
 b=61H8oWwRirgwTOYfFaHzBL0aSIkABhFTNA8/buY9oPNnMKtXv43A1/fblU89xQ9LV+
 +k6iFPXqLkDXIZf4hVOejW2E181uNY2Qf5qj49PXt1J1DSr+hWT8BVxHyimbtH/9c2D5
 MMx3Jo6FoFmAry8jHlnG5FXX3OzDm3BMkf8xD8d44w6seaYI/O1H4aI83zXivy3dIlcv
 DkpXzaQhM2UbvqxDWLZlf03m/qsJ7NrEa8egCy2zi4lQt9qCbzQjLFcceIHF8rwb14na
 uzJD52xbydJpc1ifDnCk5mwwsZ9ta3AmcfJYzjnikzkY82PWgFjLqJPO2zff6lyso1Tu
 OkSg==
X-Gm-Message-State: AFqh2kpWPOfzOs4IGAemyLxQi5ybKJKBmZ7EdB6HDkjj9/Gy3lYJOsf7
 WyRFHr+DImsESZbaK8NxbSqMYM8NEUY=
X-Google-Smtp-Source: AMrXdXseq/4pW/6RhZaLLO9ZCNOKERrBXihNkSlPkgjZIOHVUV6iwN05ZN0gbFfIeK42D72/py6JBQ==
X-Received: by 2002:aa7:c649:0:b0:475:de4a:373f with SMTP id
 z9-20020aa7c649000000b00475de4a373fmr1866757edr.30.1671202666929; 
 Fri, 16 Dec 2022 06:57:46 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa7c852000000b00467c3cbab6fsm942225edt.77.2022.12.16.06.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 06:57:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/6] hw/ppc/e500: Prefer local variable over qdev_get_machine()
Date: Fri, 16 Dec 2022 15:57:07 +0100
Message-Id: <20221216145709.271940-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216145709.271940-1-shentey@gmail.com>
References: <20221216145709.271940-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 2fe496677c..ad83924004 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -959,7 +959,7 @@ void ppce500_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0, machine->ram);
 
     dev = qdev_new("e500-ccsr");
-    object_property_add_child(qdev_get_machine(), "e500-ccsr",
+    object_property_add_child(OBJECT(machine), "e500-ccsr",
                               OBJECT(dev));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     ccsr = CCSR(dev);
@@ -1002,7 +1002,7 @@ void ppce500_init(MachineState *machine)
 
     /* PCI */
     dev = qdev_new("e500-pcihost");
-    object_property_add_child(qdev_get_machine(), "pci-host", OBJECT(dev));
+    object_property_add_child(OBJECT(machine), "pci-host", OBJECT(dev));
     qdev_prop_set_uint32(dev, "first_slot", pmc->pci_first_slot);
     qdev_prop_set_uint32(dev, "first_pin_irq", pci_irq_nrs[0]);
     s = SYS_BUS_DEVICE(dev);
-- 
2.39.0


