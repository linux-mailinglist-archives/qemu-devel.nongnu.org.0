Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A705BE523
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:02:24 +0200 (CEST)
Received: from localhost ([::1]:38828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabxH-0003Qk-I0
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYw-0001Fc-UB; Tue, 20 Sep 2022 06:33:14 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYv-0004td-Az; Tue, 20 Sep 2022 06:33:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id f23so1913371plr.6;
 Tue, 20 Sep 2022 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jtL1ld++/OCzVIJFT5yXHbwI8YvWyRv4L77Tp9zf/fk=;
 b=DZJqdhk2/vkAabipbG1uAo4xyZ6BxFx01vgh9Tx5/6ascDRXRiEpULaTUGQQW44wa4
 rXa1wwwmaIYZAUwz13HuTrK6gR8oI8oQR91M8vKX3v5suUikAjYY1Tr5Qs/cgoSjMrs9
 cWY8f2Ts/WUlQcSJvUO3QuzEfa26nf7U0kPkO/WZCokRokLqAFU/eZ8M37oC7Aai6KYP
 q6DdBhSuqHwfiuY9VFyrptHkAh7uJNWZ/A7pdKR1OCu4Sq4jVlNZpraWrCrq0jbCZMgA
 aVeqS0IpGpjTzgwtnijrZhaV5VY0H5YUZasHYoSmTqHZmtlhpYOHgqAoKZFMdVHZhAWD
 rBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jtL1ld++/OCzVIJFT5yXHbwI8YvWyRv4L77Tp9zf/fk=;
 b=UYmTb25YN50XHqH1IxNeLaOpQqWFh9qlCwMeLXmARjmoeDR3IDk5NEazQO293adAjV
 qJ5u/WskvMOlDenMY5sOZeKoUH9N3YRxNXp2NY02+iB1JgubqOfZm8sLRX5u3AzxH8Yk
 djBJfERcqXvHgCEMg1gI2YUJbVZ82Tv8YqHo4YaL9YKPv3CIOWXaKwDCd/6TXhG9dZG6
 2CkKTRpVqoZFI33fSGehQSB//fQ6KVaKQAquNXloojCnmrVsy35B4x2QA2/PtPI4a65q
 Ft9uucvw6ryjv1uB+FB4f+wqAU3yD3ScJTdGgF6lak7NysUGBQTuVU/5Jv6Zn/QzFp2z
 HdjQ==
X-Gm-Message-State: ACrzQf1pJKiWX+1C1+F5653EqBmuCWE1uZIrR7ahkuUUUk7hzw6bpbuj
 buAw3f09/aIL/LmNglFuybTkAY/FH7I=
X-Google-Smtp-Source: AMsMyM5NIvKu94KAxcTzy3EWsvZ8C/wOaspT0bpoQ8hHV9aEC5W/zCr3OFmRSEJccWBhxjp2b74P/A==
X-Received: by 2002:a17:90a:8688:b0:202:91d7:6a53 with SMTP id
 p8-20020a17090a868800b0020291d76a53mr3187724pjn.153.1663669987724; 
 Tue, 20 Sep 2022 03:33:07 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v2 20/39] tests/qtest: {ahci,
 ide}-test: Use relative path for temporary files for win32
Date: Tue, 20 Sep 2022 18:31:40 +0800
Message-Id: <20220920103159.1865256-21-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

(no changes since v1)

 tests/qtest/ahci-test.c | 21 ++++++++++++++++++---
 tests/qtest/ide-test.c  | 20 ++++++++++++++++++--
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 00524f14c6..c57576b08c 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1833,7 +1833,7 @@ static void create_ahci_io_test(enum IOMode type, enum AddrMode addr,
 
 int main(int argc, char **argv)
 {
-    const char *arch;
+    const char *arch, *base;
     int ret;
     int fd;
     int c;
@@ -1871,8 +1871,22 @@ int main(int argc, char **argv)
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
-    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
+    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
+    fd = g_mkstemp(tmp_path);
     g_assert(fd >= 0);
     if (have_qemu_img()) {
         imgfmt = "qcow2";
@@ -1889,7 +1903,8 @@ int main(int argc, char **argv)
     close(fd);
 
     /* Create temporary blkdebug instructions */
-    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
+    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
+    fd = g_mkstemp(debug_path);
     g_assert(fd >= 0);
     close(fd);
 
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 25302be6dc..5e3e28aea2 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -1011,16 +1011,32 @@ static void test_cdrom_dma(void)
 
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
-    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
+    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
+    fd = g_mkstemp(debug_path);
     g_assert(fd >= 0);
     close(fd);
 
     /* Create a temporary raw image */
-    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
+    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
+    fd = g_mkstemp(tmp_path);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
-- 
2.34.1


