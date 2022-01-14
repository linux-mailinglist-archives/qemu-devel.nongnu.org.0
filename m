Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04948E4D6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:24:00 +0100 (CET)
Received: from localhost ([::1]:40914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GwJ-0007Oy-Ky
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUy-0007iG-Lo
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUt-0007X8-DM
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QYaePNesUhGV9EeKWb7YBL5nDB2gVWXti8ghgULBy0=;
 b=be9ZNZLSkPbJFp5/jn437TXNpI+nfJD3FawFYyOIQbF1QGtHLdS+ZvZhbiQCJHfUNayVLr
 YkPIUE4FOS+yCm5IQXYlPyPbQla+nqxNqGopDxjlHmiYSoTmVRpZ1b4fLbPfy8nm7IUKTA
 FYIcg0wXse4A/aezXSWVO3raSk1rbp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-dpvn52SdMIG8fKeazyZwDA-1; Fri, 14 Jan 2022 01:55:34 -0500
X-MC-Unique: dpvn52SdMIG8fKeazyZwDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBF4164141;
 Fri, 14 Jan 2022 06:55:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7058578AEA;
 Fri, 14 Jan 2022 06:55:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 890C91800852; Fri, 14 Jan 2022 07:53:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] ui/sdl2: pass horizontal scroll information to the
 device code
Date: Fri, 14 Jan 2022 07:53:25 +0100
Message-Id: <20220114065326.782420-20-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Dmitry Petrov <dpetroff@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Petrov <dpetroff@gmail.com>

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
Message-Id: <20220108153947.171861-5-dpetroff@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/sdl2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 0bd30504cfcc..46a252d7d9d7 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -33,6 +33,7 @@
 #include "sysemu/runstate-action.h"
 #include "sysemu/sysemu.h"
 #include "ui/win32-kbd-hook.h"
+#include "qemu/log.h"
 
 static int sdl2_num_outputs;
 static struct sdl2_console *sdl2_console;
@@ -535,6 +536,10 @@ static void handle_mousewheel(SDL_Event *ev)
         btn = INPUT_BUTTON_WHEEL_UP;
     } else if (wev->y < 0) {
         btn = INPUT_BUTTON_WHEEL_DOWN;
+    } else if (wev->x < 0) {
+        btn = INPUT_BUTTON_WHEEL_RIGHT;
+    } else if (wev->x > 0) {
+        btn = INPUT_BUTTON_WHEEL_LEFT;
     } else {
         return;
     }
-- 
2.34.1


