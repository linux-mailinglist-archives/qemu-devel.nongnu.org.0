Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D15191F4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:58:43 +0200 (CEST)
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1Td-0001hi-JA
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzKC-0006J4-9V
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzKA-000279-Nr
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GeRNkgt6+1qnaLnhDd/WZh7qwSJ7BxYvRZ2SVl8Xe+M=;
 b=O2p2rZtZcNxcqr6b0tW1AMu4ANKirz9ZJnZZbe6kMl7QzRDeyOQz4Ge/nP/aKU9oBXEz+2
 8bzxHuGUfj4O3TrblJ5Qjf4u1P8buyA6wzSGueMcgrVfocxYgCOF0+3y450ovFw7RJH1g4
 bTzb2qWtL+Pe9T4J0PA5MHjbhbBEqRw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-7giV7CW3M9uzYmMaKx-8mQ-1; Tue, 03 May 2022 11:35:32 -0400
X-MC-Unique: 7giV7CW3M9uzYmMaKx-8mQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 107A228C802C;
 Tue,  3 May 2022 13:02:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A180153AD3A;
 Tue,  3 May 2022 13:02:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 18/23] qga: replace qemu_set_nonblock()
Date: Tue,  3 May 2022 17:00:18 +0400
Message-Id: <20220503130023.180544-19-marcandre.lureau@redhat.com>
In-Reply-To: <20220503130023.180544-1-marcandre.lureau@redhat.com>
References: <20220503130023.180544-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The call is POSIX-specific. Use the dedicated GLib API.

(this is a preliminary patch before renaming qemu_set_nonblock())

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.36.0.44.g0f828332d5ac


