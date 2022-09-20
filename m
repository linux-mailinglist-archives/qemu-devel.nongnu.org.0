Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1155BE409
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:01:12 +0200 (CEST)
Received: from localhost ([::1]:51780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oab03-0004Jy-81
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYA-0000Uf-Cj
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:28 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaY8-0004m3-Ig
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:22 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r23so2126555pgr.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3EiKA0nKWgy4YlkPlu/AU3W7YI8ulagrX1lAIm9vhNc=;
 b=gNww3WAv7cFZKACCnc0dsWKP1r+HJ+JgTD0o9Amv/k81gjfWD/JqbqlrX6iEY5APu+
 4HUsW04wpq/Ojxe1cuqe37OszDwJ03gwQkBIY0Xk9Q6Fn/vZsEBw/BOULHudBm/Xay+o
 JTV0zt5tXivjKNlAceNaqR+upa5g8Mv3ARBhLLejMRyAFNMTDZkVvNIVMFH5Mat6V2wB
 +4HlyFuqvRlWrdz5Dqk8xR/IjyLHeQ9k8G7yTomXRy7T9HZEqPLpck+NAHXEQkikkXdq
 L/72tHq00ZVaRamFh7s8K8jATJkSnq1PsJD5rsI8gekFiDZ5U1JubiA7o1cPc1fwxisQ
 GIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3EiKA0nKWgy4YlkPlu/AU3W7YI8ulagrX1lAIm9vhNc=;
 b=7k0Z6Xg5qU1Jnee1r/tNi8/tcwempuszf5az4DAgCggQ9IttZ+pog5RC2MZynoWw4Q
 xH1Ve105ckQgoOLv5gh6zMGCLLyQYwUX8BfuHg9f/pfVVcBajZC/yFUf+n3/a91CCdbr
 qTVO0aWmnVlZUZ1Ii3N68qXUquHS67Lz7MtbhaIDmU5Vaa5t6AW00YliTswGIls1Q4Jl
 BrOXPJVf9P6GJfiQCEnk7MG4EzgS6IORPOiQcA9+MJ5P1wjoOfwwo9pNKMZdDWvUmOB9
 Rhuq67gfGSaMSkZiFsCpPhUJ6nn5M21o4SSdnLc77qh/+dT4hcssr0VNe3R433rVk8VH
 w2TA==
X-Gm-Message-State: ACrzQf3aNbBi0ohDXBLpSih0yJxfqAi9twmL1z4IR+lBwPbyDUdUyVca
 Ce6DZzwcqHUyLO2tQGnuD9kuy+F6gqg=
X-Google-Smtp-Source: AMsMyM6hn/K6+U43uthMFPq4hTrjXpk4OPzBnKNCGrlWAd0+8oziWtqtPIXaTE3eXu0tN5GdLtPdgQ==
X-Received: by 2002:a05:6a00:1d9b:b0:541:1894:d5db with SMTP id
 z27-20020a056a001d9b00b005411894d5dbmr23231779pfw.78.1663669939014; 
 Tue, 20 Sep 2022 03:32:19 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 02/39] tests/qtest: i440fx-test: Rewrite create_blob_file()
 to be portable
Date: Tue, 20 Sep 2022 18:31:22 +0800
Message-Id: <20220920103159.1865256-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
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

Previously request_{bios, pflash} cases were skipped on win32, mainly
due to create_blob_file() calling mmap() which does not exist on win32.
This rewirtes create_blob_file() to be portable, so that we can enable
these cases on Windows.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- new patch: "tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable"

 tests/qtest/i440fx-test.c | 53 +++++++++++----------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
index 3890f1237c..202bc6022c 100644
--- a/tests/qtest/i440fx-test.c
+++ b/tests/qtest/i440fx-test.c
@@ -278,8 +278,6 @@ static void test_i440fx_pam(gconstpointer opaque)
     qtest_end();
 }
 
-#ifndef _WIN32
-
 #define BLOB_SIZE ((size_t)65536)
 #define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))
 
@@ -290,44 +288,25 @@ static void test_i440fx_pam(gconstpointer opaque)
  */
 static char *create_blob_file(void)
 {
-    int ret, fd;
+    int i, fd;
     char *pathname;
-    GError *error = NULL;
+    GError *error;
+    g_autofree uint8_t *buf = g_malloc(BLOB_SIZE);
 
-    ret = -1;
+    error = NULL;
     fd = g_file_open_tmp("blob_XXXXXX", &pathname, &error);
-    if (fd == -1) {
-        fprintf(stderr, "unable to create blob file: %s\n", error->message);
-        g_error_free(error);
-    } else {
-        if (ftruncate(fd, BLOB_SIZE) == -1) {
-            fprintf(stderr, "ftruncate(\"%s\", %zu): %s\n", pathname,
-                    BLOB_SIZE, strerror(errno));
-        } else {
-            void *buf;
-
-            buf = mmap(NULL, BLOB_SIZE, PROT_WRITE, MAP_SHARED, fd, 0);
-            if (buf == MAP_FAILED) {
-                fprintf(stderr, "mmap(\"%s\", %zu): %s\n", pathname, BLOB_SIZE,
-                        strerror(errno));
-            } else {
-                size_t i;
-
-                for (i = 0; i < BLOB_SIZE; ++i) {
-                    ((uint8_t *)buf)[i] = i;
-                }
-                munmap(buf, BLOB_SIZE);
-                ret = 0;
-            }
-        }
-        close(fd);
-        if (ret == -1) {
-            unlink(pathname);
-            g_free(pathname);
-        }
+    g_assert_no_error(error);
+    close(fd);
+
+    for (i = 0; i < BLOB_SIZE; i++) {
+        buf[i] = i;
     }
 
-    return ret == -1 ? NULL : pathname;
+    error = NULL;
+    g_file_set_contents(pathname, (char *)buf, BLOB_SIZE, &error);
+    g_assert_no_error(error);
+
+    return pathname;
 }
 
 static void test_i440fx_firmware(FirmwareTestFixture *fixture,
@@ -398,8 +377,6 @@ static void request_pflash(FirmwareTestFixture *fixture,
     fixture->is_bios = false;
 }
 
-#endif /* _WIN32 */
-
 int main(int argc, char **argv)
 {
     TestData data;
@@ -410,10 +387,8 @@ int main(int argc, char **argv)
 
     qtest_add_data_func("i440fx/defaults", &data, test_i440fx_defaults);
     qtest_add_data_func("i440fx/pam", &data, test_i440fx_pam);
-#ifndef _WIN32
     add_firmware_test("i440fx/firmware/bios", request_bios);
     add_firmware_test("i440fx/firmware/pflash", request_pflash);
-#endif
 
     return g_test_run();
 }
-- 
2.34.1


