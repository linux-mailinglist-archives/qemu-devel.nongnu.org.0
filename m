Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DAB2465EA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 14:03:58 +0200 (CEST)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7drp-0000Cp-AL
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 08:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1k7dpM-0005JW-3B
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1k7dpJ-0003g4-V0
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597665680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnTZ8fSNYZm8BnGf3vXMOJX1rM8xJLNxvNHAMR2YpCA=;
 b=ajUvR0fQmgnmTZY/kWGEgjg3efeFW1iclbOJB8FEt8UITFYLIXC8tP8ftWkyFCOaMfoc9Z
 lDNVgaPX2tZUPV7NPlyPdfQCbvMNzFTVyOYStRfP6ntxZhpailhIBzQq654xsFJK4JjlDn
 ejP5O3PuN13pIvLjojXqDoRe/h2ZNd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-M_nMDv7jMDKGm4fxEne1tg-1; Mon, 17 Aug 2020 08:01:19 -0400
X-MC-Unique: M_nMDv7jMDKGm4fxEne1tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C1201854FDC
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 12:01:18 +0000 (UTC)
Received: from localhost (unknown [10.36.110.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A6E31A92A;
 Mon, 17 Aug 2020 12:01:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] spice: get monitors physical dimension
Date: Mon, 17 Aug 2020 16:00:55 +0400
Message-Id: <20200817120056.56751-4-marcandre.lureau@redhat.com>
In-Reply-To: <20200817120056.56751-1-marcandre.lureau@redhat.com>
References: <20200817120056.56751-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 01:24:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Note that for consistency, we use the same logic as MonitorsConfig to
figure out the associated monitor. However, I can't find traces of the
discussion/patches about the "new spice-server" behaviour: it still uses
the multiple-configurations path in git master.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |  4 ++++
 ui/spice-display.c   | 52 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index f35b4fc082..c334b92e70 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -133,6 +133,9 @@ typedef struct DisplaySurface {
 } DisplaySurface;
 
 typedef struct QemuUIInfo {
+    /* physical dimension */
+    uint16_t width_mm;
+    uint16_t height_mm;
     /* geometry */
     int       xoff;
     int       yoff;
@@ -278,6 +281,7 @@ void update_displaychangelistener(DisplayChangeListener *dcl,
 void unregister_displaychangelistener(DisplayChangeListener *dcl);
 
 bool dpy_ui_info_supported(QemuConsole *con);
+const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con);
 int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info);
 
 void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h);
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 625d9232b9..93d4e1c0a4 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -657,6 +657,53 @@ static void interface_set_client_capabilities(QXLInstance *sin,
     /* nothing to do */
 }
 
+#if SPICE_INTERFACE_QXL_MAJOR >= 3 && SPICE_INTERFACE_QXL_MINOR >= 4
+static int interface_client_monitors_mm(QXLInstance *sin, VDAgentMonitorsMM *mm)
+{
+    SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
+    QemuUIInfo info;
+    int head;
+
+    if (!dpy_ui_info_supported(ssd->dcl.con)) {
+        return 0; /* == not supported by guest */
+    }
+
+    if (!mm) {
+        return 1;
+    }
+
+    info = *dpy_get_ui_info(ssd->dcl.con);
+    /* Note: this code doesn't handle Spice multi-head support, where multiple
+     * monitor configuration for a single QXL device means multiple head. */
+    if (mm->num_of_monitors == 1) {
+        /*
+         * New spice-server version which filters the list of monitors
+         * to only include those that belong to our display channel.
+         *
+         * single-head configuration (where filtering doesn't matter)
+         * takes this code path too.
+         */
+        info.width_mm  = mm->monitors[0].width;
+        info.height_mm = mm->monitors[0].height;
+    } else {
+        /*
+         * Old spice-server which gives us all monitors, so we have to
+         * figure ourself which entry we need.  Array index is the
+         * channel_id, which is the qemu console index, see
+         * qemu_spice_add_display_interface().
+         */
+        head = qemu_console_get_index(ssd->dcl.con);
+        if (mm->num_of_monitors > head) {
+            info.width_mm  = mm->monitors[head].width;
+            info.height_mm = mm->monitors[head].height;
+        }
+    }
+
+    dpy_set_ui_info(ssd->dcl.con, &info);
+    return 1;
+}
+#endif
+
 static int interface_client_monitors_config(QXLInstance *sin,
                                             VDAgentMonitorsConfig *mc)
 {
@@ -674,6 +721,8 @@ static int interface_client_monitors_config(QXLInstance *sin,
 
     info = *dpy_get_ui_info(ssd->dcl.con);
 
+    /* Note: this code doesn't handle Spice multi-head support, where multiple
+     * monitor configuration for a single QXL device means multiple head. */
     if (mc->num_of_monitors == 1) {
         /*
          * New spice-server version which filters the list of monitors
@@ -728,6 +777,9 @@ static const QXLInterface dpy_interface = {
     .update_area_complete    = interface_update_area_complete,
     .set_client_capabilities = interface_set_client_capabilities,
     .client_monitors_config  = interface_client_monitors_config,
+#if SPICE_INTERFACE_QXL_MAJOR >= 3 && SPICE_INTERFACE_QXL_MINOR >= 4
+    .client_monitors_mm      = interface_client_monitors_mm,
+#endif
 };
 
 static void display_update(DisplayChangeListener *dcl,
-- 
2.26.2


