Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697A5299EC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:53:33 +0200 (CEST)
Received: from localhost ([::1]:35918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqr5I-0007LN-Ek
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nqqoK-0004l1-63
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:36:03 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:46483
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nqqoG-0007fG-EI
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:35:59 -0400
HMM_SOURCE_IP: 172.18.0.48:35216.1855245433
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.84 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 2A22D2800AD;
 Tue, 17 May 2022 14:35:24 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id e5802fa2f987487f868228a6084f4c78 for
 qemu-devel@nongnu.org; Tue, 17 May 2022 14:35:28 CST
X-Transaction-ID: e5802fa2f987487f868228a6084f4c78
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [RFC 0/6] migration: introduce dirtylimit capability 
Date: Tue, 17 May 2022 14:35:00 +0800
Message-Id: <cover.1652762652.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Abstract
========

This series added a new migration capability called "dirtylimit".  It can
be enabled when dirty ring is enabled, and it'll improve the vCPU performance
during the process of migration. It is based on the previous patchset:
https://lore.kernel.org/qemu-devel/cover.1648748793.git.huangy81@chinatelecom.cn/

As mentioned in patchset "support dirty restraint on vCPU", dirtylimit way of
migration can make the read-process not be penalized. This series wires up the
vcpu dirty limit and wrappers as dirtylimit capability of migration. I introduce
two parameters vcpu-dirtylimit-period and vcpu-dirtylimit to implement the setup 
of dirtylimit during live migration.

To validate the implementation, i tested a 32 vCPU vm live migration with such 
model:
Only dirty vcpu0, vcpu1 with heavy memory workoad and leave the rest vcpus
untouched, running unixbench on the vpcu8-vcpu15 by setup the cpu affinity as
the following command:
taskset -c 8-15 ./Run -i 2 -c 8 {unixbench test item}

The following are results:

host cpu: Intel(R) Xeon(R) Platinum 8378A
host interface speed: 1000Mb/s
  |---------------------+--------+------------+---------------|
  | UnixBench test item | Normal | Dirtylimit | Auto-converge |
  |---------------------+--------+------------+---------------|
  | dhry2reg            | 32800  | 32786      | 25292         |
  | whetstone-double    | 10326  | 10315      | 9847          |
  | pipe                | 15442  | 15271      | 14506         |
  | context1            | 7260   | 6235       | 4514          |
  | spawn               | 3663   | 3317       | 3249          |
  | syscall             | 4669   | 4667       | 3841          |
  |---------------------+--------+------------+---------------|
From the data above we can draw a conclusion that vcpus that do not dirty memory
in vm are almost unaffected during the dirtylimit migration, but the auto converge
way does. 

I also tested the total time of dirtylimit migration with variable dirty memory
size in vm.

senario 1:
host cpu: Intel(R) Xeon(R) Platinum 8378A
host interface speed: 1000Mb/s
  |-----------------------+----------------+-------------------|
  | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
  |-----------------------+----------------+-------------------|
  | 60                    | 2014           | 2131              |
  | 70                    | 5381           | 12590             |
  | 90                    | 6037           | 33545             |
  | 110                   | 7660           | [*]               |
  |-----------------------+----------------+-------------------|
  [*]: This case means migration is not convergent. 

senario 2:
host cpu: Intel(R) Xeon(R) CPU E5-2650
host interface speed: 10000Mb/s
  |-----------------------+----------------+-------------------|
  | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
  |-----------------------+----------------+-------------------|
  | 1600                  | 15842          | 27548             |
  | 2000                  | 19026          | 38447             |
  | 2400                  | 19897          | 46381             |
  | 2800                  | 22338          | 57149             |
  |-----------------------+----------------+-------------------|
Above data shows that dirtylimit way of migration can also reduce the total
time of migration and it achieves convergence more easily in some case.

Since the dependent patchset has not been merged yet, i post the series in the
the following link if anyone want to have a try, once the depenent patchset is
ready and merged, the dirtylimit can be availiable by patching series:
https://github.com/newfriday/qemu/tree/dirtylimit_cap_v1

This series is for RFC, comments and reviews about the API, code logic,
algo implementation or anything else are welcomed and appreciated

Please review, thanks !

Yong 

Hyman Huang (6):
  qapi/migration: Introduce vcpu-dirtylimit-period parameters
  qapi/migration: Introduce vcpu-dirtylimit parameters
  migration: Implement dirtylimit convergence algo
  migration: Introduce dirtylimit capability
  migration: Add dirtylimit data into migration info
  tests: Add migration dirtylimit capability test

 include/sysemu/dirtylimit.h  |  2 +
 migration/migration.c        | 48 ++++++++++++++++++++++++
 migration/migration.h        |  1 +
 migration/ram.c              | 53 +++++++++++++++++++-------
 migration/trace-events       |  1 +
 monitor/hmp-cmds.c           | 15 ++++++++
 qapi/migration.json          | 47 ++++++++++++++++++++---
 softmmu/dirtylimit.c         | 33 +++++++++++++++-
 tests/qtest/migration-test.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 269 insertions(+), 20 deletions(-)

-- 
1.8.3.1


