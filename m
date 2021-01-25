Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981753027D4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:30:00 +0100 (CET)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44kZ-0006PR-Lp
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l44f4-0001g2-GM
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:24:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l44ey-0007je-Nv
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611591850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKP7Q7osLsvT1soIEA1W+zmnEf7Juc8PolyMuH5YceI=;
 b=Rmugv02XZalAkf8chSJl1zMXtsxfGXdKJdeKv/XKrXjD+wIWYXzmGN/6gtZU4HBZkkfjlO
 eTOQo4sFBenrsyu57GBj7yp31qDpvjqMPDYQuuW2UfjBn53YXe/4KTLqKXKgInoVqeh6qc
 yHNVtNYSZDoaPCqtKn7soVAane5/J9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-FftM-X3gPxKPS18Lkm-KLw-1; Mon, 25 Jan 2021 11:24:09 -0500
X-MC-Unique: FftM-X3gPxKPS18Lkm-KLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1229210054FF;
 Mon, 25 Jan 2021 16:24:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1ED5D9DB;
 Mon, 25 Jan 2021 16:24:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0EC0F1138461; Mon, 25 Jan 2021 17:24:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] fdc: Inline fdctrl_connect_drives() into
 fdctrl_realize_common()
Date: Mon, 25 Jan 2021 17:24:01 +0100
Message-Id: <20210125162402.1807394-3-armbru@redhat.com>
In-Reply-To: <20210125162402.1807394-1-armbru@redhat.com>
References: <20210125162402.1807394-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, libvir-list@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit rendered the name fdctrl_realize_common() somewhat
misleading.  Get rid of it by inlining the (now pretty simple)
function into its only caller.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/block/fdc.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index c6c9393e29..7fc547c62d 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2521,20 +2521,6 @@ void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds)
     fdctrl_init_drives(&ISA_FDC(fdc)->state.bus, fds);
 }
 
-static void fdctrl_connect_drives(FDCtrl *fdctrl, DeviceState *fdc_dev,
-                                  Error **errp)
-{
-    unsigned int i;
-    FDrive *drive;
-
-    for (i = 0; i < MAX_FD; i++) {
-        drive = &fdctrl->drives[i];
-        drive->fdctrl = fdctrl;
-        fd_init(drive);
-        fd_revalidate(drive);
-    }
-}
-
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds)
 {
@@ -2575,6 +2561,7 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
                                   Error **errp)
 {
     int i, j;
+    FDrive *drive;
     static int command_tables_inited = 0;
 
     if (fdctrl->fallback == FLOPPY_DRIVE_TYPE_AUTO) {
@@ -2614,7 +2601,13 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
     }
 
     floppy_bus_create(fdctrl, &fdctrl->bus, dev);
-    fdctrl_connect_drives(fdctrl, dev, errp);
+
+    for (i = 0; i < MAX_FD; i++) {
+        drive = &fdctrl->drives[i];
+        drive->fdctrl = fdctrl;
+        fd_init(drive);
+        fd_revalidate(drive);
+    }
 }
 
 static const MemoryRegionPortio fdc_portio_list[] = {
-- 
2.26.2


