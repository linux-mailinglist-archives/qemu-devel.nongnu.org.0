Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3455EC2CF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:36:08 +0200 (CEST)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9ol-00028w-Di
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rr-0003Hs-WA; Tue, 27 Sep 2022 07:08:27 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rq-0005G9-CD; Tue, 27 Sep 2022 07:08:23 -0400
Received: by mail-pl1-x635.google.com with SMTP id t3so8781945ply.2;
 Tue, 27 Sep 2022 04:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WQDx+cZ1kDn23arphhz0GuuPrk4Ga5SEGuDsuw5J2h4=;
 b=UXHtywOYYf7/ugDY4VALfR8gFQlMM3YBXgFy2c6G4FeXqHdSQgvOYuhuRq6nzQw5s9
 U/eoifiKySWFDGhuTAXkMuYWrtKV/7xc7G+jzJ11OVqIPVG5VTuGpENDDQnupDG36BTC
 DieFa7HXb7hYSclZcI/oKrBMGuWTOpXR7vscqaJkiu8FvBeg/BD48Xv/U4rZu14ztp6g
 ymk8hhqbVyXDx8kKYUvvTO15CeKeOnMUV0WKL81+ldcjjGg/gYx9uGfyDNiklOiwTgCr
 51nxkmfqwjoVbfiPJOiIlcIH1TBQTMsgks+1G+tqWJxERjSd6JqqhQXjXE+NFtxYBfna
 2XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WQDx+cZ1kDn23arphhz0GuuPrk4Ga5SEGuDsuw5J2h4=;
 b=C/E/GsX1kxgeqca9oUFigGLureCfa85Yjo0yU6unctNUD8kkIi/ljKtmsHqSyHz14I
 /+zJzVys2/8H3bqtGeVgBfc20P6vviOxt1kRTePxbyxagX3OwieD0Ey8zowuuPeK4kAi
 7dxce08+WSg9mUwyo7/553p3QOSf+YJnO9eKhVhfj49580XqC2zxGbCpxDANjctTeey1
 DaI4TjlwdVhCBrc6zjle/nUIIo173m715kE2Fk4X4i5O0i0V8hChhlujhB8/ZsBvsiBO
 GTfdnddxv9qWmm2wLDT501uH9gC/wBTVS84PuU3lIO5bd06fm4zFgav+6XIDDnSsKd86
 smQQ==
X-Gm-Message-State: ACrzQf1eMLpR+Z2iFRsrOXCEajYEO07SHpHNGlSs5cYcZZ9FUD+t4tbk
 bex7NRiFlxdlkH6JWTXZJPZqK17uMz8=
X-Google-Smtp-Source: AMsMyM7Ds0R55xlAo3BUwsBUkGtms6VFpIEejI5d90Rlh/dp/GwLBXjSWgbdup8Xzkv7UTM64CkJRA==
X-Received: by 2002:a17:90b:1e02:b0:203:21f3:f233 with SMTP id
 pg2-20020a17090b1e0200b0020321f3f233mr3918411pjb.189.1664276900579; 
 Tue, 27 Sep 2022 04:08:20 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:20 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v4 37/54] tests/qtest: {ahci,
 ide}-test: Use relative path for temporary files for win32
Date: Tue, 27 Sep 2022 19:06:15 +0800
Message-Id: <20220927110632.1973965-38-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v1)

 tests/qtest/ahci-test.c | 21 ++++++++++++++++++---
 tests/qtest/ide-test.c  | 20 ++++++++++++++++++--
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 1d5929d8c3..66652fed04 100644
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


