Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC282D5D32
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:11:15 +0100 (CET)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMf4-0008Nv-S3
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knLiv-0001sJ-4N
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:11:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:50294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knLis-0007OS-LI
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:11:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A8C6AC6A;
 Thu, 10 Dec 2020 13:11:05 +0000 (UTC)
Subject: Re: [PATCH v10 00/32] i386 cleanup
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201210121226.19822-1-cfontana@suse.de>
 <3b70ca52-8b06-42c3-1187-9cf700a506f3@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d25c5912-8945-b1dd-e7c0-9922fe09ba07@suse.de>
Date: Thu, 10 Dec 2020 14:11:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3b70ca52-8b06-42c3-1187-9cf700a506f3@redhat.com>
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
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:05 PM, Philippe Mathieu-Daudé wrote:
> Hi Claudio,
> 
> On 12/10/20 1:11 PM, Claudio Fontana wrote:
>> Hello, this is version 10 of the cleanup, changed from RFC to PATCH.
>>
>> v9 -> v10: minor tweaks and fixes
>>
>> * in "i386: split cpu accelerators from cpu.c",
>>
>> use kvm/kvm-cpu.c, hvf/hvf-cpu.c, tcg/tcg-cpu.c.
>> Easier to understand compared to editing multiple cpu.c files,
>> and matches the header files if needed (kvm-cpu.h).
>>
>> * in "accel: replace struct CpusAccel with AccelOpsClass",
>>
>> make it a bit more consistent, by naming the files defining
>> the AccelOpsClass types "...-accel-ops.c" instead of the old
>> naming "...-cpus.c".
>>
>> * in "cpu: move cc->transaction_failed to tcg_ops",
>>
>> protect with CONFIG_TCG the use of tcg_ops for hw/misc/jazz.c,
>>
>>  #include "exec/memattrs.h" (Philippe, Eduardo)
>>
>> * in "cpu: Move synchronize_from_tb() to tcg_ops",
>>
>>  #include "hw/core/cpu.h" (Philippe, Eduardo)
>>
>> do not remove the comment about struct TcgCpuOperations (Philippe)
>>
>> * in "accel/tcg: split TCG-only code from cpu_exec_realizefn",
>>
>> invert tcg_target_initialized set order (Alex)
>>
>> * in "i386: move TCG cpu class initialization out of helper.c",
>>
>> extract helper-tcg.h, tcg-cpu.c, and tcg-cpu.h directly into
>> tcg/, avoiding the extra move later to tcg/ (Alex)
>>
> ...
> 
>> Claudio Fontana (23):
>>   accel/tcg: split CpusAccel into three TCG variants
>>   accel/tcg: split tcg_start_vcpu_thread
>>   accel/tcg: rename tcg-cpus functions to match module name
>>   i386: move kvm accel files into kvm/
>>   i386: move whpx accel files into whpx/
>>   i386: move hax accel files into hax/
>>   i386: hvf: remove stale MAINTAINERS entry for old hvf stubs
>>   i386: move TCG accel files into tcg/
>>   i386: move cpu dump out of helper.c into cpu-dump.c
>>   i386: move TCG cpu class initialization out of helper.c
>>   target/riscv: remove CONFIG_TCG, as it is always TCG
>>   accel/tcg: split TCG-only code from cpu_exec_realizefn
>>   target/arm: do not use cc->do_interrupt for KVM directly
>>   cpu: move cc->do_interrupt to tcg_ops
>>   cpu: move cc->transaction_failed to tcg_ops
>>   cpu: move do_unaligned_access to tcg_ops
> 
> To be honest this is a lot to digest... I'd split your
> series in 2, the first part until here, almost ready;
> 
> And this second part, the accel refactor:
> 
>>   accel: extend AccelState and AccelClass to user-mode
>>   accel: replace struct CpusAccel with AccelOpsClass
>>   accel: introduce AccelCPUClass extending CPUClass
>>   i386: split cpu accelerators from cpu.c, using AccelCPUClass
>>   cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
>>   hw/core/cpu: call qemu_init_vcpu in cpu_common_realizefn
>>   cpu: introduce cpu_accel_instance_init
> 

Ok, will do for the next spin

Ciao,

Claudio

