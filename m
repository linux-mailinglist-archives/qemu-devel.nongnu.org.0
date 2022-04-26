Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4317E50F960
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:58:36 +0200 (CEST)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHxr-0003SW-BQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHWD-0004P2-6U
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHWB-0006Pq-N9
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxKe3k0M73v6CU3J9tnW0zCu22X/Raxl9gTfAsh+Ylw=;
 b=ZbixQgZPR2mNKORQYz8m9rIuwX71aDl4g5+tAoPB0lwjKFqNWo+fGB/qq3vBrs/ztqAMDE
 GvdFCa1aGN+5bDzJ5B+wrJ0xRjVVJRVjqTxRf3WF4AGo2pdGmnWiHG4++LLNus1L8fd9Nf
 EyqN49n0V0NBwcJWYD5ugE7ozCRCKRU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-JK-YkDmoMF2q5EDjEVWXKw-1; Tue, 26 Apr 2022 05:29:50 -0400
X-MC-Unique: JK-YkDmoMF2q5EDjEVWXKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECDB629ABA0F;
 Tue, 26 Apr 2022 09:29:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E361040D2824;
 Tue, 26 Apr 2022 09:29:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/26] qga: replace qemu_set_nonblock()
Date: Tue, 26 Apr 2022 13:27:10 +0400
Message-Id: <20220426092715.3931705-22-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The call is POSIX-specific. Use the dedicated GLib API.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 094487c2c395..78f2f210015d 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -404,7 +404,11 @@ int64_t qmp_guest_file_open(const char *path, bool has_mode, const char *mode,
     /* set fd non-blocking to avoid common use cases (like reading from a
      * named pipe) from hanging the agent
      */
-    qemu_set_nonblock(fileno(fh));
+    if (!g_unix_set_fd_nonblocking(fileno(fh), true, NULL)) {
+        fclose(fh);
+        error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+        return -1;
+    }
 
     handle = guest_file_handle_add(fh, errp);
     if (handle < 0) {
-- 
2.36.0


