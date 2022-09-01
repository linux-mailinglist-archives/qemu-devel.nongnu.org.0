Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFD5A9E66
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:46:14 +0200 (CEST)
Received: from localhost ([::1]:37912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oToGb-0004gJ-In
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oTnu8-00009l-AX
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:00 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:56513
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oTnu5-00035z-6W
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:00 -0400
HMM_SOURCE_IP: 172.18.0.218:57590.1734067809
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.60 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 8B4722800CF;
 Fri,  2 Sep 2022 01:22:39 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id c30f8ffc77114489890c36c666994ce6 for
 qemu-devel@nongnu.org; Fri, 02 Sep 2022 01:22:43 CST
X-Transaction-ID: c30f8ffc77114489890c36c666994ce6
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v1 0/8] migration: introduce dirtylimit capability
Date: Fri,  2 Sep 2022 01:22:28 +0800
Message-Id: <cover.1662052189.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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

v1:
- make parameter vcpu-dirty-limit experimental 
- switch dirty limit off when cancel migrate
- add cancel logic in migration test 

Please review, thanks,

Yong 

Abstract
========

This series added a new migration capability called "dirtylimit".  It can
be enabled when dirty ring is enabled, and it'll improve the vCPU performance
during the process of migration. It is based on the previous patchset:
https://lore.kernel.org/qemu-devel/cover.1656177590.git.huangy81@chinatelecom.cn/

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

In addition to implement dirtylimit capability itself, this series
add 3 tests for migration, aiming at playing around for developer simply: 
 1. qtest for dirty limit migration
 2. support dirty ring way of migration for guestperf tool
 3. support dirty limit migration for guestperf tool

Please review, thanks !

Hyman Huang (8):
  qapi/migration: Introduce x-vcpu-dirty-limit-period parameter
  qapi/migration: Introduce x-vcpu-dirty-limit parameters
  migration: Introduce dirty-limit capability
  migration: Implement dirty-limit convergence algo
  migration: Export dirty-limit time info
  tests: Add migration dirty-limit capability test
  tests/migration: Introduce dirty-ring-size option into guestperf
  tests/migration: Introduce dirty-limit into guestperf

 include/sysemu/dirtylimit.h             |   2 +
 migration/migration.c                   |  51 +++++++++++
 migration/migration.h                   |   1 +
 migration/ram.c                         |  53 ++++++++---
 migration/trace-events                  |   1 +
 monitor/hmp-cmds.c                      |  26 ++++++
 qapi/migration.json                     |  57 ++++++++++--
 softmmu/dirtylimit.c                    |  33 ++++++-
 tests/migration/guestperf/comparison.py |  24 +++++
 tests/migration/guestperf/engine.py     |  33 ++++++-
 tests/migration/guestperf/hardware.py   |   8 +-
 tests/migration/guestperf/progress.py   |  17 +++-
 tests/migration/guestperf/scenario.py   |  11 ++-
 tests/migration/guestperf/shell.py      |  25 +++++-
 tests/qtest/migration-test.c            | 154 ++++++++++++++++++++++++++++++++
 15 files changed, 465 insertions(+), 31 deletions(-)

-- 
1.8.3.1


