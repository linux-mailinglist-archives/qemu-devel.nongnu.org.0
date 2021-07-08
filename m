Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6523C1818
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:28:02 +0200 (CEST)
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xof-0001d6-3L
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1XmZ-0007hx-JN
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:25:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1XmY-0005W9-32
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:25:51 -0400
Received: by mail-pj1-x1034.google.com with SMTP id n11so4044458pjo.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KxvTLSU1IwRTYkOMS6dRGl4OQuHqSkLV4qmVQ6tKy4k=;
 b=oqXof65H9ZAKTeY2wu7MfjUSbYNnYJR+FXwYVmJOdWpPiF6akVt+IQOaLijR10aWz7
 3F+HJmNbykwfuKqaFEfTAYrGc4RIctA5l+zwJOelSORYQCkSQCP99uD2xZF9UkTCIzTN
 6WTkSU0t0snomF3CryX1NmpIxO+EX3Pa97t1YIHzFqTcuHViiqjOLlq1s2QiPyZou+2d
 V4W/wadlb/QOijnKNqZYpz0OZP0mky9hHlRNxo5M4bxyzpziDgxM5fSlXhVORS1lqOVP
 5Bs4PdMWdGUtBT9mzSQkdpx2WfepdLrngN7xfaPYaYJVsu48NDS5iVxWLxpRva/5YP2e
 IPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KxvTLSU1IwRTYkOMS6dRGl4OQuHqSkLV4qmVQ6tKy4k=;
 b=hHtq5dK3wNzDbif0tclObr2EHUJo0yXB5d1RKaaWCd6xRTP6L6xut0yk2V7M791dAf
 Jz5kihhPxxTgbbgmn7ig+gEbR7/95v/DThYZCxvPLIwTp9dF7ES5tTGuZQJ4Ff39Mvl/
 h87Rs6Y+DksYxQAk/xAMXTeDnK0BZUcY/xgyop/k1NWzHxcR8B5Rwnz8uB0Q1DdKxnIM
 dCT0vM/cAMAdBB2Ji2AtZgPVh2uoWmugDFTmFCBpuQAFikD6HrR2I+L1VeC+4etucZM4
 0Wa9ZvG8Waeg9RELaFCwuWnOLww8PEC6T7Y1CDcSmcKquKTV8hBGTttNSVFIUg7meRXW
 8Gpw==
X-Gm-Message-State: AOAM531DEkYXwOr9yVnz9WmBek625GiEsx3/KKE3eCNNXSUE5nVuCkKy
 7WG+ATlOoOM+OcX6DuvebCfTEOIBtGv7FA==
X-Google-Smtp-Source: ABdhPJyI6Xk/kA1YJuAcezysrH7kIiC6dL6hEJOTe2zEDrgaHzhHPXfOqn+vyEHbMpPVrEuFCuKPaA==
X-Received: by 2002:a17:90a:9282:: with SMTP id
 n2mr6022498pjo.92.1625765148644; 
 Thu, 08 Jul 2021 10:25:48 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:7947:37f7:fd02:9c0c])
 by smtp.gmail.com with ESMTPSA id c20sm3579429pfd.64.2021.07.08.10.25.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:25:48 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 1/4] cutils: Introduce bundle mechanism
Date: Fri,  9 Jul 2021 02:25:38 +0900
Message-Id: <20210708172541.29530-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/qemu/cutils.h | 19 +++++++++++++++++++
 util/cutils.c         | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 986ed8e15f4..6060e56b877 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -209,4 +209,23 @@ int qemu_pstrcmp0(const char **str1, const char **str2);
  */
 char *get_relocated_path(const char *dir);
 
+/**
+ * find_bundle:
+ * @path: Relative path
+ *
+ * Returns a path for the specified directory or file bundled in QEMU. It uses
+ * the directory of the running executable as the prefix first. See
+ * get_relocated_path() for the details. The next candidate is "qemu-bundle"
+ * directory in the directory of the running executable. "qemu-bundle"
+ * directory is typically present in the build tree.
+ *
+ * The returned string should be freed by the caller.
+ *
+ * Returns: a path that can access the bundle, or NULL if no matching bundle
+ * exists.
+ */
+char *find_bundle(const char *path);
+
+void list_bundle_candidates(const char *path);
+
 #endif
diff --git a/util/cutils.c b/util/cutils.c
index c9b91e7535a..b4e4cda71c8 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -1057,3 +1057,36 @@ char *get_relocated_path(const char *dir)
     }
     return g_string_free(result, false);
 }
+
+static const char * const bundle_formats[] = {
+    "%s" G_DIR_SEPARATOR_S ".." G_DIR_SEPARATOR_S "%s",
+    "%s" G_DIR_SEPARATOR_S "qemu-bundle" G_DIR_SEPARATOR_S "%s"
+};
+
+char *find_bundle(const char *path)
+{
+    const char *dir = qemu_get_exec_dir();
+    char *candidate;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(bundle_formats); i++) {
+        candidate = g_strdup_printf(bundle_formats[i], dir, path);
+        if (access(candidate, R_OK) == 0) {
+            return candidate;
+        }
+        g_free(candidate);
+    }
+
+    return NULL;
+}
+
+void list_bundle_candidates(const char *path)
+{
+    const char *dir = qemu_get_exec_dir();
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(bundle_formats); i++) {
+        printf(bundle_formats[i], dir, path);
+        putc('\n', stdout);
+    }
+}
-- 
2.30.1 (Apple Git-130)


