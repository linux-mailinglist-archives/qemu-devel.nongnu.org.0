Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1D4C55EE
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 13:53:42 +0100 (CET)
Received: from localhost ([::1]:32982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNwZw-0002td-Gw
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 07:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSM-0001Pa-SW
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:45:50 -0500
Received: from [2607:f8b0:4864:20::1034] (port=39581
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSK-0003KN-IT
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:45:50 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso10754175pju.4
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 04:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2TxLC9fYa4dsSXt2w85XmJ89x3QqEVRdv+e2nZt/7lg=;
 b=olesjjnq4KZlzXPtT9YV486okFXbJ0rqGS2v1SlFea6rrOQQ/OrUbOewPZM8Eo8inY
 Yt38iEjxGBwbGZ1Pc+dFJ5F6lO0fEHqcwevL2qsKeazsV3xnT0jAFQLuX1QXO0p2C7cu
 V+W+UERDX5xpcCjfu4u3Yc1Mdl75m9ijE/ci3UXQqCFcvUQkgtQub2plVNRcvzFvbMTc
 wYuFQ6CYla5ex0kr6Y5AsC9Y+lG1LuWdUNhgZOBBL6QGZaOP3suLqhDToVWcb8SnVbDA
 yqe6MM6eu9SUe/D3tALj+yfdih0mRENyRpxxlGQ1yEZvqbwQRRflD6f+hfyuyejPnP32
 F6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2TxLC9fYa4dsSXt2w85XmJ89x3QqEVRdv+e2nZt/7lg=;
 b=LjwOl1CvFE6kzLQdki3fVC7oZsj7mBcIsM9fKgF65uI3uyZ3zvCmVc9naFYhzuVa2Q
 ocAQLMwUOQVOPzILXSpgGhjdW61Na/PJ2KhH3A5hsT3ecxG5MXRw1OyZTk1qcp5K056m
 UtH0wst5B6WgOQ4wnDqvEHqdWbXCoWuVtdTJnxhWkH4+FazGVjzz4xvVJuD8cCSRlLH/
 6ilfKNDGBUrGSE+7BUpR/Mb9WLQKAqyW25DbSxAybWDuDBPjCpHiu52WD8a+hltPmROJ
 POD89vJBPAvGZKV2QauLzdN3t7wh+ZxXCiYERJ/BpSumIZOKr7paQBK5iuATPN3kBZG/
 QjAg==
X-Gm-Message-State: AOAM531Ir8H7syD1sznuwvWyn9ooqlDmSC3S8YfNRiLu3z2eRNJCbFhk
 W2CqK6hXv9VhXNyz0eeYGhAyt4nokQY=
X-Google-Smtp-Source: ABdhPJwtExKSg7KSKyVetcc9qanIXCKb/54ATwpcP90OF/lzAVNZg9eyMt6KgHaKKzZLQS//IyINNw==
X-Received: by 2002:a17:902:d4c6:b0:150:15ed:3cd9 with SMTP id
 o6-20020a170902d4c600b0015015ed3cd9mr11358404plg.2.1645879547009; 
 Sat, 26 Feb 2022 04:45:47 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a17090a438400b001bc6d52de70sm11725653pjg.24.2022.02.26.04.45.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 04:45:46 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 1/4] cutils: Introduce bundle mechanism
Date: Sat, 26 Feb 2022 21:45:32 +0900
Message-Id: <20220226124535.76885-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226124535.76885-1-akihiko.odaki@gmail.com>
References: <20220226124535.76885-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index 320543950c4..98ff59e38e3 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -209,6 +209,25 @@ int qemu_pstrcmp0(const char **str1, const char **str2);
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
 static inline const char *yes_no(bool b)
 {
      return b ? "yes" : "no";
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
2.32.0 (Apple Git-132)


