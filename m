Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FCB427D93
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:17:36 +0200 (CEST)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJip-0000pM-HP
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJbY-0007bf-1Y
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:10:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJbW-0008Jo-GJ
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fSMSZM4TPVrrQ3mQENgUc3s8/iOOvqCL31XcV9SFE8=;
 b=jU55MNf5/Jm3S1MgjY4uujQG3xYNNywqMWcbOHNTl5+bHh9NgyVrHfXGnNyZB1lxORJwbN
 hdvcWuXKYpCIu7EEHSh7j5W5sf+MVQso+vmaCXv9CB2x2dxYevI05K9M8zrvF1Tj79w3sv
 0RyNyNznOOu6/3HoaysY9hvoyL1cE4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-Jd_2OeTwMMCfSwLfgFfBGw-1; Sat, 09 Oct 2021 17:10:00 -0400
X-MC-Unique: Jd_2OeTwMMCfSwLfgFfBGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B009CA0CAB
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:09:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 579345F4E1;
 Sat,  9 Oct 2021 21:09:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/37] ui/clipboard: add qemu_clipboard_check_serial()
Date: Sun, 10 Oct 2021 01:08:07 +0400
Message-Id: <20211009210838.2219430-7-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/clipboard.h | 10 ++++++++++
 ui/clipboard.c         | 15 +++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
index e590b453c8..2c6488c1ee 100644
--- a/include/ui/clipboard.h
+++ b/include/ui/clipboard.h
@@ -172,6 +172,16 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
  */
 QemuClipboardInfo *qemu_clipboard_info(QemuClipboardSelection selection);
 
+/**
+ * qemu_clipboard_check_serial
+ *
+ * @info: clipboard info.
+ * @client: whether to check from the client context and priority.
+ *
+ * Return TRUE if the @info has a higher serial than the current clipboard.
+ */
+bool qemu_clipboard_check_serial(QemuClipboardInfo *info, bool client);
+
 /**
  * qemu_clipboard_info_new
  *
diff --git a/ui/clipboard.c b/ui/clipboard.c
index 743b39edf4..ffbd80e5c6 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -41,6 +41,21 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
     }
 }
 
+bool qemu_clipboard_check_serial(QemuClipboardInfo *info, bool client)
+{
+    if (!info->has_serial ||
+        !cbinfo[info->selection] ||
+        !cbinfo[info->selection]->has_serial) {
+        return true;
+    }
+
+    if (client) {
+        return cbinfo[info->selection]->serial >= info->serial;
+    } else {
+        return cbinfo[info->selection]->serial > info->serial;
+    }
+}
+
 void qemu_clipboard_update(QemuClipboardInfo *info)
 {
     QemuClipboardNotify notify = {
-- 
2.33.0.721.g106298f7f9


