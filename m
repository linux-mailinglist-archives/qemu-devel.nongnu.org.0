Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABDF5E92E3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:59:14 +0200 (CEST)
Received: from localhost ([::1]:42326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQHx-0002Lb-AJ
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrD-0002ia-Tv
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:36 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPr3-0006KO-RT
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:28 -0400
Received: by mail-pg1-x531.google.com with SMTP id t190so4208012pgd.9
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wj7NFE4UEqf1bXdPeQ070iFkhBShBJOjWt5P85H+XeI=;
 b=G9koeUdrjJZrYH2/Ca1dkiSWRbpTJqAwlZb30pYM6dopeGaOMDCUEPs124Ui/H6ii4
 L+Q2YWqhlUOUtlTdtd+apOOzeFgmPU+irSPwCVINPPj9wv8t27yKHeYh+b/HptVt7s9T
 9vEwaCjYaEy51JNpOyWZx/+2dQkBfMbAAlyTRc0FxTVThrx+jEVhu2D9bwZTbJzh8zSj
 2FAmeorrbeUAe1fsM59Wz6t91JQ0fhjPAbjz0OWJW/RGdPPsqHgeKrYruISWJ2q9Lngm
 +l/Iz7jCgmc/mgC3qWQwwEuwFTCAsSsHGa5Qe7088U2BgF/46oSWgvIu79IdNtpbOpQi
 CVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wj7NFE4UEqf1bXdPeQ070iFkhBShBJOjWt5P85H+XeI=;
 b=AGw7jP+O6tNe1rkY6pByW3It9leb/M9nBrQl6iMlVN8nMbTnkqqk1gS6GjNn7jyqSh
 pXt4EG2vMN9T/BWRjcjCJCXcIjL2M7s9UkKW/RfK/6XnL5qaTxQLz0VV5RGUy2+IJcsk
 4ym/FwpxxQGw4CbBEhUoiQPnYMTr9MiVrdMlAoiwRANV4EZMMZzSQ7psWqF8sf76qHO0
 l60AFU9BmO3GBmKvMy05Hyf2Hijx5rLbaMTHEcU/+sDPOTAYNR4AZaHgHxtUPlAzKtUL
 I737EWooN0szoR/uuMgtvKHTnsiLqblhB5Fu53vATxqqKU/BeqYNY9NNqIWEv3TNRGeR
 Sycw==
X-Gm-Message-State: ACrzQf3cvLfQuILST/jvOaIOgfYKEskneGdg+p7QMQZkc9TgonRJz9iv
 ge1jyA5oyQfMiQAKcP4EzuvaMiRM2Ds=
X-Google-Smtp-Source: AMsMyM47LSROCIetAPTVF/+L8i72Uf/hK9p7yfvfyMuct7Trnop1goAV/gPyjOJ9UoU1Cv4Rd+Rb5Q==
X-Received: by 2002:a63:1508:0:b0:438:eb90:52d1 with SMTP id
 v8-20020a631508000000b00438eb9052d1mr15639271pgl.252.1664105474639; 
 Sun, 25 Sep 2022 04:31:14 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 12/54] tests/qtest: hd-geo-test: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:50 +0800
Message-Id: <20220925113032.1949844-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Use g_steal_pointer() in create_test_img()

 tests/qtest/hd-geo-test.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 413cf964c0..455bc5db5c 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -27,20 +27,19 @@
 
 static char *create_test_img(int secs)
 {
-    char *template = strdup("/tmp/qtest.XXXXXX");
+    g_autofree char *template = NULL;
     int fd, ret;
 
-    fd = mkstemp(template);
+    fd = g_file_open_tmp("qtest.XXXXXX", &template, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, (off_t)secs * 512);
     close(fd);
 
     if (ret) {
-        free(template);
         template = NULL;
     }
 
-    return template;
+    return g_steal_pointer(&template);
 }
 
 typedef struct {
@@ -422,9 +421,8 @@ static MBRpartitions empty_mbr = { {false, 0, 0, 0, 0, 0, 0, 0, 0},
 
 static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
 {
-    const char *template = "/tmp/qtest.XXXXXX";
-    char *raw_path = strdup(template);
-    char *qcow2_path = strdup(template);
+    g_autofree char *raw_path = NULL;
+    char *qcow2_path;
     char cmd[100 + 2 * PATH_MAX];
     uint8_t buf[512] = {};
     int i, ret, fd, offset;
@@ -468,7 +466,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
         offset += 0x10;
     }
 
-    fd = mkstemp(raw_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &raw_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -478,7 +476,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     g_assert(ret == sizeof(buf));
     close(fd);
 
-    fd = mkstemp(qcow2_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &qcow2_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -506,7 +504,6 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     free(qemu_img_abs_path);
 
     unlink(raw_path);
-    free(raw_path);
 
     return qcow2_path;
 }
@@ -714,7 +711,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -867,7 +864,7 @@ static void test_override_scsi_hot_unplug(void)
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -927,7 +924,7 @@ static void test_override_virtio_hot_unplug(void)
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -987,7 +984,7 @@ test_add_done:
     for (i = 0; i < backend_last; i++) {
         if (img_file_name[i]) {
             unlink(img_file_name[i]);
-            free(img_file_name[i]);
+            g_free(img_file_name[i]);
         }
     }
 
-- 
2.34.1


