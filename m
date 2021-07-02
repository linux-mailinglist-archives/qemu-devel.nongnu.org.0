Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D107D3B9EE1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:10:14 +0200 (CEST)
Received: from localhost ([::1]:56702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzG7h-0007JF-S8
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5U-00055P-P1
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:07:56 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lzG5Q-0003Kx-SW
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:07:56 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GGW025rGLzZmKH;
 Fri,  2 Jul 2021 18:04:34 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:42 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 18:07:42 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/6] machine: smp parsing fixes and improvement
Date: Fri, 2 Jul 2021 18:07:33 +0800
Message-ID: <20210702100739.13672-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Yanan Wang <wangyanan55@huawei.com>, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Here are some smp parsing fix and improvement, most of which is about
the smp parsing helpers. This series was arranged based on the latest
QEMU code since commit d940d468e29b.

Description:
Patch #1 improves the calculation of maxcpus.
Patch #2 and #3 adds the missing zero-check for values of sockets and dies.
Patch #4 allows us to uniformly use maxcpus for all calculations.
Patch #5 reject the configuration of dies more strictly for non-PC machines.
Patch #6 makes no functional change but tweaks the order of topology parameters.

Regards,
Yanan

Yanan Wang (6):
  machine: Set the value of maxcpus to match cpus if specified as zero
  machine: Perform zero-check for the computed value of sockets
  pc/machine: Perform zero-check for the value of -smp dies
  machine: Uniformly use maxcpus to calculate the missing values
  pc/machine: Disallow any configuration of dies for non-PC machines
  machine: Tweak the order of topology members in struct CpuTopology

 hw/core/machine.c   | 49 +++++++++++++++++++++++++--------------------
 hw/i386/pc.c        | 48 +++++++++++++++++++++++++-------------------
 include/hw/boards.h |  7 ++++---
 qapi/machine.json   |  2 +-
 4 files changed, 59 insertions(+), 47 deletions(-)

-- 
2.19.1


