Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB6E508A00
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:05:34 +0200 (CEST)
Received: from localhost ([::1]:49256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhAxZ-00015V-NX
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhALv-0005F4-JJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhALs-0004LR-Nf
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAHj4RwSrHOGPVZpr8SIV6uskyytSD69N8mgLF9lAnA=;
 b=fMyuvu5AzGsIpRkz150oOsO+IjaMFrg5gWrbjMUDSoNprfeCd5XxvvDlgPUsJMdWs7R9+i
 MmzonLjZnP3HP3u5LsHsRQ3Sxz9egSikYBW3GwRwgj8A3I581Tiy5vcLjGBLWtUoXgiTGH
 qOwFXX3D6ByGWpesNEcUjoCY4FoGA1Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-uc7k8WeLPSC_glVWwfPskA-1; Wed, 20 Apr 2022 09:26:33 -0400
X-MC-Unique: uc7k8WeLPSC_glVWwfPskA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF2321066542;
 Wed, 20 Apr 2022 13:26:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9E2F2166B46;
 Wed, 20 Apr 2022 13:26:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 01/41] qga: use fixed-length for usecs formatting
Date: Wed, 20 Apr 2022 17:25:44 +0400
Message-Id: <20220420132624.2439741-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The old code is kind of wrong. Say it's 1649309843.000001 seconds past
the epoch. Prints "1649309843.1". 9us later, it prints "1649309843.10".
Should really use %06lu for the microseconds part.

Use int64_t/PRId64 instead of old GLib-style.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 1deb0ee2fbfe..ac63d8e47802 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -328,11 +328,10 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
 #else
     if (level & s->log_level) {
 #endif
-        gint64 t = g_get_real_time();
+        int64_t t = g_get_real_time();
         fprintf(s->log_file,
-                "%" G_GINT64_FORMAT ".%" G_GINT64_FORMAT
-                ": %s: %s\n", t / G_USEC_PER_SEC, t % G_USEC_PER_SEC,
-                level_str, msg);
+                "%" PRId64 ".%06" PRId64 ": %s: %s\n",
+                t / G_USEC_PER_SEC, t % G_USEC_PER_SEC, level_str, msg);
         fflush(s->log_file);
     }
 }
-- 
2.35.1.693.g805e0a68082a


