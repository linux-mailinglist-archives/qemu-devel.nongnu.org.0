Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D952CD44D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:10:17 +0100 (CET)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmV5-0004qW-Vh
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmTA-00038K-Od
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmT7-0006c6-Hi
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+8n2MMAKDUhkWx/cgfOhRJfN/bIIYVRnw9ZPuOIHuA=;
 b=Hhfz3g7nCv+Bf5a56WxlzHF6Vs7NIPTv69ISBgAGi+A8HwtJvNldYIk0rNGkK6zTYmbBsO
 fY4J8L+2PvYxX4ypk2Bn9dx2M01zRMEC60sQtH6pFZaSvBKJCHe+YeDDjqzu8k1SZzzqA3
 Aywl6sahGjsQ4z4EXFiwlc2q4GjphDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-d3ajYMByOWuj0c7Eixl-jw-1; Thu, 03 Dec 2020 06:08:11 -0500
X-MC-Unique: d3ajYMByOWuj0c7Eixl-jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 318428049C3
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 11:08:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED3215C1B4;
 Thu,  3 Dec 2020 11:08:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1657C9D99; Thu,  3 Dec 2020 12:08:06 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] console: add check for ui_info pointer
Date: Thu,  3 Dec 2020 12:07:58 +0100
Message-Id: <20201203110806.13556-3-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-1-kraxel@redhat.com>
References: <20201203110806.13556-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify the hw_ops->ui_info function pointer is non-zero before
calling it.  Can be triggered by qxl which changes hw_ops when
switching between qxl-native and vga-compat modes.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/console.c b/ui/console.c
index 16b326854080..8930808d0b6d 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1539,7 +1539,9 @@ static void dpy_set_ui_info_timer(void *opaque)
 {
     QemuConsole *con = opaque;
 
-    con->hw_ops->ui_info(con->hw, con->head, &con->ui_info);
+    if (con->hw_ops->ui_info) {
+        con->hw_ops->ui_info(con->hw, con->head, &con->ui_info);
+    }
 }
 
 bool dpy_ui_info_supported(QemuConsole *con)
-- 
2.27.0


