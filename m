Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03E3057B3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:04:25 +0100 (CET)
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hgW-0002Jq-6R
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l4heX-0000sn-NU
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:02:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l4heW-0003fz-0y
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611741738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dVRExDkN+K0X+o9jFXIyCB8Ahq1tXq4B03gq9G2FsqA=;
 b=ByByqAEXaUM4th0jMQFXtGrOW4DIpithOMLpBjI2vxv1/s6HtN5e/yj8Om0GSb+KPMCPGN
 5j+533TbzL9bGXJayHMbVi+CCmDs+JdKN5qONA24dI+5GUe5D0463n5VZTPMxwGa/u56n7
 6TYBaplLsxlXvagwdeXvGQauXpco1B8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-dV5-HPZCPL6XnXoAArdSOw-1; Wed, 27 Jan 2021 05:02:17 -0500
X-MC-Unique: dV5-HPZCPL6XnXoAArdSOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DE998144E0
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 10:02:16 +0000 (UTC)
Received: from localhost (unknown [10.36.110.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DA3F5D9DD;
 Wed, 27 Jan 2021 10:02:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] ui: fix spice display regression
Date: Wed, 27 Jan 2021 14:02:06 +0400
Message-Id: <20210127100206.277698-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit b4e1a342112e50e05b609e857f38c1f2b7aafdc4 ("vl: remove
separate preconfig main_loop"), spice initialization is a bit dodgy, and
the client get stuck waiting for server events.

The initialization order changed, so that qemu_spice_display_start() is
called before the display interfaces are added. The new interfaces
aren't started by spice-server automatically (yet?), so we have to tell
the server explicitely when we are already running.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/spice-core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/ui/spice-core.c b/ui/spice-core.c
index 5746d0aae7..6eebf12e3c 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -830,6 +830,8 @@ static void qemu_spice_init(void)
 
 static int qemu_spice_add_interface(SpiceBaseInstance *sin)
 {
+    int ret;
+
     if (!spice_server) {
         if (QTAILQ_FIRST(&qemu_spice_opts.head) != NULL) {
             error_report("Oops: spice configured but not active");
@@ -848,7 +850,13 @@ static int qemu_spice_add_interface(SpiceBaseInstance *sin)
         qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
     }
 
-    return spice_server_add_interface(spice_server, sin);
+    ret = spice_server_add_interface(spice_server, sin);
+    /* make sure the newly added interface is started */
+    if (ret == 0 && spice_display_is_running) {
+        spice_server_vm_start(spice_server);
+    }
+
+    return ret;
 }
 
 static GSList *spice_consoles;
-- 
2.29.0


