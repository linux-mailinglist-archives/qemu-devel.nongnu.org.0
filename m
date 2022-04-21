Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AEB50A19B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:09:19 +0200 (CEST)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXUl-0007g2-0k
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXE4-0005Pq-4L
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXE2-0006N8-Lj
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byhhTH4PBXv8zo/fZq7JFgPYfuONtJHoy4ZTS5ZpPdQ=;
 b=W3H2tvaH6agqw6uYB5xjIweku4nwj2YMr3bXqi9WFtYwsGkYXifeELNj0ehINBimE4FvNh
 YVJi4XI2jzwIQlzrtfKW5buj5xamHRY7f67WFbwXIU1fcV/qpTezZpZNX+b8PAEz9Fimwf
 M67N0di3aL5D1ZrOSEkTuIlipy0e0rE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-xh73lWkePPeXepvu38DbZQ-1; Thu, 21 Apr 2022 09:52:00 -0400
X-MC-Unique: xh73lWkePPeXepvu38DbZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EB3C3C37F26;
 Thu, 21 Apr 2022 13:52:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DF3FC28110;
 Thu, 21 Apr 2022 13:51:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] util: simplify write in signal handler
Date: Thu, 21 Apr 2022 17:49:34 +0400
Message-Id: <20220421134940.2887768-25-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Use qemu_write_full() instead of open-coding a write loop.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-36-marcandre.lureau@redhat.com>
---
 util/compatfd.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/util/compatfd.c b/util/compatfd.c
index ab810c42a927..55b6e0b7fb27 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -42,25 +42,11 @@ static void *sigwait_compat(void *opaque)
             }
         } else {
             struct qemu_signalfd_siginfo buffer;
-            size_t offset = 0;
-
             memset(&buffer, 0, sizeof(buffer));
             buffer.ssi_signo = sig;
 
-            while (offset < sizeof(buffer)) {
-                ssize_t len;
-
-                len = write(info->fd, (char *)&buffer + offset,
-                            sizeof(buffer) - offset);
-                if (len == -1 && errno == EINTR) {
-                    continue;
-                }
-
-                if (len <= 0) {
-                    return NULL;
-                }
-
-                offset += len;
+            if (qemu_write_full(info->fd, &buffer, sizeof(buffer)) != sizeof(buffer)) {
+                return NULL;
             }
         }
     }
-- 
2.36.0


