Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FAD4B4F9B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:05:25 +0100 (CET)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJa6e-0007vH-7E
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:05:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nJa12-0005jp-U0
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nJa10-0005X4-Ih
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644839973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4HiWx5LNM3+W0/KC87evxOFbm7HP2G5N5jY/C14wRM0=;
 b=NtGTvuodZ77lk2jcy4rxta+h2D3cj8cy8wHGW0OMKhXFXmEBvgT2MOs21WAPVgPguZ3WY3
 bhOk1q/6oKjK6/rWCdqhj0jUp0phaM2SoaRTV1pe1rBhj+vOCtrrOv1ufnu3rk5U+T3VM7
 pV6ySJ9RmrkvJP5wICWvBERYsPLcCEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-TKPGXnupNayMEd7C97JBcA-1; Mon, 14 Feb 2022 06:59:32 -0500
X-MC-Unique: TKPGXnupNayMEd7C97JBcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BAB1814243
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 11:59:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91A1C6E219;
 Mon, 14 Feb 2022 11:59:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/clipboard: fix use-after-free regression
Date: Mon, 14 Feb 2022 15:59:17 +0400
Message-Id: <20220214115917.1679568-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The same info may be used to update the clipboard, and may be freed
before being ref'ed again.

Fixes: 70a54b01693ed ("ui: avoid compiler warnings from unused clipboard info variable")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/clipboard.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index 5f15cf853d07..9079ef829b51 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -66,8 +66,10 @@ void qemu_clipboard_update(QemuClipboardInfo *info)
 
     notifier_list_notify(&clipboard_notifiers, &notify);
 
-    qemu_clipboard_info_unref(cbinfo[info->selection]);
-    cbinfo[info->selection] = qemu_clipboard_info_ref(info);
+    if (cbinfo[info->selection] != info) {
+        qemu_clipboard_info_unref(cbinfo[info->selection]);
+        cbinfo[info->selection] = qemu_clipboard_info_ref(info);
+    }
 }
 
 QemuClipboardInfo *qemu_clipboard_info(QemuClipboardSelection selection)
-- 
2.34.1.428.gdcc0cd074f0c


