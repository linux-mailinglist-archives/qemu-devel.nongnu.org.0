Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDAB33899C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:05:58 +0100 (CET)
Received: from localhost ([::1]:57636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeg9-0002eh-JP
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKebr-0006jF-AW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKebi-00029p-It
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EX4SCqUu9TjjEb0u/oZndKEfA8JC/LvHoqNIFbvdD8A=;
 b=BNjYmCpwnFukoqv4c+iYmkvb75mtaR/ccBKpDQqEylqEqmtSGPKZUO9gVBbAUSRtHFqFQK
 ZpXVuwc6y6ww7GFhMgEx16nTL6ssJS0VswLK7GmKhi+1ibgnfNy+ljO7wrYDn7xPpnbgkv
 qhOiLxjednTqhXjAARL7seugJXABpUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-CSCwdUaPNGavKBTydbYUVA-1; Fri, 12 Mar 2021 05:01:20 -0500
X-MC-Unique: CSCwdUaPNGavKBTydbYUVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25B5D8015BD
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:01:19 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7CCA196E3;
 Fri, 12 Mar 2021 10:01:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 01/27] ui: fold qemu_alloc_display in only caller
Date: Fri, 12 Mar 2021 14:00:42 +0400
Message-Id: <20210312100108.2706195-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

A minor code simplification.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 171a7bf14b..bab32723b5 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1386,26 +1386,18 @@ static QemuConsole *new_console(DisplayState *ds, console_type_t console_type,
     return s;
 }
 
-static void qemu_alloc_display(DisplaySurface *surface, int width, int height)
+DisplaySurface *qemu_create_displaysurface(int width, int height)
 {
-    qemu_pixman_image_unref(surface->image);
-    surface->image = NULL;
+    DisplaySurface *surface = g_new0(DisplaySurface, 1);
 
+    trace_displaysurface_create(surface, width, height);
     surface->format = PIXMAN_x8r8g8b8;
     surface->image = pixman_image_create_bits(surface->format,
                                               width, height,
                                               NULL, width * 4);
     assert(surface->image != NULL);
-
     surface->flags = QEMU_ALLOCATED_FLAG;
-}
 
-DisplaySurface *qemu_create_displaysurface(int width, int height)
-{
-    DisplaySurface *surface = g_new0(DisplaySurface, 1);
-
-    trace_displaysurface_create(surface, width, height);
-    qemu_alloc_display(surface, width, height);
     return surface;
 }
 
-- 
2.29.0


