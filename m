Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3854981CE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 15:13:59 +0100 (CET)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC06Y-0003jE-A7
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 09:13:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nC043-0001V5-Ne
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:11:23 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:43200
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nC03y-0003w1-7M
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:11:23 -0500
HMM_SOURCE_IP: 172.18.0.188:38272.1433758357
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.59 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 2AD042800A5;
 Mon, 24 Jan 2022 22:10:46 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 9445f90b000049199b099b1918cd3eea for
 qemu-devel@nongnu.org; Mon, 24 Jan 2022 22:10:50 CST
X-Transaction-ID: 9445f90b000049199b099b1918cd3eea
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v12 0/5] support dirty restraint on vCPU 
Date: Mon, 24 Jan 2022 22:10:35 +0800
Message-Id: <cover.1642774952.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

v12
- rebase on master
- add a new commmit to refactor per-vcpu dirty ring reaping, which can resolve 
  the "vcpu miss the chances to sleep" problem
- remove the dirtylimit_thread and implemtment throttle in bottom half instead.
- let the dirty ring reaper thread keep sleeping when dirtylimit is in service 
- introduce cpu_list_generation_id to identify cpu_list changing. 
- keep taking the cpu_list_lock during dirty_stat_wait to prevent vcpu plug/unplug
  when calculating the dirty page rate
- move the dirtylimit global initializations out of dirtylimit_set_vcpu and do
  some code clean
- add DIRTYLIMIT_LINEAR_ADJUSTMENT_WATERMARK in case of oscillation when throttling 
- remove the unmatched count field in dirtylimit_state
- add stub to fix build on non-x86
- refactor the documents

Thanks Peter and Markus for reviewing the previous versions, please review.

Thanks,
Yong

v11
- rebase on master
- add a commit " refactor dirty page rate calculation"  so that dirty page rate limit
  can reuse the calculation logic. 
- handle the cpu hotplug/unplug case in the dirty page rate calculation logic.
- modify the qmp commands according to Markus's advice.
- introduce a standalone file dirtylimit.c to implement dirty page rate limit
- check if dirty limit in service by dirtylimit_state pointer instead of global variable
- introduce dirtylimit_mutex to protect dirtylimit_state
- do some code clean and docs

See the commit for more detail, thanks Markus and Peter very mush for the code
review and give the experienced and insightful advices, most modifications are
based on these advices.

v10:
- rebase on master
- make the following modifications on patch [1/3]:
  1. Make "dirtylimit-calc" thread joinable and join it after quitting.

  2. Add finalize function to free dirtylimit_calc_state

  3. Do some code clean work

- make the following modifications on patch [2/3]:
  1. Remove the original implementation of throttle according to
     Peter's advice.
     
  2. Introduce a negative feedback system and implement the throttle
     on all vcpu in one thread named "dirtylimit". 

  3. Simplify the algo when calculation the throttle_us_per_full:
     increase/decrease linearly when there exists a wide difference
     between quota and current dirty page rate, increase/decrease
     a fixed time slice when the difference is narrow. This makes
     throttle responds faster and reach the quota smoothly.

  4. Introduce a unfit_cnt in algo to make sure throttle really
     takes effect.

  5. Set the max sleep time 99 times more than "ring_full_time_us".                                                                                                                                                                          
                                                                                                                                                                                                                                             
  6. Make "dirtylimit" thread joinable and join it after quitting.                                                                                                                                                                           
                                                                                                                                                                                                                                             
- make the following modifications on patch [3/3]:                                                                                                                                                                                           
  1. Remove the unplug cpu handling logic.                                                                                                                                                                                                   
                                                                                                                                                                                                                                             
  2. "query-vcpu-dirty-limit" only return dirtylimit information of                                                                                                                                                                          
     vcpus that enable dirtylimit                                                                                                                                                                                                            
                                                                                                                                                                                                                                             
  3. Remove the "dirtylimit_setup" function                                                                                                                                                                                                  
                                                                                                                                                                                                                                             
  4. Trigger the dirtylimit and initialize the global state only                                                                                                                                                                             
     when someone enable dirtylimit, and finalize it after the last                                                                                                                                                                          
     dirtylimit be canceled.                                                                                                                                                                                                                 
                                                                                                                                                                                                                                             
  5. Redefine the qmp command vcpu-dirty-limit/query-vcpu-dirty-limit:                                                                                                                                                                       
     enable/disable dirtylimit use a single command "vcpu-dirty-limit",
     to enable/disabled dirtylimit on specified vcpu only if "cpu-index"
     is specified, otherwise, all vcpu will be affected.

  6. Redefine the hmp command vcpu_dirty_limit/info vcpu_dirty_limit

- other points about the code review:
  1. "merge the code of calculation dirty page rate"
     I think maybe it's not suitable to touch the 'calc-dirty-rate',
     because 'calc-dirty-rate' will stop sync log after calculating 
     the dirtyrate and the 'dirtylimit-cal' will not untill the last
     dirtylimit be canceled, if we merge the GLOBAL_DIRTY_LIMIT into
     GLOBAL_DIRTY_DIRTYRATE, the two are interacted with each other.

  2. The new implementaion of throttle algo enlightened by Peter
     responds faster and consume less cpu resource than the older,
     we make a impressed progress.

     And there is a viewpoint may be discussed, it is that the new 
     throttle logic is "passive", vcpu sleeps only after dirty ring,
     is full, unlike the "auto-converge" which will kick vcpu instead
     in a fixed slice time. If the vcpu is memory-write intensive
     and the ring size is large, it will produce dirty memory during
     the dirty ring full time and the throttle works not so good, it
     means the throttle depends on the dirty ring size. 

     I actually tested the new algo in two case:

     case 1: dirty-ring-size: 4096, dirtyrate: 1170MB/s 
     result: minimum quota dirtyrate is 25MB/s or even less
             minimum vcpu util is 6%

     case 2: dirty-ring-size: 65536, dirtyrate: 1170MB/s 
     result: minimum quota dirtyrate is 256MB/s
             minimum vcpu util is 24%
     
     I post this just for discussion, i think this is not a big deal
     beacase if we set the dirty-ring-size to the maximum value(65536),
     we assume the server's bandwidth is capable of handling it.

  3. I hard-code the acceptable deviation value to 25MB/s, see the
     macro DIRTYLIMIT_TOLERANCE_RANGE. I'm struggling to decide 
     whether to let it configurable
   
  4. Another point is the unplug cpu handle, current algo affects the
     unplugged vcpu, if we set dirty limit on it, we should fork 2 
     thread "dirtylimit" and "dirtylimit-calc" but do nothing, once the
     vcpu is hot-plugged, dirty limit works, i think the logic is ok
     but still there can be different advice.

- to let developers play with it easier, i post the hmp usage example:
  (qemu) vcpu_dirty_limit -g on -1 500
  [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
  
  (qemu) info vcpu_dirty_limit 
  vcpu[0], limit rate 500 (MB/s), current rate 415 (MB/s)
  vcpu[1], limit rate 500 (MB/s), current rate 496 (MB/s)
  vcpu[2], limit rate 500 (MB/s), current rate 0 (MB/s)
  vcpu[3], limit rate 500 (MB/s), current rate 0 (MB/s)
  (qemu) vcpu_dirty_limit -g off
  [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
  
  (qemu) info vcpu_dirty_limit 
  Dirty page limit not enabled!
  
  (qemu) vcpu_dirty_limit on 0 300
  [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
  
  (qemu) vcpu_dirty_limit on 1 500
  [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
  
  (qemu) info vcpu_dirty_limit 
  vcpu[0], limit rate 300 (MB/s), current rate 342 (MB/s)
  vcpu[1], limit rate 500 (MB/s), current rate 485 (MB/s)
  
  (qemu) vcpu_dirty_limit off 0
  [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
  
  (qemu) info vcpu_dirty_limit 
  vcpu[1], limit rate 500 (MB/s), current rate 528 (MB/s)
  
  (qemu) vcpu_dirty_limit off 1
  [Please use 'info vcpu_dirty_limit' to query dirty limit for virtual CPU]
  
  (qemu) info vcpu_dirty_limit 
  Dirty page limit not enabled!

Thanks very much for the instructive algo suggestion given by Peter,
the comment and other code reviews made by Markus.

Please review, thanks!

v9:
- rebase on master
- fix the meson directory change, keep it untouched.

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

Hyman Huang (5):
  accel/kvm/kvm-all: refactor per-vcpu dirty ring reaping
  migration/dirtyrate: refactor dirty page rate calculation
  softmmu/dirtylimit: implement vCPU dirtyrate calculation periodically
  softmmu/dirtylimit: implement virtual CPU throttle
  softmmu/dirtylimit: implement dirty page rate limit

 accel/kvm/kvm-all.c         |  36 ++-
 accel/stubs/kvm-stub.c      |   5 +
 hmp-commands-info.hx        |  13 +
 hmp-commands.hx             |  32 +++
 include/exec/memory.h       |   5 +-
 include/hw/core/cpu.h       |   6 +
 include/monitor/hmp.h       |   3 +
 include/sysemu/dirtylimit.h |  38 +++
 include/sysemu/dirtyrate.h  |  29 +++
 include/sysemu/kvm.h        |   2 +
 migration/dirtyrate.c       | 211 +++++++++------
 migration/dirtyrate.h       |   7 +-
 qapi/migration.json         |  80 ++++++
 softmmu/dirtylimit.c        | 622 ++++++++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build         |   1 +
 softmmu/trace-events        |   8 +
 16 files changed, 1002 insertions(+), 96 deletions(-)
 create mode 100644 include/sysemu/dirtylimit.h
 create mode 100644 include/sysemu/dirtyrate.h
 create mode 100644 softmmu/dirtylimit.c

-- 
1.8.3.1


