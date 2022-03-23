Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612204E5635
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:19:58 +0100 (CET)
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3iH-0004bQ-Fd
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:19:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Ok-0004Zj-L0
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Oh-00053x-DS
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzQfoN89ZbN9n8shvtJGmGnsFALTimJov+YPqv5Vcj8=;
 b=SPMLwyAv9900O9DdLLdfO0R/R2RY1+VM6b21wLVSL3jXkni5jzZfdlTlD3h8OJ2QimVHNC
 vcUoL/r3bQp2uqA218h2bopmiOnAP6bYEQ6VDUDhFuubxdFCs+cQtvAaAKpT4JMClz59u2
 BzmOgFjlWIkZwthlRkguYebI9mQS45k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-sg_RsyMXNS6FFUniq4inzw-1; Wed, 23 Mar 2022 11:59:40 -0400
X-MC-Unique: sg_RsyMXNS6FFUniq4inzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52D54899EC4;
 Wed, 23 Mar 2022 15:59:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F11C9C26E80;
 Wed, 23 Mar 2022 15:59:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 12/32] qga: replace deprecated g_get_current_time()
Date: Wed, 23 Mar 2022 19:57:23 +0400
Message-Id: <20220323155743.1585078-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

According to GLib API:
g_get_current_time has been deprecated since version 2.62 and should not
be used in newly-written code. GTimeVal is not year-2038-safe. Use
g_get_real_time() instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index b9dd19918e47..1deb0ee2fbfe 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -314,7 +314,6 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
                    const gchar *msg, gpointer opaque)
 {
     GAState *s = opaque;
-    GTimeVal time;
     const char *level_str = ga_log_level_str(level);
 
     if (!ga_logging_enabled(s)) {
@@ -329,9 +328,11 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
 #else
     if (level & s->log_level) {
 #endif
-        g_get_current_time(&time);
+        gint64 t = g_get_real_time();
         fprintf(s->log_file,
-                "%lu.%lu: %s: %s\n", time.tv_sec, time.tv_usec, level_str, msg);
+                "%" G_GINT64_FORMAT ".%" G_GINT64_FORMAT
+                ": %s: %s\n", t / G_USEC_PER_SEC, t % G_USEC_PER_SEC,
+                level_str, msg);
         fflush(s->log_file);
     }
 }
-- 
2.35.1.273.ge6ebfd0e8cbb


