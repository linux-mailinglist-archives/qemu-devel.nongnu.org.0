Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F76325828
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:57:15 +0100 (CET)
Received: from localhost ([::1]:36992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFNhC-0005rQ-Po
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1lFNf2-0004b0-At
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:55:00 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1lFNf0-0000iq-FZ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:55:00 -0500
Received: by mail-ej1-x62c.google.com with SMTP id do6so11142879ejc.3
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/e7On/NbY6NesHUdlz2p2J2DIcZllpiU2fsw9H1h1Q4=;
 b=GKSkLH4+2AYNCx4oPTJGL2VgY0y8BCJVCrhOtPl8EiTNIantY8szx23xq0MR7DnFD2
 EQjhuq8adAaVfhyR7AoBw+vEMTOoIlcU9T6V5FxGC8oRGeFvn5V0k8lr5kRg4p+3DNL1
 98zkZiqmb5ZgbLeTcHWmyZpjt4ekmraiXITVU9KqjhhIx70i1vQaHGZimUCeFguvFoil
 22hmBIn63zbSsuZWhLEdxAW21yiF34Pl9tBrlLL+tBWbsN/yVnjbsPWLYd1cQNMyT5nv
 VBJN11tXhE3a0JoqJyirGQPq3pzpQOoMBjbMWxl1CokZORXvBdJZRYEcCtv9PLFUSG99
 CA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/e7On/NbY6NesHUdlz2p2J2DIcZllpiU2fsw9H1h1Q4=;
 b=FheG3Z4iUDQOUODMjykY4mZseftElfMyV1rjpmq6nDU47M0fbWIRRg18OHXlA6GUYb
 +cxAhQhOhVzKvbB+sEZjyEQnkVFLeowgd4aXtif8UNmpBj3OwQCb4Cfu1UoVQf6olJVR
 9fpr4z19ASQbAgSyORRkEO+SjYddeENxLJSZEVgfSAciG/J8hiG9h6ZWPzxo3rFoGi/O
 TSZ6pXYboEootLqB/rmwSOJeZlm/fW4JrMAsmH1QsE1v4OFRXvUsGG/Ac6fbhqlZ2rr5
 By17xT3PAjDwJZeQfZ0RYv6lJvDPyoOobJwQEHy3bF2AUjGW4u8xDvNEEftLKF2XuO+i
 +JTA==
X-Gm-Message-State: AOAM530WPCqwf67FNZlJlq2Ojl0madxK7gNZlUfuNnq3cuzjVD86/S7j
 nQvxaFM1tRiT+lloFw+yTNRIweUhofb5+Q==
X-Google-Smtp-Source: ABdhPJxJf+jKnck7Ek5uQPefatvErvyLTGY3lZgN5MlOmTArHLGIk6I3o5Yvi9Rj9LVeatz06Be1bg==
X-Received: by 2002:a17:906:2e91:: with SMTP id
 o17mr4490189eji.488.1614286496692; 
 Thu, 25 Feb 2021 12:54:56 -0800 (PST)
Received: from mini.lan (ns331963.ip-37-187-122.eu. [37.187.122.190])
 by smtp.gmail.com with ESMTPSA id c17sm949472edw.32.2021.02.25.12.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 12:54:56 -0800 (PST)
From: aladjev.andrew@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] linux user: moved is proc functions to separate file
Date: Thu, 25 Feb 2021 23:54:46 +0300
Message-Id: <20210225205448.10624-2-aladjev.andrew@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210225205448.10624-1-aladjev.andrew@gmail.com>
References: <20210225205448.10624-1-aladjev.andrew@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=aladjev.andrew@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Aladjev <aladjev.andrew@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Aladjev <aladjev.andrew@gmail.com>

---
 linux-user/meson.build    |  1 +
 linux-user/syscall.c      | 33 +--------------------------------
 linux-user/syscall_proc.c | 32 ++++++++++++++++++++++++++++++++
 linux-user/syscall_proc.h |  7 +++++++
 4 files changed, 41 insertions(+), 32 deletions(-)
 create mode 100644 linux-user/syscall_proc.c
 create mode 100644 linux-user/syscall_proc.h

diff --git a/linux-user/meson.build b/linux-user/meson.build
index 7fe28d6..b6a204d 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -9,6 +9,7 @@ linux_user_ss.add(files(
   'signal.c',
   'strace.c',
   'syscall.c',
+  'syscall_proc.c',
   'uaccess.c',
   'uname.c',
 ))
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c171dea..0ead34b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -133,6 +133,7 @@
 #include "qapi/error.h"
 #include "fd-trans.h"
 #include "tcg/tcg.h"
+#include "syscall_proc.h"
 
 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
@@ -7979,38 +7980,6 @@ static int open_self_auxv(void *cpu_env, int fd)
     return 0;
 }
 
-static int is_proc_myself(const char *filename, const char *entry)
-{
-    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
-        filename += strlen("/proc/");
-        if (!strncmp(filename, "self/", strlen("self/"))) {
-            filename += strlen("self/");
-        } else if (*filename >= '1' && *filename <= '9') {
-            char myself[80];
-            snprintf(myself, sizeof(myself), "%d/", getpid());
-            if (!strncmp(filename, myself, strlen(myself))) {
-                filename += strlen(myself);
-            } else {
-                return 0;
-            }
-        } else {
-            return 0;
-        }
-        if (!strcmp(filename, entry)) {
-            return 1;
-        }
-    }
-    return 0;
-}
-
-#if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN) || \
-    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
-static int is_proc(const char *filename, const char *entry)
-{
-    return strcmp(filename, entry) == 0;
-}
-#endif
-
 #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
 static int open_net_route(void *cpu_env, int fd)
 {
diff --git a/linux-user/syscall_proc.c b/linux-user/syscall_proc.c
new file mode 100644
index 0000000..34051a8
--- /dev/null
+++ b/linux-user/syscall_proc.c
@@ -0,0 +1,32 @@
+#include "qemu/osdep.h"
+
+#include "syscall_proc.h"
+
+int is_proc_myself(const char *filename, const char *entry)
+{
+    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
+        filename += strlen("/proc/");
+        if (!strncmp(filename, "self/", strlen("self/"))) {
+            filename += strlen("self/");
+        } else if (*filename >= '1' && *filename <= '9') {
+            char myself[80];
+            snprintf(myself, sizeof(myself), "%d/", getpid());
+            if (!strncmp(filename, myself, strlen(myself))) {
+                filename += strlen(myself);
+            } else {
+                return 0;
+            }
+        } else {
+            return 0;
+        }
+        if (!strcmp(filename, entry)) {
+            return 1;
+        }
+    }
+    return 0;
+}
+
+int is_proc(const char *filename, const char *entry)
+{
+    return strcmp(filename, entry) == 0;
+}
diff --git a/linux-user/syscall_proc.h b/linux-user/syscall_proc.h
new file mode 100644
index 0000000..3098af9
--- /dev/null
+++ b/linux-user/syscall_proc.h
@@ -0,0 +1,7 @@
+#ifndef SYSCALL_PROC_H
+#define SYSCALL_PROC_H
+
+int is_proc(const char *filename, const char *entry);
+int is_proc_myself(const char *filename, const char *entry);
+
+#endif
-- 
2.26.2


