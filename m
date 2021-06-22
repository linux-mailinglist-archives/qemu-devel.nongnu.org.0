Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0693B05A5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:14:00 +0200 (CEST)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgE3-0004ml-EN
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linfeng23@huawei.com>)
 id 1lveO8-0000vr-3l
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:16:16 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linfeng23@huawei.com>)
 id 1lveNw-00008E-SA
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:16:09 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G8NyB53Rwz71H0;
 Tue, 22 Jun 2021 19:11:46 +0800 (CST)
Received: from dggema768-chm.china.huawei.com (10.1.198.210) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 19:15:52 +0800
Received: from localhost (10.174.151.75) by dggema768-chm.china.huawei.com
 (10.1.198.210) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 22
 Jun 2021 19:15:51 +0800
From: Lin Feng <linfeng23@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] migration: fix the memory overwriting risk in add_to_iovec
Date: Tue, 22 Jun 2021 19:15:49 +0800
Message-ID: <20210622111549.490-1-linfeng23@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.151.75]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema768-chm.china.huawei.com (10.1.198.210)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=linfeng23@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Jun 2021 09:12:36 -0400
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
Cc: wangxinxin.wang@huawei.com, Feng Lin <linfeng23@huawei.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Feng Lin <linfeng23@huawei.com>

When testing migration, a Segmentation fault qemu core is generated.
0  error_free (err=0x1)
1  0x00007f8b862df647 in qemu_fclose (f=f@entry=0x55e06c247640)
2  0x00007f8b8516d59a in migrate_fd_cleanup (s=s@entry=0x55e06c0e1ef0)
3  0x00007f8b8516d66c in migrate_fd_cleanup_bh (opaque=0x55e06c0e1ef0)
4  0x00007f8b8626a47f in aio_bh_poll (ctx=ctx@entry=0x55e06b5a16d0)
5  0x00007f8b8626e71f in aio_dispatch (ctx=0x55e06b5a16d0)
6  0x00007f8b8626a33d in aio_ctx_dispatch (source=<optimized out>, callback=<optimized out>, user_data=<optimized out>)
7  0x00007f8b866bdba4 in g_main_context_dispatch ()
8  0x00007f8b8626cde9 in glib_pollfds_poll ()
9  0x00007f8b8626ce62 in os_host_main_loop_wait (timeout=<optimized out>)
10 0x00007f8b8626cffd in main_loop_wait (nonblocking=nonblocking@entry=0)
11 0x00007f8b862ef01f in main_loop ()
Using gdb print the struct QEMUFile f = {
  ...,
  iovcnt = 65, last_error = 21984,
  last_error_obj = 0x1, shutdown = true
}
Well iovcnt is overflow, because the max size of MAX_IOV_SIZE is 64.
struct QEMUFile {
    ...;
    struct iovec iov[MAX_IOV_SIZE];
    unsigned int iovcnt;
    int last_error;
    Error *last_error_obj;
    bool shutdown;
};
iovcnt and last_error is overwrited by add_to_iovec().
Right now, add_to_iovec() increase iovcnt before check the limit.
And it seems that add_to_iovec() assumes that iovcnt will set to zero
in qemu_fflush(). But qemu_fflush() will directly return when f->shutdown
is true.

The situation may occur when libvirtd restart during migration, after
f->shutdown is set, before calling qemu_file_set_error() in
qemu_file_shutdown().

So the safiest way is checking the iovcnt before increasing it.

Signed-off-by: Feng Lin <linfeng23@huawei.com>
---
 migration/qemu-file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index d6e03dbc0e..3dde1a193c 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -419,8 +419,10 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
         if (may_free) {
             set_bit(f->iovcnt, f->may_free);
         }
-        f->iov[f->iovcnt].iov_base = (uint8_t *)buf;
-        f->iov[f->iovcnt++].iov_len = size;
+        if (f->iovcnt < MAX_IOV_SIZE) {
+            f->iov[f->iovcnt].iov_base = (uint8_t *)buf;
+            f->iov[f->iovcnt++].iov_len = size;
+        }
     }
 
     if (f->iovcnt >= MAX_IOV_SIZE) {
-- 
2.23.0


