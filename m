Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B320548E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 16:27:47 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnjtq-0006qV-7I
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 10:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnjpq-0001hd-AC
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:23:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34967
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnjpm-0007ie-0h
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592922213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEcIsXzOthQgeNTiPu22drNv3v4DqfLOdNPXqchnCVM=;
 b=T7k0SOJbC5s2qblskl1TYwYVtBTri/nvLmUH9ifBFD0KtOacJlW6+pUuT5YCsVbY96WBJQ
 1lCuG3Eso+YxNTFG7mhKZCabgkvCc63PcmoUtScacNzXWxquTKdmoQVI/TtGGKuEKRwiYb
 PdjQXvlHGyIeGbwfZ9w2uW+CjKdtS9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-GmakxzJgOzSzIm_-4QN42A-1; Tue, 23 Jun 2020 10:23:31 -0400
X-MC-Unique: GmakxzJgOzSzIm_-4QN42A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1713107ACF2;
 Tue, 23 Jun 2020 14:23:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD97E78F0A;
 Tue, 23 Jun 2020 14:23:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B470113847C; Tue, 23 Jun 2020 16:23:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/16] arm/aspeed: Drop aspeed_board_init_flashes() parameter
 @errp
Date: Tue, 23 Jun 2020 16:23:24 +0200
Message-Id: <20200623142326.2349416-15-armbru@redhat.com>
In-Reply-To: <20200623142326.2349416-1-armbru@redhat.com>
References: <20200623142326.2349416-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
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
Message-Id: <20200622094227.1271650-15-armbru@redhat.com>
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


