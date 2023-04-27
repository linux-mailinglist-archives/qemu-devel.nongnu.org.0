Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B46F0609
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:44:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0ya-0006iX-Jy; Thu, 27 Apr 2023 08:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0yW-0006dO-U1
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:43:52 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1ps0yS-0001pQ-VI
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:43:52 -0400
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q6b4z11zsz6D9gm;
 Thu, 27 Apr 2023 20:43:31 +0800 (CST)
Received: from DESKTOP-0LHM7NF.huawei.com (10.199.58.101) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 13:43:32 +0100
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <berrange@redhat.com>, <zhengchuan@huawei.com>, Andrei Gudkov
 <gudkov.andrei@huawei.com>
Subject: [PATCH v2 0/4] Migration time prediction using calc-dirty-rate
Date: Thu, 27 Apr 2023 15:42:56 +0300
Message-ID: <cover.1682598010.git.gudkov.andrei@huawei.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.58.101]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=gudkov.andrei@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Andrei Gudkov <gudkov.andrei@huawei.com>
From:  Andrei Gudkov via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

V1 -> V2:
  - Extracted CRC32->xxHash into separate commit
  - Extacted @n-zero-samples metric into separate commit
  - Added description to qapi about connection between
    @n-dirty-samples and @periods arrays
  - Added (Since ...) tag to new metrics

---

The overall goal of this patch is to be able to predict time it would
take to migrate VM in precopy mode based on max allowed downtime,
network bandwidth, and metrics collected with "calc-dirty-rate".
Predictor itself is a simple python script that closely follows iterations
of the migration algorithm: compute how long it would take to copy
dirty pages, estimate number of pages dirtied by VM from the beginning
of the last iteration; repeat all over again until estimated iteration time
fits max allowed downtime. However, to get reasonable accuracy, predictor
requires more metrics, which have been implemented into "calc-dirty-rate".

Summary of calc-dirty-rate changes:

1. The most important change is that now calc-dirty-rate produces
   a *vector* of dirty page measurements for progressively increasing time
   periods: 125ms, 250, 500, 750, 1000, 1500, .., up to specified calc-time.
   The motivation behind such change is that number of dirtied pages as
   a function of time starting from "clean state" (new migration iteration)
   is far from linear. Shape of this function depends on the workload type
   and intensity. Measuring number of dirty pages at progressively
   increasing periods allows to reconstruct this function using piece-wise
   interpolation.

2. New metric added -- number of all-zero pages.
   Predictor needs to distinguish between number of zero and non-zero pages
   because during migration only 8 byte header is placed on the wire for
   all-zero page.

3. Hashing function was changed from CRC32 to xxHash.
   This reduces overhead of sampling by ~10 times, which is important since
   now some of the measurement periods are sub-second.

4. Other trivial metrics were added for convenience: total number
   of VM pages, number of sampled pages, page size.


After these changes output from calc-dirty-rate looks like this:

{
  "page-size": 4096,
  "periods": [125, 250, 375, 500, 750, 1000, 1500,
              2000, 3000, 4001, 6000, 8000, 10000,
              15000, 20000, 25000, 30000, 35000,
              40000, 45000, 50000, 60000],
  "status": "measured",
  "sample-pages": 512,
  "dirty-rate": 98,
  "mode": "page-sampling",
  "n-dirty-pages": [33, 78, 119, 151, 217, 236, 293, 336,
                    425, 505, 620, 756, 898, 1204, 1457,
                    1723, 1934, 2141, 2328, 2522, 2675, 2958],
  "n-sampled-pages": 16392,
  "n-zero-pages": 10060,
  "n-total-pages": 8392704,
  "start-time": 2916750,
  "calc-time": 60
}

Passing this data into prediction script, we get the following estimations:

Downtime> |    125ms |    250ms |    500ms |   1000ms |   5000ms |    unlim
---------------------------------------------------------------------------
 100 Mbps |        - |        - |        - |        - |        - |   16m59s  
   1 Gbps |        - |        - |        - |        - |        - |    1m40s
   2 Gbps |        - |        - |        - |        - |    1m41s |      50s  
 2.5 Gbps |        - |        - |        - |        - |    1m07s |      40s
   5 Gbps |      48s |      46s |      31s |      28s |      25s |      20s
  10 Gbps |      13s |      12s |      12s |      12s |      12s |      10s
  25 Gbps |       5s |       5s |       5s |       5s |       4s |       4s
  40 Gbps |       3s |       3s |       3s |       3s |       3s |       3s


Quality of prediction was tested with YCSB benchmark. Memcached instance
was installed into 32GiB VM, and a client generated a stream of requests.
Between experiments we varied request size distribution, number of threads,
and location of the client (inside or outside the VM).
After short preheat phase, we measured calc-dirty-rate:
1. {"execute": "calc-dirty-rate", "arguments":{"calc-time":60}}
2. Wait 60 seconds
3. Collect results with {"execute": "query-dirty-rate"}

Afterwards we tried to migrate VM after randomly selecting max downtime
and bandwidth limit. Typical prediction error is 6-7%, with only 180 out
of 5779 experiments failing badly: prediction error >=25% or incorrectly
predicting migration success when in fact it didn't converge.


Andrei Gudkov (4):
  migration/calc-dirty-rate: replaced CRC32 with xxHash
  migration/calc-dirty-rate: detailed stats in sampling mode
  migration/calc-dirty-rate: added n-zero-pages metric
  migration/calc-dirty-rate: tool to predict migration time

 MAINTAINERS                  |   1 +
 migration/dirtyrate.c        | 228 +++++++++++++++++++++-------
 migration/dirtyrate.h        |  26 +++-
 migration/trace-events       |   4 +-
 qapi/migration.json          |  28 +++-
 scripts/predict_migration.py | 283 +++++++++++++++++++++++++++++++++++
 6 files changed, 511 insertions(+), 59 deletions(-)
 create mode 100644 scripts/predict_migration.py

-- 
2.30.2


