Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6335F5B5885
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:38:20 +0200 (CEST)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgpR-0000SC-OP
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgdF-00073p-MA
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgdC-0007TS-3m
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662978330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnGjaPyEqfQ/TyLOGSMsrPT2XpXGZg/m3336kFbUWro=;
 b=dM0Y0qI5eKU8li2fjZtJyhU2/Fi4F4GVileCiBOTh9qT4WbeNywsJIizW5AIujpLEHLELw
 CFel4jKDz/2F5HIG0vDb9h+kKFiQBymu8ObMxPQyT2Qjq8YofANknVexvdiKeWvbjAklOW
 +aKOfvCvqcMny/k8IYWR+EQXS86MLNs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-_gfNkJ2XOXSYPVnAvDCyew-1; Mon, 12 Sep 2022 06:25:21 -0400
X-MC-Unique: _gfNkJ2XOXSYPVnAvDCyew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 806D429ABA01
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 10:25:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4295AC15BA4;
 Mon, 12 Sep 2022 10:25:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 4/5] ui/clipboard: reset the serial state on reset
Date: Mon, 12 Sep 2022 14:24:54 +0400
Message-Id: <20220912102455.111765-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220912102455.111765-1-marcandre.lureau@redhat.com>
References: <20220912102455.111765-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Not only we have to reset the vdagent clipboards serial state, but also
the current QEMU clipboards info serial (the value is currently used by
qemu_clipboard_check_serial, only used by -display dbus).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/clipboard.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index 3e2d02d549..3d14bffaf8 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -139,7 +139,14 @@ void qemu_clipboard_request(QemuClipboardInfo *info,
 void qemu_clipboard_reset_serial(void)
 {
     QemuClipboardNotify notify = { .type = QEMU_CLIPBOARD_RESET_SERIAL };
+    int i;
 
+    for (i = 0; i < QEMU_CLIPBOARD_SELECTION__COUNT; i++) {
+        QemuClipboardInfo *info = qemu_clipboard_info(i);
+        if (info) {
+            info->serial = 0;
+        }
+    }
     notifier_list_notify(&clipboard_notifiers, &notify);
 }
 
-- 
2.37.3


