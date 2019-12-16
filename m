Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA0120FAE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 17:38:39 +0100 (CET)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igtOI-00075h-71
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 11:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtF6-0004xO-Fe
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtF5-0007LU-CF
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:08 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43815)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1igtF5-0007JX-5c
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:07 -0500
Received: by mail-wr1-x432.google.com with SMTP id d16so8035923wre.10
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 08:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=YxoUvt3Ps00ZPMRYsL2yZ0hkryLbuyO6moys9UaojTo=;
 b=LBGyytqPFmYvd7qfKp/kzjUZ++0fxnh0bwCn81ZOtAtX9xcL+hH27ZE4c9oNjGfyzN
 Nf9CSowaA2axFHVFe6EDYLfGTELyKo5Io6oLbdzdx720u4pUCtFwnvmZV3fZLTVaWLlV
 08QFn+tfy1UAn1zW7EPywE8h5Ic5dYNDAVj+DjaxPwyA+NqkcJRPXWzEM2B9zgo3/sD8
 WGMH3hSUXxoKWTSe9mfoMThK4SIL3i+jvLZprRa24XVyt+/2S9rLga7zKw7yuAoVio0v
 e63k0cHEFnlEvyvUeWGr/upHMZwLtz2kuMkDPYQclh/KE1o8bpG+STtcWxvAaSC5bF5M
 B2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=YxoUvt3Ps00ZPMRYsL2yZ0hkryLbuyO6moys9UaojTo=;
 b=lQuzY2mEtzjQ4fVPffppzcjRVPxov0Xk78C2zyZ+0LK27EfPj1KCFqYPvH7EFduiri
 UjEHlVtAQFJL+5mNj7qcH2Rtcv021UoRHaUdzFxiSyt4smRY3WcNjQOhmxXykirGvedE
 AytSVsmmBoMvVgW4IuXrSc+z9hLRL0dhDa+o+UmOQRCxC/GjFW1krPqgeSAvbWotEEO+
 Co4MGKXBykiLej5A1Jfe5JfOIDjc0dZ7C1iYHugIMvkLS8aIcEC09uXFYALkTZ9oWSCe
 W1aldLmf48QhRZMGgLhkrmonQNvRTTYsh88UrpAZmCT1pLiHGH00fzu5ejk0iCQimxBk
 Kbzg==
X-Gm-Message-State: APjAAAVXfwxJIrZmT+1tt3hS1l3gc5JPSYz9g0ViJfbW1claUYET4k9f
 e4IFXl21SZ2gzpdCbJ+psyFNJqNZ
X-Google-Smtp-Source: APXvYqzQAHlgYUKzYuAa/zn4Ln+fPDJv7vTq2RZb7uMjPVBt/FwidpuhhZMQf6xH7paWP5AdvO4Eig==
X-Received: by 2002:adf:f885:: with SMTP id u5mr31958112wrp.359.1576513745888; 
 Mon, 16 Dec 2019 08:29:05 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id q68sm19962334wme.14.2019.12.16.08.29.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Dec 2019 08:29:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/62] vl: introduce object_parse_property_opt
Date: Mon, 16 Dec 2019 17:28:02 +0100
Message-Id: <1576513726-53700-19-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
References: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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
index 14c78bc..2f6b0dd 100644
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



