Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184ED2C6092
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:42:59 +0100 (CET)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiYPB-0001Dk-Lb
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kiYNd-0000iX-HS
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:41:21 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kiYNa-0007OD-UN
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:41:21 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Cj6433xGKz4y8W;
 Fri, 27 Nov 2020 15:40:35 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 27 Nov 2020 15:41:03 +0800
Received: from localhost (10.174.187.211) by dggemi758-chm.china.huawei.com
 (10.1.198.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1913.5; Fri, 27
 Nov 2020 15:41:03 +0800
From: Zeyu Jin <jinzeyu@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [RFC PATCH 0/6] migration: Multi-thread compression method support
Date: Fri, 27 Nov 2020 15:40:54 +0800
Message-ID: <20201127074054.2009-1-jinzeyu@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.211]
X-ClientProxiedBy: dggemi702-chm.china.huawei.com (10.3.20.101) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=jinzeyu@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Zeyu Jin <jinzeyu@huawei.com>,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we have both multi-thread compression and multifd to optimize
live migration in Qemu. Mulit-thread compression deals with the situation
where network bandwith is limited but cpu resource adequate. Multifd instead
aims to take full advantage of network bandwith. Moreover it supports both
zlib and zstd compression on each channel.

In this patch series, we did some code refactoring on multi-thread compression
live migration and bring zstd compression method support for it.

Below is the test result of multi-thread compression live migration
with different compress methods. Test result shows that zstd outperforms
zlib by about 70%.

 Migration Configuration:
 Guest 8U 32G
 compress-threads   8
 decompress-threads 2
 compress-level 1
 bandwidth-limit 100Mbps

 Test Result:
 +---------------------+--------------+-------------+
 |  compress method    |   zlib       |    zstd     |
 +---------------------+--------------+-------------+
 |  total time (ms)    |   75256      |    44187    |
 +---------------------+--------------+-------------+
 |  downtime(ms)       |   128        |    81       |
 +---------------------+--------------+-------------+
 |  transferred ram(kB)|   1576866    |    736117   |
 +---------------------+--------------+-------------+
 |  throughput(mbps)   |   172.06     |    137.16   |
 +---------------------+--------------+-------------+
 |  total ram(kB)      |   33685952   |    33685952 |
 +---------------------+--------------+-------------+

Zeyu Jin (6):
  migration: Add multi-thread compress method
  migration: Refactoring multi-thread compress migration
  migration: Add multi-thread compress ops
  migration: Add zstd support in multi-thread compression
  migration: Add compress_level sanity check
  doc: Update multi-thread compression doc

 docs/multi-thread-compression.txt |  31 ++-
 hw/core/qdev-properties-system.c  |  11 +
 include/hw/qdev-properties.h      |   4 +
 migration/migration.c             |  56 ++++-
 migration/migration.h             |   1 +
 migration/qemu-file.c             |  62 +----
 migration/qemu-file.h             |   4 +-
 migration/ram.c                   | 381 +++++++++++++++++++++++++-----
 monitor/hmp-cmds.c                |  12 +
 qapi/migration.json               |  26 +-
 10 files changed, 465 insertions(+), 123 deletions(-)

-- 
2.23.0


