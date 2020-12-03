Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821152CD473
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:21:20 +0100 (CET)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmfn-0000t6-Jh
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmTE-00039d-3b
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmT8-0006dD-MN
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdFb8vObo36jbpyMLYFdy97m3VFRm+fPrpMC6UrJYwQ=;
 b=XfjNk1brnM1kj/A1/N0m72xU45kZnBjvL0BQ92O7qVkT7gcX9dG3ST89ZuaLd+eVDTIf2p
 Y65yi2XaThYkA+uEHUSK0dTzIIapO3OJAZHVLh8jcLhQi/FS5kvdW4UOyoocivETcrZyb9
 M5OXPjFBy4Lj2BVYS9ZEpuoRk9y0de0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-gZWjGa3uP-W6_zmLAUZ9gg-1; Thu, 03 Dec 2020 06:08:11 -0500
X-MC-Unique: gZWjGa3uP-W6_zmLAUZ9gg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D10973E747
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 11:08:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA8BC18A60;
 Thu,  3 Dec 2020 11:08:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0D41D9D92; Thu,  3 Dec 2020 12:08:06 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] console: allow con==NULL in dpy_set_ui_info
Date: Thu,  3 Dec 2020 12:07:57 +0100
Message-Id: <20201203110806.13556-2-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-1-kraxel@redhat.com>
References: <20201203110806.13556-1-kraxel@redhat.com>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use active_console in that case like we do in many other places.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/console.c b/ui/console.c
index 53dee8e26b17..16b326854080 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1556,7 +1556,9 @@ const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con)
 
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


