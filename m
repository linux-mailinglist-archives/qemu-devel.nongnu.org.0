Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E055E92D4
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:51:30 +0200 (CEST)
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQAT-0005Ig-Sl
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrM-0002qI-5i
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:44 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrJ-0006Js-05
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:43 -0400
Received: by mail-pl1-x636.google.com with SMTP id w20so3902209ply.12
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=fcS3F/JfCp6zFQVQ4uOqfbe0hQm4j7AcaWC5M8e5occ=;
 b=euRMx6Y5Z7uUeLot3C2wCKUY/OwrBrvLPyjuzn+rHpljb3MCup1dcLN0uZm6Q9n3FJ
 JmiV5WaHJ2tvH3D5HGfstVCmPbJb6KnTS4bStkTshm0ETfnazkQSlnGzZHpvXxE+ob2F
 IbclPzv742VQX1xtKThyWMnKjIACZfYgF9r62c3P1Lm/swwnhcYBllvxXhvVwWz2T8Ad
 ZTfn/s8rkt2lvz9jjn6H0eEzCyKnb1iyBE7DFWvRxTogUslyfnnChauHk4YaynXe0lRw
 fPcI3KfnhfJ3hqMFV+Wf2XdDeQfeurJvQZQbSejgMpKcXVEgN0Q7FlkitGY08XgspIeR
 oi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fcS3F/JfCp6zFQVQ4uOqfbe0hQm4j7AcaWC5M8e5occ=;
 b=09ZWyu23qbEPcNPJg5tfv5heUAmSZHueDMMd03dBuM+babH92RehddSSUrAlob4vPt
 b1lDS5yAph8LlNjMewZSbbDdD0iYFEYu0h/e4Fvjp+G2I1urJrVFE3ODW2lydfVnm5yJ
 SV8MPwJ223/XOlvkIZcKXOOt04zfGSj07/d7g/ju74n9QkjB+IFMXGMoyeFjOpAE30ND
 zPmx1W9yLQMujVyIsFwuzXrRVtAjsCKyniWoOFHKQ3tuKDN6MQzfz8vuP5VA2Cndb2gK
 hWIx1IZY55Bh7TyYTQp2fLKtqM9u/GVsGlgY/BOeLnGpebyjQC974TSTvUDw5qzGx3/Y
 /3Ag==
X-Gm-Message-State: ACrzQf3KUadBjswP4BERRQQ1Gb/bH/gMZp1Dooa2DyZA1G8BlOEUexoh
 DNquEc/O2jwpz7EYrRoMRDCuTfzEN9Q=
X-Google-Smtp-Source: AMsMyM4wW9LZzEJWru1sZHKcvMf0C25Syg6MWKQOJqeeK/g9tJB1WE5i9QpR5kOZhoWleDK4cBTkKw==
X-Received: by 2002:a17:902:d482:b0:178:1585:40b6 with SMTP id
 c2-20020a170902d48200b00178158540b6mr17435463plg.134.1664105499467; 
 Sun, 25 Sep 2022 04:31:39 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 22/54] tests/unit: test-image-locking: Avoid using
 hardcoded /tmp
Date: Sun, 25 Sep 2022 19:30:00 +0800
Message-Id: <20220925113032.1949844-23-bmeng.cn@gmail.com>
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
- Ensure g_autofree variable is initialized

 tests/unit/test-image-locking.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-image-locking.c b/tests/unit/test-image-locking.c
index ba057bd66c..a47299c247 100644
--- a/tests/unit/test-image-locking.c
+++ b/tests/unit/test-image-locking.c
@@ -76,10 +76,10 @@ static void check_locked_bytes(int fd, uint64_t perm_locks,
 static void test_image_locking_basic(void)
 {
     BlockBackend *blk1, *blk2, *blk3;
-    char img_path[] = "/tmp/qtest.XXXXXX";
+    g_autofree char *img_path = NULL;
     uint64_t perm, shared_perm;
 
-    int fd = mkstemp(img_path);
+    int fd = g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
     assert(fd >= 0);
 
     perm = BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
@@ -117,10 +117,10 @@ static void test_image_locking_basic(void)
 static void test_set_perm_abort(void)
 {
     BlockBackend *blk1, *blk2;
-    char img_path[] = "/tmp/qtest.XXXXXX";
+    g_autofree char *img_path = NULL;
     uint64_t perm, shared_perm;
     int r;
-    int fd = mkstemp(img_path);
+    int fd = g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
     assert(fd >= 0);
 
     perm = BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
-- 
2.34.1


