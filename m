Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822CF39F7C2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:24:29 +0200 (CEST)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbiW-0004rp-Ji
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbb2-0008Dp-N4; Tue, 08 Jun 2021 09:16:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbb1-0001zx-04; Tue, 08 Jun 2021 09:16:44 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so1442170wmq.1; 
 Tue, 08 Jun 2021 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zbEKtWwYtPu17XYhL91Y3v+VjithiK8Jl8+pLNVJebs=;
 b=B34ocfF6yZbf7UUiTswjm+rFTaQEeiK39tg8gADUCqYBW35ZybKnjALh90kg8VQaf1
 7P8RTUng90WiayY4DljsW4Rf3W7pJOAQuzdPt6mdLxE7NBZegf+ER7GL+iG+yOtAnbdi
 d+sksBl7NedyM9bY21Z9NvuKqmGbQbNeQRR6F54wQ2jvDFi+RBg/yJ9gMD1YKph0Bgga
 wxnqXVUGsh6TMD+fYIK1aqsLt1Gf/YZZphrxveuuIAFOB4d1cruRzB69yScyP1X+RFiP
 2WZyfjykyankPPfjmrrIC5UG5LoJHarWvPLYZAm4CmPfum0MAfdzmPp3jp+LikpbHVxo
 04Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zbEKtWwYtPu17XYhL91Y3v+VjithiK8Jl8+pLNVJebs=;
 b=YGHbnUx+Swy/LMEDivDU0W+5Rz5ELsxqYI2nZ4gm69bgLzi68mvXHuAG9+RFwyHLEq
 RQa6qystiELBQaT260PTdDWntbOcaSZYIyDdWb7qEJn6XMY/rMyL7RBTCPSinlUHvBzI
 4mF6W+ZKjIulWU5kGoHyE1hwpkNpWqvvWHbka99cArbNkGyELbWFc691XJfbepNirEoS
 tUUjRzxbx3s+OiFusM0rRvaz8trCBiUbelhLt8/kekYDzyS5zT3kyTJXjqNIc0jNfSoB
 8QTaDRe1yWvxil1VePeGNdFg5UBrFAOOMCR4MQng+V1nK+Icxjm4Fq8Fssmks4SD9qSe
 cEKw==
X-Gm-Message-State: AOAM532C3Zg2vgYGVpeROZxgkyKn5Hgw+WtOaQNWhMPBrbuzVXrbZV0C
 LnvS/h4viVRN5bgxKMDm8CByCyk8coMo4g==
X-Google-Smtp-Source: ABdhPJx/d9RM/dC6+AvC2Z0RLKaSXob4cmqfu0FUO/1rvctbRhsNl2weDqss7Csbi7SYQCAu4wDCXA==
X-Received: by 2002:a05:600c:1c0b:: with SMTP id
 j11mr22314007wms.139.1623158201398; 
 Tue, 08 Jun 2021 06:16:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i9sm15855686wrn.54.2021.06.08.06.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 06:16:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/7] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
Date: Tue,  8 Jun 2021 15:16:34 +0200
Message-Id: <20210608131634.423904-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608131634.423904-1-pbonzini@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Joelle van Dyne <j@getutm.app>, Warner Losh <imp@bsdimp.com>
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
index 5821e1afed..4e2f7cf508 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2322,8 +2322,11 @@ static int64_t raw_getlength(BlockDriverState *bs)
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
@@ -2332,9 +2335,7 @@ again:
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
@@ -2342,19 +2343,15 @@ again:
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


