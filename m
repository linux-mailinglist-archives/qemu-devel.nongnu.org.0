Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9DD50A223
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:24:25 +0200 (CEST)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXjM-000224-Hz
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXEr-0007hO-Jr
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXEq-0006U5-4v
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isXn+YnfS5KSYFCe4gFUD89pPfoLmUAdk0hnX2U9yPo=;
 b=UbDdjKsyY2lGNgA5qs9mvMWiPIA38oTFoCrKSDqlweFiaf4nuTWlzJkCtxhkYB4wfFxlCp
 gFQSmg69yrm8xMjOU2Xy1KHuf0Qax7oKnJAKTwN7+Iv5IwrujIlUJ0IoLnIjVT+7K7gLPh
 f2wXs9+DrW+BCVzWmO1o3ZcJz7KiZ+I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-437lY15APSaCgAIqj3b0YQ-1; Thu, 21 Apr 2022 09:52:48 -0400
X-MC-Unique: 437lY15APSaCgAIqj3b0YQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 057DD185A7B2;
 Thu, 21 Apr 2022 13:52:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 232B640E80F5;
 Thu, 21 Apr 2022 13:52:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] qga: use fixed-length and GDateTime for log timestamp
Date: Thu, 21 Apr 2022 17:49:40 +0400
Message-Id: <20220421134940.2887768-31-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
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
 richard.henderson@linaro.org, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The old code is kind of wrong. Say it's 1649309843.000001 seconds past
the epoch. Prints "1649309843.1". 9us later, it prints "1649309843.10".
Should really use %06lu for the microseconds part.

Use GDateTime instead, as suggested by Daniel.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qga/main.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 3c20bf1fbfe0..3b9546c18584 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -328,11 +328,9 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
 #else
     if (level & s->log_level) {
 #endif
-        gint64 t = g_get_real_time();
-        fprintf(s->log_file,
-                "%" G_GINT64_FORMAT ".%" G_GINT64_FORMAT
-                ": %s: %s\n", t / G_USEC_PER_SEC, t % G_USEC_PER_SEC,
-                level_str, msg);
+        g_autoptr(GDateTime) now = g_date_time_new_now_utc();
+        g_autofree char *nowstr = g_date_time_format(now, "%s.%f");
+        fprintf(s->log_file, "%s: %s: %s\n", nowstr, level_str, msg);
         fflush(s->log_file);
     }
 }
-- 
2.36.0


