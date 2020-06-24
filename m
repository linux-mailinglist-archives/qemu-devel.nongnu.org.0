Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26936207A05
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 19:15:31 +0200 (CEST)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8zi-0007Rz-5l
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 13:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8aj-0004yq-5x
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:49:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30640
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8ag-0007xG-R9
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnV/HyOFkCf5tLNTavGfK7x5swowGtq9OLMzspL5ubo=;
 b=D8Udll9oWsoeNqlkXpNSsYPq8i0qeUmW/zRHcEjqYIOlJNXmAxJNY8r9lyHI2z+9QraIHt
 sueqamk+PFux0F940c9+pAvhNhYLkXuC0V61XQpQjeCwa6bITcbgSdjnNCKOh6V2QqvWYL
 xlIUNHBB5z3hsOS1qPn21+Hi8VicrN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-R9l3-7KNMH2e3xurHpvfuw-1; Wed, 24 Jun 2020 12:49:35 -0400
X-MC-Unique: R9l3-7KNMH2e3xurHpvfuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42086804001;
 Wed, 24 Jun 2020 16:49:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F060D7BFEA;
 Wed, 24 Jun 2020 16:49:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 81B741138497; Wed, 24 Jun 2020 18:43:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 42/46] qdev: Smooth error checking with Coccinelle
Date: Wed, 24 Jun 2020 18:43:40 +0200
Message-Id: <20200624164344.3778251-43-armbru@redhat.com>
In-Reply-To: <20200624164344.3778251-1-armbru@redhat.com>
References: <20200624164344.3778251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit enables conversion of

    qdev_prop_set_drive_err(..., &err);
    if (err) {
    ...
    }

to

    if (!qdev_prop_set_drive_err(..., errp)) {
    ...
    }

Coccinelle script:

    @@
    identifier fun = qdev_prop_set_drive_err;
    expression list args, args2;
    typedef Error;
    Error *err;
    identifier errp;
    @@
    -      fun(args, &err, args2);
    -      if (err) {
    +      if (!fun(args, errp, args2)) {
	       ... when != err
    -	   error_propagate(errp, err);
	       ...
	   }

    @@
    identifier fun = qdev_prop_set_drive_err;
    expression list args, args2;
    typedef Error;
    Error *err;
    @@
    -      fun(args, &err, args2);
    -      if (err) {
    +      if (!fun(args, &err, args2)) {
	       ...
	   }

Eliminate error_propagate() that are now unnecessary.  Delete @err
that are now unused.  Tidy up line breaks and whitespace.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/scsi/scsi-bus.c | 5 +----
 hw/sd/sd.c         | 3 +--
 hw/sd/ssi-sd.c     | 5 ++---
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index b937df16bc..df65cc2223 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -248,7 +248,6 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
     const char *driver;
     char *name;
     DeviceState *dev;
-    Error *err = NULL;
     DriveInfo *dinfo;
 
     if (blk_is_sg(blk)) {
@@ -277,9 +276,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
     if (serial && object_property_find(OBJECT(dev), "serial", NULL)) {
         qdev_prop_set_string(dev, "serial", serial);
     }
-    qdev_prop_set_drive_err(dev, "drive", blk, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!qdev_prop_set_drive_err(dev, "drive", blk, errp)) {
         object_unparent(OBJECT(dev));
         return NULL;
     }
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 97a9d32964..5137168d66 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -706,8 +706,7 @@ SDState *sd_init(BlockBackend *blk, bool is_spi)
 
     obj = object_new(TYPE_SD_CARD);
     dev = DEVICE(obj);
-    qdev_prop_set_drive_err(dev, "drive", blk, &err);
-    if (err) {
+    if (!qdev_prop_set_drive_err(dev, "drive", blk, &err)) {
         error_reportf_err(err, "sd_init failed: ");
         return NULL;
     }
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 4d91f603fa..e0fb9f3093 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -254,9 +254,8 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
     dinfo = drive_get_next(IF_SD);
     carddev = qdev_new(TYPE_SD_CARD);
     if (dinfo) {
-        qdev_prop_set_drive_err(carddev, "drive", blk_by_legacy_dinfo(dinfo),
-                                &err);
-        if (err) {
+        if (!qdev_prop_set_drive_err(carddev, "drive",
+                                     blk_by_legacy_dinfo(dinfo), &err)) {
             goto fail;
         }
     }
-- 
2.26.2


