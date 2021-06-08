Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2B39F793
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:19:27 +0200 (CEST)
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbdf-0002v5-0A
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbb1-00087L-2X; Tue, 08 Jun 2021 09:16:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbay-0001xm-Vd; Tue, 08 Jun 2021 09:16:42 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so1442068wmq.1; 
 Tue, 08 Jun 2021 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ikfSr+R6k78Hz4eiit0nQyTHY92c+5jpIVNQZpw7fc0=;
 b=kJqFIWRjxld/d0eIZwtvpHkKnv7dA3UjThqsW6YZ4/2CZsu2NJYig8wLUZGPsXgOd3
 aqTjPoQfEQWFGV/oB7GJOgoRAqPq6P9YZLGLQuLneo+1q7XcZKSeXNoVNaQbCu36AqnC
 fiKBkrEkKi02UHmKqm7uttOxwKDjZDtqOBGQ8wJasCpEVcXTgZwHlJLUFN7wHjibx296
 0a/PG2q3s+ZzdB0qx1tPVJpcsv5ZA+4pdlPeAH1g3FPbGieSMFCAGE7fySKf0PeBa1QZ
 n+11h/07rltoHxGAJY/3lhV788udQZFeoCJjdj6mRG1K97lK1rxFBflU7QF10/tdUCIF
 i3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ikfSr+R6k78Hz4eiit0nQyTHY92c+5jpIVNQZpw7fc0=;
 b=mTOlpFPMRwMQPpMXbFodGSO6S376uacJ0J1xDo5BdU6dr4wmpnP3c1CNpVJXN70jLv
 E/TIDZxybEBM4tumE1LEqWJkZ0KVzu+m+PK9jUCCqeMIkf+E2Zbazj62wDJOcKcFUD3V
 DYJcgBs1x9RuswnJodqDkmYqiJo5/PmR/0+JWnl8y+4p30XEODVyHw41yhW1E7UFgOJ8
 Pa64DoX6DpbdxGyXDx1LZcCDJrq4YdcF1nCbrAfY1/f3ozfbKA1Br4PnBg95gfa8tYSD
 2q4ghyDGyY8JmAuCbT8Ew8gqpFUJ0F/0E5WCkDlcscwD8HfRl4Ibh6jVMNyrCgUmXvMe
 1TFg==
X-Gm-Message-State: AOAM5324p7Y32vJ5Q4NgMVJRpq0K6DSNiZi8IgZIKypHQFrjScgMYHym
 a7MxcC1UHoUcdFfWD/RZ7VgsgxvMTcpXhg==
X-Google-Smtp-Source: ABdhPJyHZCbgb2MasP0d3LP947Ph+4IeNKQ+IHq8KM0IZQooA078r8+YdOZ8N3YrY7aXTZKyllBVBw==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr21866863wmb.14.1623158199097; 
 Tue, 08 Jun 2021 06:16:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i9sm15855686wrn.54.2021.06.08.06.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 06:16:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Date: Tue,  8 Jun 2021 15:16:31 +0200
Message-Id: <20210608131634.423904-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608131634.423904-1-pbonzini@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bs->sg is only true for character devices, but block devices can also
be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
returns bytes in an int for /dev/sgN devices, and sectors in a short
for block devices, so account for that in the code.

The maximum transfer also need not be a power of 2 (for example I have
seen disks with 1280 KiB maximum transfer) so there's no need to pass
the result through pow2floor.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index c9746d3eb6..1439293f63 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1149,22 +1149,27 @@ static void raw_reopen_abort(BDRVReopenState *state)
     s->reopen_state = NULL;
 }
 
-static int sg_get_max_transfer_length(int fd)
+static int hdev_get_max_hw_transfer(int fd, struct stat *st)
 {
 #ifdef BLKSECTGET
-    int max_bytes = 0;
-
-    if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
-        return max_bytes;
+    if (S_ISBLK(st->st_mode)) {
+        unsigned short max_sectors = 0;
+        if (ioctl(fd, BLKSECTGET, &max_sectors) == 0) {
+            return max_sectors * 512;
+        }
     } else {
-        return -errno;
+        int max_bytes = 0;
+        if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
+            return max_bytes;
+        }
     }
+    return -errno;
 #else
     return -ENOSYS;
 #endif
 }
 
-static int sg_get_max_segments(int fd)
+static int hdev_get_max_segments(int fd, struct stat *st)
 {
 #ifdef CONFIG_LINUX
     char buf[32];
@@ -1173,26 +1178,20 @@ static int sg_get_max_segments(int fd)
     int ret;
     int sysfd = -1;
     long max_segments;
-    struct stat st;
 
-    if (fstat(fd, &st)) {
-        ret = -errno;
-        goto out;
-    }
-
-    if (S_ISCHR(st.st_mode)) {
+    if (S_ISCHR(st->st_mode)) {
         if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
             return ret;
         }
         return -ENOTSUP;
     }
 
-    if (!S_ISBLK(st.st_mode)) {
+    if (!S_ISBLK(st->st_mode)) {
         return -ENOTSUP;
     }
 
     sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
-                                major(st.st_rdev), minor(st.st_rdev));
+                                major(st->st_rdev), minor(st->st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
     if (sysfd == -1) {
         ret = -errno;
@@ -1229,15 +1228,20 @@ out:
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
+    struct stat st;
+
+    if (fstat(s->fd, &st)) {
+        return;
+    }
 
-    if (bs->sg) {
-        int ret = sg_get_max_transfer_length(s->fd);
+    if (bs->sg || S_ISBLK(st.st_mode)) {
+        int ret = hdev_get_max_hw_transfer(s->fd, &st);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-            bs->bl.max_hw_transfer = pow2floor(ret);
+            bs->bl.max_hw_transfer = ret;
         }
 
-        ret = sg_get_max_segments(s->fd);
+        ret = hdev_get_max_segments(s->fd, &st);
         if (ret > 0) {
             bs->bl.max_iov = ret;
         }
-- 
2.31.1



