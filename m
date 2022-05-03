Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9151904E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:41:35 +0200 (CEST)
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0H0-0003tY-Kv
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz0g-00023Q-9l
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz0e-0004zb-JZ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fd+Rz0jgLWiYZFJ4+raBzYg5dQ+5DddFsUFfXtIIixA=;
 b=cXjIOW5CgjNnAbxUk5Yr2jhkQGzeoqJ96kiBmE9Hi8HX0Uyh7xYnjeOo5pcmmvgpGiCaEV
 mskf3CrXVJMe6RBdCpGWjkSqyUDDqNJcYGu0fu79jgU4bH3IYnsvMrXgrOi+6bITZVX19C
 NhtQ4RW3QzRc6zAwcjBfJJhOZkV18IU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-kAc_WtXoN_W5pImOsONwXg-1; Tue, 03 May 2022 11:36:56 -0400
X-MC-Unique: kAc_WtXoN_W5pImOsONwXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C28CF1CCCB18;
 Tue,  3 May 2022 13:01:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C540D40D2820;
 Tue,  3 May 2022 13:01:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 09/23] qga: replace pipe() with g_unix_open_pipe(CLOEXEC)
Date: Tue,  3 May 2022 17:00:09 +0400
Message-Id: <20220503130023.180544-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220503130023.180544-1-marcandre.lureau@redhat.com>
References: <20220503130023.180544-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 qga/commands-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 77f4672ca2c9..094487c2c395 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2529,7 +2529,7 @@ void qmp_guest_set_user_password(const char *username,
         goto out;
     }
 
-    if (pipe(datafd) < 0) {
+    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
         error_setg(errp, "cannot create pipe FDs");
         goto out;
     }
-- 
2.36.0.44.g0f828332d5ac


