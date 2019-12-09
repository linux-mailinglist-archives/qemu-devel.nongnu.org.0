Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B65117001
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 16:12:10 +0100 (CET)
Received: from localhost ([::1]:41294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieKhl-0005eI-3w
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 10:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47178)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ieKXx-0003Tj-4U
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:02:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ieKXr-0001Ij-St
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:02:01 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53787)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ieKXr-0001HT-MA
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 10:01:55 -0500
Received: by mail-wm1-x343.google.com with SMTP id n9so15328520wmd.3
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 07:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BhSHBEFiJOtlRUjScEEDImi8MRa01lSsuQLxl3Kz++4=;
 b=LuIxSO3bYcU2Nty96VfIdiXf3GsOVSAZiEAvnezWOa5QV+lle8aI3JybYXQNcBalSM
 SbP6zeammGoOFix9zTz1iulC4ebI23Spbaysdcdyako0Zdta1SgU+/EQdhASllSYvnxT
 nhnmErGd/4ADkZjzXOHO+XckYoTQvH1LQ8Pc6V+qnJfVpFy/Bv62tYQBxkaUH9keT9rS
 v6wD34l4aAcA6Ys5AgxC7ute9bwiHDlNiy8z/Dh31REm3O367XbNHMZ0+leSaMHfaVuB
 qhxKPJNiEAMX5wR54PuhTeIZaX5bRyO7pOav1rBGd1xa+L9zALndifzAJPLwsZxXEzA2
 wJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=BhSHBEFiJOtlRUjScEEDImi8MRa01lSsuQLxl3Kz++4=;
 b=HYg7frqZlEtXedzUnwxCkVNZSUCerE3rt8mF5wma+wonKVlH0IuQeoJMeiDeF2ap8Y
 Pq0D0+au90erys//P4Dq+KwDNsFaH8M6GWqGq//FfPM2Js2IF2jp3DT+eklVUHuXtBGx
 QIaSuBSYOVxqi154Y5rESwz8VLpqdWldlSiXOj3L3nfzH3SfXBYL90FpYZiZ2571MvB9
 LFtUsI0XfXuxdN0eB2ZLvLJ3J41aLNKb7gaW0e/NmDyrM7FuyJzvX/yPBQMd+xn+tLgQ
 3qq6IZTmaDrHy4ECmn9l7C89LlBbhPGao0UY+MXqVYUXhZfJryVBkyo2sNGjbaEFUnB5
 MGJg==
X-Gm-Message-State: APjAAAWPspx0MoDf/tr5SC+Cp71n0NAUGj6I9Lz97U/WigEOkjC5WM7m
 Z7itVNCkTmuiVuxUBBpREslfhXmE
X-Google-Smtp-Source: APXvYqz+X67ceED+6E8riqGQspBqDoCEED8Vu4bkqP+z72iY5N6KUQFry104KzvyO99rAFhSbt3JKw==
X-Received: by 2002:a1c:8153:: with SMTP id c80mr24773899wmd.58.1575903714502; 
 Mon, 09 Dec 2019 07:01:54 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g9sm27219371wro.67.2019.12.09.07.01.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2019 07:01:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/18] vl: introduce object_parse_property_opt
Date: Mon,  9 Dec 2019 16:01:34 +0100
Message-Id: <1575903705-12925-8-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575903705-12925-1-git-send-email-pbonzini@redhat.com>
References: <1575903705-12925-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: thuth@redhat.com, elmarco@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will reuse the parsing loop of machine_set_property soon for "-accel",
but we do not want the "_" -> "-" conversion since "-accel" can just
standardize on dashes.  We will also add a bunch of legacy option handling
to keep the QOM machine object clean.  Extract the loop into a separate
function, and keep the legacy handling in machine_set_property.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/vl.c b/vl.c
index 19c77b4..66dff1b 100644
--- a/vl.c
+++ b/vl.c
@@ -2615,27 +2615,17 @@ static MachineClass *select_machine(void)
     return machine_class;
 }
 
-static int machine_set_property(void *opaque,
-                                const char *name, const char *value,
-                                Error **errp)
+static int object_parse_property_opt(Object *obj,
+                                     const char *name, const char *value,
+                                     const char *skip, Error **errp)
 {
-    Object *obj = OBJECT(opaque);
     Error *local_err = NULL;
-    char *p, *qom_name;
 
-    if (strcmp(name, "type") == 0) {
+    if (g_str_equal(name, skip)) {
         return 0;
     }
 
-    qom_name = g_strdup(name);
-    for (p = qom_name; *p; p++) {
-        if (*p == '_') {
-            *p = '-';
-        }
-    }
-
-    object_property_parse(obj, value, qom_name, &local_err);
-    g_free(qom_name);
+    object_property_parse(obj, value, name, &local_err);
 
     if (local_err) {
         error_propagate(errp, local_err);
@@ -2645,6 +2635,21 @@ static int machine_set_property(void *opaque,
     return 0;
 }
 
+static int machine_set_property(void *opaque,
+                                const char *name, const char *value,
+                                Error **errp)
+{
+    g_autofree char *qom_name = g_strdup(name);
+    char *p;
+
+    for (p = qom_name; *p; p++) {
+        if (*p == '_') {
+            *p = '-';
+        }
+    }
+
+    return object_parse_property_opt(opaque, name, value, "type", errp);
+}
 
 /*
  * Initial object creation happens before all other
-- 
1.8.3.1



