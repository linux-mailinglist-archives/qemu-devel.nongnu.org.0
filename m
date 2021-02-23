Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C503227B0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:22:55 +0100 (CET)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETuA-0007mF-2C
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lETq2-0004NL-4Z
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:18:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:60178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lETpz-0005m2-Mr
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:18:37 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B4A2AEE5;
 Tue, 23 Feb 2021 09:18:34 +0000 (UTC)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ac869e6c-8969-585b-5a6e-a893635f2b2e@suse.de>
Date: Tue, 23 Feb 2021 10:18:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <875z2k53mn.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 8:00 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> Hi all,
>>
>> this is an experiment, a cleanup based on and requiring the series
>> "i386 cleanup PART 2":
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05935.html
>>
>> The goal is to split the code between TCG-only and non-TCG code,
>> fixing the KVM-only build (configure --disable-tcg),
>>
>> and laying the ground for further cleanups and the use of the
>> new accel objects in the hierarchy to specialize the cpu
>> according to the accelerator.
>>
>> This is known to be an early state, with probably a lot of work
>> still needed.
> 
> Well early work is looking pretty good:
> 
>   18:59:22 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|… ± ls -lh qemu-system-aarch64
>   -rwxr-xr-x 1 alex alex 107M Feb 22 18:08 qemu-system-aarch64*
>   18:59:29 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|… ± ls -lh ../disable.tcg/qemu-system-aarch64
>   -rwxr-xr-x 1 alex alex 76M Feb 22 17:47 ../disable.tcg/qemu-system-aarch64*
> 
> and I've tested the KVM side works well enough with a basic image.

Thanks for giving it a spin :-)

Now needs a cleanup pass for sure..

Ciao,

Claudio

> 
>>
>> I thought it could be useful to share early, especially in light
>> of the combination of this with Philippe's work on building
>> only the machines and devices compatible with KVM for arm.
>>
>> Comments welcome, thanks,
>>
>> Claudio
>>
>>
>> Claudio Fontana (38):
>>   target/arm: move translate modules to tcg/
>>   target/arm: move helpers to tcg/
>>   arm: tcg: only build under CONFIG_TCG
>>   target/arm: move psci.c into tcg/softmmu/
>>   target/arm: wrap arm_cpu_exec_interrupt in CONFIG_TCG
>>   target/arm: split off cpu-softmmu.c
>>   target/arm: split off softmmu/helper.c
>>   target/arm/tcg: split softmmu parts of v8_cp_reginfo and
>>     el2_cp_reginfo
>>   target/arm/tcg: split softmmu parts of vhe_cp_reginfo
>>   target/arm/tcg: move v8_user_idregs to user-only subdir
>>   target/arm/tcg: move id_v8_user_midr_cp_reginfo to user-only subdir
>>   target/arm/tcg: move mpidr_user_cp_reginfo to user-only subdir
>>   target/arm/tcg: split vapa_cp_reginfo softmmu part
>>   target/arm: move vec_internal.h to tcg/
>>   target/arm: move aarch64_sync_32_to_64 and vv to cpu code
>>   target/arm: move arm_sctlr away from tcg helpers
>>   target/arm: move switch_mode and cpsr_read/write to cpu
>>   target/arm: split vfp state setting from tcg helpers
>>   target/arm: move register read/write to common_cpu
>>   target/arm: move arm_hcr_el2_eff to common_cpu
>>   target/arm: move cp regs definition functions to common_cpu
>>   target/arm: move arm_cpu_list to common_cpu
>>   target/arm: move arm_mmu_idx_el to common-cpu
>>   target/arm: move aa64_va_parameter_tbi,tbid,tcma and
>>     arm_rebuild_hflags
>>   target/arm: move fp_exception_el outside of tcg helpers
>>   target/arm: move sve_exception_el to cpu
>>   target/arm: move sve_zcr_len_for_el to common_cpu
>>   target/arm: make arm_pmu_timer_cb TCG-only, starting tcg-stub
>>   target/arm/tcg: add write_v7m_exception to stubs
>>   target/arm: make hw_watchpoint and hw_breakpoint stuff tcg-only
>>   target/arm: move cp register write-ignore and read-as-zero to cpu
>>   target/arm: cpu: do not initialize TCG PMU for KVM
>>   target/arm: cpu: do not initialize TCG view of cpregs
>>   target/arm: cpu: only initialize TCG gt timers under CONFIG_TCG
>>   target/arm: get-phys-addr: new module
>>   target/arm: move qmp_query_cpu_definitions to common_cpu
>>   target/arm: move arm_mmu_idx from tcg to get-phys-addr.c
>>   target/arm: move arm_cpu_do_interrupt from tcg to common code
>>
>>  meson.build                               |    2 +
>>  target/arm/cpu.h                          |    5 +
>>  target/arm/internals.h                    |   84 +-
>>  target/arm/tcg/helper-tcg.h               |   50 +
>>  target/arm/tcg/softmmu/trace.h            |    1 +
>>  target/arm/tcg/trace.h                    |    1 +
>>  target/arm/{ => tcg}/translate-a64.h      |    0
>>  target/arm/{ => tcg}/translate.h          |    0
>>  target/arm/{ => tcg}/vec_internal.h       |    0
>>  target/arm/{ => tcg}/a32-uncond.decode    |    0
>>  target/arm/{ => tcg}/a32.decode           |    0
>>  target/arm/{ => tcg}/m-nocp.decode        |    0
>>  target/arm/{ => tcg}/neon-dp.decode       |    0
>>  target/arm/{ => tcg}/neon-ls.decode       |    0
>>  target/arm/{ => tcg}/neon-shared.decode   |    0
>>  target/arm/{ => tcg}/sve.decode           |    0
>>  target/arm/{ => tcg}/t16.decode           |    0
>>  target/arm/{ => tcg}/t32.decode           |    0
>>  target/arm/{ => tcg}/vfp-uncond.decode    |    0
>>  target/arm/{ => tcg}/vfp.decode           |    0
>>  target/arm/cpu-common.c                   | 1388 +++++
>>  target/arm/cpu-softmmu.c                  | 1228 ++++
>>  target/arm/cpu-user.c                     |   77 +
>>  target/arm/cpu-vfp.c                      |  232 +
>>  target/arm/cpu.c                          |  109 +-
>>  target/arm/get-phys-addr.c                | 2286 +++++++
>>  target/arm/machine.c                      |   23 +-
>>  target/arm/{ => tcg}/crypto_helper.c      |    0
>>  target/arm/{ => tcg}/debug_helper.c       |    0
>>  target/arm/{ => tcg}/helper-a64.c         |    0
>>  target/arm/{ => tcg}/helper.c             | 6613 +--------------------
>>  target/arm/{ => tcg}/iwmmxt_helper.c      |    0
>>  target/arm/{ => tcg}/m_helper.c           |    0
>>  target/arm/{ => tcg}/mte_helper.c         |    0
>>  target/arm/{ => tcg}/neon_helper.c        |    0
>>  target/arm/{ => tcg}/op_helper.c          |    0
>>  target/arm/{ => tcg}/pauth_helper.c       |    0
>>  target/arm/tcg/softmmu/helper.c           | 1784 ++++++
>>  target/arm/{ => tcg/softmmu}/psci.c       |    0
>>  target/arm/{ => tcg}/sve_helper.c         |    0
>>  target/arm/tcg/tcg-stub.c                 |   20 +
>>  target/arm/{ => tcg}/tlb_helper.c         |    0
>>  target/arm/{ => tcg}/translate-a64.c      |    0
>>  target/arm/{ => tcg}/translate-sve.c      |    0
>>  target/arm/{ => tcg}/translate.c          |    0
>>  target/arm/tcg/user/helper.c              |  129 +
>>  target/arm/tcg/user/psci.c                |   26 +
>>  target/arm/{ => tcg}/vec_helper.c         |    0
>>  target/arm/{ => tcg}/vfp_helper.c         |  210 +-
>>  target/arm/{ => tcg}/translate-neon.c.inc |    0
>>  target/arm/{ => tcg}/translate-vfp.c.inc  |    0
>>  target/arm/meson.build                    |   42 +-
>>  target/arm/tcg/meson.build                |   43 +
>>  target/arm/tcg/softmmu/meson.build        |    5 +
>>  target/arm/tcg/softmmu/trace-events       |   10 +
>>  target/arm/tcg/trace-events               |    2 +
>>  target/arm/tcg/user/meson.build           |    5 +
>>  target/arm/trace-events                   |    9 -
>>  58 files changed, 7427 insertions(+), 6957 deletions(-)
>>  create mode 100644 target/arm/tcg/helper-tcg.h
>>  create mode 100644 target/arm/tcg/softmmu/trace.h
>>  create mode 100644 target/arm/tcg/trace.h
>>  rename target/arm/{ => tcg}/translate-a64.h (100%)
>>  rename target/arm/{ => tcg}/translate.h (100%)
>>  rename target/arm/{ => tcg}/vec_internal.h (100%)
>>  rename target/arm/{ => tcg}/a32-uncond.decode (100%)
>>  rename target/arm/{ => tcg}/a32.decode (100%)
>>  rename target/arm/{ => tcg}/m-nocp.decode (100%)
>>  rename target/arm/{ => tcg}/neon-dp.decode (100%)
>>  rename target/arm/{ => tcg}/neon-ls.decode (100%)
>>  rename target/arm/{ => tcg}/neon-shared.decode (100%)
>>  rename target/arm/{ => tcg}/sve.decode (100%)
>>  rename target/arm/{ => tcg}/t16.decode (100%)
>>  rename target/arm/{ => tcg}/t32.decode (100%)
>>  rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
>>  rename target/arm/{ => tcg}/vfp.decode (100%)
>>  create mode 100644 target/arm/cpu-common.c
>>  create mode 100644 target/arm/cpu-softmmu.c
>>  create mode 100644 target/arm/cpu-user.c
>>  create mode 100644 target/arm/cpu-vfp.c
>>  create mode 100644 target/arm/get-phys-addr.c
>>  rename target/arm/{ => tcg}/crypto_helper.c (100%)
>>  rename target/arm/{ => tcg}/debug_helper.c (100%)
>>  rename target/arm/{ => tcg}/helper-a64.c (100%)
>>  rename target/arm/{ => tcg}/helper.c (53%)
>>  rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
>>  rename target/arm/{ => tcg}/m_helper.c (100%)
>>  rename target/arm/{ => tcg}/mte_helper.c (100%)
>>  rename target/arm/{ => tcg}/neon_helper.c (100%)
>>  rename target/arm/{ => tcg}/op_helper.c (100%)
>>  rename target/arm/{ => tcg}/pauth_helper.c (100%)
>>  create mode 100644 target/arm/tcg/softmmu/helper.c
>>  rename target/arm/{ => tcg/softmmu}/psci.c (100%)
>>  rename target/arm/{ => tcg}/sve_helper.c (100%)
>>  create mode 100644 target/arm/tcg/tcg-stub.c
>>  rename target/arm/{ => tcg}/tlb_helper.c (100%)
>>  rename target/arm/{ => tcg}/translate-a64.c (100%)
>>  rename target/arm/{ => tcg}/translate-sve.c (100%)
>>  rename target/arm/{ => tcg}/translate.c (100%)
>>  create mode 100644 target/arm/tcg/user/helper.c
>>  create mode 100644 target/arm/tcg/user/psci.c
>>  rename target/arm/{ => tcg}/vec_helper.c (100%)
>>  rename target/arm/{ => tcg}/vfp_helper.c (84%)
>>  rename target/arm/{ => tcg}/translate-neon.c.inc (100%)
>>  rename target/arm/{ => tcg}/translate-vfp.c.inc (100%)
>>  create mode 100644 target/arm/tcg/meson.build
>>  create mode 100644 target/arm/tcg/softmmu/meson.build
>>  create mode 100644 target/arm/tcg/softmmu/trace-events
>>  create mode 100644 target/arm/tcg/trace-events
>>  create mode 100644 target/arm/tcg/user/meson.build
> 
> 


