Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0475E92DE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:57:34 +0200 (CEST)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQGL-0007p7-RO
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrG-0002ja-F3; Sun, 25 Sep 2022 07:31:41 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPr5-0006KX-6R; Sun, 25 Sep 2022 07:31:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so4300374pjh.3; 
 Sun, 25 Sep 2022 04:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9nzx3zjt1kod4XqM/j/+23LNx+kI/TyLGdD65qxmPHA=;
 b=qh9+xWZTZsahhWsuw+fAzNxkydMBkRpxxRNuQ84c9UiAs+MyYXBYF7Dn+2X/ZjujbB
 zaoxtb03v631ZXIgQUon6Z4p+FGTfGuaYzYsWzSgPr2La54FiHjQ/+zFw9QWOCpUX/xw
 9q1iXa9ikB+45HGQ5/3H78WJ4fWTd2qgPJnDL26vr3fHA85YhlGOuwPqHxECO7Io6xkO
 SvikYaWHq+MylsU/H7dayyn+TQ7CBlrspTaZ14czlWJ9xhFyiaD9fma0RQ9J2gCo+ibb
 J4Jj3y6F9AoAjUsL2s40HlOHJnU3yMke0sX2WcEqz34XUnmJBwLCmDx5c6ntMztm7nxy
 Gq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9nzx3zjt1kod4XqM/j/+23LNx+kI/TyLGdD65qxmPHA=;
 b=AJPrumFqFJ1AV0S6ZNakFenW8uSpoJEEkBTzoDTNA8v3Hu6YAufZaWf3SZOSjlVbiD
 JJiuVNqYydGPNFSZ4h6O2FVmDTiLBx8VBAW1EIIqw2jEzuniXdiK2TVS+XiykMlc4M8F
 A5vlt5Gz6DLz4i7ifoEhie3h+notQe5iHSfeJ4rnGMt8Q1/w1SpuWRBsPxvWodn8NIT3
 iK1B2CykxEQn4dXlr2/1x143thzDnjZ2NtUoQn8WUD888YEfjYap0nDoiHfj6F08DKm6
 gkydJj8f8X7YEt4MiBa61W5l0jjVPoxK6dCshcI8V8/mplnMoFGoL+CTzzm1+32/sdzp
 zFZQ==
X-Gm-Message-State: ACrzQf2rsX0gFss8AXJpBoXtgp6WnAsMAhJIj+RObGfTc/Di5djK3aMB
 VlfSKeMeQPRwOaHEgNnfPBeWq/bJHP8=
X-Google-Smtp-Source: AMsMyM4eB8CwrjEmFjARLBF0NWCyIWEQDuAwxQiZXkDem69G+xcUDez/LNxuLWzwNTCym5jVYWx7OA==
X-Received: by 2002:a17:90b:1e0d:b0:202:91ec:e167 with SMTP id
 pg13-20020a17090b1e0d00b0020291ece167mr19014437pjb.174.1664105477259; 
 Sun, 25 Sep 2022 04:31:17 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v3 13/54] tests/qtest: ide-test: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:51 +0800
Message-Id: <20220925113032.1949844-14-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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

 tests/qtest/ide-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 5bcb75a7e5..25302be6dc 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -121,8 +121,8 @@ enum {
 static QPCIBus *pcibus = NULL;
 static QGuestAllocator guest_malloc;
 
-static char tmp_path[] = "/tmp/qtest.XXXXXX";
-static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
+static char *tmp_path;
+static char *debug_path;
 
 static QTestState *ide_test_start(const char *cmdline_fmt, ...)
 {
@@ -1015,12 +1015,12 @@ int main(int argc, char **argv)
     int ret;
 
     /* Create temporary blkdebug instructions */
-    fd = mkstemp(debug_path);
+    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
     /* Create a temporary raw image */
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
@@ -1049,7 +1049,9 @@ int main(int argc, char **argv)
 
     /* Cleanup */
     unlink(tmp_path);
+    g_free(tmp_path);
     unlink(debug_path);
+    g_free(debug_path);
 
     return ret;
 }
-- 
2.34.1


