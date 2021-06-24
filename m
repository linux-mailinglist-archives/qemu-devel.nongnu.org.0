Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E33B355D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:13:14 +0200 (CEST)
Received: from localhost ([::1]:35304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTqj-0005iZ-JM
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiS-00081W-6K; Thu, 24 Jun 2021 14:04:41 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiN-0001UY-UQ; Thu, 24 Jun 2021 14:04:38 -0400
Received: by mail-ej1-x630.google.com with SMTP id gt18so10842155ejc.11;
 Thu, 24 Jun 2021 11:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1inmLhcVq0aSD320zpWtlTjRRoDETw4S+Ab6hL0QjO8=;
 b=rr1/z9Kciyox4j/5FbBQ5+ZUvjci1mOQW/njMSxKTTBG06eFCYvbQQ5qmXcDG4lfkb
 VnZFp+RA2/2T8qyxZH3Jhyc991HnIikvxzlUF07iE7k+W0FbWWeOzHZagGA7BQ3dhPzX
 ag3wSQf14oKkf8+fhxV8Of6SQYue43DYWs5P5uSzHym73PWbJWrMu9k6lCN4gBbnJGRp
 CNYR06REciWanIprdFfO882c/fjwNiqpM1Yfl3ckCACMJhVEIg4SkWe9cZWUUHcqOPtV
 dbXeA1oUK+xxrb0An64qUa3Gi/3qUJpSLJoW0fzPq/E57oHguPCzM7sVu8i4++IKotQm
 svWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1inmLhcVq0aSD320zpWtlTjRRoDETw4S+Ab6hL0QjO8=;
 b=a9QlmQUOxGzJPUv1ciB/xTF/AqQ7idhi5nWGujekJP9TmX7jFgp2LUiDnCLZijcSpq
 wrCE0ZHQcH2WL6wep43tER7VCQlhWf+nXD6JR2gxb49TNN1wxJK+09BaVzqqJQdharNh
 c1jSudLSaIU3EsStJfBZM6/5LRLhuPqmIu5XwwnThFR9oQp+x6WrAsyuRSGaOE8sTJgu
 S/5q/qkCv/0jdpXL/ZSTCJu6ZRAoOTVEMhdbzKaCubYY+UM5lacIE+pkj69nU2B2ej7J
 WGhfCkcLFy+ad56k1X0nvfmAQ7Uo9B0+bePf3LPzku/bSguVCN83dkevffZ2wJcFNPcy
 dm5g==
X-Gm-Message-State: AOAM5304i7G3fTUC9b4T+Id128ox1YRcvBcZASYa8MFmhoKUkRjMT39Z
 PSR9fLFP8QGi8zKF12qZE8H9LyKBFJ0=
X-Google-Smtp-Source: ABdhPJxA75QDU80ZgQg5xkQzSx1nm3kyxW+z0A9XC5ZbUhXy7iq9Ks784whwm3IjgVn63saNlqyw8A==
X-Received: by 2002:a17:906:9a4f:: with SMTP id
 aj15mr6354005ejc.197.1624557873392; 
 Thu, 24 Jun 2021 11:04:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm2436466edt.16.2021.06.24.11.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:04:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] block: try BSD disk size ioctls one after another
Date: Thu, 24 Jun 2021 20:04:21 +0200
Message-Id: <20210624180423.1322165-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624180423.1322165-1-pbonzini@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: mreitz@redhat.com, qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try all the possible ioctls for disk size as long as they are
supported, to keep the #if ladder simple.

Extracted and cleaned up from a patch by Joelle van Dyne and
Warner Losh.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index e56bb491a1..f16d987c07 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2327,39 +2327,37 @@ static int64_t raw_getlength(BlockDriverState *bs)
 again:
 #endif
     if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
+        size = 0;
 #ifdef DIOCGMEDIASIZE
-        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
-#elif defined(DIOCGPART)
-        {
-                struct partinfo pi;
-                if (ioctl(fd, DIOCGPART, &pi) == 0)
-                        size = pi.media_size;
-                else
-                        size = 0;
+        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size)) {
+            size = 0;
+        }
+#endif
+#ifdef DIOCGPART
+        if (size == 0) {
+            struct partinfo pi;
+            if (ioctl(fd, DIOCGPART, &pi) == 0) {
+                size = pi.media_size;
+            }
         }
-        if (size == 0)
 #endif
 #if defined(__APPLE__) && defined(__MACH__)
-        {
+        if (size == 0) {
             uint64_t sectors = 0;
             uint32_t sector_size = 0;
 
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
2.31.1



