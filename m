Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59A54F29D1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 12:49:17 +0200 (CEST)
Received: from localhost ([::1]:35616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgkO-000358-HD
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 06:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1nbgUz-0000ZC-T0
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1nbgUt-0008JB-2J
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649154793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tj4lzragWy8xiHEwmvqG10AMGbWKUyu6f1FtpXMuCfw=;
 b=FtE6XtMfUIhS2zdzI9sHAy63CyPE2GbndCq05ytvlyvAAOiUj8crQAElELptcFszxQf/Ko
 kgy5/n20f3srgnZNO8W/jI52lC31c6U2nMkRi+TERiVNMZTUY5FR1lxFmOU4HKLRnJCNoU
 NjCjnU/AvWykdAFGy2coDvy1jq/lKEE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-rINWx_H2MqG_nInpvVFBqw-1; Tue, 05 Apr 2022 06:33:12 -0400
X-MC-Unique: rINWx_H2MqG_nInpvVFBqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E51EE3C11A07
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 10:33:11 +0000 (UTC)
Received: from f35-work.redhat.com (unknown [10.39.194.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44FA5C15D40;
 Tue,  5 Apr 2022 10:33:11 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2022-4206)
Date: Tue,  5 Apr 2022 12:32:58 +0200
Message-Id: <20220405103258.105701-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mcascell@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prevent potential integer overflow by limiting 'width' and 'height' to
512x512. Also change 'datasize' type to size_t. Refer to security
advisory https://starlabs.sg/advisories/22-4206/ for more information.

Fixes: CVE-2022-4206
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 hw/display/qxl-render.c |  7 +++++++
 ui/cursor.c             | 12 +++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index d28849b121..dc3c4edd05 100644
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
diff --git a/ui/cursor.c b/ui/cursor.c
index 1d62ddd4d0..7cfb08a030 100644
--- a/ui/cursor.c
+++ b/ui/cursor.c
@@ -46,6 +46,13 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
 
     /* parse pixel data */
     c = cursor_alloc(width, height);
+
+    if (!c) {
+        fprintf(stderr, "%s: cursor %ux%u alloc error\n",
+                __func__, width, height);
+        return NULL;
+    }
+
     for (pixel = 0, y = 0; y < height; y++, line++) {
         for (x = 0; x < height; x++, pixel++) {
             idx = xpm[line][x];
@@ -91,7 +98,10 @@ QEMUCursor *cursor_builtin_left_ptr(void)
 QEMUCursor *cursor_alloc(int width, int height)
 {
     QEMUCursor *c;
-    int datasize = width * height * sizeof(uint32_t);
+    size_t datasize = width * height * sizeof(uint32_t);
+
+    if (width > 512 || height > 512)
+        return NULL;
 
     c = g_malloc0(sizeof(QEMUCursor) + datasize);
     c->width  = width;
-- 
2.35.1


