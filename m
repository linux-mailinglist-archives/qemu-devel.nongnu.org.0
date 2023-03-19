Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA56C00B8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 12:12:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdqvx-0004G1-Pt; Sun, 19 Mar 2023 07:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pdqvl-0004Fq-Dh
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 07:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pdqvi-000697-Ib
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 07:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679224223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j9V3BE4SVaAZhY3ILk8MUzTlTSJ+FUwbhSAFZsO8Cys=;
 b=Tvzb0gYsHfcZUvKPBwm/fHhqf1kCftjoohQLovR4+0kEx7F4bblFH4+2cnrIAfnvjfAHfR
 3K+ePnZtcmtd21KeTyUovuFi3wEe0Q7X6ut9A4u3S1IgxDaaRZUzfrqqF16rEnLbC+b/mc
 xag4vGcO37gNu0B+joLQQGqUzj4n5Eo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-Idq3n66SPTGt8mC0I3jxdg-1; Sun, 19 Mar 2023 07:10:22 -0400
X-MC-Unique: Idq3n66SPTGt8mC0I3jxdg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9A59830F9E
 for <qemu-devel@nongnu.org>; Sun, 19 Mar 2023 11:10:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94095401E30;
 Sun, 19 Mar 2023 11:10:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] ui: return the default console cursor when con == NULL
Date: Sun, 19 Mar 2023 15:10:17 +0400
Message-Id: <20230319111017.1319880-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

VNC code relies on con==NULL to mean the default console.

Fixes:
https://gitlab.com/qemu-project/qemu/-/issues/1548

Fixes: commit 385ac97f8 ("ui: keep current cursor with QemuConsole")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index f3783021e5..6e8a3cdc62 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2303,6 +2303,9 @@ QemuConsole *qemu_console_lookup_unused(void)
 
 QEMUCursor *qemu_console_get_cursor(QemuConsole *con)
 {
+    if (con == NULL) {
+        con = active_console;
+    }
     return con->cursor;
 }
 
-- 
2.39.2


