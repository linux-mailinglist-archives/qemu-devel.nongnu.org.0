Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B228475B45
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:00:44 +0100 (CET)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVlr-0005qJ-8Y
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:00:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrl-0000zl-UG
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUra-0001TI-4M
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwBr7DLX25Tdnq9A/wZL4KQ5ENSJgKkxMvK2leyMdfM=;
 b=U1qgPanT0qquzpDxjznr7wTfXTe4bDRrRI/UDo1k2FJS+cd+pnK9gCtU0l2Wa4PaoXMQfP
 g7ayGdVDucoFUtoO/F2NI0RAcmu3eJKhK/B7uF7ZMguoe0HOGJwHeitD4Fa6dod5wF0rlk
 0vI5vzloFGCmgw72ucPnL0wLRSVG2hE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-FnXHfUbjPiG3NrdYWyF5cg-1; Wed, 15 Dec 2021 09:02:26 -0500
X-MC-Unique: FnXHfUbjPiG3NrdYWyF5cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62FBC1934106;
 Wed, 15 Dec 2021 14:02:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB295BD01;
 Wed, 15 Dec 2021 14:02:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5369B1138611; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] hw/arm/npcm7xx_boards: Replace drive_get_next() by
 drive_get()
Date: Wed, 15 Dec 2021 15:02:12 +0100
Message-Id: <20211215140222.769652-4-armbru@redhat.com>
In-Reply-To: <20211215140222.769652-1-armbru@redhat.com>
References: <20211215140222.769652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "quanta-gbs-bmc" connects just one backend with
drive_get_next(), but with a helper function.  Change it to use
drive_get() directly.  This makes the unit numbers explicit in the
code.

Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20211117163409.3587705-4-armbru@redhat.com>
Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index dec7d16ae5..d8a49e4e85 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -84,9 +84,9 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
                              &error_abort);
 }
 
-static void sdhci_attach_drive(SDHCIState *sdhci)
+static void sdhci_attach_drive(SDHCIState *sdhci, int unit)
 {
-        DriveInfo *di = drive_get_next(IF_SD);
+        DriveInfo *di = drive_get(IF_SD, 0, unit);
         BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
 
         BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
@@ -374,7 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
                           drive_get(IF_MTD, 0, 0));
 
     quanta_gbs_i2c_init(soc);
-    sdhci_attach_drive(&soc->mmc.sdhci);
+    sdhci_attach_drive(&soc->mmc.sdhci, 0);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.31.1


