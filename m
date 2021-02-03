Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2930D434
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:46:54 +0100 (CET)
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7CsG-0004fk-GV
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpd-0002xY-1B
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:09 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7CpO-0008Ch-H3
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:05 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DVttM0Np3zlDsM;
 Wed,  3 Feb 2021 15:42:03 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:36 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 00/18] Support Multifd for RDMA migration
Date: Wed, 3 Feb 2021 16:01:33 +0800
Message-ID: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RDMA bandwidth is not fully utilized for over 25Gigabit NIC because
of single channel for RDMA migration. This patch series is going to support
multifd for RDMA migration based on multifd framework.

Comparsion is between origion and multifd RDMA migration is re-tested for v3.
The VM specifications for migration are as follows:
- VM use 4k page;
- the number of VCPU is 4;
- the total memory is 16Gigabit;
- use 'mempress' tool to pressurize VM(mempress 8000 500);
- use 25Gigabit network card to migrate;

For origin RDMA and MultiRDMA migration, the total migration times of
VM are as follows:
+++++++++++++++++++++++++++++++++++++++++++++++++
|             | NOT rdma-pin-all | rdma-pin-all |
+++++++++++++++++++++++++++++++++++++++++++++++++
| origin RDMA |       26 s       |     29 s     |
-------------------------------------------------
|  MultiRDMA  |       16 s       |     17 s     |
+++++++++++++++++++++++++++++++++++++++++++++++++

Test the multifd RDMA migration like this:
virsh migrate --live --parallel --migrateuri
rdma://192.168.1.100 [VM] --listen-address 0.0.0.0  qemu+tcp://192.168.1.100/system --verbose

v3 -> v4:
    modify some function names
    export multifd_rdma_ops instead of a function
    fix minior codestyle issues

v2 -> v3:
    create multifd ops for both tcp and rdma
    do not export rdma to avoid multifd code in mess
    fix build issue for non-rdma
    fix some codestyle and buggy code

Chuan Zheng (18):
  migration/rdma: add the 'migrate_rdma_pin_all' function
  migration/rdma: judge whether or not the RDMA is used for migration
  migration/rdma: create multifd_setup_ops for Tx/Rx thread
  migration/rdma: add multifd_setup_ops for rdma
  migration/rdma: do not need sync main for rdma
  migration/rdma: export MultiFDSendParams/MultiFDRecvParams
  migration/rdma: add rdma field into multifd send/recv param
  migration/rdma: export getQIOChannel to get QIOchannel in rdma
  migration/rdma: add multifd_rdma_load_setup() to setup multifd rdma
  migration/rdma: Create the multifd recv channels for RDMA
  migration/rdma: record host_port for multifd RDMA
  migration/rdma: Create the multifd send channels for RDMA
  migration/rdma: Add the function for dynamic page registration
  migration/rdma: register memory for multifd RDMA channels
  migration/rdma: only register the memory for multifd channels
  migration/rdma: add rdma_channel into Migrationstate field
  migration/rdma: send data for both rdma-pin-all and NOT rdma-pin-all
    mode
  migration/rdma: RDMA cleanup for multifd migration

 migration/migration.c |  24 +++
 migration/migration.h |  11 ++
 migration/multifd.c   |  97 +++++++++-
 migration/multifd.h   |  25 +++
 migration/qemu-file.c |   5 +
 migration/qemu-file.h |   1 +
 migration/rdma.c      | 490 +++++++++++++++++++++++++++++++++++++++++++++++++-
 7 files changed, 641 insertions(+), 12 deletions(-)

-- 
1.8.3.1


