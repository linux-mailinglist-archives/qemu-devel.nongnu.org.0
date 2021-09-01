Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2B63FD259
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 06:28:30 +0200 (CEST)
Received: from localhost ([::1]:42934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLHrR-0000fW-TX
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 00:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHjB-0006jq-Ey
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHj7-0001yK-Mq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630469992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGdGZvxrYlY/3/cqMJj5yr6YPJrDB+CO8qjQORCnAl4=;
 b=DyphrGL/rbu0HxMo/umI86kUuvJvnnD0FLnsgdLIpN0OO2OClxAENVRf19iDp7yq1HPZ1P
 4+styW3Po1H7cXPkUw1I/BiMCH9LTLBQ8DXDVERRYiskLiyIT4j9Sc03vrvqecEo+vXFp5
 rmzRfGrAWSg/5nCheBVZbng+swT7STE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-iT_Gkn0yOpO-JbbezCGSYA-1; Wed, 01 Sep 2021 00:19:51 -0400
X-MC-Unique: iT_Gkn0yOpO-JbbezCGSYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74736189C446;
 Wed,  1 Sep 2021 04:19:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3E471001281;
 Wed,  1 Sep 2021 04:19:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 77FC818009F4; Wed,  1 Sep 2021 06:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] hw/display/artist: Fix bug in coordinate extraction in
 artist_vram_read() and artist_vram_write()
Date: Wed,  1 Sep 2021 06:19:03 +0200
Message-Id: <20210901041903.3111086-7-kraxel@redhat.com>
In-Reply-To: <20210901041903.3111086-1-kraxel@redhat.com>
References: <20210901041903.3111086-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

The CDE desktop on HP-UX 10 shows wrongly rendered pixels when the local screen
menu is closed. This bug was introduced by commit c7050f3f167b
("hw/display/artist: Refactor x/y coordination extraction") which converted the
coordinate extraction in artist_vram_read() and artist_vram_write() to use the
ADDR_TO_X and ADDR_TO_Y macros, but forgot to right-shift the address by 2 as
it was done before.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: c7050f3f167b ("hw/display/artist: Refactor x/y coordination extraction")
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Sven Schnelle <svens@stackframe.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YK1aPb8keur9W7h2@ls3530>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/artist.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index aa7bd594aac0..21b7fd1b440e 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1170,8 +1170,8 @@ static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
     }
 
     buf = vram_write_buffer(s);
-    posy = ADDR_TO_Y(addr);
-    posx = ADDR_TO_X(addr);
+    posy = ADDR_TO_Y(addr >> 2);
+    posx = ADDR_TO_X(addr >> 2);
 
     if (!buf->size) {
         return;
@@ -1232,8 +1232,8 @@ static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size)
         return 0;
     }
 
-    posy = ADDR_TO_Y(addr);
-    posx = ADDR_TO_X(addr);
+    posy = ADDR_TO_Y(addr >> 2);
+    posx = ADDR_TO_X(addr >> 2);
 
     if (posy > buf->height || posx > buf->width) {
         return 0;
-- 
2.31.1


