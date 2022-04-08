Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ADC4F8D2E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 06:55:49 +0200 (CEST)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncgey-0006mt-RS
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 00:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ncgcT-0004ln-S8
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 00:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ncgcO-0000vq-8t
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 00:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649393584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyZLwjMryR1qotp94vwQJTdrV7UPTn4JCz0g4HLB7l0=;
 b=aDVRYu+8n5GF4vQz4eoOQ8N3wnOEh+fmk8lNgue9cZJ7j513cdwiegTWwhpLCzLv4xRHkw
 N5n+ym0IIDL2F6amdX5lPPr7frY568DHdGrXClSR3/3vkQzhaewosU3g1cACDyiiPky/P+
 tdjXS8FLVBMkgf6iG7zznHHu5nhJgoI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-L7WgnZHGPR-qM6M9a_TWLQ-1; Fri, 08 Apr 2022 00:53:03 -0400
X-MC-Unique: L7WgnZHGPR-qM6M9a_TWLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CF6B29DD9BE
 for <qemu-devel@nongnu.org>; Fri,  8 Apr 2022 04:53:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8829C2166BA2;
 Fri,  8 Apr 2022 04:52:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D62041800635; Fri,  8 Apr 2022 06:52:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2021-4206)
Date: Fri,  8 Apr 2022 06:52:52 +0200
Message-Id: <20220408045252.2375896-3-kraxel@redhat.com>
In-Reply-To: <20220408045252.2375896-1-kraxel@redhat.com>
References: <20220408045252.2375896-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Matteo Cascella <mcascell@redhat.com>

Prevent potential integer overflow by limiting 'width' and 'height' to
512x512. Also change 'datasize' type to size_t. Refer to security
advisory https://starlabs.sg/advisories/22-4206/ for more information.

Fixes: CVE-2021-4206
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220407081712.345609-1-mcascell@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl-render.c | 7 +++++++
 hw/display/vmware_vga.c | 2 ++
 ui/cursor.c             | 8 +++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index 237ed293baae..ca217004bf72 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -247,6 +247,13 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QXLCursor *cursor,
     size_t size;
 
     c = cursor_alloc(cursor->header.width, cursor->header.height);
+
+    if (!c) {
+        qxl_set_guest_bug(qxl, "%s: cursor %ux%u alloc error", __func__,
+                cursor->header.width, cursor->header.height);
+        goto fail;
+    }
+
     c->hot_x = cursor->header.hot_spot_x;
     c->hot_y = cursor->header.hot_spot_y;
     switch (cursor->header.type) {
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 98c83474adb5..45d06cbe2544 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -515,6 +515,8 @@ static inline void vmsvga_cursor_define(struct vmsvga_state_s *s,
     int i, pixels;
 
     qc = cursor_alloc(c->width, c->height);
+    assert(qc != NULL);
+
     qc->hot_x = c->hot_x;
     qc->hot_y = c->hot_y;
     switch (c->bpp) {
diff --git a/ui/cursor.c b/ui/cursor.c
index 1d62ddd4d072..835f0802f951 100644
--- a/ui/cursor.c
+++ b/ui/cursor.c
@@ -46,6 +46,8 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
 
     /* parse pixel data */
     c = cursor_alloc(width, height);
+    assert(c != NULL);
+
     for (pixel = 0, y = 0; y < height; y++, line++) {
         for (x = 0; x < height; x++, pixel++) {
             idx = xpm[line][x];
@@ -91,7 +93,11 @@ QEMUCursor *cursor_builtin_left_ptr(void)
 QEMUCursor *cursor_alloc(int width, int height)
 {
     QEMUCursor *c;
-    int datasize = width * height * sizeof(uint32_t);
+    size_t datasize = width * height * sizeof(uint32_t);
+
+    if (width > 512 || height > 512) {
+        return NULL;
+    }
 
     c = g_malloc0(sizeof(QEMUCursor) + datasize);
     c->width  = width;
-- 
2.35.1


