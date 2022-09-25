Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6615E92D3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:51:29 +0200 (CEST)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQAS-0005Ed-6S
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqo-0002gO-HC; Sun, 25 Sep 2022 07:31:15 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPql-0006Js-GD; Sun, 25 Sep 2022 07:31:09 -0400
Received: by mail-pl1-x636.google.com with SMTP id w20so3901623ply.12;
 Sun, 25 Sep 2022 04:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zguLWmiD6IuG7yrS2NpjVBr5INGxJ8UZ9U8MjSEIiIU=;
 b=JiMvea3xpXLMHVlL2igokD6nyhClhCDJJwiu12Uyzf9xylc0CEOvjgokaHlB5PJIK8
 ACFKdKGQ8Ssn8bowp7WYO3ibusZfS7X08gGX01R8I1uhtJVLdP7weRzzkUyhMwnNlKN1
 3qhYF/hga/2iISZ0pMhk1pZFF2SQ4kVx92TskZTNu8+waDiG9iAhlK/GWHPrmQN5VDZV
 hwla5Q0Zvya2Hre3ywq5f8ovnIXgsAStV/O6nINnqVbWuWi8RYl8cQLLf+bm0LzJxTvh
 vCy4Dg9yHQ7T5yaEF4cspBvwLjJW5ooB+Br0ojSY+u5QF/KBMGoKkqRmWms91KkWnTjq
 gw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zguLWmiD6IuG7yrS2NpjVBr5INGxJ8UZ9U8MjSEIiIU=;
 b=VVKRmO4uEK0hEUbUwd7q54tOWL8dbhmCNT2bzs+6evNryRxxK/CTH8qRYmz/LKdOZ3
 hXACNPJECKQJFhkuEFby4dpTyUZhewoRzfEni0TJ1tY0AvyjfjvGhiH7D4zinFojKZu+
 sxOjTWQZXBmANlGgMG2MUJ+A9JHW/3UN4Q1RqZc2A23Fl+pzA1pG2tyfbo0L0TvfGlAQ
 xRmwOAVPTGZlOeG6ap93uAcMdVYKYvxE3X4twt+4ja+5t+6TeqT+h0xwVUGvUogqrv9w
 CoSC8j75j29uPq5it0sRHMXGlAM4bIZNjUn836DcBStBhZVJEsCelXEqNKKroJp42IMC
 FnzA==
X-Gm-Message-State: ACrzQf09wShw2Et3r36ek9Tj72J6vg3NR6OT372dd2v/OG2Du4Zo9gV4
 L2k3RyksITaqGggLwlTOThrT2SLnEfY=
X-Google-Smtp-Source: AMsMyM5+Z33FvtX4sSWLYy0Wznqvxry7fFXCO/2dEAKa9UZXxxZMG0cCznApXn5Fxvedg6FhswT4uQ==
X-Received: by 2002:a17:902:d70e:b0:178:2d9d:ba7b with SMTP id
 w14-20020a170902d70e00b001782d9dba7bmr17287849ply.90.1664105465749; 
 Sun, 25 Sep 2022 04:31:05 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:05 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v3 09/54] tests/qtest: fdc-test: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:47 +0800
Message-Id: <20220925113032.1949844-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x636.google.com
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

 tests/qtest/fdc-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 52ade90a7d..1f9b99ad6d 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -68,7 +68,7 @@ enum {
     DSKCHG  = 0x80,
 };
 
-static char test_image[] = "/tmp/qtest.XXXXXX";
+static char *test_image;
 
 #define assert_bit_set(data, mask) g_assert_cmphex((data) & (mask), ==, (mask))
 #define assert_bit_clear(data, mask) g_assert_cmphex((data) & (mask), ==, 0)
@@ -608,7 +608,7 @@ int main(int argc, char **argv)
     int ret;
 
     /* Create a temporary raw image */
-    fd = mkstemp(test_image);
+    fd = g_file_open_tmp("qtest.XXXXXX", &test_image, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
@@ -640,6 +640,7 @@ int main(int argc, char **argv)
     /* Cleanup */
     qtest_end();
     unlink(test_image);
+    g_free(test_image);
 
     return ret;
 }
-- 
2.34.1


