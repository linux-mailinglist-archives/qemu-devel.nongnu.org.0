Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AC35EC113
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:21:49 +0200 (CEST)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8eq-0000tQ-UC
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QO-0002Gh-1y
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:06:52 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QM-0004mO-8H
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:06:51 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w10so8742018pll.11
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oneS/5NhgJGKLAYvnqqmGUrPQyryOhpOkHe8cX+R0Kc=;
 b=L/56Bt+JX9X0Ne8ftKzKqy51aMdWdq9uLz1c6x7Mk871a7uObql/hnJMFC+5F8tgwF
 cd0NwS1EhN0q3FogVu0yVlXCXbTg3m7NrKW2Bq1RmSncXQoH1B19wV9qNliT88zLo7Ae
 E1AxijGZXLUDndQR3VuO35bdKPXrEUQDgigERi48PpMsQqiigHSioqxg8H4cyCCm7mj7
 uIUgDRJKXD0vsedtfnR3BsuShEZgj9fwFB969vYkghl7xTjG5l/kIubNC30g9EMpLCPD
 GTNZQPFl0ikQIkEE6aL9ptWBvmjrO77FBWl6/YcN1JyzV0Rpt92nkO/iEbFSYawu5xst
 k6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oneS/5NhgJGKLAYvnqqmGUrPQyryOhpOkHe8cX+R0Kc=;
 b=kJD5HhQkINiMEJSd5qXM5tnCY5KXmjWLylZri60G9OOPEdT99x8oAy3un0a13u5h9I
 YWb99GZ5rcwAT+rHkWDiWl+Kp2LeecOzuCvavnzkP4vCbwTdWOoQiCD1+ub8rCGtoJkZ
 CLQR3Q5EqzSgqyV3FVgXoL3VROc5Zo+z+17rXw5cQqCk/5pP66ud7KosP9WZM0dvjV72
 ZxVgrNd3rBTwboiBrUc04r61yVWNexVmgEJdrGADP6ivORj5/SSqEfuI/mL0y6+4pifS
 HYuAtKH66z2tDfjfu7HIx65sa7VeImiPHRDnCDgr9OvrHgC6wV3EQPYfjJJjGNgJve6b
 nXng==
X-Gm-Message-State: ACrzQf3IwtipL5eXadU0xy+aIpkrU+Gis8e2hlZ79zoBfNke5EaFYtcv
 O5w8UrWjjOUT7kwRNuXC1rTySNUSTxk=
X-Google-Smtp-Source: AMsMyM4YhPwvB/lQqL0TSDlTnsWywhHcI/HguAOqgcIkAmjOee0Ea57UxnGjKJnEeRVD0n455LYZVg==
X-Received: by 2002:a17:90b:38cb:b0:203:100:bb53 with SMTP id
 nn11-20020a17090b38cb00b002030100bb53mr4003138pjb.107.1664276806560; 
 Tue, 27 Sep 2022 04:06:46 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:06:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 01/54] tests/qtest: i440fx-test: Rewrite create_blob_file()
 to be portable
Date: Tue, 27 Sep 2022 19:05:39 +0800
Message-Id: <20220927110632.1973965-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v3)

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


