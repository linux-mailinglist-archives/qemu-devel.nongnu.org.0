Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDA5E92C7
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:42:59 +0200 (CEST)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQ2E-00045y-NN
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqT-0002WO-GM
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:30:51 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqR-0006I4-Tq
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:30:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id y11so3941998pjv.4
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xnFrQK3bS6jDORxTN0ClsvhvIgU1UaPy49FL95nw1To=;
 b=NlTohaiu4KpwH5DQ2va1OLthEox0Gh4UO96l3qE1Jn0q69y2eP4lTwnsuYJj81hWeh
 M7HVzpczovnQwtjBQsK98upw0pR7kdpxh6rA3kMcJdaa/+fZlwQfJG5qWwlHJ+k7DyMk
 On0eo7wJg1hZ2Nh/C1PUrFE6lDjuv+1rLjkzXI7BQI9Dao42nlXlEeAit3Tzsmp2ouwj
 v0UhMPzk2qg/pexxTpTdoP2SJe1gQuQ1fHnITMVpe7D3KtHXo6MDluJ8SOpdD1qbRDEQ
 7K1yy9LQZUePVg0lgQ1ciUN0jA0IZKa4U4zNFUqHfhHGLuoRSOjGdYkYlGcNHi1zvkm+
 PCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xnFrQK3bS6jDORxTN0ClsvhvIgU1UaPy49FL95nw1To=;
 b=pt2+BYZgw+BdTI1xyaZMuaMNABON7jswMDKJS3b0T4I/D4l5QQNOHws5kR7Zsb9t/r
 z2k/KHIeygJiYBaFoH4fQzx3oLgLWic2VpTWUeHmFwC4aukYV5cfuDDXBox/BvyqhEgq
 tcWsb/peZs6frtHkhzZuAilzbLN443d3LhxbknoVfjBeArbNB2Ouucga04Mu0TJ1jPuy
 L3hVt1n1z6+VUkAYDBfkaIvndItxsN61Ibn0s7oHDTjPh1GfkAym+EOJOlm94UP2Xmh1
 M0ciCh2B9XtWDHrXTIqmBpcSWczIuZMDZhnMDUYp2V6xD93JZSRwbqevSZUIA/9LmddW
 MiaA==
X-Gm-Message-State: ACrzQf0n3KRMvXs7IeMY8kTtjEAon3jxY8Gw2tLNeangT0Vg6JwBjklh
 53L6X2FXKhSAAWknDDwQ8G/MZ2Wb14w=
X-Google-Smtp-Source: AMsMyM6/RkDI8C39fTx6tEtkLthGeN554FEQLBzyHLSo1lfiyKfmy+v8litX/i0jqihvae9XNT1JUQ==
X-Received: by 2002:a17:90b:180a:b0:202:ae1f:328a with SMTP id
 lw10-20020a17090b180a00b00202ae1f328amr31603392pjb.78.1664105446371; 
 Sun, 25 Sep 2022 04:30:46 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:30:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 01/54] tests/qtest: i440fx-test: Rewrite create_blob_file()
 to be portable
Date: Sun, 25 Sep 2022 19:29:39 +0800
Message-Id: <20220925113032.1949844-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
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

Changes in v3:
- Remove unnecessary "error = NULL" statements

Changes in v2:
- new patch: "tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable"

 tests/qtest/i440fx-test.c | 54 ++++++++++-----------------------------
 1 file changed, 14 insertions(+), 40 deletions(-)

diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
index 3890f1237c..795fd85343 100644
--- a/tests/qtest/i440fx-test.c
+++ b/tests/qtest/i440fx-test.c
@@ -278,56 +278,34 @@ static void test_i440fx_pam(gconstpointer opaque)
     qtest_end();
 }
 
-#ifndef _WIN32
-
 #define BLOB_SIZE ((size_t)65536)
 #define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))
 
-/* Create a blob file, and return its absolute pathname as a dynamically
+/*
+ * Create a blob file, and return its absolute pathname as a dynamically
  * allocated string.
  * The file is closed before the function returns.
- * In case of error, NULL is returned. The function prints the error message.
+ * In case of error, the function aborts and prints the error message.
  */
 static char *create_blob_file(void)
 {
-    int ret, fd;
+    int i, fd;
     char *pathname;
     GError *error = NULL;
+    g_autofree uint8_t *buf = g_malloc(BLOB_SIZE);
 
-    ret = -1;
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
+    g_file_set_contents(pathname, (char *)buf, BLOB_SIZE, &error);
+    g_assert_no_error(error);
+
+    return pathname;
 }
 
 static void test_i440fx_firmware(FirmwareTestFixture *fixture,
@@ -398,8 +376,6 @@ static void request_pflash(FirmwareTestFixture *fixture,
     fixture->is_bios = false;
 }
 
-#endif /* _WIN32 */
-
 int main(int argc, char **argv)
 {
     TestData data;
@@ -410,10 +386,8 @@ int main(int argc, char **argv)
 
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


