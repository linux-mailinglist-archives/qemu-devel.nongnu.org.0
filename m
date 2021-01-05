Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0962EA356
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:27:19 +0100 (CET)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwc46-0007GK-No
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyG-0000nQ-2f; Mon, 04 Jan 2021 21:21:16 -0500
Received: from mail-pf1-f178.google.com ([209.85.210.178]:44168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyA-000218-S4; Mon, 04 Jan 2021 21:21:15 -0500
Received: by mail-pf1-f178.google.com with SMTP id a188so4849795pfa.11;
 Mon, 04 Jan 2021 18:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2beqqzeGhDVR66ppVSfUzIPL472cxrqAoVT6lzv9HXY=;
 b=rLjpICn6GH8KT+vDp+TQE8KpBfzbHPkraC+oh4oWMymr7ZwlXGvyQJKww3rTAxY3H1
 bqxwbRBmSrfgGrG/bmHLSXKoF4UEiNsF0Nv2FNxpE8CUlXqdKLQ6V1Z7gq/t1Vg6nj/6
 gd0g52GXvwuHtIMb66PmcjBH3Ar4qIZf9B2uTU9T77Pk4uxacNve/9d8H9UCcjHv2DW0
 rZ+SS3x5y8EjJP7t66RnfyLzU+nqQKBIF2cMiZmm4bQz6Bo9R8CQ/IjyDs3AP7j16H5Q
 waYujbDBmH8lOOhwtZEfEIB0Aon9qTuPh7Ai7/yqVuPRbjlboCQutj63nCwrklTfQOI9
 Agww==
X-Gm-Message-State: AOAM531Vx/n4X6Zkxx+c2TYut26RznquLqCQfFesY3GlzoSPgfyaentz
 akF7Mrw/J7t/mUJRbwwqnEqN20c8x48=
X-Google-Smtp-Source: ABdhPJyoUpWlEImryPuPMXtw6Auz0GT4ete79/haeGmotxXm2ha+BhzkNUEm5hku+WmM8t2rxSH2hg==
X-Received: by 2002:aa7:8159:0:b029:1a5:54e4:7cf2 with SMTP id
 d25-20020aa781590000b02901a554e47cf2mr45214006pfn.69.1609813266858; 
 Mon, 04 Jan 2021 18:21:06 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.186])
 by smtp.gmail.com with ESMTPSA id y27sm57674386pfr.78.2021.01.04.18.21.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 18:21:06 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 7/7] block: check availablity for preadv/pwritev on mac
Date: Mon,  4 Jan 2021 18:20:55 -0800
Message-Id: <20210105022055.12113-8-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210105022055.12113-1-j@getutm.app>
References: <20210105022055.12113-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.178;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f178.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Joelle van Dyne <j@getutm.app>, "open list:raw" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
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
index 9f556322e6..f109e1f305 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1390,17 +1390,50 @@ static int handle_aiocb_flush(void *opaque)
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


