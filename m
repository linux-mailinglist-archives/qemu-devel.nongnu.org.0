Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B413D3BBD51
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:07:08 +0200 (CEST)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OJX-0004f3-GB
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0OHu-0002Kn-IA; Mon, 05 Jul 2021 09:05:28 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0OHp-0008Br-3h; Mon, 05 Jul 2021 09:05:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso11425104pjx.1; 
 Mon, 05 Jul 2021 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWN+FaNfl1eCTe4tnHoO+KqxIX/vH2hey0Q0qZdbmf0=;
 b=AtNgA0fHV59klnA0qehOmNqVk6LA1obzOdwfmR4J1F7GUkAiCfRp6ThEDB3zX6lnB2
 2F1HzCdHWdMi74wf4hWt5yVeUQx/mRZnxGmlh5Z/i/MRc23FLUsfyhUmK60j2NRB4sbL
 fuHHcMXm7MFNFW5xnLSS3MfYhX18rJ7Z6t2R3Lc+g3Lyxk0y1Ha2kWG327m2ssNeD1h5
 sDnP0dGYWkMlLBIVEAv1bgaiaKkEFD8+0ZHFFOZREbwpTfJl7VcGM6PVHq0gzUmkkGsH
 2eCcedKkzFZWflcAoZ0MU5wHvHiRoVgawWZqsN3VBAqXes4Drorb4em8F83eyrmcvWOC
 qtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWN+FaNfl1eCTe4tnHoO+KqxIX/vH2hey0Q0qZdbmf0=;
 b=WE255M350x0KIDGa6NujACqLqQCDJ+rkYn06jV9HbDSAT02FOQCo6taNmBt1BZny46
 ZM5vv3fRmN6IRbgjCLRzXRJIrCbqA3IE5nB3R+gaaMYLnGyv1LFImUDji9cN5+fmM8YN
 kUc/udCCcebvrz1BMDCgj7pstg9i9bOEhw+98J9BPVcsqdQ0RnNuBeZJfO2M6lV2n6x3
 YrZ46RCmwLlZuxfFco4hV3vZnnGBe1re4374xaGs5+tAcqq+E5qPbjZY2gMXSp/nXT3b
 CgpOftWCVb9AWv6TsP4fbz7qfTb+M1AXkKC7quarCpFw63/w5X9eBs3TUJ7+1ErNFv7t
 71lw==
X-Gm-Message-State: AOAM5313FMHcbIM1LC9c/6yP55+scbT3Z012BjlOha6LcRnPKBELLHhi
 +eLh7a+2NF9CvD0MXr9QPsQ=
X-Google-Smtp-Source: ABdhPJwVqDWISgPoZUaVDK5L62mfbXmf0pqvpERtHJn8ul/HUSnHlriXK53lSVw9crWiaWD9/Mn3Zg==
X-Received: by 2002:a17:90a:6942:: with SMTP id j2mr9386659pjm.9.1625490318474; 
 Mon, 05 Jul 2021 06:05:18 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ad14:b651:2921:88e5])
 by smtp.gmail.com with ESMTPSA id s27sm12727263pfg.169.2021.07.05.06.05.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Jul 2021 06:05:18 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v5 1/3] block/file-posix: Optimize for macOS
Date: Mon,  5 Jul 2021 22:04:56 +0900
Message-Id: <20210705130458.97642-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1029.google.com
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
 Konstantin Nazarov <mail@knazarov.com>, shajnocz <shajnocz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 dgilbert@redhat.com
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
index b3fbb9bd63a..80da1f59a60 100644
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
@@ -1217,6 +1218,15 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
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
 
@@ -1557,6 +1567,7 @@ out:
     }
 }
 
+#if defined(CONFIG_FALLOCATE) || defined(BLKZEROOUT) || defined(BLKDISCARD)
 static int translate_err(int err)
 {
     if (err == -ENODEV || err == -ENOSYS || err == -EOPNOTSUPP ||
@@ -1565,6 +1576,7 @@ static int translate_err(int err)
     }
     return err;
 }
+#endif
 
 #ifdef CONFIG_FALLOCATE
 static int do_fallocate(int fd, int mode, off_t offset, off_t len)
@@ -1777,16 +1789,27 @@ static int handle_aiocb_discard(void *opaque)
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
2.30.1 (Apple Git-130)


