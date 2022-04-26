Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76050F7F1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:42:16 +0200 (CEST)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHi2-0002OY-Va
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVC-0003lB-Qb
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVA-0006Is-OF
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVXTNSWEK/KXWEdF6gn4l5b51G5JklU6wI328yNwvM0=;
 b=hXmq/Kav8Wk+dfT1KRSekxK2WXDALEmucN7WKJyDd9ska+kayKQApU1dNsMm/98KyLr8ai
 1wml2ghyUqw7/qZDjOBhBaZCkvKQxhGbfDgHR4cdszrPqL+AGAxe/uE4jhlKw7rfiOtQ31
 atADV8uYjuaE4qz4G+mO3JW8rSxPcfk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-bwH4iM7zOS6Mx9ZAooKDSA-1; Tue, 26 Apr 2022 05:28:54 -0400
X-MC-Unique: bwH4iM7zOS6Mx9ZAooKDSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5985B3838C83
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:28:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94AB22166B2F;
 Tue, 26 Apr 2022 09:28:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/26] util: replace pipe()+cloexec with g_unix_open_pipe()
Date: Tue, 26 Apr 2022 13:27:00 +0400
Message-Id: <20220426092715.3931705-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/compatfd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/util/compatfd.c b/util/compatfd.c
index 55b6e0b7fb27..147e39e2c62b 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -60,14 +60,11 @@ static int qemu_signalfd_compat(const sigset_t *mask)
 
     info = g_malloc(sizeof(*info));
 
-    if (pipe(fds) == -1) {
+    if (!g_unix_open_pipe(fds, FD_CLOEXEC, NULL)) {
         g_free(info);
         return -1;
     }
 
-    qemu_set_cloexec(fds[0]);
-    qemu_set_cloexec(fds[1]);
-
     memcpy(&info->mask, mask, sizeof(*mask));
     info->fd = fds[1];
 
-- 
2.36.0


