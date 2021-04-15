Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F853609B1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:45:24 +0200 (CEST)
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1N5-0001hY-4i
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lX1L0-0008IX-5v; Thu, 15 Apr 2021 08:43:14 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lX1Ky-0006Sh-K4; Thu, 15 Apr 2021 08:43:13 -0400
Received: by mail-ej1-x633.google.com with SMTP id g5so29945920ejx.0;
 Thu, 15 Apr 2021 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KPq5K5pOkYBNbeQdAhUzt6rQzCWaAkLUygiBtCaJmHA=;
 b=nLZjeIyUVPa7p55b1QBoZJCw66mV4jjBgvo2gfwz1SOrJNzJ6vYhbX/yhhNCvQBgkl
 bigfh/RWY8adbBGqxDSo6N57gvu3X68a9Rg6s3UIYliNVi6nDxXIuBieFHJCcm0bwhp0
 HEuwAMU2kh/r3HrwRyi640WgSymUm9HGILHasuJzrG1rd9Uzd0AYzz4lynQBRXkgUcCn
 tRJ/XaU8bLLeuAy537tm1W3PJ0aPiFsc0ysNF3pO/ZjBFsOSUAFReBf4b+kTaWKKywvj
 xFaEl6KT9PkL7YdiN1BvfmG6rrAZAh/ztafMFeU+G0il3Mt+a20agH+qmhl4oIOjMQiF
 Fsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KPq5K5pOkYBNbeQdAhUzt6rQzCWaAkLUygiBtCaJmHA=;
 b=PjzLs7OYHva6L7skS0mEH7LWVcqEV2b2pmGLKTVglfMHh0mFTBelak0ikNZyd+mYcK
 JW0DaUUoH2eP7iKMEq/I7TuyhsCJFcZpRn+PXZyGTT5fLPWqbphF5HXuP/VYe6BFwWRL
 zwHVRWan/m0EVcK2XPHeNm2QFLNMV40MNZ9qUHbkTVYBmxLNJL+IZLKhXTSeQLsLrLjQ
 yk/HTIEKEnRLRgH/7nRusCA9zf4HbPG3km81q0+z5MMtTgJi0gmzMM2HWEGoKOC6nC84
 +EFmPA/KoUeNMq7/ttXC4QRHzmBOdvBxbr5MYkkZ3mN2zxqqtXfnAKHJGq+3qrgIHkC0
 aTLQ==
X-Gm-Message-State: AOAM531WxCqZ9mvA1GLk6+5BC5p0GDMtUF5TPClWZuco/S1N+iOpFw0n
 No1oul03LzK9bsjKeQ6T4QCQbI7b5lM=
X-Google-Smtp-Source: ABdhPJxyIgSDvDeiYNdeBJwOl+2EkjIG9bfwgDI9yM9VOgYo3njAPfWMcqpvfF3CA5mzwqlNKwBQLQ==
X-Received: by 2002:a17:906:3d41:: with SMTP id
 q1mr3171095ejf.282.1618490590976; 
 Thu, 15 Apr 2021 05:43:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r10sm1862585ejd.112.2021.04.15.05.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:43:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Date: Thu, 15 Apr 2021 14:43:06 +0200
Message-Id: <20210415124307.428203-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210415124307.428203-1-pbonzini@redhat.com>
References: <20210415124307.428203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: fam@euphon.net, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bs->sg is only true for character devices, but block devices can also
be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
returns bytes for /dev/sgN devices and sectors for block devices, so
account for that in the code.

The maximum transfer also need not be a power of 2 (for example I have
seen disks with 1280 KiB maximum transfer) so there's no need to pass
the result through pow2floor.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 9e316a2a97..e37a6bb8de 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1173,13 +1173,13 @@ static void raw_reopen_abort(BDRVReopenState *state)
     s->reopen_state = NULL;
 }
 
-static int sg_get_max_transfer_length(int fd)
+static int sg_get_max_transfer_length(int fd, struct stat *st)
 {
 #ifdef BLKSECTGET
     int max_bytes = 0;
 
     if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
-        return max_bytes;
+        return S_ISBLK(st->st_mode) ? max_bytes * 512 : max_bytes;
     } else {
         return -errno;
     }
@@ -1188,7 +1188,7 @@ static int sg_get_max_transfer_length(int fd)
 #endif
 }
 
-static int sg_get_max_segments(int fd)
+static int sg_get_max_segments(int fd, struct stat *st)
 {
 #ifdef CONFIG_LINUX
     char buf[32];
@@ -1197,15 +1197,9 @@ static int sg_get_max_segments(int fd)
     int ret;
     int sysfd = -1;
     long max_segments;
-    struct stat st;
-
-    if (fstat(fd, &st)) {
-        ret = -errno;
-        goto out;
-    }
 
     sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
-                                major(st.st_rdev), minor(st.st_rdev));
+                                major(st->st_rdev), minor(st->st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
     if (sysfd == -1) {
         ret = -errno;
@@ -1242,15 +1236,20 @@ out:
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
+        int ret = sg_get_max_transfer_length(s->fd, &st);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-            bs->bl.max_transfer = pow2floor(ret);
+            bs->bl.max_transfer = ret;
         }
 
-        ret = sg_get_max_segments(s->fd);
+        ret = sg_get_max_segments(s->fd, &st);
         if (ret > 0) {
             bs->bl.max_iov = ret;
         }
-- 
2.30.1



