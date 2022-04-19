Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11565064E2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:54:31 +0200 (CEST)
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghkt-0002Ll-2p
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmB-0001D3-3a
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm5-0004Sl-8j
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:43 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so758651wms.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LGTworkvhjNi4sRrBmXWX8Is+INO2oUvDU7KNrsBYxk=;
 b=pv3ayNRtdwobtHFMu40v5n2wGQMjtorWlOVw8+uyYY6KwimGdyln33k+N6DYDxU6MY
 F0KFLwVjmZFHppdGdsSM/F3JFQma2pM7+phtAkwKHmqJ4kwX15KZtgJVksDfeB+2mjnu
 JKlqAQi0jcbgtwzAi4Bc2yQYKkxjymvTFC5p50IQT27SEmjVnhMp6F4xMyP7/ALoztfH
 R7Ym1R1CsXMREfBxGpmlmFQ//BdSXtXlyu7jWgFj+CfSHmw4t7ZGNNhcMB9FNikpHmZc
 xqcLmGjEKtf8ZxNuQy6UcIqYpwM68XT3lfw9hgqZ3pZi/B+yV+gs5nahrbFpBboWAbTY
 41Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LGTworkvhjNi4sRrBmXWX8Is+INO2oUvDU7KNrsBYxk=;
 b=faF+GPBy8V46AojuriQOFKg6eyJNOGNb2CHzQJiQKtBhK9zHqnYDDS6NklByD6g+pu
 YH2RyJt8OxPp/EKvXVnhzSXF7JIGW5Exxt2XnWSowkDXQ1dpePXrzt8gaCF8PVGqUbzj
 1ktZNmYvXG4DIZ47vvVd3Isdf7/9A3cBpPAgEhG80Z4+UA/9RD2jfvI1KKqoaNw1QfKF
 C7TswfqtzOLMCThpsEL6xNXdHD2i4X5H9FXICD2zlHZUUEpLKVTYn86jwM0G91Q3hpKo
 w2iqHQ0A1cazv6u9S/keqaJ1vXZXm8hDh6e/i9/lyHZ7uNYG/6vkDlJ5g1OnHZXdttXQ
 yydw==
X-Gm-Message-State: AOAM530GxqL88Mmx46w++uP1rwaaFz9tv6r/I/HAIScwFUHeEbZqAmQ7
 DO77SAoJBSVYzy7CEIajNQyXx/+YK4r4ow==
X-Google-Smtp-Source: ABdhPJx0hmH11maMZ23XkRdWADyXd5HwJ0OyK/jEEnvd2S3doaIFaJuupvDISIqu3bRMhsJxk60X8A==
X-Received: by 2002:a1c:2942:0:b0:392:3aff:4fcd with SMTP id
 p63-20020a1c2942000000b003923aff4fcdmr14190457wmp.0.1650347498922; 
 Mon, 18 Apr 2022 22:51:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/53] Move fcntl_setfl() to oslib-posix
Date: Tue, 19 Apr 2022 07:50:50 +0200
Message-Id: <20220419055109.142788-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It is only implemented for POSIX anyway.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323155743.1585078-30-marcandre.lureau@redhat.com>
[Add braces around if statements. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/cutils.h     |  1 -
 include/sysemu/os-posix.h |  2 ++
 util/cutils.c             | 17 -----------------
 util/oslib-posix.c        | 15 +++++++++++++++
 4 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 2137e65260..e873bad366 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -131,7 +131,6 @@ const char *qemu_strchrnul(const char *s, int c);
 time_t mktimegm(struct tm *tm);
 int qemu_fdatasync(int fd);
 int qemu_msync(void *addr, size_t length, int fd);
-int fcntl_setfl(int fd, int flag);
 int qemu_parse_fd(const char *param);
 int qemu_strtoi(const char *nptr, const char **endptr, int base,
                 int *result);
diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 58de7c994d..adbe19d3e4 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -96,6 +96,8 @@ static inline void qemu_funlockfile(FILE *f)
     funlockfile(f);
 }
 
+int fcntl_setfl(int fd, int flag);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/cutils.c b/util/cutils.c
index 1173ce3b88..aaf2ced291 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -199,23 +199,6 @@ int qemu_msync(void *addr, size_t length, int fd)
 #endif /* CONFIG_POSIX */
 }
 
-#ifndef _WIN32
-/* Sets a specific flag */
-int fcntl_setfl(int fd, int flag)
-{
-    int flags;
-
-    flags = fcntl(fd, F_GETFL);
-    if (flags == -1)
-        return -errno;
-
-    if (fcntl(fd, F_SETFL, flags | flag) == -1)
-        return -errno;
-
-    return 0;
-}
-#endif
-
 static int64_t suffix_mul(char suffix, int64_t unit)
 {
     switch (qemu_toupper(suffix)) {
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 577c855612..a069dbff69 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -936,3 +936,18 @@ size_t qemu_get_host_physmem(void)
 #endif
     return 0;
 }
+
+/* Sets a specific flag */
+int fcntl_setfl(int fd, int flag)
+{
+    int flags;
+
+    flags = fcntl(fd, F_GETFL);
+    if (flags == -1) {
+        return -errno;
+    }
+    if (fcntl(fd, F_SETFL, flags | flag) == -1) {
+        return -errno;
+    }
+    return 0;
+}
-- 
2.35.1



