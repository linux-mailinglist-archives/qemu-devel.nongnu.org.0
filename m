Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E637F203DE8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 19:29:09 +0200 (CEST)
Received: from localhost ([::1]:51438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnQFp-00064N-12
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 13:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jnQDl-0003t1-Vs
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 13:27:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42305
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jnQDk-00068g-6A
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 13:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592846819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omB/C5xhlgaHTAk2xiwoKR+JnhPBVcdye6A/qfnjfTY=;
 b=ZnKR7wYwyFJpS6HIoabAiBUthA9UTagFfPs6L4+DOqMuzQ9Nd1pxjBuwshUdtKODnQTzcV
 IwyK9y0oWOo2VxOb+g2JQBbrQFJtbDS5HI9/XU/ygzle5lrnWAe0LkMl/jaGcJ8V8dWILb
 SKb6VAN5UADCQONgGL4sPoOoNyxrYA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-ADzJjk10O5mdkf1VLSc40g-1; Mon, 22 Jun 2020 13:26:55 -0400
X-MC-Unique: ADzJjk10O5mdkf1VLSc40g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 789EA107ACF3;
 Mon, 22 Jun 2020 17:26:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C23E5C1BD;
 Mon, 22 Jun 2020 17:26:52 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] qga: Use qemu_get_host_name() instead of
 g_get_host_name()
Date: Mon, 22 Jun 2020 19:26:45 +0200
Message-Id: <e5c3951e9f442d66a9cf992769db0545f0bca820.1592846572.git.mprivozn@redhat.com>
In-Reply-To: <cover.1592846572.git.mprivozn@redhat.com>
References: <cover.1592846572.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, vfeenstr@redhat.com, marcandre.lureau@gmail.com,
 mdroth@linux.vnet.ibm.com, sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Problem with g_get_host_name() is that on the first call it saves
the hostname into a global variable and from then on, every
subsequent call returns the saved hostname. Even if the hostname
changes. This doesn't play nicely with guest agent, because if
the hostname is acquired before the guest is set up (e.g. on the
first boot, or before DHCP) we will report old, invalid hostname.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1845127

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 qga/commands.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index efc8b90281..d3fec807c1 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -515,11 +515,20 @@ int ga_parse_whence(GuestFileWhence *whence, Error **errp)
 GuestHostName *qmp_guest_get_host_name(Error **errp)
 {
     GuestHostName *result = NULL;
-    gchar const *hostname = g_get_host_name();
-    if (hostname != NULL) {
-        result = g_new0(GuestHostName, 1);
-        result->host_name = g_strdup(hostname);
+    g_autofree char *hostname = qemu_get_host_name(errp);
+
+    /*
+     * We want to avoid using g_get_host_name() because that
+     * caches the result and we wouldn't reflect changes in the
+     * host name.
+     */
+
+    if (!hostname) {
+        hostname = g_strdup("localhost");
     }
+
+    result = g_new0(GuestHostName, 1);
+    result->host_name = g_steal_pointer(&hostname);
     return result;
 }
 
-- 
2.26.2


