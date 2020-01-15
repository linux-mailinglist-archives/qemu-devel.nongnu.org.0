Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5388613BA49
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 08:22:11 +0100 (CET)
Received: from localhost ([::1]:50462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ird0D-00029e-U1
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 02:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1ircyt-00019M-4L
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 02:20:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1ircyo-0001dS-QU
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 02:20:46 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:46742 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1ircyo-0001Tc-Fl; Wed, 15 Jan 2020 02:20:42 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 32628D11D13B8F2C3707;
 Wed, 15 Jan 2020 15:20:29 +0800 (CST)
Received: from HGHY4C002233111.china.huawei.com (10.133.205.93) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Wed, 15 Jan 2020 15:20:20 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <dgilbert@redhat.com>
Subject: [PATCH] monitor: fix memory leak in monitor_fdset_dup_fd_find_remove
Date: Wed, 15 Jan 2020 15:20:16 +0800
Message-ID: <20200115072016.167252-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: qemu-trivial@nongnu.org, Chen Qun <kuhn.chenqun@huawei.com>,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

When remove dup_fd in monitor_fdset_dup_fd_find_remove function,
we need to free mon_fdset_fd_dup. ASAN shows memory leak stack:

Direct leak of 96 byte(s) in 3 object(s) allocated from:
    #0 0xfffd37b033b3 in __interceptor_calloc (/lib64/libasan.so.4+0xd33b3)
    #1 0xfffd375c71cb in g_malloc0 (/lib64/libglib-2.0.so.0+0x571cb)
    #2 0xaaae25bf1c17 in monitor_fdset_dup_fd_add /qemu/monitor/misc.c:1724
    #3 0xaaae265cfd8f in qemu_open /qemu/util/osdep.c:315
    #4 0xaaae264e2b2b in qmp_chardev_open_file_source /qemu/chardev/char-fd.c:122
    #5 0xaaae264e47cf in qmp_chardev_open_file /qemu/chardev/char-file.c:81
    #6 0xaaae264e118b in qemu_char_open /qemu/chardev/char.c:237
    #7 0xaaae264e118b in qemu_chardev_new /qemu/chardev/char.c:964
    #8 0xaaae264e1543 in qemu_chr_new_from_opts /qemu/chardev/char.c:680
    #9 0xaaae25e12e0f in chardev_init_func /qemu/vl.c:2083
    #10 0xaaae26603823 in qemu_opts_foreach /qemu/util/qemu-option.c:1170
    #11 0xaaae258c9787 in main /qemu/vl.c:4089
    #12 0xfffd35b80b9f in __libc_start_main (/lib64/libc.so.6+0x20b9f)
    #13 0xaaae258d7b63  (/qemu/build/aarch64-softmmu/qemu-system-aarch64+0x8b7b63)

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 monitor/misc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/monitor/misc.c b/monitor/misc.c
index a04d7edde0..cf79d36100 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1744,6 +1744,7 @@ static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
             if (mon_fdset_fd_dup->fd == dup_fd) {
                 if (remove) {
                     QLIST_REMOVE(mon_fdset_fd_dup, next);
+                    g_free(mon_fdset_fd_dup);
                     if (QLIST_EMPTY(&mon_fdset->dup_fds)) {
                         monitor_fdset_cleanup(mon_fdset);
                     }
-- 
2.23.0



