Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191211A4E56
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Apr 2020 08:26:16 +0200 (CEST)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jN9ao-0000ge-Nx
	for lists+qemu-devel@lfdr.de; Sat, 11 Apr 2020 02:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <catherine.hecx@gmail.com>) id 1jN9Zt-00008W-Jv
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 02:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <catherine.hecx@gmail.com>) id 1jN9Zs-0000G5-Jw
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 02:25:17 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:46361)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <catherine.hecx@gmail.com>)
 id 1jN9Zs-0000Fa-AQ
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 02:25:16 -0400
Received: by mail-qk1-x743.google.com with SMTP id g74so4253415qke.13
 for <qemu-devel@nongnu.org>; Fri, 10 Apr 2020 23:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GzzuzoJO5dzeQyXnKq8icvH6vIhlp30+SlHLfpaP/gY=;
 b=ejgvmyD1JskgBcdZLwwxIqtwFHZ7rC+vPsOEso4o8uMEiATvBZCRcZqOMZTi4EqMjh
 9L9Aq4efvBJvxW3TEXrXbew+kQ3TAeTkJIKZtaDuRFisdI9UrR1G3smNIfR7RRP5s0n6
 UlFdPinTpt5mvUZG15qm6jz1CCpGARjWgiKU+RDU+qSmcOUZC1RJjPBVBEfL3dk0/s7Z
 PgYhp7Hp8pHTsVr9feK7giK4JXGCbqBZB9psCXXkCkgZbc9YkQP2Ebmt9VxuXYo5iMY2
 NttClR1uptGwOywEc1IaAdP4AfVZBj1IPcI5r5ilHvwCbQt5AyB6xO6+BDmbFEJ6rTaE
 RZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GzzuzoJO5dzeQyXnKq8icvH6vIhlp30+SlHLfpaP/gY=;
 b=jVVn7nz1kIiTGNxMTnlrnahL1aULTDP+Hgi40+6GaxijQKgrL0a2NP2cEfsdNC9Fq7
 F74XApy5rDP284C61uWZK/Fbw0lgmBEfeEf98LKip+3+hPjqrXubjcyskCgKTV5uPdZu
 wZ4sxjRA0/uKwvy4p9xbB3yKTSin96WG8D4Elg3NByLLFH0fU2aCPTV5yMC/bxOLLr/A
 y5ZhdRb8QIsPv1wR1+ZwVAgifmyCe6dfnxk+CUhWT2HnAxaPNQgaObD5c/59B3NWc7qr
 WxiyVxkIpYi+2vnlGKPTRAKxLvX+wGPQ05So3If6Ll3rwoF0rmulSKlMWmFozZxpocds
 NgJQ==
X-Gm-Message-State: AGi0PuaPsKFGH7gJUOpmI6CuIMhaA52dTQVOgJtUghmc69diPdLW3I1q
 25YHk584aKdJMlUykrB/W5g=
X-Google-Smtp-Source: APiQypKZCEhKj1pPo6WtNY5eaf61hSrM/8cGaXWWAEXHqsYUv7sqoKKdPcDRYXmsA8ufAxi29CIFNQ==
X-Received: by 2002:a05:620a:15f4:: with SMTP id
 p20mr7058116qkm.496.1586586315225; 
 Fri, 10 Apr 2020 23:25:15 -0700 (PDT)
Received: from host.localdomain ([104.129.187.94])
 by smtp.gmail.com with ESMTPSA id z18sm3432044qtz.77.2020.04.10.23.25.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Apr 2020 23:25:14 -0700 (PDT)
From: Catherine Ho <catherine.hecx@gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH] virtiofsd/passthrough_ll: don't remove O_DIRECT when
 cache=none
Date: Sat, 11 Apr 2020 02:19:57 -0400
Message-Id: <1586585997-24446-1-git-send-email-catherine.hecx@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
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
Cc: Catherine Ho <catherine.hecx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cache=none means to bypass host cache. So we can't remove O_DIRECT flag in
unconditionally in update_open_flags();

Signed-off-by: Catherine Ho <catherine.hecx@gmail.com>
---
 tools/virtiofsd/passthrough_ll.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 4c35c95..889e144 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1677,7 +1677,8 @@ static void lo_releasedir(fuse_req_t req, fuse_ino_t ino,
     fuse_reply_err(req, 0);
 }
 
-static void update_open_flags(int writeback, struct fuse_file_info *fi)
+static void update_open_flags(int writeback, int cache_mode,
+                              struct fuse_file_info *fi)
 {
     /*
      * With writeback cache, kernel may send read requests even
@@ -1702,10 +1703,13 @@ static void update_open_flags(int writeback, struct fuse_file_info *fi)
 
     /*
      * O_DIRECT in guest should not necessarily mean bypassing page
-     * cache on host as well. If somebody needs that behavior, it
-     * probably should be a configuration knob in daemon.
+     * cache on host as well. If cache=none, set the flag to O_DIRECT
      */
-    fi->flags &= ~O_DIRECT;
+    if (cache_mode == CACHE_NONE) {
+        fi->flags |= O_DIRECT;
+    } else {
+        fi->flags &= ~O_DIRECT;
+    }
 }
 
 static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
@@ -1737,7 +1741,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
         goto out;
     }
 
-    update_open_flags(lo->writeback, fi);
+    update_open_flags(lo->writeback, lo->cache, fi);
 
     fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
                 mode);
@@ -1947,7 +1951,7 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
     fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
              fi->flags);
 
-    update_open_flags(lo->writeback, fi);
+    update_open_flags(lo->writeback, lo->cache, fi);
 
     sprintf(buf, "%i", lo_fd(req, ino));
     fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
-- 
1.7.1


