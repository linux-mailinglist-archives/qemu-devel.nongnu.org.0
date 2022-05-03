Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CCF519136
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:20:59 +0200 (CEST)
Received: from localhost ([::1]:35606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0t7-0001ag-VA
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzKY-0006sx-Nb
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzKV-00028Y-I5
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=spcnoU6B6qZO+mMZtjLZJhWRg+6PC57/TK/gztEAXZ4=;
 b=XQ+fGr7Pd/PyD7qgo8m6ZZ3xUqgWl5lD5jLJE+zh8ZGQUjsXZlbCHajpZ8bF0+rXcTjOn3
 kMVIeX3hkRci2GeN4Hl8WYe4+6nDa8IGGEXtK6fkujG/W4xrGbT67cjsZhBzagfWpWWTcR
 yBsdJaFqLv1VUtU3w6O8ClZ0Q3AJFC8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-lCxS-RmpPvWIJeDaWos75w-1; Tue, 03 May 2022 11:01:15 -0400
X-MC-Unique: lCxS-RmpPvWIJeDaWos75w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E20C13D0D6F5;
 Tue,  3 May 2022 13:14:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC8620296A5;
 Tue,  3 May 2022 13:14:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 13/23] io: replace pipe() with g_unix_open_pipe(CLOEXEC)
Date: Tue,  3 May 2022 17:12:46 +0400
Message-Id: <20220503131256.187238-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-command.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io/channel-command.c b/io/channel-command.c
index 338da73ade56..539685ea8340 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -76,8 +76,8 @@ qio_channel_command_new_spawn(const char *const argv[],
         }
     }
 
-    if ((!stdinnull && pipe(stdinfd) < 0) ||
-        (!stdoutnull && pipe(stdoutfd) < 0)) {
+    if ((!stdinnull && !g_unix_open_pipe(stdinfd, FD_CLOEXEC, NULL)) ||
+        (!stdoutnull && !g_unix_open_pipe(stdoutfd, FD_CLOEXEC, NULL))) {
         error_setg_errno(errp, errno,
                          "Unable to open pipe");
         goto error;
-- 
2.36.0.44.g0f828332d5ac


