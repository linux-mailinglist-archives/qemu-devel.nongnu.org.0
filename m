Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F6454B2B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:39:18 +0100 (CET)
Received: from localhost ([::1]:43258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNxt-00054J-OD
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtH-0003Qo-Mj
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:34:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNt9-000893-Ty
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYswMrWmEmAz/Uk6rnfHjwvLtZ0axzsg1ucyN0GZvJw=;
 b=SVdPfS5oFpsHbpxqVbJckKEVsdhYm/fBHmCbwFwnIZq+Axm1xyb9NK7yFiKFA/a/ofQUzz
 tVDDK+vpjZZGoHrVd6DfhpV/UXuk2nEf6Cu5VkNIJcOM8L2f6QIunwKyNvYmYnXYfcVQ1+
 S+ahcurQ1+CW6KARe2SofgjF9LRJKLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-i3Y4S7cVMYiULzdpXz7Suw-1; Wed, 17 Nov 2021 11:34:19 -0500
X-MC-Unique: i3Y4S7cVMYiULzdpXz7Suw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59FA110168C4;
 Wed, 17 Nov 2021 16:34:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 282B1100EBBE;
 Wed, 17 Nov 2021 16:34:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 975301132D27; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] hw/arm/xlnx-zcu102: Replace drive_get_next() by
 drive_get()
Date: Wed, 17 Nov 2021 17:34:06 +0100
Message-Id: <20211117163409.3587705-11-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "xlnx-zcu102" connects backends with drive_get_next() in
several counting loops.  Change it to use drive_get() directly.  This
makes the unit numbers explicit in the code.

Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/xlnx-zcu102.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 3dc2b5e8ca..45eb19ab3b 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -169,7 +169,7 @@ static void xlnx_zcu102_init(MachineState *machine)
     /* Create and plug in the SD cards */
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
         BusState *bus;
-        DriveInfo *di = drive_get_next(IF_SD);
+        DriveInfo *di = drive_get(IF_SD, 0, i);
         BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
         DeviceState *carddev;
         char *bus_name;
@@ -190,7 +190,7 @@ static void xlnx_zcu102_init(MachineState *machine)
         BusState *spi_bus;
         DeviceState *flash_dev;
         qemu_irq cs_line;
-        DriveInfo *dinfo = drive_get_next(IF_MTD);
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
         gchar *bus_name = g_strdup_printf("spi%d", i);
 
         spi_bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
@@ -212,7 +212,7 @@ static void xlnx_zcu102_init(MachineState *machine)
         BusState *spi_bus;
         DeviceState *flash_dev;
         qemu_irq cs_line;
-        DriveInfo *dinfo = drive_get_next(IF_MTD);
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, XLNX_ZYNQMP_NUM_SPIS + i);
         int bus = i / XLNX_ZYNQMP_NUM_QSPI_BUS_CS;
         gchar *bus_name = g_strdup_printf("qspi%d", bus);
 
-- 
2.31.1


