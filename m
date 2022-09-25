Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBD15E92DA
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:55:01 +0200 (CEST)
Received: from localhost ([::1]:44834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQDs-0002P9-MG
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrG-0002jc-Gc
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:41 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPr8-0006Ki-Md
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:37 -0400
Received: by mail-pl1-x62c.google.com with SMTP id f23so3929103plr.6
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xSaeu3bMM0haLGRmrvVDTyuVh+uN3dsUBZJf+5l/M5A=;
 b=NKLUKPCdqqOgJf9p53DOUSaPLKDNdfMlQdi9QRbvSxPLjSJ8ScUh6ZGl9Q6kx2EeIY
 uLwt5qiIo6wpDdZp/iKyw9dg4S9eH3ETV0eCbZS9EjUY5Lhug/pKNMxZS2tOivmZUNLi
 16Uw4OVGT637TzMe50UocZKQuaFlsiyRpTzUoSxO8LaqgIvyt4Ay3TGq6OGgfXbr25to
 rpzvqo0CD5tcr2wAqzzfSLFUgf4AdtsFNoTsguUoZffxQxFlV8b0zo4dmP5vOepDPmsc
 LYT6gIdJCrEn+chgV9HFgSOFE6sZQctimRfD59/LrBB0QCRQnQiyij3qGiHvhEWbaMlf
 MBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xSaeu3bMM0haLGRmrvVDTyuVh+uN3dsUBZJf+5l/M5A=;
 b=2K9gpq+Hbzpc+ja7t3iA8qOGMjbaYj5ymAPwFnJPwHo4zy62lmIj3NifgZGCJzljZF
 L0pQ0HfCfslnf1bH7cbq77p2stn/e06MPWJpyyrPL1wgZ0kc/7Sicby0cxJ835GNBBeI
 UP+ODpn+giWmG8xcsBR6ZPM5oDpKGwjX88ypG0sPBBlYRh7ZnFLa8OmX4HgYFieeZHpk
 zb2KHKp2dwJWq50SnL+egtj/QdbJ+coJAtA8HGL8xw5Qxo+odEa5w72efQzWskS9QgdB
 EeQr99nFX60EwvjRkmoIVpuHIRGe4CJzTAik4FxM0cITbVhzghQ7VGP41bxC/vE7ruBs
 hfpA==
X-Gm-Message-State: ACrzQf01mKo2CWs6rKKojGPf+s1/zgcmc4zRWbpWbLlr56g672gieC88
 TU3swcEoyM+PuRtcIAS/sUiHqsfN600=
X-Google-Smtp-Source: AMsMyM4DbDp9AKe1BDF/g3DryP32wT/Vb6yDv94+lee825jtBPEaTMuVUzehG+oPvA39Oj/YT5VVvw==
X-Received: by 2002:a17:902:f545:b0:178:b4c3:eab6 with SMTP id
 h5-20020a170902f54500b00178b4c3eab6mr16831566plf.148.1664105479913; 
 Sun, 25 Sep 2022 04:31:19 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:19 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 14/54] tests/qtest: migration-test: Avoid using hardcoded
 /tmp
Date: Sun, 25 Sep 2022 19:29:52 +0800
Message-Id: <20220925113032.1949844-15-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch

 tests/qtest/migration-test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 4728d528bb..029c4f3a6a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2434,7 +2434,6 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
@@ -2462,9 +2461,10 @@ int main(int argc, char **argv)
         return g_test_run();
     }
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("migration-test-XXXXXX", NULL);
     if (!tmpfs) {
-        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+                       strerror(errno));
     }
     g_assert(tmpfs);
 
@@ -2589,6 +2589,7 @@ int main(int argc, char **argv)
         g_test_message("unable to rmdir: path (%s): %s",
                        tmpfs, strerror(errno));
     }
+    g_free((gpointer)tmpfs);
 
     return ret;
 }
-- 
2.34.1


