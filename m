Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D4519DBC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:16:00 +0200 (CEST)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCz3-0000BE-El
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBp4-0000J4-GR
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBp2-0006Ee-Sh
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651658488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=utl+uFbDvNs/TJQRyDTZGAG/tI3wsSKl/nWyOYU7QBQ=;
 b=QSBCE5d1TAt2+CjrkAXmL2LpffXD2c4gM0SJBtHQqIw1UAOsVt+j53BUM0ZBuaZ6Wtq22M
 ZwC2JAb6y4tbZQWewLoNhEyerC3iiNHw+mMhXnd4b5mgD1mC8ysvD1heDhuP5LUcw7MrNl
 QPZbumaCXNWKxq0pdLDUN1B+4ViMPGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-o3Rc0XI8MNOvN7imSFyaag-1; Wed, 04 May 2022 06:01:24 -0400
X-MC-Unique: o3Rc0XI8MNOvN7imSFyaag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EA07811E81;
 Wed,  4 May 2022 10:01:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41F1B155CAD1;
 Wed,  4 May 2022 10:01:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Deason <adeason@sinenomine.net>
Subject: [PULL 4/7] qga/commands-posix: Log all net stats failures
Date: Wed,  4 May 2022 14:00:58 +0400
Message-Id: <20220504100101.564747-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220504100101.564747-1-marcandre.lureau@redhat.com>
References: <20220504100101.564747-1-marcandre.lureau@redhat.com>
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

From: Andrew Deason <adeason@sinenomine.net>

guest_get_network_stats can silently fail in a couple of ways. Add
debug messages to these cases, so we're never completely silent on
failure.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220426195526.7699-5-adeason@sinenomine.net>
---
 qga/commands-posix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c1e994f3e6ab..ee997a58f21c 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2775,6 +2775,8 @@ static int guest_get_network_stats(const char *name,
     size_t n = 0;
     fp = fopen(devinfo, "r");
     if (!fp) {
+        g_debug("failed to open network stats %s: %s", devinfo,
+                g_strerror(errno));
         return -1;
     }
     name_len = strlen(name);
@@ -2823,7 +2825,9 @@ static int guest_get_network_stats(const char *name,
     fclose(fp);
     g_free(line);
     g_debug("/proc/net/dev: Interface '%s' not found", name);
-#endif /* CONFIG_LINUX */
+#else /* !CONFIG_LINUX */
+    g_debug("Network stats reporting available only for Linux");
+#endif /* !CONFIG_LINUX */
     return -1;
 }
 
-- 
2.36.0.44.g0f828332d5ac


