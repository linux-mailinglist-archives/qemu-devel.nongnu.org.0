Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB9352BDF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 17:56:44 +0200 (CEST)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMA7-0002lX-3G
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 11:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSM81-0001V7-Tq; Fri, 02 Apr 2021 11:54:33 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lSM7x-0004yf-6D; Fri, 02 Apr 2021 11:54:33 -0400
Received: by mail-pj1-x102e.google.com with SMTP id t18so2877000pjs.3;
 Fri, 02 Apr 2021 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TMGCO1ooIPpKsTuojQpj0eW+Ayh7TPtCvPU6SJHF/o=;
 b=RU2eDOjQjqrVIjmC/xUSh1RE/RPmwuy1i61SMfamf5X6ltlzqgxUWFRyt0OxSjnrpG
 uj9v7nlPBpKskVHpnkL5mSm8Vu+WFAOyqlUOiyvTaorAeKu8rWl2S1eQK1mGlbVTRa++
 Puc0/JR/FcMkGo6EeqXVWbvZL1YL+qAj/JAgvki8UZfK7mgUxQNb7EfZt+BMTLvvqH/W
 4g96W9yeItQBsISJJvghNMiXIKyhDobX3rlkD4mM5kOivP+aEluJ2sK2vlooLVx5FNGY
 b5pgk80ddV/6+AEYUXEhXER37VyMGb33Xr6EiQLx3GicJ9lGhAGjp7fV8mPTg/LP7sYj
 yh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TMGCO1ooIPpKsTuojQpj0eW+Ayh7TPtCvPU6SJHF/o=;
 b=Ano7TcP7bjCeSlh+rkXkMTF1nQEtcqGobSbsbOWIOlkOKSOjRwBC7jRVSxCvyYhuAu
 JZz7Dvacc9DYj4210bL6kp3crCcnFTAYNRn14pSH6SLfSn1K6l2LgwSZpNiNmxAyPDa5
 aXNvZDO9vZhCxHecMU6yOIZIR9LxB6+bQ6GL02KC+NQ0HaFGX0Ifnm6LhICPlFdWb5Hw
 3aphI+G1/TD5r5qhKk1mrzPyMtGDRL1Za9wzcAKtJb/+skxlRi0V13G5XGpyHNAkgPin
 jciQhYNA30z6eUDcT66NX+p9tU5UDTAvkX6sEDYH1/ify/4P7gh5zd7yztwAEOSU1oBw
 KmUw==
X-Gm-Message-State: AOAM531ej1OQeyTQnU38zgu50XnxsXh/a4rWi2XFFE2xjwm2isKX3cFs
 bh3r3DwwxQFuZ+bdtRG5GBeWeOG6Dl7RJQ==
X-Google-Smtp-Source: ABdhPJyP7AmqGE8Gn+8C4BrMJe1VY/NZaMvUmeCSxwmuJu6F6YrGMYy0jq0jy0ScRjCZcigKt/LUeA==
X-Received: by 2002:a17:903:1cf:b029:e8:c4ca:be6d with SMTP id
 e15-20020a17090301cfb02900e8c4cabe6dmr2521829plh.39.1617378864053; 
 Fri, 02 Apr 2021 08:54:24 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:3c79:94d8:55ff:9601])
 by smtp.gmail.com with ESMTPSA id 138sm8540278pfv.192.2021.04.02.08.54.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Apr 2021 08:54:23 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [v4 1/3] block/file-posix: Optimize for macOS
Date: Sat,  3 Apr 2021 00:54:04 +0900
Message-Id: <20210402155406.31033-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102e.google.com
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
index 05079b40cae..8f25e194fcd 100644
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
 
+#if defined(CONFIG_FALLOCATE) || defined(BLKZEROOUT)
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


