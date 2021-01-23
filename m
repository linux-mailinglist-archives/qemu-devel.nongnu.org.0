Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7531301329
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 06:03:07 +0100 (CET)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B4k-0006tK-Gy
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 00:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayh-0006zL-6B; Fri, 22 Jan 2021 23:56:52 -0500
Received: from mail-pj1-f54.google.com ([209.85.216.54]:55520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayf-0005sm-B0; Fri, 22 Jan 2021 23:56:50 -0500
Received: by mail-pj1-f54.google.com with SMTP id j12so5065549pjy.5;
 Fri, 22 Jan 2021 20:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3bgTvyMVaMNKOvbfkCeAjPnu2P94ObpQ3L4Z8LkPIk=;
 b=ZCsBc1XZxUOkri0ark6D7AZQehDuWJ3fGobnAw2H4ywpUUzRGKDGBsVysajUhH/Jd0
 hnlTxT6KUecVji875Ic+duUjwZJkFhcz1HHEiMAmu3/jQKImFjxILbn01Yv/0oMvnjXM
 lxfzrTwE7cCVrwGRXGR+2hto+y52gwVP1UWocr8lKVzI+i0xZT/ZxSfZ9HEgiYZ7xwmL
 fsoqczdA0asAO8nbUNFRWshilHATaDEfkepYERguT6/EKJTnvuwm/B5hU5vqzf6WB/a9
 xHHvJK9setKbV1odZqAi4byiJ9MfWs9oROXqnbvh9dw5L7C0FtrWy8xDtkpVidCw1e0B
 1/aw==
X-Gm-Message-State: AOAM530EetZO2XeVsE91QeHWsEoBITw1DPTsDW9xR6p2cWbCAPqax4Jk
 WGxZZQnTw3oCuhLpci/81WotnnQrXLE=
X-Google-Smtp-Source: ABdhPJzD0q0CY52pUgDEOAHJ8Uj1xt98INpqDD0Qyzx+4i3sX9UOek389ngBnv2pFNhrokT284L6EA==
X-Received: by 2002:a17:90b:107:: with SMTP id
 p7mr9218673pjz.110.1611377807217; 
 Fri, 22 Jan 2021 20:56:47 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:46 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/11] block: check availablity for preadv/pwritev on mac
Date: Fri, 22 Jan 2021 20:56:30 -0800
Message-Id: <20210123045632.18482-10-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210123045632.18482-1-j@getutm.app>
References: <20210123045632.18482-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.54; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f54.google.com
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


