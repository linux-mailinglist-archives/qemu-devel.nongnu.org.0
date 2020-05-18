Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B351D7C92
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 17:18:46 +0200 (CEST)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jahXR-00072R-EN
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 11:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jahS8-0008FR-Ji
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:13:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23865
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jahS6-0005xw-HZ
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589814790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtqUmKQMGjg6mbojO7jrd87kWqX6KkWWBX0ulVrUm/w=;
 b=KjQcWrrUgJzdfVA3bwJG29Wwuj/jE1siEXwcexxYCXqqpzWt5LszQhihdBkzcvBXERdZAY
 u417gtaUHPgZchpuMRQ3BFBx1KDU4uuI9gRDvR+SWyWC0JyWkNK0PWGnNC1pBuRN5Za9ut
 2Z3D5e+l6FqO7cj+anh5i34O+iJjjy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-9bWC0OqIMKu1EQ-y2nOC0w-1; Mon, 18 May 2020 11:13:08 -0400
X-MC-Unique: 9bWC0OqIMKu1EQ-y2nOC0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB68E107ACF4;
 Mon, 18 May 2020 15:13:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B10695C1B2;
 Mon, 18 May 2020 15:13:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B6C5A9DAF; Mon, 18 May 2020 17:12:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] ramfb: don't update RAMFBState on errors
Date: Mon, 18 May 2020 17:12:53 +0200
Message-Id: <20200518151255.10785-7-kraxel@redhat.com>
In-Reply-To: <20200518151255.10785-1-kraxel@redhat.com>
References: <20200518151255.10785-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <huth@tuxfamily.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Store width & height & surface in local variables.  Update RAMFBState
with the new values only in case the ramfb_create_display_surface() call
succeeds.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Message-id: 20200429115236.28709-5-kraxel@redhat.com
---
 hw/display/ramfb.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 228defee5683..1a20bdec416f 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -71,18 +71,26 @@ static DisplaySurface *ramfb_create_display_surface(int width, int height,
 static void ramfb_fw_cfg_write(void *dev, off_t offset, size_t len)
 {
     RAMFBState *s = dev;
-    uint32_t fourcc, format;
+    DisplaySurface *surface;
+    uint32_t fourcc, format, width, height;
     hwaddr stride, addr;
 
-    s->width  = be32_to_cpu(s->cfg.width);
-    s->height = be32_to_cpu(s->cfg.height);
-    stride    = be32_to_cpu(s->cfg.stride);
-    fourcc    = be32_to_cpu(s->cfg.fourcc);
-    addr      = be64_to_cpu(s->cfg.addr);
-    format    = qemu_drm_format_to_pixman(fourcc);
+    width  = be32_to_cpu(s->cfg.width);
+    height = be32_to_cpu(s->cfg.height);
+    stride = be32_to_cpu(s->cfg.stride);
+    fourcc = be32_to_cpu(s->cfg.fourcc);
+    addr   = be64_to_cpu(s->cfg.addr);
+    format = qemu_drm_format_to_pixman(fourcc);
 
-    s->ds = ramfb_create_display_surface(s->width, s->height,
-                                         format, stride, addr);
+    surface = ramfb_create_display_surface(width, height,
+                                           format, stride, addr);
+    if (!surface) {
+        return;
+    }
+
+    s->width = width;
+    s->height = height;
+    s->ds = surface;
 }
 
 void ramfb_display_update(QemuConsole *con, RAMFBState *s)
-- 
2.18.4


