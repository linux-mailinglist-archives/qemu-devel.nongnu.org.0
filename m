Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C22754BC86
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:10:34 +0200 (CEST)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Do0-0007p5-Tu
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Dla-0005IX-Ds
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:02 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1DlY-0007kb-Ud
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:02 -0400
Received: by mail-pl1-x632.google.com with SMTP id d13so8737083plh.13
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 14:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0JDPtmJtIBq1IHFDsbna1CTcRo1CbVD+DG/jmYsEX1A=;
 b=EA0godP1b4Tm08b37VG0elunUpOGXYeqzFI84sua/vNBTI8pNVn0jU5KcLeirugqMZ
 dabvjAyXd1i764vQABiINsNFTOLBXjo1+pSlueBi+wwvtjv+egOKlA6AAKM6ADheZv1h
 NwCaPJQJmMqmMcDRduSByC0ArZxVmRmb4v3ghrJuHIY1NIWr3Te70DSC6CUffAeN16f5
 SYhjLtg4W6KRMNxRvqhjc7ajYcJCZOptZMWLZPJ2NAzTcBSCgw3yqfqzJiVYh+fmfEw3
 hBLpmWBIrzwsJmejMm2W7GHOqfqaCL0gJhVV6dorpLILn9nLiNUIFzsasWblKtOvrTmb
 rxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0JDPtmJtIBq1IHFDsbna1CTcRo1CbVD+DG/jmYsEX1A=;
 b=gU0Tk/UBq9wzJ5lTATTYwkhMdD71+7SFVLB+Z3NWxQVWsSnqnLJUtsSHo2hHQyen0/
 WN30OgysqM7j6kmqWPb8xQb24Px5bKNvuhwaHxY8ojK4fbDcaRELT44AgchJGWlInq2o
 crQsahZWhS09JAG5jqmoTFMX2hyhHMj8xrxEY0yCEuXzh5slK7Il6aiD4ck+tfUL0prh
 Has63MxL/7M5TL52YM8gcaBVHcDfZvQQu3QXhzyP9a3cDLVhDyAHFN6ndLiPpgjth3ps
 UnI8f3h+mSp0Dfj08Vi+K1jAGalT8Ah5UwcaPvWxCneNn6sy+qVl8NEocwRooVY/CqtD
 9KyQ==
X-Gm-Message-State: AJIora8YTb9/FF1MjKUEa5c6JY/J/UGZ+mahX6e/DcOKEoLmIW+ezHOH
 drYUGAPgHIyaCCAb2RamwcI=
X-Google-Smtp-Source: AGRyM1sXilXxho3kVmcDLIVph5xvX+Vi8Wob6AEkZTN8IZg6x/rtaQQ0MY78fj1svrHhDSe6+1SFEQ==
X-Received: by 2002:a17:90a:a002:b0:1e8:6ea3:849c with SMTP id
 q2-20020a17090aa00200b001e86ea3849cmr6408363pjp.179.1655240879670; 
 Tue, 14 Jun 2022 14:07:59 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d5aa:1806:cce3:7773])
 by smtp.gmail.com with ESMTPSA id
 h65-20020a62de44000000b0050dc762813csm8129456pfg.22.2022.06.14.14.07.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Jun 2022 14:07:59 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v4 1/4] cutils: Introduce bundle mechanism
Date: Wed, 15 Jun 2022 06:07:43 +0900
Message-Id: <20220614210746.78911-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220614210746.78911-1-akihiko.odaki@gmail.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index 40e10e19a7e..3b66026cd3c 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -213,6 +213,25 @@ const char *qemu_get_exec_dir(void);
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
index a58bcfd80e7..fe3bbb1c4eb 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -1086,3 +1086,36 @@ char *get_relocated_path(const char *dir)
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
2.32.1 (Apple Git-133)


