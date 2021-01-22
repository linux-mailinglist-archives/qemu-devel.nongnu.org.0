Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B6300D86
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:17:13 +0100 (CET)
Received: from localhost ([::1]:59324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32rn-00034D-Vx
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mG-000511-Bi; Fri, 22 Jan 2021 15:11:28 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mE-0004cv-QX; Fri, 22 Jan 2021 15:11:28 -0500
Received: by mail-pf1-f182.google.com with SMTP id i63so4549951pfg.7;
 Fri, 22 Jan 2021 12:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3bgTvyMVaMNKOvbfkCeAjPnu2P94ObpQ3L4Z8LkPIk=;
 b=Y0J4RsFAifHC2lIaWdIBucyYGnMM5ATHnp9xlJsOMyzXElk8htBtXtGc8dPzIYQbBJ
 iTyma/aliTf24pBt2CWPlvPUedIumRZrUGcy8PTk2rDN2iZXGUtnwKg7mIF68KnJ+eg9
 YDGxJsbnVA+7R5cog1uiLJ7EpqLpbXcvj8cqT4HqvDWxJmoQcmkQHROrIb6McWfiAef8
 /UIRl4SixaeYA75z4NXxYfa15LS1bfyljmN7paVydfInt8abw7YWBiZMMc1EeYlCotNd
 7/CV8Yq0RntoQXaqxiuFQswz12wFtaVMxsGSDBWVTLsEzgh633Qzpz14BqZEZYXJS+fg
 tUgg==
X-Gm-Message-State: AOAM533TSvR28oJ51wyvCZ7HvTfEoxptVQaP09Qu/zrJED4WDZ3LUIEZ
 r0H63nhcN2V7Qz3tjGpJwAICgoyZd0U=
X-Google-Smtp-Source: ABdhPJxBrXNtWSd3gd/yJoTymIBbNHd6W04dZW2VpE6niu6fkfTktaNFOPMSuEyTG/zGiyXI8K+QGg==
X-Received: by 2002:a63:749:: with SMTP id 70mr6469704pgh.182.1611346284972;
 Fri, 22 Jan 2021 12:11:24 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:24 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/11] block: check availablity for preadv/pwritev on mac
Date: Fri, 22 Jan 2021 12:11:11 -0800
Message-Id: <20210122201113.63788-10-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.182;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Joelle van Dyne <j@getutm.app>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configure
will succeed with CONFIG_PREADV even when targeting a lower OS version.
We therefore need to check at run time if we can actually use these APIs.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 block/file-posix.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 666d3e7504..6473f84db8 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1386,17 +1386,50 @@ static int handle_aiocb_flush(void *opaque)
 #ifdef CONFIG_PREADV
 
 static bool preadv_present = true;
+static bool preadv_checked;
 
 static ssize_t
 qemu_preadv(int fd, const struct iovec *iov, int nr_iov, off_t offset)
 {
+#ifdef CONFIG_DARWIN /* preadv introduced in macOS 11 */
+    if (unlikely(!preadv_checked)) {
+        if (__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *)) {
+            preadv_checked = true;
+        } else {
+            preadv_present = false;
+            return -ENOSYS;
+        }
+    }
+    /* Now we suppress the availability warning since we use the cached check */
+#pragma clang diagnostic push
+#pragma clang diagnostic ignored "-Wunguarded-availability-new"
+    return preadv(fd, iov, nr_iov, offset);
+#pragma clang diagnostic pop
+#else /* CONFIG_DARWIN */
     return preadv(fd, iov, nr_iov, offset);
+#endif
 }
 
 static ssize_t
 qemu_pwritev(int fd, const struct iovec *iov, int nr_iov, off_t offset)
 {
+#ifdef CONFIG_DARWIN /* preadv introduced in macOS 11 */
+    if (unlikely(!preadv_checked)) {
+        if (__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *)) {
+            preadv_checked = true;
+        } else {
+            preadv_present = false;
+            return -ENOSYS;
+        }
+    }
+    /* Now we suppress the availability warning since we use the cached check */
+#pragma clang diagnostic push
+#pragma clang diagnostic ignored "-Wunguarded-availability-new"
+    return pwritev(fd, iov, nr_iov, offset);
+#pragma clang diagnostic pop
+#else /* CONFIG_DARWIN */
     return pwritev(fd, iov, nr_iov, offset);
+#endif
 }
 
 #else
-- 
2.28.0


