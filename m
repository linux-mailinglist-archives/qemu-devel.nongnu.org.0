Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1896632F244
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:19:16 +0100 (CET)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF2h-0003Au-53
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsurbayrole@quarkslab.com>)
 id 1lIEJ7-0007vn-II
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:32:09 -0500
Received: from mx5.quarkslab.com ([163.172.30.93]:51940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsurbayrole@quarkslab.com>)
 id 1lIEJ3-0004PK-9k
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:32:08 -0500
Received: from localhost.localdomain (143.68.31.93.rev.sfr.net [93.31.68.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by mx5.quarkslab.com (Postfix) with ESMTPSA id 4DsZYB1rgCz7sfM;
 Fri,  5 Mar 2021 18:31:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quarkslab.com;
 s=mail; t=1614965518;
 bh=ej8mXFyq1S3fLjunoOjVkx+WEWcZkAKvpzvj9k1PIz8=;
 h=From:To:Cc:Subject:Date:Reply-To;
 b=Yis7fVK+tqthSEyN6dRJaUDzEYf6WrO+7/RLuPqgo7kzJpHZGR1YxjM9PbjYcLMqo
 WnBnuz/GtRI4GWssWQDvgrAhmzj+hJbEz502utETT6YpHhp8BTTV1RvAWrPEHm9RLg
 5IKc8ZOAT7wuuQPJuDYfNWjuLBZsz00dBt/LeIxc=
From: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Fix executable page of /proc/self/maps
Date: Fri,  5 Mar 2021 18:31:44 +0100
Message-Id: <20210305173144.874378-1-nsurbayrole@quarkslab.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=163.172.30.93;
 envelope-from=nsurbayrole@quarkslab.com; helo=mx5.quarkslab.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: laurent@vivier.eu
Cc: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The guest binary and libraries are not always mapped with the
executable bit in the host process. The guest may read a
/proc/self/maps with no executable address range. The
patch bases the perm fields against the guest permission inside
Qemu.

Signed-off-by: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
---
 linux-user/syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 389ec09764..77c40a274f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7888,9 +7888,9 @@ static int open_self_maps(void *cpu_env, int fd)
             count = dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT_ptr
                             " %c%c%c%c %08" PRIx64 " %s %"PRId64,
                             h2g(min), h2g(max - 1) + 1,
-                            e->is_read ? 'r' : '-',
-                            e->is_write ? 'w' : '-',
-                            e->is_exec ? 'x' : '-',
+                            (flags & PROT_READ) ? 'r' : '-',
+                            (flags & PROT_WRITE) ? 'w' : '-',
+                            (flags & PROT_EXEC) ? 'x' : '-',
                             e->is_priv ? 'p' : '-',
                             (uint64_t) e->offset, e->dev, e->inode);
             if (path) {
-- 
2.30.1

When trying to used Qemu on amd64 host to run aarch64 binary, I've reached 
an issue with /proc/self/maps.

$ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes 
$ docker run --rm -it arm64v8/ubuntu cat /proc/self/maps
5500000000-5500008000 r--p 00000000 fe:06 141788774                      /usr/bin/cat
5500008000-5500017000 ---p 00000000 00:00 0
5500017000-5500018000 r--p 00007000 fe:06 141788774                      /usr/bin/cat
5500018000-5500019000 rw-p 00008000 fe:06 141788774                      /usr/bin/cat
5500019000-550003a000 rw-p 00000000 00:00 0
5501019000-550101a000 ---p 00000000 00:00 0
550101a000-550181a000 rw-p 00000000 00:00 0                              [stack]
550181a000-550183b000 r--p 00000000 fe:06 134329967                      /usr/lib/aarch64-linux-gnu/ld-2.31.so
550183b000-550184b000 ---p 00000000 00:00 0
550184b000-550184c000 r--p 00021000 fe:06 134329967                      /usr/lib/aarch64-linux-gnu/ld-2.31.so
550184c000-550184e000 rw-p 00022000 fe:06 134329967                      /usr/lib/aarch64-linux-gnu/ld-2.31.so
5501850000-55019a9000 r--p 00000000 fe:06 134344388                      /usr/lib/aarch64-linux-gnu/libc-2.31.so
55019a9000-55019b8000 ---p 00159000 fe:06 134344388                      /usr/lib/aarch64-linux-gnu/libc-2.31.so
55019b8000-55019bb000 r--p 00158000 fe:06 134344388                      /usr/lib/aarch64-linux-gnu/libc-2.31.so
55019bb000-55019be000 rw-p 0015b000 fe:06 134344388                      /usr/lib/aarch64-linux-gnu/libc-2.31.so
55019be000-55019c3000 rw-p 00000000 00:00 0

No executable page is available. The same result is observed with the 
last master commit. I think the perm fields should be based on 
the guest permission inside Qemu, but I'd be happy to hear the rational against this.


