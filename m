Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A293D3E59D3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:23:49 +0200 (CEST)
Received: from localhost ([::1]:52360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQnM-0006N9-Mj
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDQie-0005sY-Ek
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDQid-0008VL-2M
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628597934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkeA9963fvICt6ND8XDfTgGy1x/kapYUXHTh6Eheow4=;
 b=btYhsm/nK7dUKozDIVB8LumtD0r5e2fcH03UuDpqdMM7jzlK1Bg4k/9Q3ABidLrbLgXYp9
 EaIejLOy3kdvPPaXRabnA1LHwFXuRxK9JuIAz6Ik6v31zJ8u9AYjYha8xTiCZywFqQ8yGI
 fazCqdGEWU2vqDAmNDFcM+tHjGMbZCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-fFe_qDwBOyms_CrlpXZG8Q-1; Tue, 10 Aug 2021 08:18:52 -0400
X-MC-Unique: fFe_qDwBOyms_CrlpXZG8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20F90107B7C8;
 Tue, 10 Aug 2021 12:18:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1DF581F73;
 Tue, 10 Aug 2021 12:18:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2831A180092B; Tue, 10 Aug 2021 14:18:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] ui/sdl2: Check return value from g_setenv()
Date: Tue, 10 Aug 2021 14:18:39 +0200
Message-Id: <20210810121840.2525726-4-kraxel@redhat.com>
In-Reply-To: <20210810121840.2525726-1-kraxel@redhat.com>
References: <20210810121840.2525726-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Setting environment variables can fail; check the return value
from g_setenv() and bail out if we couldn't set SDL_VIDEODRIVER.

Fixes: Coverity 1458798
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210809161424.32355-1-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/sdl2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 36d9010cb6c1..17c0ec30ebff 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -817,7 +817,10 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
      * This is a bit hackish but saves us from bigger problem.
      * Maybe it's a good idea to fix this in SDL instead.
      */
-    g_setenv("SDL_VIDEODRIVER", "x11", 0);
+    if (!g_setenv("SDL_VIDEODRIVER", "x11", 0)) {
+        fprintf(stderr, "Could not set SDL_VIDEODRIVER environment variable\n");
+        exit(1);
+    }
 #endif
 
     if (SDL_Init(SDL_INIT_VIDEO)) {
-- 
2.31.1


