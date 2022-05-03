Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F351914D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:24:23 +0200 (CEST)
Received: from localhost ([::1]:43632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0wQ-0006xX-Nd
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzLD-0008Nd-7o
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzLA-0002BR-GF
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQBsgcrQOkDnPF+L/WmSPlub4EeftGUv7eS99iC3nn8=;
 b=ej4w3zxyA5cicGVfoPt1a5cLYKqw3sx4A8jhMLyy3a+e7wnT6SJovSH59s9O8v0AH2uX+T
 oUvhgwHLwrtLpcDkxTJ1EtsCnZa6YpIvGo22Pcp7h/y5chDTJ8sD2gkPhriJfwE+ZL2P/D
 RkUdvzkygpHUIDUgzRcbR+2fzUbS/+4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-uE_DIGh0MVKRvFFvUW3hRQ-1; Tue, 03 May 2022 12:02:24 -0400
X-MC-Unique: uE_DIGh0MVKRvFFvUW3hRQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FF481948C39;
 Tue,  3 May 2022 13:14:37 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6872D42B94C;
 Tue,  3 May 2022 13:14:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 20/23] ui: replace qemu_set_nonblock()
Date: Tue,  3 May 2022 17:12:53 +0400
Message-Id: <20220503131256.187238-21-marcandre.lureau@redhat.com>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 ui/input-linux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ui/input-linux.c b/ui/input-linux.c
index 05c0c988199a..e572a2e905b9 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -316,7 +316,10 @@ static void input_linux_complete(UserCreatable *uc, Error **errp)
         error_setg_file_open(errp, errno, il->evdev);
         return;
     }
-    qemu_set_nonblock(il->fd);
+    if (!g_unix_set_fd_nonblocking(il->fd, true, NULL)) {
+        error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+        return;
+    }
 
     rc = ioctl(il->fd, EVIOCGVERSION, &ver);
     if (rc < 0) {
-- 
2.36.0.44.g0f828332d5ac


