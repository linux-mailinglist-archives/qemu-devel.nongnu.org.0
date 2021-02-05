Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A884C3108ED
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:23:12 +0100 (CET)
Received: from localhost ([::1]:60846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yGd-0003IN-MQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7a-0002zO-TY; Fri, 05 Feb 2021 05:13:50 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7X-00074q-0Y; Fri, 05 Feb 2021 05:13:50 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DXB6k6fmCz164xF;
 Fri,  5 Feb 2021 18:12:14 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 18:13:28 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 0/9] block: Add retry for werror=/rerror= mechanism
Date: Fri, 5 Feb 2021 18:13:06 +0800
Message-ID: <20210205101315.13042-1-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, cenjiahui@huawei.com,
 zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 fangying1@huawei.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A VM in the cloud environment may use a virutal disk as the backend storage,
and there are usually filesystems on the virtual block device. When backend
storage is temporarily down, any I/O issued to the virtual block device
will cause an error. For example, an error occurred in ext4 filesystem would
make the filesystem readonly. In production environment, a cloud backend
storage can be soon recovered. For example, an IP-SAN may be down due to
network failure and will be online soon after network is recovered. However,
the error in the filesystem may not be recovered unless a device reattach
or system restart. Thus an I/O retry mechanism is in need to implement a
self-healing system.

This patch series propose to extend the werror=/rerror= mechanism to add
a 'retry' feature. It can automatically retry failed I/O requests on error
without sending error back to guest, and guest can get back running smoothly
when I/O is recovred.

v4->v5:
* Add document for 'retry' in qapi.
* Support werror=/rerror=retry for scsi-disk.
* Pause retry when draining.

v3->v4:
* Adapt to werror=/rerror= mechanism.

v2->v3:
* Add a doc to describe I/O hang.

v1->v2:
* Rebase to fix compile problems.
* Fix incorrect remove of rehandle list.
* Provide rehandle pause interface.

REF: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg06560.html

Jiahui Cen (9):
  qapi/block-core: Add retry option for error action
  block-backend: Introduce retry timer
  block-backend: Add device specific retry callback
  block-backend: Enable retry action on errors
  block-backend: Add timeout support for retry
  block: Add error retry param setting
  virtio_blk: Add support for retry on errors
  scsi-bus: Refactor the code that retries requests
  scsi-disk: Add support for retry on errors

 block/block-backend.c          | 68 ++++++++++++++++++++
 blockdev.c                     | 52 +++++++++++++++
 hw/block/block.c               | 10 +++
 hw/block/virtio-blk.c          | 21 +++++-
 hw/scsi/scsi-bus.c             | 16 +++--
 hw/scsi/scsi-disk.c            | 16 +++++
 include/hw/block/block.h       |  7 +-
 include/hw/scsi/scsi.h         |  1 +
 include/sysemu/block-backend.h | 10 +++
 qapi/block-core.json           |  9 ++-
 10 files changed, 199 insertions(+), 11 deletions(-)

-- 
2.29.2


