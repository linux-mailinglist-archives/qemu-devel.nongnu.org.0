Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19255A5C04
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 08:45:01 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSuzc-0004CJ-V8
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 02:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oSutQ-000889-3J
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oSutM-0003Sl-Qw
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661841511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsOqXgicuTyAeeO6P07elOb964v3Eg7CA+6DZtv8jGI=;
 b=C5AHhO5YO1O5u8JvR8w6eIwFOISJrHnPmxZA5LecrpZZdZ4FTmMydR5pAQrCu/STezNjD3
 JtH4U2yiUWKtn4DhAYe+q78SVoLaO8smjwhAxrkdC8D65xqOo1WSj3nqYRosipEdoxLnnd
 gTyULhUlYuGYOMwZFTIlE7Lz5DdSycE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-lU9wy-xeNXOyDeyk3QUiZQ-1; Tue, 30 Aug 2022 02:38:29 -0400
X-MC-Unique: lU9wy-xeNXOyDeyk3QUiZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26865801231
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 06:38:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA4E32166B26;
 Tue, 30 Aug 2022 06:38:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 77886180061D; Tue, 30 Aug 2022 08:38:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/2] usb/msd: move usb_msd_packet_complete()
Date: Tue, 30 Aug 2022 08:38:26 +0200
Message-Id: <20220830063827.813053-2-kraxel@redhat.com>
In-Reply-To: <20220830063827.813053-1-kraxel@redhat.com>
References: <20220830063827.813053-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Change ordering to avoid adding forward declarations in
following patches.  Fix comment code style while being
at it.  No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-storage.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index dca62d544fe9..4485a2411797 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -177,6 +177,20 @@ static const USBDesc desc = {
     .str   = desc_strings,
 };
 
+static void usb_msd_packet_complete(MSDState *s)
+{
+    USBPacket *p = s->packet;
+
+    /*
+     * Set s->packet to NULL before calling usb_packet_complete
+     * because another request may be issued before
+     * usb_packet_complete returns.
+     */
+    trace_usb_msd_packet_complete();
+    s->packet = NULL;
+    usb_packet_complete(&s->dev, p);
+}
+
 static void usb_msd_copy_data(MSDState *s, USBPacket *p)
 {
     uint32_t len;
@@ -208,18 +222,6 @@ static void usb_msd_send_status(MSDState *s, USBPacket *p)
     memset(&s->csw, 0, sizeof(s->csw));
 }
 
-static void usb_msd_packet_complete(MSDState *s)
-{
-    USBPacket *p = s->packet;
-
-    /* Set s->packet to NULL before calling usb_packet_complete
-       because another request may be issued before
-       usb_packet_complete returns.  */
-    trace_usb_msd_packet_complete();
-    s->packet = NULL;
-    usb_packet_complete(&s->dev, p);
-}
-
 void usb_msd_transfer_data(SCSIRequest *req, uint32_t len)
 {
     MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
-- 
2.37.2


