Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23AA33086F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:50:54 +0100 (CET)
Received: from localhost ([::1]:45526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9jB-0006sD-QC
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJ9gs-0004M2-U5; Mon, 08 Mar 2021 01:48:31 -0500
Received: from mail-pj1-f46.google.com ([209.85.216.46]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJ9gr-0007pi-Fa; Mon, 08 Mar 2021 01:48:30 -0500
Received: by mail-pj1-f46.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so2547324pjg.5; 
 Sun, 07 Mar 2021 22:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RIP/r3nyG15GF413S6T6+JeyoT6XtJQWSwQR9etpPKM=;
 b=Mz3iJan40os0zPd0Iq+RxeR+1UjrjEyEnS5MA4kkQoC+vVdjw6hyn4S0OsvsFqfUrD
 kDXHilj5M1wBXyWadXeFYnB5YcsVgFG6qnKGW6l8OfyxLqyCIxM9oLIqadCL+xk8U20p
 gJAsSZ3hJdyE7MLLwc4NEC9HupG9af931/ndBCvmzUGPDIl+zf9xss0Ljyyo5+rI4y+l
 QWyLqrYgJbIhQl4moFxSfAjo3O9/yuNpqINR6V3eO6vcMYLNgMUrxU91d7hvQChFVoet
 K6h2yzftiQ4pqakq8vUb/8n8ilWvMX4WLgPqsfQIpCgJO9tyAMjY3Mbk5A2sC6FMKCci
 u2xw==
X-Gm-Message-State: AOAM533pORIgHe0XU7JhH/DrD00g8tqzpIbMYqbfplqGM9REcJ+gjGo3
 olVGloeRHsUWnV6e1rpy/ti/hp7a5rM=
X-Google-Smtp-Source: ABdhPJyYhvPXyyLupgJ6Pcfc7kbd+yv+PRcz9dgNxo2B2iHrc094JOT04cDOAwgU5XYC1EIuGnfIRQ==
X-Received: by 2002:a17:90a:400f:: with SMTP id
 u15mr22906926pjc.80.1615186107749; 
 Sun, 07 Mar 2021 22:48:27 -0800 (PST)
Received: from localhost.localdomain ([73.93.155.14])
 by smtp.gmail.com with ESMTPSA id i17sm426943pfq.135.2021.03.07.22.48.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Mar 2021 22:48:27 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
Date: Sun,  7 Mar 2021 22:48:20 -0800
Message-Id: <20210308064821.81427-4-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210308064821.81427-1-j@getutm.app>
References: <20210308064821.81427-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.46; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f46.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:raw" <qemu-block@nongnu.org>,
 Joelle van Dyne <j@getutm.app>, Warner Losh <imp@bsdimp.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

iOS hosts do not have these defined so we fallback to the
default behaviour.

Co-authored-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 block/file-posix.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index d1ab3180ff..9b6d7ddda3 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2326,8 +2326,10 @@ static int64_t raw_getlength(BlockDriverState *bs)
 again:
 #endif
     if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
+        size = 0;
 #ifdef DIOCGMEDIASIZE
         if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
+            size = 0;
 #elif defined(DIOCGPART)
         {
                 struct partinfo pi;
@@ -2336,9 +2338,7 @@ again:
                 else
                         size = 0;
         }
-        if (size == 0)
-#endif
-#if defined(__APPLE__) && defined(__MACH__)
+#elif defined(DKIOCGETBLOCKCOUNT) && defined(DKIOCGETBLOCKSIZE)
         {
             uint64_t sectors = 0;
             uint32_t sector_size = 0;
@@ -2346,19 +2346,15 @@ again:
             if (ioctl(fd, DKIOCGETBLOCKCOUNT, &sectors) == 0
                && ioctl(fd, DKIOCGETBLOCKSIZE, &sector_size) == 0) {
                 size = sectors * sector_size;
-            } else {
-                size = lseek(fd, 0LL, SEEK_END);
-                if (size < 0) {
-                    return -errno;
-                }
             }
         }
-#else
-        size = lseek(fd, 0LL, SEEK_END);
+#endif
+        if (size == 0) {
+            size = lseek(fd, 0LL, SEEK_END);
+        }
         if (size < 0) {
             return -errno;
         }
-#endif
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
         switch(s->type) {
         case FTYPE_CD:
-- 
2.28.0


