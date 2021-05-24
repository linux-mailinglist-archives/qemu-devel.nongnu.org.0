Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4338F1D9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:57:17 +0200 (CEST)
Received: from localhost ([::1]:59966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDtE-0001Ul-9H
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZW-0007El-ME; Mon, 24 May 2021 12:36:55 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZV-0002o0-1q; Mon, 24 May 2021 12:36:54 -0400
Received: by mail-ed1-x536.google.com with SMTP id b17so32752592ede.0;
 Mon, 24 May 2021 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J4uFbK1t87t3yE0My/WwkVODQQO6taRX0FVG5vrflTQ=;
 b=eP65eK+uSkEvfyUl9Ny+71ANhXbWPpNMGho2aQ6VfrFRZimqG6dLZdC5ZF9ertN3Ci
 vqedzIX4azAFLU9VfGpF/weC530GhO9faVY4e2gFHKcfT634W9RSdADimnwBOCHzwKhu
 cZI9c1bwP38vacSgZlaYABkSE3ic6DMF6v0bDA5zF0/jb1/1Bgs1CFfEbyTCtTvGQIoT
 axK49XzmUVCfaxM9SBVd31b1VbOKLH9iTf4cJ1TmNe5m3apJpUaP6FcgRqbyp01Dw9Bx
 YHokBvo9v8ZGkWNKdW1j7QQ2y1tIfALmjYT7yOD+WBIe6KCGDzab01OPB5Rd1uK4fp8M
 D7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J4uFbK1t87t3yE0My/WwkVODQQO6taRX0FVG5vrflTQ=;
 b=TmQo89MzeNF8KXPuPwiKyi+yVbMR4o3nfDlsSKVdIo9ipURRzfsRnDI2G/T/n0Sw14
 T6Y++rhDotNVz3PLG0Cx3wF93P8cDj2kJWIpKNfqs63vOsWgH4Fg5CJES8pB2Ja2cItq
 RXAAKRyXlz/E0Witc34SDz1ZkLP+nq77gJ5LQ3enczER01NCtwgB4lZvJ+aq6P51s5W1
 3MGE+wobhwdz7EWxw1TGCmOw36FG9uhwqFZOii1jHOO/IJQM6w3LgKnUH0iK0Urh44vD
 tucjtOmDixMAylMWM4QfIKURY4JzjS1fYvw9pUsUoGFOse6qUYkjIPNbQvLVMsmEoiUg
 ObUA==
X-Gm-Message-State: AOAM533k+S4Ne0hDcGWYkHklRX3n/QEvJOH6F4KphxxqzIxX4Dszrg3B
 uZQBfZ5SLJPulstT4du6bLSaeShA8k9pCg==
X-Google-Smtp-Source: ABdhPJy+JRfjkiP4KQxWcbX09dlRXvlUmDcmcmRZ8T72OAqsSeziHyD5VBLsRV7tGuiplx0KxF5KSg==
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr25774073edr.144.1621874211294; 
 Mon, 24 May 2021 09:36:51 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n8sm7967684ejl.0.2021.05.24.09.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:36:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
Date: Mon, 24 May 2021 18:36:45 +0200
Message-Id: <20210524163645.382940-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524163645.382940-1-pbonzini@redhat.com>
References: <20210524163645.382940-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Warner Losh <imp@bsdimp.com>, Joelle van Dyne <j@getutm.app>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

iOS hosts do not have these defined so we fallback to the
default behaviour.

Co-authored-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20210315180341.31638-4-j@getutm.app>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index e83f34a960..34bd413553 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2311,8 +2311,11 @@ static int64_t raw_getlength(BlockDriverState *bs)
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
@@ -2321,9 +2324,7 @@ again:
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
@@ -2331,19 +2332,15 @@ again:
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


