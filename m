Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A25833DDBD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:44:06 +0100 (CET)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFbp-0005CD-1c
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMFIL-0000DM-7P
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMFIH-0002NX-5b
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615922632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdSer4G8YKk2oNImVWO7Db5YrIwrVO3xMGHC6suIL7w=;
 b=Ygl35baJ5rVGzUm26CsPpf7jidxpg9Ysg6LETFcn0/IfoHO1tzhi+o8oplt7eosrw2oA4e
 9riByf9hmprZ41oyaFZkYaQLS+rmrBbZMtOWGZl1uEfJcvyZnU2uB+7QEoGfC6ruFUrxAr
 wAoG1K2FXyxr3+LXZTkj9KTrt1dvJqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-1kX0FYNDOt22q_iOBefBzA-1; Tue, 16 Mar 2021 15:23:50 -0400
X-MC-Unique: 1kX0FYNDOt22q_iOBefBzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDC65107B005;
 Tue, 16 Mar 2021 19:23:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF2445C1A1;
 Tue, 16 Mar 2021 19:23:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 368081131C01; Tue, 16 Mar 2021 20:23:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/6] fdc: Inline fdctrl_connect_drives() into
 fdctrl_realize_common()
Date: Tue, 16 Mar 2021 20:23:44 +0100
Message-Id: <20210316192347.3918857-4-armbru@redhat.com>
In-Reply-To: <20210316192347.3918857-1-armbru@redhat.com>
References: <20210316192347.3918857-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit rendered the name fdctrl_connect_drives() somewhat
misleading.  Get rid of it by inlining the (now pretty simple)
function into its only caller.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20210309161214.1402527-4-armbru@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/block/fdc.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index f978ddf647..32701c2bc5 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2511,20 +2511,6 @@ void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds)
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
@@ -2565,6 +2551,7 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
                                   Error **errp)
 {
     int i, j;
+    FDrive *drive;
     static int command_tables_inited = 0;
 
     if (fdctrl->fallback == FLOPPY_DRIVE_TYPE_AUTO) {
@@ -2604,7 +2591,13 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
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


