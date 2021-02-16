Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6699231C7EE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:23:01 +0100 (CET)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBwZP-0005c1-W4
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lBwXl-0004kw-DO
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:21:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lBwXh-0001Xq-QJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613467272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6C8LwhJi+zFDMksfVMI3njPkLaTa3uBWp30i4K52bw0=;
 b=bI92+RoIEvU4U/RoB28Swr0a/9yEitk9/7e0/mlP8SLc8q4cUWi7A4SjRGv7MPk4L44GRq
 VyGQRh1q6bRUzTaU6ZbSgzO6opUqcBxOaGfpbSjNX473ReIhYieW58ojGE2vyzG6C8NSUM
 oRmm2HvL/XOt2sVLz8aqBbdHz0WqLfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-Vco08BhOPoe-Fv9qL4OcCA-1; Tue, 16 Feb 2021 04:21:09 -0500
X-MC-Unique: Vco08BhOPoe-Fv9qL4OcCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EF57CE646
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 09:21:08 +0000 (UTC)
Received: from localhost (unknown [10.36.110.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A8BA7216B;
 Tue, 16 Feb 2021 09:20:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] spice: flush on GL update before notifying client
Date: Tue, 16 Feb 2021 13:20:55 +0400
Message-Id: <20210216092056.2301293-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since the introduction of spice/virgl support in commit
474114b7 ("spice: add opengl/virgl/dmabuf support"), the drawing isn't
being flushed before notifying the client. This results in
outdated/sluggish drawing on client side, in particular when using the
Linux console.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/spice-display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index 6f32b66a6e..d562c64084 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1087,6 +1087,7 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
 
     trace_qemu_spice_gl_update(ssd->qxl.id, w, h, x, y);
     qemu_spice_gl_block(ssd, true);
+    glFlush();
     cookie = (uintptr_t)qxl_cookie_new(QXL_COOKIE_TYPE_GL_DRAW_DONE, 0);
     spice_qxl_gl_draw_async(&ssd->qxl, x, y, w, h, cookie);
 }
-- 
2.29.0


