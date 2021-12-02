Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43344668EF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:14:35 +0100 (CET)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspfG-0001ev-BV
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:14:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mspc5-0004WT-2p
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:11:17 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:48152
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mspc1-0001Lw-Bd
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:11:16 -0500
HMM_SOURCE_IP: 172.18.0.218:55170.1170008821
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.41.245 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id C30A92800A4;
 Fri,  3 Dec 2021 01:10:55 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 306ca4cd07324e68b9e0bcc9728a74da for
 qemu-devel@nongnu.org; Fri, 03 Dec 2021 01:11:02 CST
X-Transaction-ID: 306ca4cd07324e68b9e0bcc9728a74da
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v8 0/3] support dirty restraint on vCPU  
Date: Fri,  3 Dec 2021 01:10:54 +0800
Message-Id: <cover.1638463260.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

v8:
- rebase on master
- polish the error message and remove the "unlikely" compilation syntax
  according to the advice given by Markus.
- keep the dirty tracking enabled during "dirtylimit-calc" lifecycle
  so that the overhead can be reduced according to the advice given by
  Peter. 
- merge the "set/cancel" qmp commands into one named "vcpu-dirty-limit"
  and introduce qmp command "query-vcpu-dirty-limit" to query dirty
  limit information about virtual CPU, according to the advice given by
  Peter.
- check if vcpu index is valid and handle the unplug case before
  enabling, disabling dirty limit for virtual CPU.
- introduce hmp commands so developers can play with them easier, use
  "vcpu_dirty_limit" to enable dirty limit and "info vcpu_dirty_limit"
  to query.

The patch [2/3] has not been touched so far. Any corrections and
suggetions are welcome. 

Please review, thanks!

v7:
- rebase on master
- polish the comments and error message according to the
  advices given by Markus
- introduce dirtylimit_enabled function to pre-check if dirty
  page limit is enabled before canceling.

v6:
- rebase on master
- fix dirtylimit setup crash found by Markus
- polish the comments according to the advice given by Markus
- adjust the qemu qmp command tag to 7.0

v5:
- rebase on master
- adjust the throttle algorithm by removing the tuning in 
  RESTRAINT_RATIO case so that dirty page rate could reachs the quota
  more quickly.
- fix percentage update in throttle iteration.

v4:
- rebase on master
- modify the following points according to the advice given by Markus
  1. move the defination into migration.json
  2. polish the comments of set-dirty-limit
  3. do the syntax check and change dirty rate to dirty page rate

Thanks for the carefule reviews made by Markus.

Please review, thanks!

v3:
- rebase on master
- modify the following points according to the advice given by Markus
  1. remove the DirtyRateQuotaVcpu and use its field as option directly
  2. add comments to show details of what dirtylimit setup do
  3. explain how to use dirtylimit in combination with existing qmp
     commands "calc-dirty-rate" and "query-dirty-rate" in documentation.

Thanks for the carefule reviews made by Markus.

Please review, thanks!

Hyman

v2:
- rebase on master
- modify the following points according to the advices given by Juan
  1. rename dirtyrestraint to dirtylimit
  2. implement the full lifecyle function of dirtylimit_calc, include
     dirtylimit_calc and dirtylimit_calc_quit
  3. introduce 'quit' field in dirtylimit_calc_state to implement the
     dirtylimit_calc_quit
  4. remove the ready_cond and ready_mtx since it may not be suitable
  5. put the 'record_dirtypage' function code at the beggining of the
     file
  6. remove the unnecesary return;
- other modifications has been made after code review
  1. introduce 'bmap' and 'nr' field in dirtylimit_state to record the
     number of running thread forked by dirtylimit
  2. stop the dirtyrate calculation thread if all the dirtylimit thread
     are stopped
  3. do some renaming works
     dirtyrate calulation thread -> dirtylimit-calc
     dirtylimit thread -> dirtylimit-{cpu_index}
     function name do_dirtyrestraint -> dirtylimit_check
     qmp command dirty-restraint -> set-drity-limit
     qmp command dirty-restraint-cancel -> cancel-dirty-limit
     header file dirtyrestraint.h -> dirtylimit.h

Please review, thanks !

thanks for the accurate and timely advices given by Juan. we really
appreciate it if corrections and suggetions about this patchset are
proposed.

Best Regards !

Hyman

v1:
this patchset introduce a mechanism to impose dirty restraint
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

Hyman Huang (3):
  migration/dirtyrate: implement vCPU dirtyrate calculation periodically
  cpu-throttle: implement vCPU throttle
  cpus-common: implement dirty page limit on vCPU

 cpus-common.c                 | 149 ++++++++++++++++++
 hmp-commands-info.hx          |  13 ++
 hmp-commands.hx               |  16 ++
 include/exec/memory.h         |   5 +-
 include/hw/core/cpu.h         |   9 ++
 include/monitor/hmp.h         |   2 +
 include/sysemu/cpu-throttle.h |  45 ++++++
 include/sysemu/dirtylimit.h   |  44 ++++++
 meson                         |   2 +-
 migration/dirtyrate.c         | 142 +++++++++++++++--
 migration/dirtyrate.h         |   2 +
 qapi/migration.json           |  70 +++++++++
 softmmu/cpu-throttle.c        | 355 ++++++++++++++++++++++++++++++++++++++++++
 softmmu/trace-events          |   5 +
 softmmu/vl.c                  |   1 +
 15 files changed, 848 insertions(+), 12 deletions(-)
 create mode 100644 include/sysemu/dirtylimit.h

-- 
1.8.3.1


