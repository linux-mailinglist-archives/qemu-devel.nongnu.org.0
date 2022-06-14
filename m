Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03EF54B074
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:22:26 +0200 (CEST)
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o15Yv-00048F-W3
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15T8-0006Un-Ew
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15T0-0007kS-Dm
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655208977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgE0u/psF+5HbFaMEFEBF+1+y1Gn5UXWEs7HICOeN3Q=;
 b=ZG0qKNWXiUrvILOD7m9nufbILm7qLZEGS1xz+noUIxHd8YciUG33+VtxhqLHcUBexEshLl
 Lv8DjRKlJulCbvPnQ9QcyW6dKRFhuDxMZS7PG5JKZNbnr1hTlFe2Up9x6J1HruOAbJ71AP
 4yIC6uTnKyQ5WGEDTt+TWx9fSvevusw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-pVihZslYPXmGc_VmJgPZPg-1; Tue, 14 Jun 2022 08:16:14 -0400
X-MC-Unique: pVihZslYPXmGc_VmJgPZPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 417BF85A58E;
 Tue, 14 Jun 2022 12:16:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0829E400F3FF;
 Tue, 14 Jun 2022 12:16:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 14D011800395; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Canokeys.org" <contact@canokeys.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 03/15] ui/cocoa: Fix poweroff request code
Date: Tue, 14 Jun 2022 14:15:58 +0200
Message-Id: <20220614121610.508356-4-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220529082508.89097-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 09a62817f2a9..84c84e98fc5e 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -35,6 +35,7 @@
 #include "ui/kbd-state.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
 #include "sysemu/cpu-throttle.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block.h"
@@ -1290,7 +1291,10 @@ - (void)applicationWillTerminate:(NSNotification *)aNotification
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
 
-    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
+    with_iothread_lock(^{
+        shutdown_action = SHUTDOWN_ACTION_POWEROFF;
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
+    });
 
     /*
      * Sleep here, because returning will cause OSX to kill us
-- 
2.36.1


