Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CC332CC8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:06:03 +0100 (CET)
Received: from localhost ([::1]:57682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfo2-0004DL-JV
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJeyC-0007r0-7p
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJey8-0000Fr-OC
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615306343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r99EcZb7CQ6mgjNwmAHWGcsYGGYPYZsJegLrB+sOF+I=;
 b=VAAXrDIqvUayOUs5luZMCowxFrtVLfYxVGM70IHj1C41mNLdgqIQh5kqJnlqPwEsPnlH+s
 eDHBi+JnfxkBLgBjQzmQ0RU+VQq/7u9fswUyCcJ+u96Tzm7lQUKDs+nEdBCloFYXsg2wvD
 a3ELtJEBq8DvKzW/IMiaeCkictpNaew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-yuwASzRmN7e1XHsX_P0yNA-1; Tue, 09 Mar 2021 11:12:20 -0500
X-MC-Unique: yuwASzRmN7e1XHsX_P0yNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 175E580432E;
 Tue,  9 Mar 2021 16:12:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8042F1002391;
 Tue,  9 Mar 2021 16:12:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 13FEE1131C01; Tue,  9 Mar 2021 17:12:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] fdc: Inline fdctrl_connect_drives() into
 fdctrl_realize_common()
Date: Tue,  9 Mar 2021 17:12:12 +0100
Message-Id: <20210309161214.1402527-4-armbru@redhat.com>
In-Reply-To: <20210309161214.1402527-1-armbru@redhat.com>
References: <20210309161214.1402527-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit rendered the name fdctrl_connect_drives() somewhat
misleading.  Get rid of it by inlining the (now pretty simple)
function into its only caller.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


