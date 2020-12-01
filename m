Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5752CAFD6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 23:15:22 +0100 (CET)
Received: from localhost ([::1]:53010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkDvc-0000lB-T9
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 17:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkDsO-0007cY-Br; Tue, 01 Dec 2020 17:12:01 -0500
Received: from mail.csgraf.de ([188.138.100.120]:50468
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkDsA-0004jy-DH; Tue, 01 Dec 2020 17:12:00 -0500
Received: from freeip.amazon.com
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 2409F3900313;
 Tue,  1 Dec 2020 23:11:44 +0100 (CET)
Subject: Re: [PATCH v2 2/2] arm/hvf: Stop setting current_cpu
To: Peter Collingbourne <pcc@google.com>
References: <4a2d15d01087207e2fba1f55ad312727dbfc782e.1606856104.git.pcc@google.com>
 <d91deec6e2c68a9cf0e911251992b4d845be14ab.1606856104.git.pcc@google.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <bd199d49-91a6-e14a-41c3-4a4325c8eff2@csgraf.de>
Date: Tue, 1 Dec 2020 23:11:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <d91deec6e2c68a9cf0e911251992b4d845be14ab.1606856104.git.pcc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 01.12.20 22:00, Peter Collingbourne wrote:
> This variable is already being set by the generic HVF code and it's a
> thread-local variable so I don't see how it can be overwritten.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>


Yikes :). Yes, absolutely!

Would you mind if I squash this straight into my patch?


Thanks,

Alex


> ---
>   target/arm/hvf/hvf.c | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 3321d48aa2..40984fcf4d 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -364,7 +364,6 @@ int hvf_vcpu_exec(CPUState *cpu)
>       do {
>           bool advance_pc = false;
>   
> -        current_cpu = cpu;
>           qemu_wait_io_event_common(cpu);
>   
>           flush_cpu_state(cpu);
> @@ -391,7 +390,6 @@ int hvf_vcpu_exec(CPUState *cpu)
>               /* This is the main one, handle below. */
>               break;
>           case HV_EXIT_REASON_VTIMER_ACTIVATED:
> -            current_cpu = cpu;
>               qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
>               continue;
>           case HV_EXIT_REASON_CANCELED:
> @@ -412,8 +410,6 @@ int hvf_vcpu_exec(CPUState *cpu)
>               uint32_t srt = (syndrome >> 16) & 0x1f;
>               uint64_t val = 0;
>   
> -            current_cpu = cpu;
> -
>               DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
>                       "iswrite=%x s1ptw=%x len=%d srt=%d]\n",
>                       env->pc, hvf_exit->exception.virtual_address,
> @@ -523,7 +519,6 @@ int hvf_vcpu_exec(CPUState *cpu)
>               break;
>           case EC_AA64_HVC:
>               cpu_synchronize_state(cpu);
> -            current_cpu = cpu;
>               if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
>                   arm_handle_psci_call(arm_cpu);
>               } else {
> @@ -533,7 +528,6 @@ int hvf_vcpu_exec(CPUState *cpu)
>               break;
>           case EC_AA64_SMC:
>               cpu_synchronize_state(cpu);
> -            current_cpu = cpu;
>               if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
>                   arm_handle_psci_call(arm_cpu);
>               } else {
> @@ -561,7 +555,5 @@ int hvf_vcpu_exec(CPUState *cpu)
>           }
>       } while (ret == 0);
>   
> -    current_cpu = cpu;
> -
>       return ret;
>   }

