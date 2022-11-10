Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B977623F7B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:08:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Sk-0002wV-6h; Thu, 10 Nov 2022 05:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SN-0002tb-Td
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:47 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SL-0006TJ-Jx
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:47 -0500
Received: by mail-pg1-x536.google.com with SMTP id e129so1329570pgc.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/PRPd3/ZtVJ1S8SSoZJFlAuYT2tdPLmqj6DRdoumUU=;
 b=7bvJA0OukW2dWCprznDWPIOmoKWoESefn8tdQeqNWMaThdav2wgnq6iyj5e4tXCNSE
 91yDj6vG0Yon6hlqw/VEoOWGCgKsCljKFBVqlXqq6cextPgxbX5ZXB8uDZ9WZyIAtdV2
 rijbRFq+6GJ5+ebvKocYc0P70fQ+yaq5Iklf7wSKPCLauMGcbznJtpVjVqHto1Oi1P5N
 xNhx+vlivfWUWCoGWzFVSXRAxCzr0i4aXQzocU7q8ci9NmfNHbYJo1vjErriYmLzMJmW
 /T9MZDAOeOtlylWjlzItzUUbhedYY8UBj/VUCQz8JtWgrmiYRyD3pn8xZncjVWbDkkQ9
 T6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h/PRPd3/ZtVJ1S8SSoZJFlAuYT2tdPLmqj6DRdoumUU=;
 b=fFD/FNOLQNCWnqDicBu/aNcjP26Q960I46CDbf8IfdWJoSpA7uWmgPYsJn8X+tkqQh
 6/gPg03yMKHgZR9llRdZd1IqRJqCu0+x+lRF+dWcQaGH+HwVBotajMT34mPnLiIYV6al
 K55M8hUvMaXgzutqUo9VMV7MEHxI+hDDKhJL4dOrULXpzNRyiKjLujPThmAqGSNck1Li
 j7lLQkyfK2vJE/Yq5V2pL0plbK1mxw1L4bQ1ZyBrbHEtoFJsK9gfWztsqMcMzpyCrK2u
 jlXPfByOANFh9KbeB0FHZC3gNG8bLBL5LibRqbqJLOLe2lr+b33OTh3s4FSmIuzXTRjP
 4Eaw==
X-Gm-Message-State: ACrzQf3F0mcGhrlh71GKlNH5eIVrSQDYi+/VuEl2RA5VWtgsyX+GI3ho
 r2A+IBuAeafhscJuRpyVgoHJsACn1rR0xInr
X-Google-Smtp-Source: AMsMyM6arShkxKnwDugGCo+PGq33ZnmDF5FZLMXIc7+7DrLciC7MaZXrFXvAqO6Lq9X54dLD8KsK+w==
X-Received: by 2002:a63:5412:0:b0:470:1a94:4c0 with SMTP id
 i18-20020a635412000000b004701a9404c0mr2057273pgb.555.1668074803620; 
 Thu, 10 Nov 2022 02:06:43 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:06:43 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Yan Vugenfirer <yan@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 02/10] util: Introduce qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 19:06:21 +0900
Message-Id: <20221110100629.61496-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qemu_get_runtime_dir() returns a dynamically allocated directory path
that is appropriate for storing runtime files. It corresponds to "run"
directory in Unix.

With a tree-wide search, it was found that there are several cases
where such a functionality is implemented so let's have one as a common
utlity function.

A notable feature of qemu_get_runtime_dir() is that it uses
$XDG_RUNTIME_DIR if available. While the function is often called by
executables which requires root privileges, it is still possible that
they are called from a user without privilege to write the system
runtime directory. In fact, I decided to write this patch when I ran
virtiofsd in a Linux namespace created by a normal user and realized
it tries to write the system runtime directory, not writable in this
case. $XDG_RUNTIME_DIR should provide a writable directory in such
cases.

This function does not use qemu_get_local_state_dir() or its logic
for Windows. Actually the implementation of qemu_get_local_state_dir()
for Windows seems not right as it calls g_get_system_data_dirs(),
which refers to $XDG_DATA_DIRS. In Unix terminology, it is basically
"/usr/share", not "/var", which qemu_get_local_state_dir() is intended
to provide. Instead, this function try to use the following in order:
- $XDG_RUNTIME_DIR
- LocalAppData folder
- get_relocated_path(CONFIG_QEMU_LOCALSTATEDIR "/run")

This function does not use g_get_user_runtime_dir() either as it
falls back to g_get_user_cache_dir() when $XDG_DATA_DIRS is not
available. In the case, we rather use:
get_relocated_path(CONFIG_QEMU_LOCALSTATEDIR "/run")

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/qemu/osdep.h | 12 ++++++++++++
 util/oslib-posix.c   | 11 +++++++++++
 util/oslib-win32.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b9c4307779..86445aad25 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -565,6 +565,18 @@ void qemu_set_cloexec(int fd);
  */
 char *qemu_get_local_state_dir(void);
 
+/**
+ * qemu_get_runtime_dir:
+ *
+ * Return a dynamically allocated directory path that is appropriate for storing
+ * runtime files. It corresponds to "run" directory in Unix, and uses
+ * $XDG_RUNTIME_DIR if available.
+ *
+ * The caller is responsible for releasing the value returned with g_free()
+ * after use.
+ */
+char *qemu_get_runtime_dir(void);
+
 /**
  * qemu_getauxval:
  * @type: the auxiliary vector key to lookup
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 59a891b6a8..9a0b3913ff 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -279,6 +279,17 @@ qemu_get_local_state_dir(void)
     return get_relocated_path(CONFIG_QEMU_LOCALSTATEDIR);
 }
 
+char *
+qemu_get_runtime_dir(void)
+{
+    char *env = getenv("XDG_RUNTIME_DIR");
+    if (env) {
+        return g_strdup(env);
+    }
+
+    return get_relocated_path(CONFIG_QEMU_LOCALSTATEDIR "/run");
+}
+
 void qemu_set_tty_echo(int fd, bool echo)
 {
     struct termios tty;
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index a67cb3822e..6ad1bb4bac 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -31,6 +31,8 @@
  */
 
 #include "qemu/osdep.h"
+#include <shlobj.h>
+#include <wchar.h>
 #include <windows.h>
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
@@ -241,6 +243,30 @@ qemu_get_local_state_dir(void)
     return g_strdup(data_dirs[0]);
 }
 
+char *
+qemu_get_runtime_dir(void)
+{
+    size_t size = GetEnvironmentVariableA("XDG_RUNTIME_DIR", NULL, 0);
+    if (size) {
+        char *env = g_malloc(size);
+        GetEnvironmentVariableA("XDG_RUNTIME_DIR", env, size);
+        return env;
+    }
+
+    PWSTR wpath;
+    const wchar_t *cwpath;
+    if (!SHGetKnownFolderPath(&FOLDERID_LocalAppData, KF_FLAG_DEFAULT, NULL, &wpath)) {
+        cwpath = wpath;
+        size = wcsrtombs(NULL, &cwpath, 0, &(mbstate_t){0}) + 1;
+        char *path = g_malloc(size);
+        wcsrtombs(path, &cwpath, size, &(mbstate_t){0});
+        CoTaskMemFree(wpath);
+        return path;
+    }
+
+    return get_relocated_path(CONFIG_QEMU_LOCALSTATEDIR "/run");
+}
+
 void qemu_set_tty_echo(int fd, bool echo)
 {
     HANDLE handle = (HANDLE)_get_osfhandle(fd);
-- 
2.38.1


