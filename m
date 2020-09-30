Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD827E591
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 11:49:10 +0200 (CEST)
Received: from localhost ([::1]:49420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNYjV-0008GA-US
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 05:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kNYhL-000717-G1
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 05:46:55 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:38502 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kNYhI-0003nv-Vo
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 05:46:55 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 27434E044FBE886EBDE5;
 Wed, 30 Sep 2020 17:46:48 +0800 (CST)
Received: from localhost (10.174.186.107) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 30 Sep 2020
 17:46:39 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 0/8] block-backend: Introduce I/O hang
Date: Wed, 30 Sep 2020 17:45:58 +0800
Message-ID: <20200930094606.5323-1-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.107]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=cenjiahui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 05:46:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: kwolf@redhat.com, fangying1@huawei.com, cenjiahui@huawei.com,
 zhang.zhanghailiang@huawei.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A VM in the cloud environment may use a virutal disk as the backend storage,
and there are usually filesystems on the virtual block device. When backend
storage is temporarily down, any I/O issued to the virtual block device will
cause an error. For example, an error occurred in ext4 filesystem would make
the filesystem readonly. However a cloud backend storage can be soon recovered.
For example, an IP-SAN may be down due to network failure and will be online
soon after network is recovered. The error in the filesystem may not be
recovered unless a device reattach or system restart. So an I/O rehandle is
in need to implement a self-healing mechanism.

This patch series propose a feature called I/O hang. It can rehandle AIOs
with EIO error without sending error back to guest. From guest's perspective
of view it is just like an IO is hanging and not returned. Guest can get
back running smoothly when I/O is recovred with this feature enabled.

v1->v2:
* Rebase to fix compile problems.
* Fix incorrect remove of rehandle list.
* Provide rehandle pause interface.

Jiahui Cen (8):
  block-backend: introduce I/O rehandle info
  block-backend: rehandle block aios when EIO
  block-backend: add I/O hang timeout
  block-backend: add I/O rehandle pause/unpause
  block-backend: enable I/O hang when timeout is set
  virtio-blk: pause I/O hang when resetting
  qemu-option: add I/O hang timeout option
  qapi: add I/O hang and I/O hang timeout qapi event

 block/block-backend.c          | 300 +++++++++++++++++++++++++++++++++
 blockdev.c                     |  11 ++
 hw/block/virtio-blk.c          |   8 +
 include/sysemu/block-backend.h |   5 +
 qapi/block-core.json           |  26 +++
 5 files changed, 350 insertions(+)

-- 
2.28.0


