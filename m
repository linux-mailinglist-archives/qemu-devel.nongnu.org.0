Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707652B1B42
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 13:39:45 +0100 (CET)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYMi-0004zs-Hf
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 07:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kdYDY-0005uZ-HX
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:30:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kdYDV-0002Hf-MT
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605270613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8Lf6VBkbmFnhZ5Ds+n8gzi6RYHUmpEe3AHGXNeI6Ys=;
 b=W5yndQee2nw1HDiIl2Gp3UHc4a9L30uuzqbyXBpIUkgrY9+fcru+VOZhHQsRZlZqs1sbYj
 Xglpk186yRbJcMJH5KO0SokzVKTRdQX/MBcVEeP4hIqwP+/ERpcntTrcxVEA+WwzyHtPQT
 Q26ANeJRNT7EHb609mqcgrCbwk76PZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-BQRQSB5WNyOMIvNgt0Lccw-1; Fri, 13 Nov 2020 07:30:01 -0500
X-MC-Unique: BQRQSB5WNyOMIvNgt0Lccw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 854D51891E84;
 Fri, 13 Nov 2020 12:29:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47E695B4B2;
 Fri, 13 Nov 2020 12:29:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 69244A1FB; Fri, 13 Nov 2020 13:29:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] console: avoid passing con=NULL to graphic_hw_update_done()
Date: Fri, 13 Nov 2020 13:29:51 +0100
Message-Id: <20201113122955.759-3-kraxel@redhat.com>
In-Reply-To: <20201113122955.759-1-kraxel@redhat.com>
References: <20201113122955.759-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lichun <lichun@ruijie.com.cn>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: lichun <lichun@ruijie.com.cn>

In graphic_hw_update(), first select an existing console,
a specific-console or active_console(if not specified),
then updating the console.

Signed-off-by: lichun <lichun@ruijie.com.cn>
Message-id: 1604682219-114389-1-git-send-email-lichun@ruijie.com.cn
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index e8e59707d38c..e07d2c380df7 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -270,10 +270,11 @@ void graphic_hw_update_done(QemuConsole *con)
 void graphic_hw_update(QemuConsole *con)
 {
     bool async = false;
+    con = con ? con : active_console;
     if (!con) {
-        con = active_console;
+        return;
     }
-    if (con && con->hw_ops->gfx_update) {
+    if (con->hw_ops->gfx_update) {
         con->hw_ops->gfx_update(con->hw);
         async = con->hw_ops->gfx_update_async;
     }
-- 
2.27.0


