Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1AD2033DA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 11:44:45 +0200 (CEST)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnJ0O-0005X8-VV
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 05:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyS-0001oQ-Sm
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:42:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22143
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyJ-0003wG-M0
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592818955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmQVaYrIUs2OljokJgDutDB0ttHPzle5xo5i2bLipJs=;
 b=cTgcwsw3FcoUUrQWeqGZ4BVl6AbKqn9rg5MMRDyxaNVWniH21X/5vuZ6Xjs0XEnG91OAGN
 FuXtkfRwTBzsjDEBOS5f89M1UKiajHBprllw48OUNiaMKpEnIHX9geoCpj17sYZcNfJNmX
 gPimx5/pe24EI3OLNipc8oO2nUwnLvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-LpUhDj4GPk2AdiuuwTlpmg-1; Mon, 22 Jun 2020 05:42:33 -0400
X-MC-Unique: LpUhDj4GPk2AdiuuwTlpmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB228835B42;
 Mon, 22 Jun 2020 09:42:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA017C1FE;
 Mon, 22 Jun 2020 09:42:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1BC98113847C; Mon, 22 Jun 2020 11:42:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/16] arm/aspeed: Drop aspeed_board_init_flashes()
 parameter @errp
Date: Mon, 22 Jun 2020 11:42:25 +0200
Message-Id: <20200622094227.1271650-15-armbru@redhat.com>
In-Reply-To: <20200622094227.1271650-1-armbru@redhat.com>
References: <20200622094227.1271650-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 mreitz@redhat.com, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, pbonzini@redhat.com,
 jsnow@redhat.com, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We always pass &error_abort.  Drop the parameter, use &error_abort
directly.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/aspeed.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 42d818b81c..863757e1f0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -215,8 +215,8 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     g_free(storage);
 }
 
-static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
-                                      Error **errp)
+static void aspeed_board_init_flashes(AspeedSMCState *s,
+                                      const char *flashtype)
 {
     int i ;
 
@@ -227,8 +227,8 @@ static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
 
         fl->flash = qdev_new(flashtype);
         if (dinfo) {
-            qdev_prop_set_drive_err(fl->flash, "drive",
-                                    blk_by_legacy_dinfo(dinfo), errp);
+            qdev_prop_set_drive(fl->flash, "drive",
+                                blk_by_legacy_dinfo(dinfo));
         }
         qdev_realize_and_unref(fl->flash, BUS(s->spi), &error_fatal);
 
@@ -314,8 +314,8 @@ static void aspeed_machine_init(MachineState *machine)
                           "max_ram", max_ram_size  - ram_size);
     memory_region_add_subregion(&bmc->ram_container, ram_size, &bmc->max_ram);
 
-    aspeed_board_init_flashes(&bmc->soc.fmc, amc->fmc_model, &error_abort);
-    aspeed_board_init_flashes(&bmc->soc.spi[0], amc->spi_model, &error_abort);
+    aspeed_board_init_flashes(&bmc->soc.fmc, amc->fmc_model);
+    aspeed_board_init_flashes(&bmc->soc.spi[0], amc->spi_model);
 
     /* Install first FMC flash content as a boot rom. */
     if (drive0) {
-- 
2.26.2


