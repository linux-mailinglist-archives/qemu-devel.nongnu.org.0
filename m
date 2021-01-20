Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806B2FD2F1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:45:21 +0100 (CET)
Received: from localhost ([::1]:51274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EjY-0005RR-JI
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Eh1-00042s-3w
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:42:46 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Egz-00049A-Ib
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:42:42 -0500
Received: by mail-ej1-x62e.google.com with SMTP id rv9so15081193ejb.13
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tstkOXr/poGRTXnqb8orWZc0ENWiWlKSvgrhU06MUPQ=;
 b=GcttzMe+D+AzKCiLztkWdsCFc38nkBVNUNXRfzM+rNuK3ll5MsuMXsdj3U8CGm5icq
 EsQagDek03lWyhWkc31LSUno2qfgHKs3/HprLIhOf7OpJG3d7cHPvWRF0k/ohMHmOWKd
 LnNAiEygBbT29kMhPHGA2qMzJg1t8HCnUFAADAgsY5dArm5CqSF46fx0oxpGv3/ImFo3
 5i+NKdeuOyJku7yweBxRmXf05KN5m22ChDn+2m3ipC92pgc6pzbKLTlxBXKFY6HyTo8C
 wn3umg6KL7y6nzxKqyWdbdtsv4pcGEQP4aANqROKIEvPtLKRVG3KTnrB/nd9vlVKS9Ri
 8riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tstkOXr/poGRTXnqb8orWZc0ENWiWlKSvgrhU06MUPQ=;
 b=f0q1Rpj4+cYfQN75F4S3Q9O4x7OoxDhbQozofvKqKDYgYJRkYFcPIYqVc2l22REV/E
 MtgYkMKriS5wsbje0Y3U+zG68NU6eIe6mEhfH0/DjZMjqkVkNQMBZegJxgBzXADGOquD
 O3tbxZvB0+U0AyKMUN89i8bSgKK54p4mHPU9LIw980X3azIytN73oXbZv+aVO83hSmo4
 +561dipnbU7LBUUjA+bdqX0dPu0EIV/GpCzjWIuTw5SlxZ2l8hv6KZTIzwqEB0H6Obrr
 UUK088AZuh+wfUViCptP6NE1g3PzOWbWdbu/flWG3/hXeypU0ALI09A5OjBJWBC9T1ef
 IWUQ==
X-Gm-Message-State: AOAM532q0ZeegD6Jpyol+NViChvh4jOZpRdzSg6foJMYKieG4n+0VbYS
 kkyYxV72DA64DaaElGbJ/VnuwrwzyIps1w==
X-Google-Smtp-Source: ABdhPJx7hHPDYbWvcwSckoHaDaP2wjC+dBiX7jD0r6ieH9+1Q6nrdqwWy6CsdW6cRY0iqVwg2/nk4A==
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr3487052ejc.482.1611153760194; 
 Wed, 20 Jan 2021 06:42:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id v9sm965078ejd.92.2021.01.20.06.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 06:42:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] vnc: support "-vnc help"
Date: Wed, 20 Jan 2021 15:42:35 +0100
Message-Id: <20210120144235.345983-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120144235.345983-1-pbonzini@redhat.com>
References: <20210120144235.345983-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: armbru@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_opts_parse_noisily now that HMP does not call
vnc_parse anymore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/ui/console.h | 2 +-
 softmmu/vl.c         | 6 +++---
 ui/vnc-stubs.c       | 7 +++----
 ui/vnc.c             | 8 ++++----
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 5dd21976a3..7a3fc11abf 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -439,7 +439,7 @@ void vnc_display_open(const char *id, Error **errp);
 void vnc_display_add_client(const char *id, int csock, bool skipauth);
 int vnc_display_password(const char *id, const char *password);
 int vnc_display_pw_expire(const char *id, time_t expires);
-QemuOpts *vnc_parse(const char *str, Error **errp);
+void vnc_parse(const char *str);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
 
 /* input.c */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 59304261cf..a8876b8965 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1113,7 +1113,7 @@ static void parse_display(const char *p)
          * display access.
          */
         if (*opts == '=') {
-            vnc_parse(opts + 1, &error_fatal);
+            vnc_parse(opts + 1);
         } else {
             error_report("VNC requires a display argument vnc=<display>");
             exit(1);
@@ -1402,7 +1402,7 @@ static void qemu_create_default_devices(void)
         if (!qemu_display_find_default(&dpy)) {
             dpy.type = DISPLAY_TYPE_NONE;
 #if defined(CONFIG_VNC)
-            vnc_parse("localhost:0,to=99,id=default", &error_abort);
+            vnc_parse("localhost:0,to=99,id=default");
 #endif
         }
     }
@@ -3186,7 +3186,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_vnc:
-                vnc_parse(optarg, &error_fatal);
+                vnc_parse(optarg);
                 break;
             case QEMU_OPTION_no_acpi:
                 olist = qemu_find_opts("machine");
diff --git a/ui/vnc-stubs.c b/ui/vnc-stubs.c
index c6b737dcec..0fd4e0846a 100644
--- a/ui/vnc-stubs.c
+++ b/ui/vnc-stubs.c
@@ -10,13 +10,12 @@ int vnc_display_pw_expire(const char *id, time_t expires)
 {
     return -ENODEV;
 };
-QemuOpts *vnc_parse(const char *str, Error **errp)
+void vnc_parse(const char *str)
 {
     if (strcmp(str, "none") == 0) {
-        return NULL;
+        return;
     }
-    error_setg(errp, "VNC support is disabled");
-    return NULL;
+    error_setg(&error_fatal, "VNC support is disabled");
 }
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
diff --git a/ui/vnc.c b/ui/vnc.c
index d429bfee5a..66f7c1b936 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -50,6 +50,7 @@
 #include "crypto/random.h"
 #include "qom/object_interfaces.h"
 #include "qemu/cutils.h"
+#include "qemu/help_option.h"
 #include "io/dns-resolver.h"
 
 #define VNC_REFRESH_INTERVAL_BASE GUI_REFRESH_INTERVAL_DEFAULT
@@ -4211,14 +4212,14 @@ static void vnc_auto_assign_id(QemuOptsList *olist, QemuOpts *opts)
     qemu_opts_set_id(opts, id);
 }
 
-QemuOpts *vnc_parse(const char *str, Error **errp)
+void vnc_parse(const char *str)
 {
     QemuOptsList *olist = qemu_find_opts("vnc");
-    QemuOpts *opts = qemu_opts_parse(olist, str, true, errp);
+    QemuOpts *opts = qemu_opts_parse_noisily(olist, str, !is_help_option(str));
     const char *id;
 
     if (!opts) {
-        return NULL;
+        exit(1);
     }
 
     id = qemu_opts_id(opts);
@@ -4226,7 +4227,6 @@ QemuOpts *vnc_parse(const char *str, Error **errp)
         /* auto-assign id if not present */
         vnc_auto_assign_id(olist, opts);
     }
-    return opts;
 }
 
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp)
-- 
2.29.2


