Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407733C5BA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:33:59 +0100 (CET)
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLs2Q-0003zB-DQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lLrZI-0002d2-3g; Mon, 15 Mar 2021 14:03:52 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:45299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lLrZG-0000rY-0S; Mon, 15 Mar 2021 14:03:51 -0400
Received: by mail-pl1-f180.google.com with SMTP id u18so15675693plc.12;
 Mon, 15 Mar 2021 11:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWWeJn6aLiPnfFIqTJdojW7MYsA8Ah6EYQcBQWFcLVQ=;
 b=hiy41nsQVJZXkF9JB0y7RfL02FSsM/stkuICt8c6kiMQwGlSUBSUmxFOEFFBcnnANT
 gv/27SkAjOgupckyovj8xSh4gswDuAZm1D9i6GrIIByfmJmn+zJya6QztQcbnSmz6+ON
 KzhwHeqg1MJx6YMi2Ve8dzB11Qubyz9dzKDpIOmCp9o6jdl0iIuVkRBV/a7FHU7H8eiC
 oOuvSMD/pfxHLwKM5QDRwu1/6nOB81+0EcTyv5/LOK7sEit6HdSo0VK1asDAV9zG1Qmy
 Jghszbz6muGxMWe84Z5mpy7h1VOBU310g6xEFnKPwbUXRYTsKyhTMOQ9uDVwuoNHpwlK
 ig1A==
X-Gm-Message-State: AOAM533OOIs+HqrNukGzkyafXhudsuqjHFwrRZZ5jYHID1aQxF8bxfvt
 9ltyK1DvQCPGpfeQd71b9FBW2dfkVcY=
X-Google-Smtp-Source: ABdhPJwjuNrcZLthjcclIG3nWifYSlAYUhuyCteglbWW6e6l60WWBqXNnQhULkeMlTYBy31/x0uzkQ==
X-Received: by 2002:a17:90a:4498:: with SMTP id
 t24mr324674pjg.78.1615831428023; 
 Mon, 15 Mar 2021 11:03:48 -0700 (PDT)
Received: from localhost.localdomain ([73.93.153.95])
 by smtp.gmail.com with ESMTPSA id y194sm14267842pfb.21.2021.03.15.11.03.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:03:47 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
Date: Mon, 15 Mar 2021 11:03:40 -0700
Message-Id: <20210315180341.31638-4-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210315180341.31638-1-j@getutm.app>
References: <20210315180341.31638-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.180;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Joelle van Dyne <j@getutm.app>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

iOS hosts do not have these defined so we fallback to the
default behaviour.

Co-authored-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 block/file-posix.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index d1ab3180ff..2a14b881d0 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2326,8 +2326,11 @@ static int64_t raw_getlength(BlockDriverState *bs)
 again:
 #endif
     if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
+        size = 0;
 #ifdef DIOCGMEDIASIZE
-        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
+        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size)) {
+            size = 0;
+        }
 #elif defined(DIOCGPART)
         {
                 struct partinfo pi;
@@ -2336,9 +2339,7 @@ again:
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
@@ -2346,19 +2347,15 @@ again:
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


