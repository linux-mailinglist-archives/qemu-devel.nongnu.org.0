Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE45475B56
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:06:12 +0100 (CET)
Received: from localhost ([::1]:60138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVr9-0003ID-76
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:06:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrm-0000zn-JA
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrb-0001Tu-41
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRSLaWC+Oup2rvxqHx/8wD94GwAom7TQtKrfJwTZHz4=;
 b=iGUec5quHp56gEtFoN98E7/86u7Oppf0amiKOvCTW1XGt3N5lyGAdi4DtzYDlipzwNTjfP
 cRLAA0i6sz4BpwZDhL9f9sIiWJ5XrdshCHoehOIjN3bv8JlIlwun+4oUt4ELOnqcGbY/em
 1eE/JpLYxukAHFJO2XpbjOAsqD3sV4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-pK63H0XXNJiNicusmiBp8A-1; Wed, 15 Dec 2021 09:02:27 -0500
X-MC-Unique: pK63H0XXNJiNicusmiBp8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E4580574C;
 Wed, 15 Dec 2021 14:02:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4AED5E48C;
 Wed, 15 Dec 2021 14:02:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7233F11380A9; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] hw/arm/aspeed: Replace drive_get_next() by drive_get()
Date: Wed, 15 Dec 2021 15:02:21 +0100
Message-Id: <20211215140222.769652-13-armbru@redhat.com>
In-Reply-To: <20211215140222.769652-1-armbru@redhat.com>
References: <20211215140222.769652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 richard.henderson@linaro.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

The aspeed machines connects backends with drive_get_next() in several
counting loops, one of them in a helper function, and a conditional.
Change it to use drive_get() directly.  This makes the unit numbers
explicit in the code.

Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20211117163409.3587705-13-armbru@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a77f46b3ad..cf20ae0db5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -284,12 +284,13 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
 }
 
 static void aspeed_board_init_flashes(AspeedSMCState *s,
-                                      const char *flashtype)
+                                      const char *flashtype,
+                                      int unit0)
 {
     int i ;
 
     for (i = 0; i < s->num_cs; ++i) {
-        DriveInfo *dinfo = drive_get_next(IF_MTD);
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
         qemu_irq cs_line;
         DeviceState *dev;
 
@@ -382,10 +383,12 @@ static void aspeed_machine_init(MachineState *machine)
                           "max_ram", max_ram_size  - machine->ram_size);
     memory_region_add_subregion(&bmc->ram_container, machine->ram_size, &bmc->max_ram);
 
-    aspeed_board_init_flashes(&bmc->soc.fmc, bmc->fmc_model ?
-                              bmc->fmc_model : amc->fmc_model);
-    aspeed_board_init_flashes(&bmc->soc.spi[0], bmc->spi_model ?
-                              bmc->spi_model : amc->spi_model);
+    aspeed_board_init_flashes(&bmc->soc.fmc,
+                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
+                              0);
+    aspeed_board_init_flashes(&bmc->soc.spi[0],
+                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                              bmc->soc.fmc.num_cs);
 
     /* Install first FMC flash content as a boot rom. */
     if (drive0) {
@@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *machine)
     }
 
     for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
-        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
+        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
+                           drive_get(IF_SD, 0, i));
     }
 
     if (bmc->soc.emmc.num_slots) {
-        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
+        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
+                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));
     }
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
-- 
2.31.1


