Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DE23E1660
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:06:56 +0200 (CEST)
Received: from localhost ([::1]:42182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBe1P-0007lw-Aa
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdvY-0002vl-Pw
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:00:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdvV-0002Hy-Rc
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628172048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=to95uZafGFonwXR9uWkFz4LxEZMdZ3CnyRt1L1hyKXM=;
 b=DGYbThRt90097lEp3ssSyBAWkGpT2Q1tYIw7rZEKa7i53NpgbZa7FSGcFU1uQrDNRBjcsC
 rbUgBQPccZWdvbuiOQqRdEAOgPJskkoAuWN9w0aqTSpAjzEfxEx9z6oGtbShtC7/3Q7eXd
 rGREy9IrSPNejy45SbjmzwielO8pWtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-vU7y6UADPKa6N7HgSvFe4w-1; Thu, 05 Aug 2021 10:00:47 -0400
X-MC-Unique: vU7y6UADPKa6N7HgSvFe4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 625BD100CA89
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 14:00:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CA181000186;
 Thu,  5 Aug 2021 14:00:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/18] ui/vdagent: add a migration blocker
Date: Thu,  5 Aug 2021 17:57:15 +0400
Message-Id: <20210805135715.857938-19-marcandre.lureau@redhat.com>
In-Reply-To: <20210805135715.857938-1-marcandre.lureau@redhat.com>
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The current implementation lacks migration support. After migration,
vdagent support will be broken (even after a restart of the daemons).
Let's try to fix it in 6.2.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vdagent.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 7d8cb963ff..603a2a7bd2 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -6,6 +6,7 @@
 #include "qemu/option.h"
 #include "qemu/units.h"
 #include "hw/qdev-core.h"
+#include "migration/blocker.h"
 #include "ui/clipboard.h"
 #include "ui/console.h"
 #include "ui/input.h"
@@ -23,6 +24,9 @@
 struct VDAgentChardev {
     Chardev parent;
 
+    /* TODO: migration isn't yet supported */
+    Error *migration_blocker;
+
     /* config */
     bool mouse;
     bool clipboard;
@@ -599,6 +603,10 @@ static void vdagent_chr_open(Chardev *chr,
     return;
 #endif
 
+    if (migrate_add_blocker(vd->migration_blocker, errp) != 0) {
+        return;
+    }
+
     vd->mouse = VDAGENT_MOUSE_DEFAULT;
     if (cfg->has_mouse) {
         vd->mouse = cfg->mouse;
@@ -832,6 +840,8 @@ static void vdagent_chr_init(Object *obj)
     VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(obj);
 
     buffer_init(&vd->outbuf, "vdagent-outbuf");
+    error_setg(&vd->migration_blocker,
+               "The vdagent chardev doesn't yet support migration");
 }
 
 static void vdagent_chr_fini(Object *obj)
@@ -840,6 +850,7 @@ static void vdagent_chr_fini(Object *obj)
 
     vdagent_disconnect(vd);
     buffer_free(&vd->outbuf);
+    error_free(vd->migration_blocker);
 }
 
 static const TypeInfo vdagent_chr_type_info = {
-- 
2.32.0.264.g75ae10bc75


