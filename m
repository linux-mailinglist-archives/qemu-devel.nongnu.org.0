Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6C5EC1CC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:46:36 +0200 (CEST)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od92p-00059i-2W
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QV-0002Oh-NJ; Tue, 27 Sep 2022 07:07:05 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QU-0004ng-2d; Tue, 27 Sep 2022 07:06:59 -0400
Received: by mail-pl1-x62e.google.com with SMTP id f23so8755546plr.6;
 Tue, 27 Sep 2022 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GthvPF7Fn8DUocZcof26qEqCqGyYjxBZwhptHR5ty04=;
 b=e1IHWcWmKnSdT8OPU1Ki1S1H1aDT3MPejjhKW4FQD86Z1hFv218mBzJtzyluKD+jeZ
 6WGPn0OCiSubz1R3eB+6QCiS/VA7X1Uy2gb83iaIDH4qEuo/st1NQ+2xUYyeMVbIcEig
 U4AqTgDcn4lS4RRtM6UdUsgKSiqEcWsZsO7DbnWsX2GSuv/ftrEz3lY8LYcs8r5JqtEw
 j2kXfWNs1Zq1W9m3wjaQq4x3UGY29rsQgb3/A4AO6uPm0oZj4k3kZQnYh1DmGEuS0vrn
 mHvCYpftqPjMPQ/OAViq3sU9TpwPmC5W5k41NJcvgOy4gm00jkDLFjcXyU7IogmVClw9
 VTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GthvPF7Fn8DUocZcof26qEqCqGyYjxBZwhptHR5ty04=;
 b=ehQ8EhO07IUI+SDXEnbL7BgUrkcozxRm9WiM8DGJPVs340gQDVwLZyqnMPHQNHYXyd
 SgbMxbzxmEeaGUiz72YrA8skUzEBMWGzYJurN8fIsG2YA7PXNu+BUPM2c+ipsnSddpLD
 SWIecv15/miQzDCwpwy+7YA7qA2d2Tfq38YkCMcKSLhTwQ5SkGzAZ5G6e/WCJXw0hD3O
 KrZFOftUtZrt/+egmc8JkYZ66tsQ/BJb2isycoryWCpAEhKN9OSwoEkxCI4lvWJN60ms
 qU1hXeNMUNXllV1TOlbbRWmWmZUzAlMdem7+uSAtGnrSGSxep7TuPvo7G8tzOaz3hcUG
 FeVQ==
X-Gm-Message-State: ACrzQf2ATjDV+gBzK/SEabFiBvszOg4w75JAM4zI62Iuhatn383WTCNd
 lnXUSYMglVeqA4uNadB384gWDzF2wec=
X-Google-Smtp-Source: AMsMyM6baih2nT8mwFxNrLbUEZLeDhvGE6P0fCF9YqesQ9SKP2JzDFjrc/VuYxnP6t7g1/5EyXKRpg==
X-Received: by 2002:a17:902:d3c6:b0:178:37e0:2e72 with SMTP id
 w6-20020a170902d3c600b0017837e02e72mr26809341plb.28.1664276816045; 
 Tue, 27 Sep 2022 04:06:56 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:06:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v4 05/54] tests/qtest: ahci-test: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:43 +0800
Message-Id: <20220927110632.1973965-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v3)

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


