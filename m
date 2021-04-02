Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2797B352BE6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:06:24 +0200 (CEST)
Received: from localhost ([::1]:55890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMJS-0001Qk-IL
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSMGL-0008Tj-6w; Fri, 02 Apr 2021 12:03:09 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSMGJ-00027w-7v; Fri, 02 Apr 2021 12:03:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so2748751pjg.5; 
 Fri, 02 Apr 2021 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6IeLvvuVf+QqCe/a+Lcuwj2h0G+V9r7+7Ozfn69Buog=;
 b=hplY92qwsIs7FoUjA++Lm1iNHsAXJ5BWopULuXmX5tkf548O82tdp29ayQI+Q18X6U
 oJpqxnbTyIRiu24Cj054I7PUafEyVFmFAS2fx7OZttfafnkzbR+hdZSgcch0t1sB2uGo
 jtxbJyh6JJoQbZ+JvymC7U/npn/dhm/j9R6qOQ1dzAxZVzG5DmCfVipOqH3uuRGQ4uiX
 KHxCLXG+yOYqen2BhuYdaESkv194nUVm2AWpBP8N0Pdd+ifpFxZAqwPrZ5+Ncu7LwrhU
 3H2GOlTZ+jjkbuqlyzV9GkSWTmET1UePmicRuuHqQeTgerZa5FDDOa0HtQo43TKwqvfi
 z9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6IeLvvuVf+QqCe/a+Lcuwj2h0G+V9r7+7Ozfn69Buog=;
 b=KtT1PG8mmIMd0tA/68AArraGFd2SuRbsOUkyADgnyV6jr8naQh6M1yxmkE7x6iTewf
 A0NGf5KEB1kmVDsc/QVTiYCNN7WukSvb9dGPRXnhwnUKAoyTG8HjN17sRrvc9x9xCns9
 kOv756+AZYffTF7bNX+5WoIY8yeqccloIbJKig0VMrIUt1CZ2Frmkh3s0pEUhpnfx3Em
 P83zz3C4HQTDKTBhFvUKoCyeGlCvRE4/mO6Cdy7GoiC6DFAkQSgLO6QlyAZb7J8NzsBe
 13ZyLpiKKXdg6m2H/TswlQhXyEdJFFOTP13kf6l1xXui1ecSonGuIZMIXXUuKIyhPfim
 B5xQ==
X-Gm-Message-State: AOAM533NbZcX3B8OKGiuSxrwNstSqW+TFWMUHPbcLpLRo3Mzt457pSlZ
 uU93Y4B6LWqCC8evIWyyCxq9Y7PVznOquA==
X-Google-Smtp-Source: ABdhPJxl3mMz5kELBRQlmFrFxZtI5XftNgDUrSY1YJ2j7J4wMvF3/9sCsJzc5PGB15gTXi727g1wKQ==
X-Received: by 2002:a17:902:780c:b029:e6:9193:56e2 with SMTP id
 p12-20020a170902780cb02900e6919356e2mr13149278pll.39.1617379385022; 
 Fri, 02 Apr 2021 09:03:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:3c79:94d8:55ff:9601])
 by smtp.gmail.com with ESMTPSA id w84sm8708723pfc.142.2021.04.02.09.03.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Apr 2021 09:03:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [v5 1/3] block/file-posix: Optimize for macOS
Date: Sat,  3 Apr 2021 01:02:54 +0900
Message-Id: <20210402160256.39647-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Konstantin Nazarov <mail@knazarov.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit introduces "punch hole" operation and optimizes transfer
block size for macOS.

Thanks to Konstantin Nazarov for detailed analysis of a flaw in an
old version of this change:
https://gist.github.com/akihikodaki/87df4149e7ca87f18dc56807ec5a1bc5#gistcomment-3654667

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 block/file-posix.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 05079b40cae..89e8ed9f801 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -44,6 +44,7 @@
 #if defined(__APPLE__) && (__MACH__)
 #include <paths.h>
 #include <sys/param.h>
+#include <sys/mount.h>
 #include <IOKit/IOKitLib.h>
 #include <IOKit/IOBSD.h>
 #include <IOKit/storage/IOMediaBSDClient.h>
@@ -1248,6 +1249,15 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
 
+#if defined(__APPLE__) && (__MACH__)
+    struct statfs buf;
+
+    if (!fstatfs(s->fd, &buf)) {
+        bs->bl.opt_transfer = buf.f_iosize;
+        bs->bl.pdiscard_alignment = buf.f_bsize;
+    }
+#endif
+
     if (bs->sg) {
         int ret = sg_get_max_transfer_length(s->fd);
 
@@ -1586,6 +1596,7 @@ out:
     }
 }
 
+#if defined(CONFIG_FALLOCATE) || defined(BLKZEROOUT) || defined(BLKDISCARD)
 static int translate_err(int err)
 {
     if (err == -ENODEV || err == -ENOSYS || err == -EOPNOTSUPP ||
@@ -1594,6 +1605,7 @@ static int translate_err(int err)
     }
     return err;
 }
+#endif
 
 #ifdef CONFIG_FALLOCATE
 static int do_fallocate(int fd, int mode, off_t offset, off_t len)
@@ -1795,16 +1807,27 @@ static int handle_aiocb_discard(void *opaque)
             }
         } while (errno == EINTR);
 
-        ret = -errno;
+        ret = translate_err(-errno);
 #endif
     } else {
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
         ret = do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
                            aiocb->aio_offset, aiocb->aio_nbytes);
+        ret = translate_err(-errno);
+#elif defined(__APPLE__) && (__MACH__)
+        fpunchhole_t fpunchhole;
+        fpunchhole.fp_flags = 0;
+        fpunchhole.reserved = 0;
+        fpunchhole.fp_offset = aiocb->aio_offset;
+        fpunchhole.fp_length = aiocb->aio_nbytes;
+        if (fcntl(s->fd, F_PUNCHHOLE, &fpunchhole) == -1) {
+            ret = errno == ENODEV ? -ENOTSUP : -errno;
+        } else {
+            ret = 0;
+        }
 #endif
     }
 
-    ret = translate_err(ret);
     if (ret == -ENOTSUP) {
         s->has_discard = false;
     }
-- 
2.24.3 (Apple Git-128)


