Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F82CEF19
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 14:57:46 +0100 (CET)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBaj-0002Cv-7X
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 08:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klBYw-0000VL-2B
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:55:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:46148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klBYt-0002W9-3h
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:55:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C59CEAC75;
 Fri,  4 Dec 2020 13:55:49 +0000 (UTC)
Subject: Re: [RFC v7 00/22] i386 cleanup [hw/core/cpu.c common]
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201130023535.16689-1-cfontana@suse.de>
 <07bc7bc1-a6d0-a470-b717-15cb23c06563@suse.de>
Message-ID: <6fa4cfb6-6d85-3e79-83d7-4ae88c694941@suse.de>
Date: Fri, 4 Dec 2020 14:55:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <07bc7bc1-a6d0-a470-b717-15cb23c06563@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, "Emilio G . Cota" <cota@braap.org>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 2:54 PM, Claudio Fontana wrote:
> On 11/30/20 3:35 AM, Claudio Fontana wrote:
>> Hi all, this is v7 of the i386 cleanup,
> 
> This is fairly broken still and I am fixing it up,
> 
> but a question arises while hunting bugs here.
> 
> Silent bugs are introduced when trying to use code like
> 
> #ifndef CONFIG_USER_ONLY
> 
> in files that are built in "common" objects, since they are target independent.
> 
> I wonder also about the rationale why the cpu code is split between
> 
> hw/core/cpu.c and $(top_srcdir)/cpu.c
> 
> with one part in common and one part in "target specific".
> 
> What do we gain by having part of the cpu in common?
> 
> In some cases we end up going through all sort of hoops because we cannot just code everything in hw/core/cpu.c due to the fact
> that we do not see CONFIG_ there.


And btw I think there are bugs already _today_ in hw/core/cpu.c, due to the fact that there is code that
unknowingly is already checking CONFIG_ .


> 
> 
>> with the most interesting patches at the end.
>>
>> v6 -> v7: integrate TCGCpuOperations, refactored cpu_exec_realizefn
>>
>> * integrate TCGCpuOperations (Eduardo)
>>
>> Taken some refactoring from Eduardo for Tcg-only operations on
>> CPUClass.
>>
>> * refactored cpu_exec_realizefn
>>
>> The other main change is a refactoring of cpu_exec_realizefn,
>> directly linked to the effort of making many cpu_exec operations
>> TCG-only (Eduardo series above):
>>
>> cpu_exec_realizefn is actually a TCG-only thing, with the
>> exception of a couple things that can be done in base cpu code.
>>
>> This changes all targets realizefn, so I guess I have to Cc:
>> the Multiverse? (Universe was already CCed for all accelerators).
>>
>>
>> v5 -> v6: remove MODULE_INIT_ACCEL_CPU
>>
>>
>> instead, use a call to accel_init_interfaces().
>>
>> * The class lookups are now general and performed in accel/
>>
>>   new AccelCPUClass for new archs are supported as new
>>   ones appear in the class hierarchy, no need for stubs.
>>
>> * Split the code a bit better
>>
>>
>> v4 -> v5: centralized and simplified initializations
>>
>> I put in Cc: Emilio G. Cota, specifically because in patch 8
>> I (re)moved for user-mode the call to tcg_regions_init().
>>
>> The call happens now inside the tcg AccelClass machine_init,
>> (so earlier). This seems to work fine, but thought to get the
>> author opinion on this.
>>
>> Rebased on "tcg-cpus: split into 3 tcg variants" series
>> (queued by Richard), to avoid some code churn:
>>
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg04356.html
>>
>>
>> * Extended AccelClass to user-mode.
>>
>> user-mode now does not call tcg_exec_init directly,
>> instead it uses the tcg accel class, and its init_machine method.
>>
>> Since user-mode does not define or use a machine state,
>> the machine is just passed as NULL.
>>
>> The immediate advantage is that now we can call current_accel()
>> from both user mode and softmmu, so we can work out the correct
>> class to use for accelerator initializations.
>>
>> * QOMification of CpusAccelOps
>>
>> simple QOMification of CpusAccelOps abstract class.
>>
>> * Centralized all accel_cpu_init, so only one per cpu-arch,
>>   plus one for all accels will remain.
>>
>>   So we can expect accel_cpu_init() to be limited to:
>>   
>>   softmmu/cpus.c - initializes the chosen softmmu accel ops for the cpus module.
>>   target/ARCH/cpu.c - initializes the chosen arch-specific cpu accelerator.
>>   
>> These changes are meant to address concerns/issues (Paolo):
>>
>> 1) the use of if (tcg_enabled()) and similar in the module_init call path
>>
>> 2) the excessive number of accel_cpu_init() to hunt down in the codebase.
>>
>>
>> * Fixed wrong use of host_cpu_class_init (Eduardo)
>>
>>
>> v3 -> v4: QOMification of X86CPUAccelClass
>>
>>
>> In this version I basically QOMified X86CPUAccel, taking the
>> suggestions from Eduardo as the starting point,
>> but stopping just short of making it an actual QOM interface,
>> using a plain abstract class, and then subclasses for the
>> actual objects.
>>
>> Initialization is still using the existing qemu initialization
>> framework (module_call_init), which is I still think is better
>> than the alternatives proposed, in the current state.
>>
>> Possibly some improvements could be developed in the future here.
>> In this case, effort should be put in keeping things extendible,
>> in order not to be blocked once accelerators also become modules.
>>
>> Motivation and higher level steps:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html
>>
>> Looking forward to your comments on this proposal,
>>
>> Ciao,
>>
>> Claudio
>>
>> Claudio Fontana (13):
>>   i386: move kvm accel files into kvm/
>>   i386: move whpx accel files into whpx/
>>   i386: move hax accel files into hax/
>>   i386: hvf: remove stale MAINTAINERS entry for old hvf stubs
>>   i386: move TCG accel files into tcg/
>>   i386: move cpu dump out of helper.c into cpu-dump.c
>>   i386: move TCG cpu class initialization out of helper.c
>>   accel: extend AccelState and AccelClass to user-mode
>>   accel: replace struct CpusAccel with AccelOpsClass
>>   accel: introduce AccelCPUClass extending CPUClass
>>   i386: split cpu accelerators from cpu.c, using AccelCPUClass
>>   cpu-exec: refactor realizefn for all targets
>>   cpu: introduce cpu_accel_instance_init
>>
>> Eduardo Habkost (9):
>>   tcg: cpu_exec_{enter,exit} helpers
>>   tcg: make CPUClass.cpu_exec_* optional
>>   tcg: Make CPUClass.debug_excp_handler optional
>>   cpu: Remove unnecessary noop methods
>>   cpu: Introduce TCGCpuOperations struct
>>   cpu: Move synchronize_from_tb() to tcg_ops
>>   cpu: Move cpu_exec_* to tcg_ops
>>   cpu: Move tlb_fill to tcg_ops
>>   cpu: Move debug_excp_handler to tcg_ops
>>
>>  MAINTAINERS                           |  19 +-
>>  accel/accel-common.c                  | 105 +++++
>>  accel/{accel.c => accel-softmmu.c}    |  60 +--
>>  accel/accel-softmmu.h                 |  15 +
>>  accel/accel-user.c                    |  24 ++
>>  accel/kvm/kvm-all.c                   |   2 -
>>  accel/kvm/kvm-cpus.c                  |  26 +-
>>  accel/kvm/kvm-cpus.h                  |   2 -
>>  accel/meson.build                     |   4 +-
>>  accel/qtest/qtest.c                   |  25 +-
>>  accel/tcg/cpu-exec.c                  |  86 +++-
>>  accel/tcg/cputlb.c                    |   6 +-
>>  accel/tcg/meson.build                 |   2 +-
>>  accel/tcg/tcg-all.c                   |  11 +-
>>  accel/tcg/tcg-cpus-icount.c           |  11 +-
>>  accel/tcg/tcg-cpus-icount.h           |   2 +
>>  accel/tcg/tcg-cpus-mttcg.c            |  12 +-
>>  accel/tcg/tcg-cpus-mttcg.h            |  19 +
>>  accel/tcg/tcg-cpus-rr.c               |   7 -
>>  accel/tcg/tcg-cpus.c                  |  43 ++
>>  accel/tcg/tcg-cpus.h                  |   4 -
>>  accel/tcg/user-exec.c                 |   6 +-
>>  accel/xen/xen-all.c                   |  24 +-
>>  bsd-user/main.c                       |  12 +-
>>  cpu.c                                 |  53 +--
>>  hw/core/cpu.c                         |  44 ++-
>>  hw/i386/fw_cfg.c                      |   2 +-
>>  hw/i386/intel_iommu.c                 |   2 +-
>>  hw/i386/kvm/apic.c                    |   2 +-
>>  hw/i386/kvm/clock.c                   |   2 +-
>>  hw/i386/microvm.c                     |   2 +-
>>  hw/i386/pc.c                          |   2 +-
>>  hw/i386/pc_piix.c                     |   1 +
>>  hw/i386/x86.c                         |   2 +-
>>  include/exec/cpu-all.h                |   4 +
>>  include/hw/boards.h                   |   2 +-
>>  include/hw/core/accel-cpu.h           |  25 ++
>>  include/hw/core/cpu.h                 |  65 ++--
>>  include/hw/core/tcg-cpu-ops.h         |  56 +++
>>  include/{sysemu => qemu}/accel.h      |  16 +-
>>  include/sysemu/accel-ops.h            |  45 +++
>>  include/sysemu/cpus.h                 |  26 +-
>>  include/sysemu/hvf.h                  |   2 +-
>>  include/sysemu/kvm.h                  |   2 +-
>>  include/sysemu/kvm_int.h              |   2 +-
>>  linux-user/main.c                     |   8 +-
>>  meson.build                           |   1 +
>>  softmmu/cpus.c                        |  12 +-
>>  softmmu/memory.c                      |   2 +-
>>  softmmu/qtest.c                       |   2 +-
>>  softmmu/vl.c                          |  12 +-
>>  target/alpha/cpu.c                    |  12 +-
>>  target/arm/cpu.c                      |  16 +-
>>  target/arm/cpu64.c                    |   2 +-
>>  target/arm/cpu_tcg.c                  |   2 +-
>>  target/avr/cpu.c                      |  13 +-
>>  target/cris/cpu.c                     |  20 +-
>>  target/hppa/cpu.c                     |  11 +-
>>  target/i386/cpu-dump.c                | 538 +++++++++++++++++++++++++
>>  target/i386/cpu.c                     | 418 ++------------------
>>  target/i386/cpu.h                     | 120 +-----
>>  target/i386/{ => hax}/hax-all.c       |   5 +-
>>  target/i386/{ => hax}/hax-cpus.c      |  29 +-
>>  target/i386/{ => hax}/hax-cpus.h      |   2 -
>>  target/i386/{ => hax}/hax-i386.h      |   6 +-
>>  target/i386/{ => hax}/hax-interface.h |   0
>>  target/i386/{ => hax}/hax-mem.c       |   0
>>  target/i386/{ => hax}/hax-posix.c     |   0
>>  target/i386/{ => hax}/hax-posix.h     |   0
>>  target/i386/{ => hax}/hax-windows.c   |   0
>>  target/i386/{ => hax}/hax-windows.h   |   0
>>  target/i386/hax/meson.build           |   7 +
>>  target/i386/helper-tcg.h              | 112 ++++++
>>  target/i386/helper.c                  | 539 +-------------------------
>>  target/i386/host-cpu.c                | 198 ++++++++++
>>  target/i386/host-cpu.h                |  19 +
>>  target/i386/hvf/cpu.c                 |  65 ++++
>>  target/i386/hvf/hvf-cpus.c            |  27 +-
>>  target/i386/hvf/hvf-cpus.h            |   2 -
>>  target/i386/hvf/hvf-i386.h            |   2 +-
>>  target/i386/hvf/hvf.c                 |   3 +-
>>  target/i386/hvf/meson.build           |   1 +
>>  target/i386/hvf/x86_task.c            |   2 +-
>>  target/i386/kvm/cpu.c                 | 148 +++++++
>>  target/i386/{ => kvm}/hyperv-proto.h  |   0
>>  target/i386/{ => kvm}/hyperv-stub.c   |   0
>>  target/i386/{ => kvm}/hyperv.c        |   0
>>  target/i386/{ => kvm}/hyperv.h        |   0
>>  target/i386/kvm/kvm-cpu.h             |  41 ++
>>  target/i386/{ => kvm}/kvm-stub.c      |   0
>>  target/i386/{ => kvm}/kvm.c           |   3 +-
>>  target/i386/{ => kvm}/kvm_i386.h      |   0
>>  target/i386/kvm/meson.build           |   8 +
>>  target/i386/kvm/trace-events          |   7 +
>>  target/i386/kvm/trace.h               |   1 +
>>  target/i386/machine.c                 |   4 +-
>>  target/i386/meson.build               |  39 +-
>>  target/i386/{ => tcg}/bpt_helper.c    |   1 +
>>  target/i386/{ => tcg}/cc_helper.c     |   1 +
>>  target/i386/tcg/cpu.c                 | 173 +++++++++
>>  target/i386/{ => tcg}/excp_helper.c   |   1 +
>>  target/i386/{ => tcg}/fpu_helper.c    |  33 +-
>>  target/i386/{ => tcg}/int_helper.c    |   1 +
>>  target/i386/{ => tcg}/mem_helper.c    |   1 +
>>  target/i386/tcg/meson.build           |  14 +
>>  target/i386/{ => tcg}/misc_helper.c   |   1 +
>>  target/i386/{ => tcg}/mpx_helper.c    |   1 +
>>  target/i386/{ => tcg}/seg_helper.c    |   1 +
>>  target/i386/{ => tcg}/smm_helper.c    |   2 +
>>  target/i386/{ => tcg}/svm_helper.c    |   1 +
>>  target/i386/{ => tcg}/tcg-stub.c      |   0
>>  target/i386/{ => tcg}/translate.c     |   1 +
>>  target/i386/trace-events              |   6 -
>>  target/i386/whpx/meson.build          |   4 +
>>  target/i386/{ => whpx}/whp-dispatch.h |   0
>>  target/i386/{ => whpx}/whpx-all.c     |   4 +-
>>  target/i386/{ => whpx}/whpx-cpus.c    |  29 +-
>>  target/i386/{ => whpx}/whpx-cpus.h    |   2 -
>>  target/lm32/cpu.c                     |  13 +-
>>  target/m68k/cpu.c                     |  10 +-
>>  target/microblaze/cpu.c               |  17 +-
>>  target/mips/cpu.c                     |  12 +-
>>  target/moxie/cpu.c                    |  10 +-
>>  target/nios2/cpu.c                    |  12 +-
>>  target/openrisc/cpu.c                 |  12 +-
>>  target/ppc/translate_init.c.inc       |  17 +-
>>  target/riscv/cpu.c                    |  18 +-
>>  target/rx/cpu.c                       |  18 +-
>>  target/s390x/cpu.c                    |  13 +-
>>  target/sh4/cpu.c                      |  12 +-
>>  target/sparc/cpu.c                    |  14 +-
>>  target/tilegx/cpu.c                   |  10 +-
>>  target/tricore/cpu.c                  |  10 +-
>>  target/unicore32/cpu.c                |  12 +-
>>  target/xtensa/cpu.c                   |  12 +-
>>  135 files changed, 2302 insertions(+), 1540 deletions(-)
>>  create mode 100644 accel/accel-common.c
>>  rename accel/{accel.c => accel-softmmu.c} (64%)
>>  create mode 100644 accel/accel-softmmu.h
>>  create mode 100644 accel/accel-user.c
>>  create mode 100644 accel/tcg/tcg-cpus-mttcg.h
>>  create mode 100644 include/hw/core/accel-cpu.h
>>  create mode 100644 include/hw/core/tcg-cpu-ops.h
>>  rename include/{sysemu => qemu}/accel.h (94%)
>>  create mode 100644 include/sysemu/accel-ops.h
>>  create mode 100644 target/i386/cpu-dump.c
>>  rename target/i386/{ => hax}/hax-all.c (99%)
>>  rename target/i386/{ => hax}/hax-cpus.c (71%)
>>  rename target/i386/{ => hax}/hax-cpus.h (95%)
>>  rename target/i386/{ => hax}/hax-i386.h (95%)
>>  rename target/i386/{ => hax}/hax-interface.h (100%)
>>  rename target/i386/{ => hax}/hax-mem.c (100%)
>>  rename target/i386/{ => hax}/hax-posix.c (100%)
>>  rename target/i386/{ => hax}/hax-posix.h (100%)
>>  rename target/i386/{ => hax}/hax-windows.c (100%)
>>  rename target/i386/{ => hax}/hax-windows.h (100%)
>>  create mode 100644 target/i386/hax/meson.build
>>  create mode 100644 target/i386/helper-tcg.h
>>  create mode 100644 target/i386/host-cpu.c
>>  create mode 100644 target/i386/host-cpu.h
>>  create mode 100644 target/i386/hvf/cpu.c
>>  create mode 100644 target/i386/kvm/cpu.c
>>  rename target/i386/{ => kvm}/hyperv-proto.h (100%)
>>  rename target/i386/{ => kvm}/hyperv-stub.c (100%)
>>  rename target/i386/{ => kvm}/hyperv.c (100%)
>>  rename target/i386/{ => kvm}/hyperv.h (100%)
>>  create mode 100644 target/i386/kvm/kvm-cpu.h
>>  rename target/i386/{ => kvm}/kvm-stub.c (100%)
>>  rename target/i386/{ => kvm}/kvm.c (99%)
>>  rename target/i386/{ => kvm}/kvm_i386.h (100%)
>>  create mode 100644 target/i386/kvm/meson.build
>>  create mode 100644 target/i386/kvm/trace-events
>>  create mode 100644 target/i386/kvm/trace.h
>>  rename target/i386/{ => tcg}/bpt_helper.c (99%)
>>  rename target/i386/{ => tcg}/cc_helper.c (99%)
>>  create mode 100644 target/i386/tcg/cpu.c
>>  rename target/i386/{ => tcg}/excp_helper.c (99%)
>>  rename target/i386/{ => tcg}/fpu_helper.c (99%)
>>  rename target/i386/{ => tcg}/int_helper.c (99%)
>>  rename target/i386/{ => tcg}/mem_helper.c (99%)
>>  create mode 100644 target/i386/tcg/meson.build
>>  rename target/i386/{ => tcg}/misc_helper.c (99%)
>>  rename target/i386/{ => tcg}/mpx_helper.c (99%)
>>  rename target/i386/{ => tcg}/seg_helper.c (99%)
>>  rename target/i386/{ => tcg}/smm_helper.c (99%)
>>  rename target/i386/{ => tcg}/svm_helper.c (99%)
>>  rename target/i386/{ => tcg}/tcg-stub.c (100%)
>>  rename target/i386/{ => tcg}/translate.c (99%)
>>  create mode 100644 target/i386/whpx/meson.build
>>  rename target/i386/{ => whpx}/whp-dispatch.h (100%)
>>  rename target/i386/{ => whpx}/whpx-all.c (99%)
>>  rename target/i386/{ => whpx}/whpx-cpus.c (73%)
>>  rename target/i386/{ => whpx}/whpx-cpus.h (96%)
>>
> 


