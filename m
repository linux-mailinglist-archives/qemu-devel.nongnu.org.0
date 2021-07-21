Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608EE3D0AB5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:46:49 +0200 (CEST)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67sO-0007hH-ED
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67o8-00074H-OY
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:42:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67o7-00059W-81
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pp+7qQuM/5UkNDkITrrbNiBeKGS9spJa0q99oABY188=;
 b=ahlA7xRFktj8e1ElvkBPlMI6I5FGODgUSzc0siXmFFqQj6Go83N4y2KsTwIluSuzb1OP4B
 GKafkt0m2RgzvAvqr0R0DYQBcOxzAyffUZHc153SndByWLPvqSDQJy669+Ho5m6AL9FNr3
 UwDLXRQXhFgSXr1U/QZkRCUJbF4pPWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-fVpS4jcAOxKiQuHcFFcytA-1; Wed, 21 Jul 2021 04:42:21 -0400
X-MC-Unique: fVpS4jcAOxKiQuHcFFcytA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7068A873079
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:42:20 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 824935D9FC;
 Wed, 21 Jul 2021 08:42:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/13] ui/clipboard: release owned grabs on unregister
Date: Wed, 21 Jul 2021 12:41:32 +0400
Message-Id: <20210721084139.1124779-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
References: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/clipboard.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index 56c14509fe..a9512f01a7 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -13,6 +13,15 @@ void qemu_clipboard_peer_register(QemuClipboardPeer *peer)
 
 void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer)
 {
+    int i;
+
+    for (i = 0; i < QEMU_CLIPBOARD_SELECTION__COUNT; i++) {
+        if (cbinfo[i] && cbinfo[i]->owner == peer) {
+            /* release owned grabs */
+            g_autoptr(QemuClipboardInfo) info = qemu_clipboard_info_new(NULL, i);
+            qemu_clipboard_update(info);
+        }
+    }
     notifier_remove(&peer->update);
 }
 
-- 
2.32.0.264.g75ae10bc75


