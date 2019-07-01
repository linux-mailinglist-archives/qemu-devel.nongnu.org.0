Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3503AD22
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 04:42:47 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haAGk-0004ed-SO
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 22:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57730)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <Colin.Xu@intel.com>) id 1haA1w-0005MW-7a
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:27:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Colin.Xu@intel.com>) id 1haA1u-0003Ko-W5
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:27:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:33026)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Colin.Xu@intel.com>) id 1haA1u-0003KI-43
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:27:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jun 2019 19:27:24 -0700
X-ExtLoop1: 1
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by orsmga008.jf.intel.com with ESMTP; 09 Jun 2019 19:27:22 -0700
To: qemu-devel@nongnu.org
References: <20190610021939.13669-1-colin.xu@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <d2859fe1-df24-e5fa-a5dd-54d5f8640c1b@intel.com>
Date: Mon, 10 Jun 2019 10:27:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610021939.13669-1-colin.xu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-devel] [PATCH] hax: Honor CPUState::halted
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
Reply-To: Colin.Xu@intel.com
Cc: liq3ea@gmail.com, philmd@redhat.com, armbru@redhat.com, yu.ning@intel.com,
 chuanxiao.dong@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cc more.

On 2019-06-10 10:19, Colin Xu wrote:
> QEMU tracks whether a vcpu is halted using CPUState::halted. E.g.,
> after initialization or reset, halted is 0 for the BSP (vcpu 0)
> and 1 for the APs (vcpu 1, 2, ...). A halted vcpu should not be
> handed to the hypervisor to run (e.g. hax_vcpu_run()).
>
> Under HAXM, Android Emulator sometimes boots into a "vcpu shutdown
> request" error while executing in SeaBIOS, with the HAXM driver
> logging a guest triple fault in vcpu 1, 2, ... at RIP 0x3. That is
> ultimately because the HAX accelerator asks HAXM to run those APs
> when they are still in the halted state.
>
> Normally, the vcpu thread for an AP will start by looping in
> qemu_wait_io_event(), until the BSP kicks it via a pair of IPIs
> (INIT followed by SIPI). But because the HAX accelerator does not
> honor cpu->halted, it allows the AP vcpu thread to proceed to
> hax_vcpu_run() as soon as it receives any kick, even if the kick
> does not come from the BSP. It turns out that emulator has a
> worker thread which periodically kicks every vcpu thread (possibly
> to collect CPU usage data), and if one of these kicks comes before
> those by the BSP, the AP will start execution from the wrong RIP,
> resulting in the aforementioned SMP boot failure.
>
> The solution is inspired by the KVM accelerator (credit to
> Chuanxiao Dong <chuanxiao.dong@intel.com> for the pointer):
>
> 1. Get rid of questionable logic that unconditionally resets
>     cpu->halted before hax_vcpu_run(). Instead, only reset it at the
>     right moments (there are only a few "unhalt" events).
> 2. Add a check for cpu->halted before hax_vcpu_run().
>
> Note that although the non-Unrestricted Guest (!ug_platform) code
> path also forcibly resets cpu->halted, it is left untouched,
> because only the UG code path supports SMP guests.
>
> The patch is first merged to android emulator with Change-Id:
> I9c5752cc737fd305d7eace1768ea12a07309d716
>
> Cc: Yu Ning <yu.ning@intel.com>
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>   cpus.c                |  1 -
>   target/i386/hax-all.c | 36 ++++++++++++++++++++++++++++++++++--
>   2 files changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/cpus.c b/cpus.c
> index ffc57119ca5e..c1a56cd9ab01 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -1591,7 +1591,6 @@ static void *qemu_hax_cpu_thread_fn(void *arg)
>   
>       cpu->thread_id = qemu_get_thread_id();
>       cpu->created = true;
> -    cpu->halted = 0;
>       current_cpu = cpu;
>   
>       hax_init_vcpu(cpu);
> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
> index 44b89c1d74ae..58a27b475ec8 100644
> --- a/target/i386/hax-all.c
> +++ b/target/i386/hax-all.c
> @@ -471,13 +471,35 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
>           return 0;
>       }
>   
> -    cpu->halted = 0;
> -
>       if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
>           cpu->interrupt_request &= ~CPU_INTERRUPT_POLL;
>           apic_poll_irq(x86_cpu->apic_state);
>       }
>   
> +    /* After a vcpu is halted (either because it is an AP and has just been
> +     * reset, or because it has executed the HLT instruction), it will not be
> +     * run (hax_vcpu_run()) until it is unhalted. The next few if blocks check
> +     * for events that may change the halted state of this vcpu:
> +     *  a) Maskable interrupt, when RFLAGS.IF is 1;
> +     *     Note: env->eflags may not reflect the current RFLAGS state, because
> +     *           it is not updated after each hax_vcpu_run(). We cannot afford
> +     *           to fail to recognize any unhalt-by-maskable-interrupt event
> +     *           (in which case the vcpu will halt forever), and yet we cannot
> +     *           afford the overhead of hax_vcpu_sync_state(). The current
> +     *           solution is to err on the side of caution and have the HLT
> +     *           handler (see case HAX_EXIT_HLT below) unconditionally set the
> +     *           IF_MASK bit in env->eflags, which, in effect, disables the
> +     *           RFLAGS.IF check.
> +     *  b) NMI;
> +     *  c) INIT signal;
> +     *  d) SIPI signal.
> +     */
> +    if (((cpu->interrupt_request & CPU_INTERRUPT_HARD) &&
> +         (env->eflags & IF_MASK)) ||
> +        (cpu->interrupt_request & CPU_INTERRUPT_NMI)) {
> +        cpu->halted = 0;
> +    }
> +
>       if (cpu->interrupt_request & CPU_INTERRUPT_INIT) {
>           DPRINTF("\nhax_vcpu_hax_exec: handling INIT for %d\n",
>                   cpu->cpu_index);
> @@ -493,6 +515,16 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
>           hax_vcpu_sync_state(env, 1);
>       }
>   
> +    if (cpu->halted) {
> +        /* If this vcpu is halted, we must not ask HAXM to run it. Instead, we
> +         * break out of hax_smp_cpu_exec() as if this vcpu had executed HLT.
> +         * That way, this vcpu thread will be trapped in qemu_wait_io_event(),
> +         * until the vcpu is unhalted.
> +         */
> +        cpu->exception_index = EXCP_HLT;
> +        return 0;
> +    }
> +
>       do {
>           int hax_ret;
>   

-- 
Best Regards,
Colin Xu


