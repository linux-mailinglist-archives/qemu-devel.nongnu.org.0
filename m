Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC682D72AF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:16:01 +0100 (CET)
Received: from localhost ([::1]:51164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kneWu-0000U6-1Q
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneU1-0007Bp-Fg
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneTy-0004hS-UP
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607677978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXg9PtHs4TNRrma5VsX7y4nJvBbL6/tlaFskLe+ZdF8=;
 b=Il4Hoa6rH/kTuUary0Emwp8llVUEm04EGsW8W0e15Ur8W9kKhqKalav4hpmZ/4VWrFK95+
 efEQlqCQFm8jlvcifU6jQN0UapciK3JWeB678sIM85X0T2156yD1TU/Nmac7iDdJflQ2iE
 XT6SgZYYOhzX0WLlFdre5QYVJjD5l9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-nd9y_nLyPxC5wO6qnDrlDg-1; Fri, 11 Dec 2020 04:12:56 -0500
X-MC-Unique: nd9y_nLyPxC5wO6qnDrlDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ABC9107ACE4
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:12:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F70B60862;
 Fri, 11 Dec 2020 09:12:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCF6BA1FB; Fri, 11 Dec 2020 10:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] console: allow con==NULL in dpy_{get,
 set}_ui_info and dpy_ui_info_supported
Date: Fri, 11 Dec 2020 10:12:44 +0100
Message-Id: <20201211091250.1415-3-kraxel@redhat.com>
In-Reply-To: <20201211091250.1415-1-kraxel@redhat.com>
References: <20201211091250.1415-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use active_console in that case like we do in many other places.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20201208115737.18581-3-kraxel@redhat.com
---
 ui/console.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index f995639e45f6..30e70be555db 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1544,19 +1544,27 @@ static void dpy_set_ui_info_timer(void *opaque)
 
 bool dpy_ui_info_supported(QemuConsole *con)
 {
+    if (con == NULL) {
+        con = active_console;
+    }
+
     return con->hw_ops->ui_info != NULL;
 }
 
 const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con)
 {
-    assert(con != NULL);
+    if (con == NULL) {
+        con = active_console;
+    }
 
     return &con->ui_info;
 }
 
 int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info)
 {
-    assert(con != NULL);
+    if (con == NULL) {
+        con = active_console;
+    }
 
     if (!dpy_ui_info_supported(con)) {
         return -1;
-- 
2.27.0


