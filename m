Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA0C27A17E
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Sep 2020 17:01:41 +0200 (CEST)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMYBI-0007fG-Ie
	for lists+qemu-devel@lfdr.de; Sun, 27 Sep 2020 11:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kMY8y-0006QE-57
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 10:59:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kMY8w-0006Vq-IQ
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 10:59:15 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601218754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWT3eeP8M1S4mF5jrWBk/Kh6soLRKqtXBG4/bKeL4bg=;
 b=Fq9ofA/1hqmSVobVHEsNCzIAVkfkjEh4laXgIwbbh5KFKEFSQemDW4rRlrI3aPnsSAycWl
 cMliBkXCqWwO2sv1XSCI2hRDFQbuQVBqVPwYtw3MFF/O8WkpWn5GC6oUJtm86ERXvgFwwJ
 cppe6Bdv7Q5WRQ8XXVUTFljrS+bSfXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-Xq8ATs5mOLmMQx8X147b_g-1; Sun, 27 Sep 2020 10:59:09 -0400
X-MC-Unique: Xq8ATs5mOLmMQx8X147b_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92680807322;
 Sun, 27 Sep 2020 14:59:08 +0000 (UTC)
Received: from localhost (unknown [10.36.110.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BBFA78801;
 Sun, 27 Sep 2020 14:58:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] spice: get monitors physical dimension
Date: Sun, 27 Sep 2020 18:57:50 +0400
Message-Id: <20200927145751.365446-6-marcandre.lureau@redhat.com>
In-Reply-To: <20200927145751.365446-1-marcandre.lureau@redhat.com>
References: <20200927145751.365446-1-marcandre.lureau@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/27 10:58:22
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

With upcoming Spice server version 0.14.4, the monitor configuration can
contain additional fields for the monitor physical dimensions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h | 3 +++
 ui/spice-display.c   | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 353d2e49a1..e7303d8b98 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -119,6 +119,9 @@ typedef struct DisplaySurface {
 } DisplaySurface;
 
 typedef struct QemuUIInfo {
+    /* physical dimension */
+    uint16_t width_mm;
+    uint16_t height_mm;
     /* geometry */
     int       xoff;
     int       yoff;
diff --git a/ui/spice-display.c b/ui/spice-display.c
index b304c13149..0178d5766d 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -678,6 +678,13 @@ static int interface_client_monitors_config(QXLInstance *sin,
     if (mc->num_of_monitors > head) {
         info.width  = mc->monitors[head].width;
         info.height = mc->monitors[head].height;
+#if SPICE_SERVER_VERSION >= 0x000e04 /* release 0.14.4 */
+        if (mc->flags & VD_AGENT_CONFIG_MONITORS_FLAG_PHYSICAL_SIZE) {
+            VDAgentMonitorMM *mm = (void *)&mc->monitors[mc->num_of_monitors];
+            info.width_mm = mm[head].width;
+            info.height_mm = mm[head].height;
+        }
+#endif
     }
 
     trace_qemu_spice_ui_info(ssd->qxl.id, info.width, info.height);
-- 
2.26.2


