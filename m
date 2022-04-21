Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA9F50A0F5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:37:48 +0200 (CEST)
Received: from localhost ([::1]:37364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhX0F-0007Hw-Cw
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWyX-0005jL-Ar
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWyV-0003YM-Pm
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650548158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UWjYQbMgN6o/XuX9ZbixAYZpC2JZx7qbt9X+Pebz59o=;
 b=hxy+bnX2lrOAlL4CIbSo5WvsvNZoJuooaVyBtGxqCz3A7HL7b38A3/m9/0du//w6ZFTNoV
 6leK78Iigq/6+qtV1PMcs6JcFAaSO3iPAkou5sIg95jPXR3sokKN7Fz1BKibGcWecMPdB+
 4RJJkGK4OklXzQUmWBqkajDMGprMPWg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-OWZ8epk3NnaI_YwlVgl8hg-1; Thu, 21 Apr 2022 09:35:54 -0400
X-MC-Unique: OWZ8epk3NnaI_YwlVgl8hg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B384A1C04B71;
 Thu, 21 Apr 2022 13:35:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C10E940CFD22;
 Thu, 21 Apr 2022 13:35:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] qga: use fixed-length and GDateTime for log timestamp
Date: Thu, 21 Apr 2022 17:35:49 +0400
Message-Id: <20220421133549.2876244-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
 berrange@redhat.com, armbru@redhat.com, Michael Roth <michael.roth@amd.com>
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
2.35.1.693.g805e0a68082a


