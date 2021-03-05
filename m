Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44B32EF8D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:03:44 +0100 (CET)
Received: from localhost ([::1]:52568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICvX-0005It-Qb
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lICq7-0007LH-O6
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:58:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:54552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lICq4-0004U2-Sn
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:58:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 557A6ACCF;
 Fri,  5 Mar 2021 15:58:03 +0000 (UTC)
Subject: Re: [RFC v4 00/33] arm cleanup experiment for kvm-only build
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210305145941.32020-1-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <6eda0fc9-36d7-8ad1-dc17-d03dae41ec60@suse.de>
Date: Fri, 5 Mar 2021 16:58:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210305145941.32020-1-cfontana@suse.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 3:59 PM, Claudio Fontana wrote:
> Here a new version of the series that enables kvm-only builds.
> The goal here is to enable the KVM-only build.
> 
> The split of additional kvm code to kvm/ is planned for the next series,
> along with the splitting of the accelerator-specific extensions to the
> cpu class.
> 
> Last patches with XXX are not meant for applying, and are only there for
> reference. They allow a clean make check by disabling the tests that
> currently fail.
> 
> TEST FAILURES:
> 
> The following tests fail, and I'd appreciate any help here:
> 
> test-crypto-tlscredsx509
> test-crypto-tlssession
> test-io-channel-tls

these three actually work fine. Sorry for the confusion.

We are left with the breakages that follow.

> arm-cpu-features
> device-introspect-test
> qom-test
> test-hmp
> 
> The following tests fail, and probably they just need disabling:
> 
> tpm-tis-device-test
> tpm-tis-device-swtpm-test
> 
> v3 -> v4:
> 
> * added style cleanup patches
> 
> * added header cleanup
> 
> * added basic move of simple KVM-only code to kvm/
> 
> * fixed some qtest failures due to existing:
> 
>   if (kvm_enabled) {
>   
>   } else {
> 
>   }
> 
>   which needed explicit if qtest_enabled() in addition to tcg_enabled() check
> 
> * include 32bit cpus for AArch64 too.
> 
> v2 -> v3:
> 
> * "target/arm: tcg: add sysemu and user subsirs"
>   - new standalone patch to create the empty tcg/sysemu and tcg/user subdirs.
> 
> * "target/arm: only build psci for TCG"
>   - do not move psci inside tcg/ directory, because HVF might use it soon.
>     (Peter)
> 
> * "target/arm: move physical address translation"
>   - change the module name from "get-phys-addr" to "cpu-mmu",
>     which includes aa64_va_parameter in this patch, and that
>     will also contain the get_mmu_idx* functions later in the series.
>     (Richard)
> 
> * "target/arm: split cpregs from tcg/helper.c"
>   - moved raw_read and raw_write to cpregs.h (Richard)
> 
> * "target/arm: only perform TCG cpu and machine inits if TCG enabled"
>   - add an explanatory comment before the kvm function for cpreg list init
>   - change the use of g_renew to g_new, since we do not do the double
>     initialization of cpreg list anymore.
> 
> * "target/arm: add temporary stub for arm_rebuild_hflags"
>   - use a if (tcg_enabled()) instead of #ifdef (Richard)
> 
> * "target/arm: split vfp state setting from tcg helpers"
>   - explain better what goes where in the commit (Richard)
> 
> * "target/arm: move arm_mmu_idx*"
>   - move the functions to cpu-mmu instead of get-phys-addr (Richard)
> 
> * "target/arm: move sve_zcr_len_for_el to common_cpu"
> 
>  - add a comment about those functions being in theory
>    TARGET_AARCH64 specific, but making the change would spawn
>    a large number of additional #ifdefs. This state predates this
>    change (Richard).
> 
> * "target/arm: move aarch64_sync_32_to_64 (and vv) to cpu code"
> 
>  - explain better why these functions are needed for KVM too (Richard)
> 
> * "target/arm: move sve_exception_el out of TCG helpers"
> 
>  - bring over the sve_exception_el code, making it available for KVM too.
>    (Richard)
> 
> * "target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()"
> 
>  - mention in the commit that this enables finally a build with
>    configure --enable-kvm --disable-tcg
> 
> 
> v1 -> v2: reworked of the whole series
> 
> In this v2, only the first two patches remain, the rest is
> reworked.
> 
> Main reasons for the rework were:
> 
> 1) moving out cpregs to its own module, leave the tcg-only part in tcg/
> 
> 2) split of arm cpu32, cpu64 and cpu models. This is still not perfect,
>    but I think it's an improvement.
> 
> 3) import less stuff, that is actually unused or can be stubbed on KVM
>    (thanks to the precious feedback on the previous RFCv1).
> 
> ...
> 
> Main issues:
> 
> 1) basically needs the "configure only machines compatible with KVM" from Philippe,
>    so we can avoid some of the stubs.
> 
> 2) tests/ work fine building with tcg or with tcg + kvm,
>    but for making a kvm-only build pass the tests, more work is needed in tests/
>    figuring out which tests are TCG-only and which need to be tweaked.
> 
> Thanks a lot for your comments!
> 
> 
> . / . / . / . / . / . /
> 
> 
> Hi all,
> 
> this is an experiment, a cleanup based on and requiring the series
> "i386 cleanup PART 2":
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05935.html
> 
> The goal is to split the code between TCG-only and non-TCG code,
> fixing the KVM-only build (configure --disable-tcg),
> 
> and laying the ground for further cleanups and the use of the
> new accel objects in the hierarchy to specialize the cpu
> according to the accelerator.
> 
> This is known to be an early state, with probably a lot of work
> still needed.
> 
> I thought it could be useful to share early, especially in light
> of the combination of this with Philippe's work on building
> only the machines and devices compatible with KVM for arm.
> 
> Comments welcome, thanks,
> 
> Claudio
> 
> 
> Claudio Fontana (33):
>   target/arm: move translate modules to tcg/
>   target/arm: move helpers to tcg/
>   arm: tcg: only build under CONFIG_TCG
>   target/arm: tcg: add sysemu and user subsirs
>   target/arm: only build psci for TCG
>   target/arm: split off cpu-sysemu.c
>   target/arm: move physical address translation to cpu-mmu
>   target/arm: cpu-mmu: fix comment style
>   target/arm: split cpregs from tcg/helper.c
>   target/arm: cpregs: fix style (mostly just comments)
>   target/arm: move cpu definitions to common cpu module
>   target/arm: only perform TCG cpu and machine inits if TCG enabled
>   target/arm: kvm: add stubs for some helpers
>   target/arm: move cpsr_read, cpsr_write to cpu_common
>   target/arm: add temporary stub for arm_rebuild_hflags
>   target/arm: split vfp state setting from tcg helpers
>   target/arm: move arm_mmu_idx* to cpu-mmu
>   target/arm: move sve_zcr_len_for_el to common_cpu
>   target/arm: move arm_sctlr away from tcg helpers
>   target/arm: move arm_cpu_list to common_cpu
>   target/arm: move aarch64_sync_32_to_64 (and vv) to cpu code
>   target/arm: split 32bit cpu models from cpu.c to cpu32.c
>   target/arm: move sve_exception_el out of TCG helpers
>   target/arm: move TCG cpu and models inside tcg/
>   target/arm: cpu: fix style
>   target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>   target/arm: remove kvm include file for PSCI and arm-powerctl
>   target/arm: move kvm-const.h, kvm.c, kvm64.c, kvm_arm.h to kvm/
>   target/arm: cleanup cpu includes
>   target/arm: remove broad "else" statements when checking accels
>   tests/qtest: skip bios-tables-test test_acpi_oem_fields_virt for KVM
>   XXX disable a bunch of tests that seem to use tcg cpus
>   XXX disable arm-cpu-features
> 
>  meson.build                                   |    3 +-
>  target/arm/arm-powerctl.h                     |    2 -
>  target/arm/cpregs.h                           |  274 +
>  target/arm/cpu-mmu.h                          |  119 +
>  target/arm/cpu-qom.h                          |    3 -
>  target/arm/cpu-vfp.h                          |   29 +
>  target/arm/cpu.h                              |  246 +-
>  target/arm/cpu32.h                            |   27 +
>  target/arm/internals.h                        |   47 +-
>  target/arm/{ => kvm}/kvm-consts.h             |    0
>  target/arm/{ => kvm}/kvm_arm.h                |    0
>  target/arm/kvm/trace.h                        |    1 +
>  target/arm/{ => tcg}/op_addsub.h              |    0
>  target/arm/tcg/tcg-cpu.h                      |   37 +
>  target/arm/tcg/trace.h                        |    1 +
>  target/arm/{ => tcg}/translate-a64.h          |    0
>  target/arm/{ => tcg}/translate.h              |    0
>  target/arm/{ => tcg}/vec_internal.h           |    0
>  target/arm/trace.h                            |    1 -
>  target/arm/{ => tcg}/a32-uncond.decode        |    0
>  target/arm/{ => tcg}/a32.decode               |    0
>  target/arm/{ => tcg}/m-nocp.decode            |    0
>  target/arm/{ => tcg}/neon-dp.decode           |    0
>  target/arm/{ => tcg}/neon-ls.decode           |    0
>  target/arm/{ => tcg}/neon-shared.decode       |    0
>  target/arm/{ => tcg}/sve.decode               |    0
>  target/arm/{ => tcg}/t16.decode               |    0
>  target/arm/{ => tcg}/t32.decode               |    0
>  target/arm/{ => tcg}/vfp-uncond.decode        |    0
>  target/arm/{ => tcg}/vfp.decode               |    0
>  hw/arm/boot.c                                 |    5 +-
>  hw/arm/pxa2xx.c                               |    1 +
>  hw/arm/pxa2xx_pic.c                           |    1 +
>  hw/arm/sbsa-ref.c                             |    2 +-
>  hw/arm/virt-acpi-build.c                      |    2 +-
>  hw/arm/virt.c                                 |    2 +-
>  hw/arm/xlnx-versal.c                          |    2 +-
>  hw/arm/xlnx-zynqmp.c                          |    2 +-
>  hw/cpu/a15mpcore.c                            |    2 +-
>  hw/intc/arm_gic_kvm.c                         |    2 +-
>  hw/intc/arm_gicv3_cpuif.c                     |    1 +
>  hw/intc/arm_gicv3_its_kvm.c                   |    2 +-
>  hw/intc/arm_gicv3_kvm.c                       |    3 +-
>  target/arm/arm-powerctl.c                     |    8 +-
>  target/arm/cpregs.c                           |  377 +
>  target/arm/cpu-common.c                       |  329 +
>  target/arm/cpu-mmu-sysemu.c                   | 2307 +++++++
>  target/arm/cpu-mmu.c                          |  219 +
>  target/arm/cpu-sysemu.c                       | 1088 +++
>  target/arm/cpu-user.c                         |   40 +
>  target/arm/cpu-vfp.c                          |   92 +
>  target/arm/cpu.c                              |  950 +--
>  target/arm/cpu32.c                            |  502 ++
>  target/arm/cpu64.c                            |  154 +-
>  target/arm/cpustate-list.c                    |  146 +
>  target/arm/gdbstub.c                          |    5 +-
>  target/arm/kvm-stub.c                         |   24 -
>  target/arm/kvm/helper-stubs.c                 |   43 +
>  target/arm/{ => kvm}/kvm.c                    |   18 +-
>  target/arm/{ => kvm}/kvm64.c                  |    0
>  target/arm/machine.c                          |   40 +-
>  target/arm/monitor.c                          |    2 +-
>  target/arm/psci.c                             |    1 -
>  target/arm/{helper.c => tcg/cpregs.c}         | 6082 +----------------
>  target/arm/tcg/cpu-vfp.c                      |  146 +
>  target/arm/{ => tcg}/crypto_helper.c          |    0
>  target/arm/{ => tcg}/debug_helper.c           |    0
>  target/arm/{ => tcg}/helper-a64.c             |    0
>  target/arm/tcg/helper.c                       | 1521 +++++
>  target/arm/{ => tcg}/iwmmxt_helper.c          |    0
>  target/arm/{ => tcg}/m_helper.c               |    1 +
>  target/arm/{ => tcg}/mte_helper.c             |    0
>  target/arm/{ => tcg}/neon_helper.c            |    0
>  target/arm/{ => tcg}/op_helper.c              |    1 +
>  target/arm/{ => tcg}/pauth_helper.c           |    2 +-
>  target/arm/{ => tcg}/sve_helper.c             |    0
>  target/arm/tcg/sysemu/tcg-cpu.c               |   52 +
>  .../arm/{cpu_tcg.c => tcg/tcg-cpu-models.c}   |   16 +-
>  target/arm/tcg/tcg-cpu.c                      |  229 +
>  target/arm/{ => tcg}/tlb_helper.c             |    1 +
>  target/arm/{ => tcg}/translate-a64.c          |    1 +
>  target/arm/{ => tcg}/translate-sve.c          |    0
>  target/arm/{ => tcg}/translate.c              |    1 +
>  target/arm/{ => tcg}/vec_helper.c             |    0
>  target/arm/{ => tcg}/vfp_helper.c             |  210 +-
>  tests/qtest/bios-tables-test.c                |    7 +
>  target/arm/{ => tcg}/translate-neon.c.inc     |    0
>  target/arm/{ => tcg}/translate-vfp.c.inc      |    0
>  MAINTAINERS                                   |    2 +-
>  target/arm/kvm/meson.build                    |    8 +
>  target/arm/kvm/trace-events                   |    4 +
>  target/arm/meson.build                        |   53 +-
>  target/arm/tcg/meson.build                    |   45 +
>  target/arm/tcg/sysemu/meson.build             |    4 +
>  target/arm/{ => tcg}/trace-events             |    3 -
>  target/arm/tcg/user/meson.build               |    3 +
>  tests/meson.build                             |    6 +-
>  tests/qtest/meson.build                       |   14 +-
>  98 files changed, 8107 insertions(+), 7467 deletions(-)
>  create mode 100644 target/arm/cpregs.h
>  create mode 100644 target/arm/cpu-mmu.h
>  create mode 100644 target/arm/cpu-vfp.h
>  create mode 100644 target/arm/cpu32.h
>  rename target/arm/{ => kvm}/kvm-consts.h (100%)
>  rename target/arm/{ => kvm}/kvm_arm.h (100%)
>  create mode 100644 target/arm/kvm/trace.h
>  rename target/arm/{ => tcg}/op_addsub.h (100%)
>  create mode 100644 target/arm/tcg/tcg-cpu.h
>  create mode 100644 target/arm/tcg/trace.h
>  rename target/arm/{ => tcg}/translate-a64.h (100%)
>  rename target/arm/{ => tcg}/translate.h (100%)
>  rename target/arm/{ => tcg}/vec_internal.h (100%)
>  delete mode 100644 target/arm/trace.h
>  rename target/arm/{ => tcg}/a32-uncond.decode (100%)
>  rename target/arm/{ => tcg}/a32.decode (100%)
>  rename target/arm/{ => tcg}/m-nocp.decode (100%)
>  rename target/arm/{ => tcg}/neon-dp.decode (100%)
>  rename target/arm/{ => tcg}/neon-ls.decode (100%)
>  rename target/arm/{ => tcg}/neon-shared.decode (100%)
>  rename target/arm/{ => tcg}/sve.decode (100%)
>  rename target/arm/{ => tcg}/t16.decode (100%)
>  rename target/arm/{ => tcg}/t32.decode (100%)
>  rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
>  rename target/arm/{ => tcg}/vfp.decode (100%)
>  create mode 100644 target/arm/cpregs.c
>  create mode 100644 target/arm/cpu-common.c
>  create mode 100644 target/arm/cpu-mmu-sysemu.c
>  create mode 100644 target/arm/cpu-mmu.c
>  create mode 100644 target/arm/cpu-sysemu.c
>  create mode 100644 target/arm/cpu-user.c
>  create mode 100644 target/arm/cpu-vfp.c
>  create mode 100644 target/arm/cpu32.c
>  create mode 100644 target/arm/cpustate-list.c
>  delete mode 100644 target/arm/kvm-stub.c
>  create mode 100644 target/arm/kvm/helper-stubs.c
>  rename target/arm/{ => kvm}/kvm.c (98%)
>  rename target/arm/{ => kvm}/kvm64.c (100%)
>  rename target/arm/{helper.c => tcg/cpregs.c} (59%)
>  create mode 100644 target/arm/tcg/cpu-vfp.c
>  rename target/arm/{ => tcg}/crypto_helper.c (100%)
>  rename target/arm/{ => tcg}/debug_helper.c (100%)
>  rename target/arm/{ => tcg}/helper-a64.c (100%)
>  create mode 100644 target/arm/tcg/helper.c
>  rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
>  rename target/arm/{ => tcg}/m_helper.c (99%)
>  rename target/arm/{ => tcg}/mte_helper.c (100%)
>  rename target/arm/{ => tcg}/neon_helper.c (100%)
>  rename target/arm/{ => tcg}/op_helper.c (99%)
>  rename target/arm/{ => tcg}/pauth_helper.c (99%)
>  rename target/arm/{ => tcg}/sve_helper.c (100%)
>  create mode 100644 target/arm/tcg/sysemu/tcg-cpu.c
>  rename target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} (99%)
>  create mode 100644 target/arm/tcg/tcg-cpu.c
>  rename target/arm/{ => tcg}/tlb_helper.c (99%)
>  rename target/arm/{ => tcg}/translate-a64.c (99%)
>  rename target/arm/{ => tcg}/translate-sve.c (100%)
>  rename target/arm/{ => tcg}/translate.c (99%)
>  rename target/arm/{ => tcg}/vec_helper.c (100%)
>  rename target/arm/{ => tcg}/vfp_helper.c (84%)
>  rename target/arm/{ => tcg}/translate-neon.c.inc (100%)
>  rename target/arm/{ => tcg}/translate-vfp.c.inc (100%)
>  create mode 100644 target/arm/kvm/meson.build
>  create mode 100644 target/arm/kvm/trace-events
>  create mode 100644 target/arm/tcg/meson.build
>  create mode 100644 target/arm/tcg/sysemu/meson.build
>  rename target/arm/{ => tcg}/trace-events (85%)
>  create mode 100644 target/arm/tcg/user/meson.build
> 


