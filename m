Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4FF59F83F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:59:01 +0200 (CEST)
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQo68-0000Yy-FQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuh-0004NX-2R; Wed, 24 Aug 2022 05:43:07 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmud-0001f8-Pr; Wed, 24 Aug 2022 05:43:05 -0400
Received: by mail-pl1-x632.google.com with SMTP id x23so15191752pll.7;
 Wed, 24 Aug 2022 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/VLZ6dLEwhi2chftBh37GSy19Wuab6YAYmjufo6q520=;
 b=VLCeVfQ0VlrSUdv/RbrmfZbWOD/r6Nj51yvPcKqsi2UruZ2hwydXU/z8gByVOX6EHA
 A4tnnOP1BnTubE5yyNy8Fx+SsOBFpQT4LzhVv0RCqP85oWcYV6vKjTFmaVlNKDmdr98j
 UQx10XLhTsSn/BkUtxolKgFxuLfcTym4mxuFOnDEaeoTLk6f4tWGY+OB+vtczzCU5suh
 lfVZMbvg42/BLgLie+pEmgHWnpMiRjeht7FMxutQ7geJQgTEZd2Vr65z0KWhJfQSo4Fy
 dt88w2jlb+jgTaxr/o7Y9kBXV2vGy4rXp2G7Ph0CniiLMXbspdfwncc7IcJUUZLBZCu0
 J0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/VLZ6dLEwhi2chftBh37GSy19Wuab6YAYmjufo6q520=;
 b=T2eU6c0nVH/ZlHqEPpmw3fJoWU8kmfDA0XfRvNKzywAuL0NiQ7s/QstDGuBQ0cP06w
 uP/JPKhCYhSd0PnQ7OTDfIW/rJx1GcBEWCIUAqjiWOCLzP1bNLD5o3nvBbKBmlQBWD6E
 ZMXX/TwG4zPdlH6q7zw9CoavAWayfbVBpYaH3lyKmKTUG9OR9c2uAol+xDi5xJEGLFtW
 XC0oolqNEoKNIw5P5CVFE6OCO6HN9UUcJiXyuovnVnbPylhCLIN+GWhvztu99godEdYH
 Y6hLuvh+DAlScO/OcDSJH+3E3wPode7JgsnuEqJkRvLLIOff3RjGpx67Pmp88Y505+kU
 Mtbw==
X-Gm-Message-State: ACgBeo1efpU98k1HNGzM6vWErfzAHz2uk0SkH7BvcYLlJcLhKZs9hkBI
 XaKJ47UeiLSMI+XeyBrP9VKJxWQrXx8=
X-Google-Smtp-Source: AA6agR4Yh9tytQwZIx+V6LzE1S5IiFITxtOROjx6UWm1XchsDbdFiQlfjC6vDYybCOxDcw3N8IJv9Q==
X-Received: by 2002:a17:902:7783:b0:173:11e6:a580 with SMTP id
 o3-20020a170902778300b0017311e6a580mr3219028pll.10.1661334181357; 
 Wed, 24 Aug 2022 02:43:01 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:00 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 33/51] tests/qtest: {ahci,
 ide}-test: Use relative path for temporary files
Date: Wed, 24 Aug 2022 17:40:11 +0800
Message-Id: <20220824094029.1634519-34-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x632.google.com
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

From: Bin Meng <bin.meng@windriver.com>

These test cases uses "blkdebug:path/to/config:path/to/image" for
testing. On Windows, absolute file paths contain the delimiter ':'
which causes the blkdebug filename parser fail to parse filenames.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/ahci-test.c | 19 ++++++++++++++++---
 tests/qtest/ide-test.c  | 18 ++++++++++++++++--
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 0e88cd0eef..bce9ff770c 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1848,7 +1848,7 @@ static void create_ahci_io_test(enum IOMode type, enum AddrMode addr,
 
 int main(int argc, char **argv)
 {
-    const char *arch;
+    const char *arch, *base;
     int ret;
     int fd;
     int c;
@@ -1886,8 +1886,21 @@ int main(int argc, char **argv)
         return 0;
     }
 
+    /*
+     * "base" stores the starting point where we create temporary files.
+     *
+     * On Windows, this is set to the relative path of current working
+     * directory, because the absolute path causes the blkdebug filename
+     * parser fail to parse "blkdebug:path/to/config:path/to/image".
+     */
+#ifndef _WIN32
+    base = g_get_tmp_dir();
+#else
+    base = ".";
+#endif
+
     /* Create a temporary image */
-    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
+    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
     fd = mkstemp(tmp_path);
     g_assert(fd >= 0);
     if (have_qemu_img()) {
@@ -1905,7 +1918,7 @@ int main(int argc, char **argv)
     close(fd);
 
     /* Create temporary blkdebug instructions */
-    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", g_get_tmp_dir());
+    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
     fd = mkstemp(debug_path);
     g_assert(fd >= 0);
     close(fd);
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index ebbf8e0126..c5cad6c0be 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -1011,17 +1011,31 @@ static void test_cdrom_dma(void)
 
 int main(int argc, char **argv)
 {
+    const char *base;
     int fd;
     int ret;
 
+    /*
+     * "base" stores the starting point where we create temporary files.
+     *
+     * On Windows, this is set to the relative path of current working
+     * directory, because the absolute path causes the blkdebug filename
+     * parser fail to parse "blkdebug:path/to/config:path/to/image".
+     */
+#ifndef _WIN32
+    base = g_get_tmp_dir();
+#else
+    base = ".";
+#endif
+
     /* Create temporary blkdebug instructions */
-    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", g_get_tmp_dir());
+    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
     fd = mkstemp(debug_path);
     g_assert(fd >= 0);
     close(fd);
 
     /* Create a temporary raw image */
-    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
+    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
     fd = mkstemp(tmp_path);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
-- 
2.34.1


