Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36CA120F96
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 17:34:23 +0100 (CET)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igtKA-0001x6-MG
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 11:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtEs-0004bc-0O
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:28:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtEq-0006oy-KX
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:28:53 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53199)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1igtEq-0006nX-E4
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:28:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id p9so7441529wmc.2
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 08:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s0NAURmWeAEU0CNcWC+Zic7UHZ5JprIxfB44NlHf3g4=;
 b=YqhiMz/I/8aUf7t4wF9wYouokdNHO7KPpS11+98zjxDxz1sxqd8asR0DlJ+MgPnyQJ
 sVTzm++QZSriD1OeetSUW3tMJoHbrvR/k9HfAwQLQNI1ttQg+KPMTgmQnBkQnNmgrbWn
 pDbK4jcl8EnzQE07stYQ2i5y3eOCGaDooeMubdNz9v1bRjZ26PoU2BpuHKxKAQReyioy
 d1ap7SOXloHsN76AT9trk+uCjCKvz+R7wWQ52OmxirIWb57qENGHkD4SY5JkBNHWajnm
 1G00WCTU26F+f6MC3IJzmFql7XYZ/LWVDn/J8EiXLAQ0MpBTZnyaPh5DjIno+aFVxGKI
 uYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=s0NAURmWeAEU0CNcWC+Zic7UHZ5JprIxfB44NlHf3g4=;
 b=pB9r3VFbhnNyw0Ai23OCHxBgP/2QaZqrclgdmWdBMzVjKBrkALQECTuhxQnl2laQMY
 5KEv4swz0tgqNoqnYUKjWmm/51iZgvfF+N1jpfdOqxbu4poHNQwFOPmSgl9hLbGfuy5e
 jjRH8ShT52nHD/5hdgRJGzZKF1GDKeUVHXCskU6JsnWzMWZUVA2svOw7nDmaRwvH7Zlb
 zIXBmje08KyjuE6t2LDAvauNmOJB6MUerhairoHkW9GtqUbc6NeE+7C6YIK1/sfm/wNF
 vpNTS98QQ38E5lgZgPd+SZJX6G2f3UKhXLkeGFLa0elePXeQRKDz5Gxr/iHalqqWU2+f
 OnMg==
X-Gm-Message-State: APjAAAWAItefEITM2rwwHKjkQbxkBa57PGbKAv/UhREcaqEiLxPQoGAh
 2XmxOEZqr8tKiHEfBKurUwLxVV4b
X-Google-Smtp-Source: APXvYqySMmZis8fxBaKOyK3g4TOeUN++ljEO+x6qwbO3J2TV2QliFufjpi5gTtHts1JEmc7sAZ6yAA==
X-Received: by 2002:a7b:c001:: with SMTP id c1mr31656447wmb.96.1576513731275; 
 Mon, 16 Dec 2019 08:28:51 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id q68sm19962334wme.14.2019.12.16.08.28.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Dec 2019 08:28:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/62] migration-test: Move hide_stderr to common commandline
Date: Mon, 16 Dec 2019 17:27:47 +0100
Message-Id: <1576513726-53700-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
References: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Tested-by: Cornelia Huck <cohuck@redhat.com> #s390x
Tested-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/migration-test.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index 9573861..372e66c 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -558,6 +558,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
 {
     gchar *cmd_src, *cmd_dst;
     gchar *cmd_source, *cmd_target;
+    const gchar *ignore_stderr;
     char *bootpath = NULL;
     char *extra_opts = NULL;
     char *shmem_path = NULL;
@@ -661,24 +662,19 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     g_free(extra_opts);
 
     if (hide_stderr) {
-        gchar *tmp;
-        tmp = g_strdup_printf("%s 2>/dev/null", cmd_src);
-        g_free(cmd_src);
-        cmd_src = tmp;
-
-        tmp = g_strdup_printf("%s 2>/dev/null", cmd_dst);
-        g_free(cmd_dst);
-        cmd_dst = tmp;
+        ignore_stderr = "2>/dev/null";
+    } else {
+        ignore_stderr = "";
     }
 
-    cmd_source = g_strdup_printf("%s %s",
-                                 cmd_src, opts_src);
+    cmd_source = g_strdup_printf("%s %s %s",
+                                 cmd_src, opts_src, ignore_stderr);
     g_free(cmd_src);
     *from = qtest_init(cmd_source);
     g_free(cmd_source);
 
-    cmd_target = g_strdup_printf("%s %s",
-                                 cmd_dst, opts_dst);
+    cmd_target = g_strdup_printf("%s %s %s",
+                                 cmd_dst, opts_dst, ignore_stderr);
     g_free(cmd_dst);
     *to = qtest_init(cmd_target);
     g_free(cmd_target);
-- 
1.8.3.1



