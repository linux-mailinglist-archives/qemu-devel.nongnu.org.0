Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796E62D3671
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:49:59 +0100 (CET)
Received: from localhost ([::1]:33972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlny-0007KB-Fr
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmlGz-0000W3-1X
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:15:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:38452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmlGw-00075n-0u
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:15:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FCC1AC55;
 Tue,  8 Dec 2020 22:15:45 +0000 (UTC)
Subject: Re: [RFC v9 00/22] i386 cleanup
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
 <6395fe61-fe47-6d36-dd12-f523e66c75ec@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <98b0c5fc-54cb-8e11-5cd9-ab3da978e664@suse.de>
Date: Tue, 8 Dec 2020 23:15:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6395fe61-fe47-6d36-dd12-f523e66c75ec@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, "Emilio G . Cota" <cota@braap.org>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 9:00 PM, Philippe Mathieu-Daudé wrote:
> On 12/8/20 8:48 PM, Claudio Fontana wrote:
>> v8 -> v9: move additional methods to CPUClass->tcg_ops
>>
>> do_unaligned_access, transaction_failed and do_interrupt.
>>
>> do_interrupt is a bit tricky, as the same code is reused
>> (albeit not usually directly) for KVM under certain odd conditions.
>>
>> Change arm, as the only user of do_interrupt callback for KVM,
>> to instead call the target function directly arm_do_interrupt.
> 
> Please use scripts/git.orderfile for such refactors please ;)

Aye aye!
If you'd like me to respin now, just let me know.

Ciao,

Claudio

> 
> ...
> 
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
>>  accel/tcg/cpu-exec.c                  |  70 +++-
>>  accel/tcg/cputlb.c                    |   6 +-
>>  accel/tcg/meson.build                 |   9 +-
>>  accel/tcg/tcg-all.c                   |  14 +-
>>  accel/tcg/tcg-cpus-icount.c           | 138 +++++++
>>  accel/tcg/tcg-cpus-icount.h           |  19 +
>>  accel/tcg/tcg-cpus-mttcg.c            | 134 +++++++
>>  accel/tcg/tcg-cpus-mttcg.h            |  19 +
>>  accel/tcg/tcg-cpus-rr.c               | 298 ++++++++++++++
>>  accel/tcg/tcg-cpus-rr.h               |  21 +
>>  accel/tcg/tcg-cpus.c                  | 539 +++-----------------------
>>  accel/tcg/tcg-cpus.h                  |   8 +-
>>  accel/tcg/user-exec.c                 |   6 +-
>>  accel/xen/xen-all.c                   |  24 +-
>>  bsd-user/main.c                       |  11 +-
>>  cpu.c                                 |  71 ++--
>>  hw/core/cpu.c                         |  30 +-
>>  hw/i386/fw_cfg.c                      |   2 +-
>>  hw/i386/intel_iommu.c                 |   2 +-
>>  hw/i386/kvm/apic.c                    |   2 +-
>>  hw/i386/kvm/clock.c                   |   2 +-
>>  hw/i386/microvm.c                     |   2 +-
>>  hw/i386/pc.c                          |   2 +-
>>  hw/i386/pc_piix.c                     |   1 +
>>  hw/i386/x86.c                         |   2 +-
>>  hw/mips/jazz.c                        |   4 +-
>>  include/hw/boards.h                   |   2 +-
>>  include/hw/core/accel-cpu.h           |  25 ++
>>  include/hw/core/cpu.h                 |  92 ++---
>>  include/hw/core/tcg-cpu-ops.h         |  75 ++++
>>  include/{sysemu => qemu}/accel.h      |  16 +-
>>  include/sysemu/accel-ops.h            |  45 +++
>>  include/sysemu/cpus.h                 |  26 +-
>>  include/sysemu/hvf.h                  |   2 +-
>>  include/sysemu/kvm.h                  |   2 +-
>>  include/sysemu/kvm_int.h              |   2 +-
>>  linux-user/main.c                     |   7 +-
>>  meson.build                           |   1 +
>>  softmmu/cpus.c                        |  12 +-
>>  softmmu/icount.c                      |   2 +-
>>  softmmu/memory.c                      |   2 +-
>>  softmmu/qtest.c                       |   2 +-
>>  softmmu/vl.c                          |   8 +-
>>  target/alpha/cpu.c                    |  18 +-
>>  target/arm/cpu.c                      |  26 +-
>>  target/arm/cpu64.c                    |   5 +-
>>  target/arm/cpu_tcg.c                  |   8 +-
>>  target/arm/helper.c                   |   4 +
>>  target/arm/kvm64.c                    |   4 +-
>>  target/avr/cpu.c                      |  13 +-
>>  target/avr/helper.c                   |   4 +-
>>  target/cris/cpu.c                     |  30 +-
>>  target/cris/helper.c                  |   4 +-
>>  target/hppa/cpu.c                     |  15 +-
>>  target/i386/cpu-dump.c                | 537 +++++++++++++++++++++++++
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
>>  target/m68k/cpu.c                     |  12 +-
>>  target/microblaze/cpu.c               |  23 +-
>>  target/mips/cpu.c                     |  21 +-
>>  target/moxie/cpu.c                    |  10 +-
>>  target/nios2/cpu.c                    |  14 +-
>>  target/openrisc/cpu.c                 |  12 +-
>>  target/ppc/translate_init.c.inc       |  23 +-
>>  target/riscv/cpu.c                    |  25 +-
>>  target/rx/cpu.c                       |  18 +-
>>  target/s390x/cpu.c                    |  15 +-
>>  target/sh4/cpu.c                      |  14 +-
>>  target/sparc/cpu.c                    |  18 +-
>>  target/tilegx/cpu.c                   |  10 +-
>>  target/tricore/cpu.c                  |   8 +-
>>  target/unicore32/cpu.c                |  14 +-
>>  target/xtensa/cpu.c                   |  16 +-
>>  141 files changed, 3007 insertions(+), 2051 deletions(-)
> ...
> 
> 


