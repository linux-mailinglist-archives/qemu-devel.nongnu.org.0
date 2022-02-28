Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A472A4C607B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 01:59:11 +0100 (CET)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOUNa-0006v2-Ow
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 19:59:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUM0-00051C-1r
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:32 -0500
Received: from [2607:f8b0:4864:20::52f] (port=34561
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOULy-0004cb-LT
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:31 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 139so10066729pge.1
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 16:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E4JpDBscu6i2X5FGSRsHLHRQJcgwmq4SRaqL2cxC2ak=;
 b=Az1y9P3PeUKe1Sr1Ue7uu2BucYPN3bCOTIsFxs/trep6RI8bRjAquxxH1xSwgLmXX7
 xyv4XYlx6o4gULNbo9Vkg72L1aWPBwulIMsqTGlnrAy4NDbWA4sSNb/PaK2oxW2fn7/r
 2dO7sRIa8cmiF3L5eBqYisV2THD/sss4UzogfHE+EBmTapQI9RzDkfl7WFHJM8YceyBD
 92BWabtI7Pj272MjesdfxjImNQFId3A+/PdePabmkLCzLZJf9RVz3fwINzqkDSIHaRnv
 WShRzACNEMFQ3Zou6r7Uu5tuz2DltBcVDGNw1FPqHtrElyJrP07DNjoaPrCp7hoEvVVG
 ggKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E4JpDBscu6i2X5FGSRsHLHRQJcgwmq4SRaqL2cxC2ak=;
 b=MKS8rfsOYoniWZ9ob5jkHlw6Gqu+MAaSrgk+s5UxLY3TH3Q+Hi4DtjpH5dhjbAjfL2
 ENzUtqTHBst4x9gDm+hKgDQo6kNo+8HxL5kL/aWJhu18n++5ET0ykjmAFdLp3eJ30ZQU
 hjN2B7ZKmLW6nH96FUgD2/vZaxPTL7aTh3NOm5N94K8jqwJkyn52Dh9qrAwfiJPDyPXo
 XXwrRgxPnQoeYAkzqlhPWY5jPzVITh4vGDKEjY+YLAo6NswJdOWw5FBo4iWgNge4Ip1l
 U2tze5XdKkjr6dvmxZzJYo9tC4orGdD+cXGCvyBU90uGwSToj2+LMDkA9hUHT1/Geppl
 Yw9Q==
X-Gm-Message-State: AOAM5302cfhVNnDCCXrb0hfQjt5gDoM+tkyW63k9104TgBPWw45whcLA
 8qOKhszWhqHvPg9ui7SXfZBVMC/TCGk=
X-Google-Smtp-Source: ABdhPJwsD/yScuz17u8KlZ3Xc2ada+5XekYNbNmUVrBYIwptDUCEBz5jOXFlbrT+gnJyM81hX9pn0A==
X-Received: by 2002:a65:6a08:0:b0:374:4256:9ed8 with SMTP id
 m8-20020a656a08000000b0037442569ed8mr15331998pgu.79.1646009849260; 
 Sun, 27 Feb 2022 16:57:29 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:6839:3c6:46aa:5d85])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a056a00130100b004df82ad0498sm10634610pfu.82.2022.02.27.16.57.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 27 Feb 2022 16:57:29 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 1/4] cutils: Introduce bundle mechanism
Date: Mon, 28 Feb 2022 09:57:06 +0900
Message-Id: <20220228005710.10442-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220228005710.10442-1-akihiko.odaki@gmail.com>
References: <20220228005710.10442-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52f.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

It is a general mechanism and can find any files located relative
to the installation tree. The build tree must have a new directory,
qemu-bundle, to represent what files the installation tree would
have for reference by the executables.

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


