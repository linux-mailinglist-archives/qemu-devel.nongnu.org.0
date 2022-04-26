Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723550F96B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:02:19 +0200 (CEST)
Received: from localhost ([::1]:38788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njI1S-0007ok-Cp
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHWO-0004ev-RV
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:30:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHWL-0006cy-Fo
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KH/JywyPpUxHX2b2bhmGGvtNVgIF7kQVpeSS5FSX4Y=;
 b=aSMcAF+zdRv4QxZfytUwmMvfrh1l8wqXEWyLDjAsKOJNBNnwOZtySV8fwsQ1dUxOWB4g6R
 Pou+DtJGIqT2osZkFYyTfOJEhPHg2KvekBk2JY+cRnQk4cFRW60SF8c8zdOwLOtM1r7upB
 +R4YR29B4RiLNnHqT55t+hmzcEHI5zE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-Yeq42J5bPm2hea6hasv1ag-1; Tue, 26 Apr 2022 05:30:06 -0400
X-MC-Unique: Yeq42J5bPm2hea6hasv1ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A646C1E15C15
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0975B112132D;
 Tue, 26 Apr 2022 09:29:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/26] ui: replace qemu_set_nonblock()
Date: Tue, 26 Apr 2022 13:27:12 +0400
Message-Id: <20220426092715.3931705-24-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The call is POSIX-specific. Use the dedicated GLib API.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
2.36.0


