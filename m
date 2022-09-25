Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF66C5E92C3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:38:46 +0200 (CEST)
Received: from localhost ([::1]:38306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPy9-0000Tn-QW
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqe-0002cs-HK; Sun, 25 Sep 2022 07:31:00 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqc-0006Iv-7Y; Sun, 25 Sep 2022 07:31:00 -0400
Received: by mail-pf1-x431.google.com with SMTP id a29so4178779pfk.5;
 Sun, 25 Sep 2022 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=D3VuKooJ4UjKkQ3haTWxtVaNZNqddm2jJatcFkZLIyw=;
 b=Bsrhixs7M5N+gFRyjPlEPb6cOLd5VotPkQxGklGu3O0ykrIrdiOGEqGEc9Vf8nWOc/
 FmtRRCb26BG45sVYhj9C13y81YiB+ZShUdodNFjhT+MmnPgy9ZNasqKk9Tc6/UQkjFkj
 1uRyjkIxTJBe3PBPtupfvCKTvgd9etSbxlKW1JkVH7yUjZk4v0Z1nkD0V3pz1+63hTgL
 P399Rhne/VGom+m1f8nDRKG97oOg1opWShZNMLgEhcxB4W2tojpUafDm3swi+vgF2KfA
 BcKH5TrPsKewWDimNrFEvJU40m8zWt0I0K5vVq/WVqJmxQ+s31QKgALZP+6cWw+k2jAM
 P4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=D3VuKooJ4UjKkQ3haTWxtVaNZNqddm2jJatcFkZLIyw=;
 b=yQY5zBo5EKvLdU32LZMpyciFMa6LIHqWjjlkElpd5qKfY+OMi1cV31O1910+3ePXbt
 sD7dQ80z69omz2F/5wtWy8Lzi2ZXdWxVOmOVV8i6aV/cm0FWogtF/nbexRie8T1KgOxY
 Jn+mwUKTD5E7viLwh7A5HeqGnVKtsjbZny+aPeHH9fdbXyJxE6bgsPfMSzqyD+ZtXmLv
 z27D8F4ytZfiHKqtu3nfzHWbqgc0kdN+cNhX/aJgHDP+lYSwnYRLPnL8T3MH+DHwOZXG
 L4NxNEaNZhNIjVuyM5gY6NjqGHtlyKIap7LA3xbTTQtApZW3ZJ87pzu9Cc7XuXyNJ9nI
 PpSg==
X-Gm-Message-State: ACrzQf3lrnN6LmWhT0cesFqZc+eaKftlaeGcHA4tSJ3OaEZK1fiP3roL
 8KZqyOKeCkGI4iKHRcBp16kc2wyKwmk=
X-Google-Smtp-Source: AMsMyM5ePHUXeP23k1ejSBAYg4EjYazAQbFudw3/cFXjoAkjLBVY4zJ1noJnjhgk8Y4MyLKu/cNB5g==
X-Received: by 2002:a63:20f:0:b0:439:c92f:e6d1 with SMTP id
 15-20020a63020f000000b00439c92fe6d1mr15319770pgc.334.1664105455051; 
 Sun, 25 Sep 2022 04:30:55 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:30:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v3 05/54] tests/qtest: ahci-test: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:43 +0800
Message-Id: <20220925113032.1949844-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
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

 tests/qtest/ahci-test.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index f1e510b0ac..1d5929d8c3 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -44,9 +44,9 @@
 #define TEST_IMAGE_SIZE_MB_SMALL 64
 
 /*** Globals ***/
-static char tmp_path[] = "/tmp/qtest.XXXXXX";
-static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
-static char mig_socket[] = "/tmp/qtest-migration.XXXXXX";
+static char *tmp_path;
+static char *debug_path;
+static char *mig_socket;
 static bool ahci_pedantic;
 static const char *imgfmt;
 static unsigned test_image_size_mb;
@@ -1437,10 +1437,10 @@ static void test_ncq_simple(void)
 
 static int prepare_iso(size_t size, unsigned char **buf, char **name)
 {
-    char cdrom_path[] = "/tmp/qtest.iso.XXXXXX";
+    g_autofree char *cdrom_path = NULL;
     unsigned char *patt;
     ssize_t ret;
-    int fd = mkstemp(cdrom_path);
+    int fd = g_file_open_tmp("qtest.iso.XXXXXX", &cdrom_path, NULL);
 
     g_assert(fd != -1);
     g_assert(buf);
@@ -1872,7 +1872,7 @@ int main(int argc, char **argv)
     }
 
     /* Create a temporary image */
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     if (have_qemu_img()) {
         imgfmt = "qcow2";
@@ -1889,12 +1889,12 @@ int main(int argc, char **argv)
     close(fd);
 
     /* Create temporary blkdebug instructions */
-    fd = mkstemp(debug_path);
+    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
     /* Reserve a hollow file to use as a socket for migration tests */
-    fd = mkstemp(mig_socket);
+    fd = g_file_open_tmp("qtest-migration.XXXXXX", &mig_socket, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -1947,8 +1947,11 @@ int main(int argc, char **argv)
 
     /* Cleanup */
     unlink(tmp_path);
+    g_free(tmp_path);
     unlink(debug_path);
+    g_free(debug_path);
     unlink(mig_socket);
+    g_free(mig_socket);
 
     return ret;
 }
-- 
2.34.1


