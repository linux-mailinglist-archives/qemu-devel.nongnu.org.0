Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4813B45B1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:36:30 +0200 (CEST)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmwX-0000tV-KN
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfM-0003Sa-Lt
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:44 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfL-0003FS-14
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:44 -0400
Received: by mail-ej1-x634.google.com with SMTP id bu12so15473182ejb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d05PnkwnuDECdWXUS+gfsGR0SVTVhh2B+agXt5vsNfs=;
 b=qKybzW8UTWTBlL7mMnlOb9xLKBBvCIktVl7LZ6RPp476EiuuDtDZ9Nm8705LrVCXT5
 DQlhYwX0Gqqdyvp7dNuLdPp8TpXhS4SPurEUy5IT2kV3TADfhNyCFR4t6pCLQlsMui6R
 8yxddqUpnLZpReY8vpC2i2H/vuL9DCt3iumpDPuwqP7UtLkG0lwz9G+5HeP0UguLPRW6
 ieZRn6CoaUOngFJNW5D1RSoh+2XMOlmGoMwh3M+pebPVACJb4jcUnEDhnxz8XdJMsNw7
 UwbgHiQeQo5+qktb3FVqkPtRo8lqwCP9jGqHu74PEz4tZUAbGdV+SXvV9/ejyTOFwsWl
 E8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d05PnkwnuDECdWXUS+gfsGR0SVTVhh2B+agXt5vsNfs=;
 b=AAhsaqiTEjfaIBwi5QjZ3BWCbUwy+1PVxkrYGftaXPIg1aUct6AV7NSHxPpNJr6RZH
 nha91WpRrdRX8eQXKF4pbYGh09jwL5XVeHHvN6FCHsCa10K7gIXZelQ4+FCMWBdgZRu3
 5Dz+fDODBKjjzkl98k7GH5hib6C0zOsW85rLLEJcXHjChS4pIhp/rwBSYgjNn7gWcT1G
 e5Dk/aJYURrBZsm41UnugeiX5IE7uthEG/dL1s5IO9U4fuzV4xUAX3C6DuT6OVJb36yo
 UerE3lvAcboF0M+atH1PPKnnT7+nMGomEQbmCbXOuVJm4hjNu3L9f9QwLHcSDOKaFinY
 iIYw==
X-Gm-Message-State: AOAM532PjUNGCP9khwAA7xmfHHgvM/dt56Fhes6enrL4Sz5eDi5pw4Pz
 xtxZZKXswky6XcgRajd0HNm40GUIq0E=
X-Google-Smtp-Source: ABdhPJxc0B4SYWXdYW8tKhHhCCvc/d0ipDJS+jCXfKlOhDWbVQRXWCK4aFOKr/cnY5XpALNi7UytLQ==
X-Received: by 2002:a17:906:3845:: with SMTP id
 w5mr11121374ejc.466.1624630721628; 
 Fri, 25 Jun 2021 07:18:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/28] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Date: Fri, 25 Jun 2021 16:18:12 +0200
Message-Id: <20210625141822.1368639-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
 block/file-posix.c | 67 ++++++++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 88e58d2863..ea102483b0 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1147,22 +1147,27 @@ static void raw_reopen_abort(BDRVReopenState *state)
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
@@ -1171,26 +1176,20 @@ static int sg_get_max_segments(int fd)
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
@@ -1227,23 +1226,33 @@ out:
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
-
-    if (bs->sg) {
-        int ret = sg_get_max_transfer_length(s->fd);
-
-        if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
-            bs->bl.max_hw_transfer = pow2floor(ret);
-        }
-
-        ret = sg_get_max_segments(s->fd);
-        if (ret > 0) {
-            bs->bl.max_iov = ret;
-        }
-    }
+    struct stat st;
 
     raw_probe_alignment(bs, s->fd, errp);
     bs->bl.min_mem_alignment = s->buf_align;
     bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
+
+    /*
+     * Maximum transfers are best effort, so it is okay to ignore any
+     * errors.  That said, based on the man page errors in fstat would be
+     * very much unexpected; the only possible case seems to be ENOMEM.
+     */
+    if (fstat(s->fd, &st)) {
+        return;
+    }
+
+    if (bs->sg || S_ISBLK(st.st_mode)) {
+        int ret = hdev_get_max_hw_transfer(s->fd, &st);
+
+        if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
+            bs->bl.max_hw_transfer = ret;
+        }
+
+        ret = hdev_get_max_segments(s->fd, &st);
+        if (ret > 0) {
+            bs->bl.max_iov = ret;
+        }
+    }
 }
 
 static int check_for_dasd(int fd)
-- 
2.31.1



