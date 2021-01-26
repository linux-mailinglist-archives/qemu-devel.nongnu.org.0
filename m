Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5517930315A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:38:23 +0100 (CET)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DJG-0006XM-9D
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6Z-0005gR-9H; Mon, 25 Jan 2021 20:25:23 -0500
Received: from mail-pl1-f177.google.com ([209.85.214.177]:42719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6V-0006Am-GA; Mon, 25 Jan 2021 20:25:14 -0500
Received: by mail-pl1-f177.google.com with SMTP id s15so8752881plr.9;
 Mon, 25 Jan 2021 17:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3bgTvyMVaMNKOvbfkCeAjPnu2P94ObpQ3L4Z8LkPIk=;
 b=SYnXUtKRB7/LC1fOxpyz84XTZ/oSDUqH0qLueMEyrOoRg5/eus797NHb+4k02JJMit
 1sMSmUQa/hE4PmGXxVXE2GeZRBtj/J/zf8GuZmdXw/bfObAU1PNL1szScE0ZMAgGe+39
 N+oYxgGxdlF87rrkgoZCT+8JH/B8dZCL5QkKbIZJKyDPBw3fCBPNYfdAG21fsLQiTJPz
 BuSb6+WmFmwB/Xmt6ecDrbSTF83WO1r0RXjBWxTsI9ordgQ2mOBaqnP+QkYsGmd1N7/B
 u45VW2sdK7fQq1ZuCvYZLvlP85XNTOV4WHRQS9GyIC6iUO/Sszj/WztlIskM55zMUcy4
 Alzw==
X-Gm-Message-State: AOAM530nw+KIKymNI9vxMdabG/40aJXYclTk5mqW0uZa2mHDQYmAl+xE
 XtbTNbhLTl7osXUPP02r8HDjH3GrUMI=
X-Google-Smtp-Source: ABdhPJyKKMRn0HYFtKap+uZVeCjOIwGAZolK2QJ18x5mqYpRdFw1dEpjbuixpWXJ54LThVzzo5gxrA==
X-Received: by 2002:a17:90b:224f:: with SMTP id
 hk15mr3161546pjb.31.1611624308711; 
 Mon, 25 Jan 2021 17:25:08 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:08 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 09/11] block: check availablity for preadv/pwritev on mac
Date: Mon, 25 Jan 2021 17:24:55 -0800
Message-Id: <20210126012457.39046-10-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.177;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


