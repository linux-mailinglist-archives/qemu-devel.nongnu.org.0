Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6840727A182
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Sep 2020 17:03:06 +0200 (CEST)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMYCf-0000X2-FO
	for lists+qemu-devel@lfdr.de; Sun, 27 Sep 2020 11:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kMY8k-000626-E1
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 10:59:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kMY8i-0006UI-OT
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 10:59:02 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601218740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0l8qvWRrHwiSkIqmmCGlnK1Woq1I9l3yvB4ZPhG79Y=;
 b=P8OUdc5ivEovT5bgi6NFgWBCpdr5vFyXsw475jsnFGKDKTM4JANaR5z2oqhgTsFvBCfZJm
 PVC5+f9c/V81Vu+Hav2U4a50MjTdFW41avHVzAmrQBbyccRl1GEbMoPfVzyDXXJZn+5k7F
 fQzPDcLsq3P6ep1zwcqODjqK/lW9Ug8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-z30i4VWZN4urGLAgNL5npQ-1; Sun, 27 Sep 2020 10:58:56 -0400
X-MC-Unique: z30i4VWZN4urGLAgNL5npQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BBA6186841E;
 Sun, 27 Sep 2020 14:58:55 +0000 (UTC)
Received: from localhost (unknown [10.36.110.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0332110013C4;
 Sun, 27 Sep 2020 14:58:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] spice: remove the single monitor config logic
Date: Sun, 27 Sep 2020 18:57:49 +0400
Message-Id: <20200927145751.365446-5-marcandre.lureau@redhat.com>
In-Reply-To: <20200927145751.365446-1-marcandre.lureau@redhat.com>
References: <20200927145751.365446-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/27 10:58:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: spice-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Introduced in commit 9c956e646178fee8c14ce7dfae5a9d7cb901876c ("spice:
prepare for upcoming spice-server change"), the new logic never
materialized in the spice server source tree. Let's remove it for now,
until it actually changes in Spice.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/spice-display.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index 625d9232b9..b304c13149 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -674,28 +674,10 @@ static int interface_client_monitors_config(QXLInstance *sin,
 
     info = *dpy_get_ui_info(ssd->dcl.con);
 
-    if (mc->num_of_monitors == 1) {
-        /*
-         * New spice-server version which filters the list of monitors
-         * to only include those that belong to our display channel.
-         *
-         * single-head configuration (where filtering doesn't matter)
-         * takes this code path too.
-         */
-        info.width  = mc->monitors[0].width;
-        info.height = mc->monitors[0].height;
-    } else {
-        /*
-         * Old spice-server which gives us all monitors, so we have to
-         * figure ourself which entry we need.  Array index is the
-         * channel_id, which is the qemu console index, see
-         * qemu_spice_add_display_interface().
-         */
-        head = qemu_console_get_index(ssd->dcl.con);
-        if (mc->num_of_monitors > head) {
-            info.width  = mc->monitors[head].width;
-            info.height = mc->monitors[head].height;
-        }
+    head = qemu_console_get_index(ssd->dcl.con);
+    if (mc->num_of_monitors > head) {
+        info.width  = mc->monitors[head].width;
+        info.height = mc->monitors[head].height;
     }
 
     trace_qemu_spice_ui_info(ssd->qxl.id, info.width, info.height);
-- 
2.26.2


