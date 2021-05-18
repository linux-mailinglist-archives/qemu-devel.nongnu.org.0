Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45B38743A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:42:44 +0200 (CEST)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livJL-00073C-7L
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFw-0003ax-Bs; Tue, 18 May 2021 04:39:12 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFu-00049Q-RW; Tue, 18 May 2021 04:39:12 -0400
Received: by mail-wr1-x433.google.com with SMTP id d11so9216259wrw.8;
 Tue, 18 May 2021 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J4uFbK1t87t3yE0My/WwkVODQQO6taRX0FVG5vrflTQ=;
 b=emMpfbmK+hiPZt1z/b571kZP6uiN6NrQFpGfjPfiljSvfko51AV1TD+UbnCBbrkbm3
 YBp399AaUrOXkC6SRWPm7tH4R0IAGJecZ7BIOMxRwZhXgC+EVnlwqoBmtsAGcVxCir8Z
 bOgWoqt6jQHR0h7iAJRa7aQSTRzwxZX0DPx99iMEhB18et+HDqlWkwjGUYdqgO1UHfSE
 i0rO2kSle7sSYU6sYcwF5FoaYqEHYOKLCtp79uq78DC9a7VsZpWPAyZOpZJvFikNXJ45
 Al9Y85FCTfuGD5CCtFZzI8g7KI34kFTU3fborFwQRw8zGDYqaa3G1cjnRtk0IkKC8h1t
 JXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J4uFbK1t87t3yE0My/WwkVODQQO6taRX0FVG5vrflTQ=;
 b=PVdi0N72C7OJGo1sp/LweolwWXxs7IFGQdX16rYqYxic7wp5hA70aEd7MbdTljKg82
 /f5rh6rSGrSUocJ8v2E1ikuj0WGwgZFvHyte1FwAHlTT63tFYAwhYWSNCFu8/htyKEXJ
 84VHbqWhwSCFciKXL+gB7an7n6FwCPCpGbsOQReyU7ZQvsuurF+Ukp/2g4cE4zKBeAmh
 FbPwP+hFpOunwS2UdB1mnKNhH9O8AkjPvWJaWJu3IBRfXgvVbYv5QVIfYU85/kSzCsUQ
 cNPJuwZqwf9zSA0DHN6avm+onj+aR6yFQ7g6f0aYKDak4/1XBrwqgySsoDCEj2JSGVF3
 4Hqg==
X-Gm-Message-State: AOAM531eVJZYueC98FdowNf4QYuYmBO2IKDAPWdvKY4kQ48/CtFYTxNV
 CL4tdRFSkiFYCOsw08J7Rn3AcDxA0JiQlw==
X-Google-Smtp-Source: ABdhPJwDeUZf/RaJ3zcH0f+f+VAJscf9UqyhZ03BmbSaB0NA6PMgL6eGYF5cLzzoevuV9YK/KVnL/g==
X-Received: by 2002:a05:6000:1863:: with SMTP id
 d3mr5343072wri.126.1621327145427; 
 Tue, 18 May 2021 01:39:05 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y6sm70959wmy.23.2021.05.18.01.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:39:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
Date: Tue, 18 May 2021 10:39:01 +0200
Message-Id: <20210518083901.97369-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518083901.97369-1-pbonzini@redhat.com>
References: <20210518083901.97369-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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


