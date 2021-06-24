Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B823B2FF5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 15:27:44 +0200 (CEST)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwPOR-0002s3-4V
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 09:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojinhua1@huawei.com>)
 id 1lwO8j-00008Q-Lu; Thu, 24 Jun 2021 08:07:25 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojinhua1@huawei.com>)
 id 1lwO8g-0005G9-TB; Thu, 24 Jun 2021 08:07:25 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G9f1Z3WR2zZlrg;
 Thu, 24 Jun 2021 20:04:02 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 24 Jun 2021 20:07:04 +0800
Received: from localhost.localdomain (10.246.240.24) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 24 Jun 2021 20:07:03 +0800
From: Jinhua Cao <caojinhua1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
Subject: [RFC] block/mirror: fix file-system went to read-only after
 block-mirror
Date: Thu, 24 Jun 2021 20:06:35 +0800
Message-ID: <20210624120635.54573-1-caojinhua1@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.246.240.24]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=caojinhua1@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 24 Jun 2021 09:26:56 -0400
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
Cc: kwolf@redhat.com, eric.fangyi@huawei.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1) Configure the VM disk as prdm.
...
<disk type='block' device='lun'>
  <driver name='qemu' type='raw' cache='none'/>
  <source dev='/dev/disk/by-id/scsi-368886030000000ca50c1cd1563996917' index='1'/>
  <backingStore/>
  <target dev='sdb' bus='scsi'/>
  <alias name='scsi0-0-0-1'/>
  <address type='drive' controller='0' bus='0' target='0' unit='1'/>
</disk>
...
Mount the disk in guest and keep the disk writing data continuously during block-mirror,
the file-system went to read-only after block-mirror.

2) This commit 6cdbceb12cf[mirror: Add filter-node-name to blockdev-mirror] introduces
mirror_top_bs which does not set default function for mirror_top_bs->drv->bdrv_co_ioctl.

3) The function bdrv_co_ioctl in block/io.c will be called during block-mirror, in this
function, the judgment is as follow:
---
    if (!drv || (!drv->bdrv_aio_ioctl && !drv->bdrv_co_ioctl)) {
        co.ret = -ENOTSUP;
        goto out;
    }
---
The mirror_top_bs does not set drv->bdrv_aio_ioctl or drv->bdrv_co_ioctl which result this
return -ENOTSUP. So the file-system went to read-only after block-mirror.

4) This patch set a default function for mirror_top_bs->drv->bdrv_aio_ioctl, fix this problem.
---
 block/mirror.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/mirror.c b/block/mirror.c
index 019f6deaa5..63b788ec39 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1480,6 +1480,12 @@ static int coroutine_fn bdrv_mirror_top_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->backing->bs);
 }
 
+static int coroutine_fn bdrv_mirror_top_ioctl(BlockDriverState *bs,
+    unsigned long int req, void *buf)
+{
+    return 0;
+}
+
 static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
     int64_t offset, int bytes, BdrvRequestFlags flags)
 {
@@ -1555,6 +1561,7 @@ static BlockDriver bdrv_mirror_top = {
     .bdrv_co_pwrite_zeroes      = bdrv_mirror_top_pwrite_zeroes,
     .bdrv_co_pdiscard           = bdrv_mirror_top_pdiscard,
     .bdrv_co_flush              = bdrv_mirror_top_flush,
+    .bdrv_co_ioctl              = bdrv_mirror_top_ioctl,
     .bdrv_refresh_filename      = bdrv_mirror_top_refresh_filename,
     .bdrv_child_perm            = bdrv_mirror_top_child_perm,
 
-- 
2.27.0


