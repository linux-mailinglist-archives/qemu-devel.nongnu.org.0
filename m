Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA369336D58
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 08:54:40 +0100 (CET)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKG9X-00051N-Q8
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 02:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKG7Y-0003Tf-SD
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKG7S-00077t-Ez
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615449149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jO/U9oC1uDnEofr01HB/mG7JYp6NvbgVHNrMl4bHw1U=;
 b=CI2ifA6XOfBeGm6B1mXplYtDu3EVZWyt0moJJGEIfcq85e9tYXx5EguF8zjRFWVQDzqBGM
 CKJ2jnApMiQIWI74QqLUExQFpaFMzAp8QKMcanufXUvB2ukkJvtrPcq5z+H1RMt42YfZ19
 li9ExXvw1FmHm5ulMSmdEfJxqHaQtyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-CrjUhAH3P-K_cNbvqStZBg-1; Thu, 11 Mar 2021 02:52:27 -0500
X-MC-Unique: CrjUhAH3P-K_cNbvqStZBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 570DC83DD21;
 Thu, 11 Mar 2021 07:52:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06F1D5DEF9;
 Thu, 11 Mar 2021 07:52:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8DA8E1131C01; Thu, 11 Mar 2021 08:52:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] fdc: Inline fdctrl_connect_drives() into
 fdctrl_realize_common()
Date: Thu, 11 Mar 2021 08:52:20 +0100
Message-Id: <20210311075221.1795266-4-armbru@redhat.com>
In-Reply-To: <20210311075221.1795266-1-armbru@redhat.com>
References: <20210311075221.1795266-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
 libvir-list@redhat.com, richard.henderson@linaro.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit rendered the name fdctrl_connect_drives() somewhat
misleading.  Get rid of it by inlining the (now pretty simple)
function into its only caller.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/block/fdc.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index f978ddf647..5210ab85e2 100644
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
@@ -2604,7 +2590,14 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
     }
 
     floppy_bus_create(fdctrl, &fdctrl->bus, dev);
-    fdctrl_connect_drives(fdctrl, dev, errp);
+
+    for (i = 0; i < MAX_FD; i++) {
+        FDrive *drive = &fdctrl->drives[i];
+
+        drive->fdctrl = fdctrl;
+        fd_init(drive);
+        fd_revalidate(drive);
+    }
 }
 
 static const MemoryRegionPortio fdc_portio_list[] = {
-- 
2.26.2


