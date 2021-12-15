Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F1475A9F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:26:34 +0100 (CET)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVEn-0003Sg-PO
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:26:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrf-0000vh-V0
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrY-0001SC-MF
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20ijUi3CkWbjIzQXaQV0l3+n+XRvzcevWx7pjdsoMUo=;
 b=B7IQvefpmN4GQUv3XaTMDvri2UVHkf1+UMDj872KocJEMdWsadJoVusYlyfdH7IZzb2RcN
 oqJZgHNSAmIX6n8Uwy33N5zYXmJGKLyZqRifdmOMUHXeeo0k8XwVHxShT7N7E4rU47o+De
 j7Du0Wc32TDwZEGTTdTEVq0Umh3ybH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-Kj7GGtiBMfCqfKcy4801qQ-1; Wed, 15 Dec 2021 09:02:26 -0500
X-MC-Unique: Kj7GGtiBMfCqfKcy4801qQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 210B31934105;
 Wed, 15 Dec 2021 14:02:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1C25E485;
 Wed, 15 Dec 2021 14:02:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 56BE6113861E; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] hw/arm/versatilepb hw/arm/vexpress: Replace
 drive_get_next() by drive_get()
Date: Wed, 15 Dec 2021 15:02:13 +0100
Message-Id: <20211215140222.769652-5-armbru@redhat.com>
In-Reply-To: <20211215140222.769652-1-armbru@redhat.com>
References: <20211215140222.769652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

The versatile and vexpress machines ("versatileab", "versatilepb",
"vexpress-a9", "vexpress-a15") connect just one or two backends of a
type with drive_get_next().  Change them to use drive_get() directly.
This makes the unit numbers explicit in the code.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20211117163409.3587705-5-armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/versatilepb.c | 4 ++--
 hw/arm/vexpress.c    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 575399c4fc..ecc1f6cf74 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -310,7 +310,7 @@ static void versatile_init(MachineState *machine, int board_id)
     qdev_connect_gpio_out(sysctl, 0, qdev_get_gpio_in(dev, 0));
 
     dev = sysbus_create_varargs("pl181", 0x10005000, sic[22], sic[1], NULL);
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
 
@@ -322,7 +322,7 @@ static void versatile_init(MachineState *machine, int board_id)
     }
 
     dev = sysbus_create_varargs("pl181", 0x1000b000, sic[23], sic[2], NULL);
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 1);
     if (dinfo) {
         DeviceState *card;
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 58481c0762..966758cf82 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -625,7 +625,7 @@ static void vexpress_common_init(MachineState *machine)
                           qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT));
     qdev_connect_gpio_out_named(dev, "card-inserted", 0,
                           qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN));
-    dinfo = drive_get_next(IF_SD);
+    dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
 
@@ -657,7 +657,7 @@ static void vexpress_common_init(MachineState *machine)
 
     sysbus_create_simple("pl111", map[VE_CLCD], pic[14]);
 
-    dinfo = drive_get_next(IF_PFLASH);
+    dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash0 = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0",
                                        dinfo);
     if (!pflash0) {
@@ -673,7 +673,7 @@ static void vexpress_common_init(MachineState *machine)
         memory_region_add_subregion(sysmem, map[VE_NORFLASHALIAS], flashalias);
     }
 
-    dinfo = drive_get_next(IF_PFLASH);
+    dinfo = drive_get(IF_PFLASH, 0, 1);
     if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
                                   dinfo)) {
         error_report("vexpress: error registering flash 1");
-- 
2.31.1


