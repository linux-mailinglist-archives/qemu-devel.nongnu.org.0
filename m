Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F285855ABC7
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 19:43:11 +0200 (CEST)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o59oM-0006GF-BI
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 13:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1o59kI-0003Lg-8S
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:38:58 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:53071
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1o59kE-0007Qw-F7
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:38:58 -0400
HMM_SOURCE_IP: 172.18.0.48:34982.1285566443
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.81 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 52C622800D7;
 Sun, 26 Jun 2022 01:38:38 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id de52caa68a5f47d78487c049feece665 for
 qemu-devel@nongnu.org; Sun, 26 Jun 2022 01:38:42 CST
X-Transaction-ID: de52caa68a5f47d78487c049feece665
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hyman <huangy81@chinatelecom.cn>
Subject: [PATCH v25 0/8] support dirty restraint on vCPU 
Date: Sun, 26 Jun 2022 01:38:29 +0800
Message-Id: <cover.1656177590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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

v25:
- rebase master
- fix 32-bit and non-Linux(freebsd) build failures
  use qatomic_read_i64() to replace qatomic_read()
  move the DIRTYLIMIT_TOLERANCE_RANGE MARCO out of 'linux' scope.

Please review, thanks !

Yong.

v24:
- add "Acked-by: Peter Xu <peterx@redhat.com>" tag in (PATCH [8/8])

v23:

This is v23 of dirtylimit series. Since v22 posted abount 1 month ago,
i did some modifications to make sure it's ready to be queued:

- rebased the master and changed the qapi version tag from 7.0 to 7.1
- do not set error if when query_vcpu_dirty_limit find dirtylimit not
  in service, returning NULL is sufficient. (PATCH v22 [7/8]). 

The following is the history of the patchset, since v22 kind of different from
the original version, i made abstracts of changelog:

RFC and v1: https://lore.kernel.org/qemu-devel/cover.1637214721.git.huangy81@chinatelecom.cn/
v2: https://lore.kernel.org/qemu-devel/cover.1637256224.git.huangy81@chinatelecom.cn/
v1->v2 changelog: 
- rename some function and variables. refactor the original algo of dirtylimit. Thanks for
  the comments given by Juan Quintela.
v3: https://lore.kernel.org/qemu-devel/cover.1637403404.git.huangy81@chinatelecom.cn/
v4: https://lore.kernel.org/qemu-devel/cover.1637653303.git.huangy81@chinatelecom.cn/
v5: https://lore.kernel.org/qemu-devel/cover.1637759139.git.huangy81@chinatelecom.cn/
v6: https://lore.kernel.org/qemu-devel/cover.1637856472.git.huangy81@chinatelecom.cn/
v7: https://lore.kernel.org/qemu-devel/cover.1638202004.git.huangy81@chinatelecom.cn/
v2->v7 changelog:
- refactor the docs, annotation and fix bugs of the original algo of dirtylimit.
  Thanks for the review given by Markus Armbruster. 
v8: https://lore.kernel.org/qemu-devel/cover.1638463260.git.huangy81@chinatelecom.cn/
v9: https://lore.kernel.org/qemu-devel/cover.1638495274.git.huangy81@chinatelecom.cn/
v10: https://lore.kernel.org/qemu-devel/cover.1639479557.git.huangy81@chinatelecom.cn/
v7->v10 changelog:
- introduce a simpler but more efficient algo of dirtylimit inspired by Peter Xu.
- keep polishing the annotation suggested by Markus Armbruster.
v11: https://lore.kernel.org/qemu-devel/cover.1641315745.git.huangy81@chinatelecom.cn/
v12: https://lore.kernel.org/qemu-devel/cover.1642774952.git.huangy81@chinatelecom.cn/
v13: https://lore.kernel.org/qemu-devel/cover.1644506963.git.huangy81@chinatelecom.cn/
v10->v13 changelog:
- handle the hotplug/unplug scenario.
- refactor the new algo, split the commit and make the code more clean.
v14: https://lore.kernel.org/qemu-devel/cover.1644509582.git.huangy81@chinatelecom.cn/
v13->v14 changelog:
- sent by accident.
v15: https://lore.kernel.org/qemu-devel/cover.1644976045.git.huangy81@chinatelecom.cn/ 
v16: https://lore.kernel.org/qemu-devel/cover.1645067452.git.huangy81@chinatelecom.cn/ 
v17: https://lore.kernel.org/qemu-devel/cover.1646243252.git.huangy81@chinatelecom.cn/
v14->v17 changelog: 
- do some code clean and fix test bug reported by Dr. David Alan Gilbert.
v18: https://lore.kernel.org/qemu-devel/cover.1646247968.git.huangy81@chinatelecom.cn/
v19: https://lore.kernel.org/qemu-devel/cover.1647390160.git.huangy81@chinatelecom.cn/
v20: https://lore.kernel.org/qemu-devel/cover.1647396907.git.huangy81@chinatelecom.cn/
v21: https://lore.kernel.org/qemu-devel/cover.1647435820.git.huangy81@chinatelecom.cn/
v17->v21 changelog:
- add qtest, fix bug and do code clean. 
v21->v22 changelog:
- move the vcpu dirty limit test into migration-test and do some modification suggested
  by Peter.

Please review.

Yong.

Abstract
========

This patchset introduce a mechanism to impose dirty restraint
on vCPU, aiming to keep the vCPU running in a certain dirtyrate
given by user. dirty restraint on vCPU maybe an alternative
method to implement convergence logic for live migration,
which could improve guest memory performance during migration
compared with traditional method in theory.

For the current live migration implementation, the convergence
logic throttles all vCPUs of the VM, which has some side effects.
-'read processes' on vCPU will be unnecessarily penalized
- throttle increase percentage step by step, which seems
  struggling to find the optimal throttle percentage when
  dirtyrate is high.
- hard to predict the remaining time of migration if the
  throttling percentage reachs 99%

to a certain extent, the dirty restraint machnism can fix these
effects by throttling at vCPU granularity during migration.

the implementation is rather straightforward, we calculate
vCPU dirtyrate via the Dirty Ring mechanism periodically
as the commit 0e21bf246 "implement dirty-ring dirtyrate calculation"
does, for vCPU that be specified to impose dirty restraint,
we throttle it periodically as the auto-converge does, once after
throttling, we compare the quota dirtyrate with current dirtyrate,
if current dirtyrate is not under the quota, increase the throttling
percentage until current dirtyrate is under the quota.

this patchset is the basis of implmenting a new auto-converge method
for live migration, we introduce two qmp commands for impose/cancel
the dirty restraint on specified vCPU, so it also can be an independent
api to supply the upper app such as libvirt, which can use it to
implement the convergence logic during live migration, supplemented
with the qmp 'calc-dirty-rate' command or whatever.

we post this patchset for RFC and any corrections and suggetions about
the implementation, api, throttleing algorithm or whatever are very
appreciated!

Please review, thanks !

Best Regards !

Hyman Huang (8):
  accel/kvm/kvm-all: Refactor per-vcpu dirty ring reaping
  cpus: Introduce cpu_list_generation_id
  migration/dirtyrate: Refactor dirty page rate calculation
  softmmu/dirtylimit: Implement vCPU dirtyrate calculation periodically
  accel/kvm/kvm-all: Introduce kvm_dirty_ring_size function
  softmmu/dirtylimit: Implement virtual CPU throttle
  softmmu/dirtylimit: Implement dirty page rate limit
  tests: Add dirty page rate limit test

 accel/kvm/kvm-all.c             |  46 ++-
 accel/stubs/kvm-stub.c          |   5 +
 cpus-common.c                   |   8 +
 hmp-commands-info.hx            |  13 +
 hmp-commands.hx                 |  32 +++
 include/exec/cpu-common.h       |   1 +
 include/exec/memory.h           |   5 +-
 include/hw/core/cpu.h           |   6 +
 include/monitor/hmp.h           |   3 +
 include/sysemu/dirtylimit.h     |  37 +++
 include/sysemu/dirtyrate.h      |  28 ++
 include/sysemu/kvm.h            |   2 +
 migration/dirtyrate.c           | 227 +++++++++------
 migration/dirtyrate.h           |   7 +-
 qapi/migration.json             |  80 ++++++
 softmmu/dirtylimit.c            | 601 ++++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build             |   1 +
 softmmu/trace-events            |   7 +
 tests/qtest/migration-helpers.c |  22 ++
 tests/qtest/migration-helpers.h |   2 +
 tests/qtest/migration-test.c    | 256 +++++++++++++++++
 tests/qtest/qmp-cmd-test.c      |   2 +
 22 files changed, 1292 insertions(+), 99 deletions(-)
 create mode 100644 include/sysemu/dirtylimit.h
 create mode 100644 include/sysemu/dirtyrate.h
 create mode 100644 softmmu/dirtylimit.c

-- 
1.8.3.1


