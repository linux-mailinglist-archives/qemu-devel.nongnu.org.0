Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89912D40E7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:21:02 +0100 (CET)
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxWn-0005vI-SK
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmxVW-0005Uc-OO
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:19:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:48128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmxVU-00051Q-Ub
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:19:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B7FEAD09;
 Wed,  9 Dec 2020 11:19:39 +0000 (UTC)
Subject: Re: [RFC v9 10/32] i386: move TCG cpu class initialization out of
 helper.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-11-cfontana@suse.de> <87360ffewo.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <03de7a9a-632d-185b-6ade-25a8cab97d02@suse.de>
Date: Wed, 9 Dec 2020 12:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87360ffewo.fsf@linaro.org>
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 11:23 AM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/i386/cpu.c             |  33 ++++------
>>  target/i386/cpu.h             |  97 ++---------------------------
>>  target/i386/helper-tcg.h      | 112 ++++++++++++++++++++++++++++++++++
>>  target/i386/helper.c          |  23 -------
>>  target/i386/meson.build       |   1 +
>>  target/i386/tcg-cpu.c         |  71 +++++++++++++++++++++
>>  target/i386/tcg-cpu.h         |  15 +++++
>>  target/i386/tcg/bpt_helper.c  |   1 +
>>  target/i386/tcg/cc_helper.c   |   1 +
>>  target/i386/tcg/excp_helper.c |   1 +
>>  target/i386/tcg/fpu_helper.c  |  33 +++++-----
>>  target/i386/tcg/int_helper.c  |   1 +
>>  target/i386/tcg/mem_helper.c  |   1 +
>>  target/i386/tcg/misc_helper.c |   1 +
>>  target/i386/tcg/mpx_helper.c  |   1 +
>>  target/i386/tcg/seg_helper.c  |   1 +
>>  target/i386/tcg/smm_helper.c  |   2 +
>>  target/i386/tcg/svm_helper.c  |   1 +
>>  target/i386/tcg/translate.c   |   1 +
>>  19 files changed, 244 insertions(+), 153 deletions(-)
>>  create mode 100644 target/i386/helper-tcg.h
>>  create mode 100644 target/i386/tcg-cpu.c
>>  create mode 100644 target/i386/tcg-cpu.h
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index b9bd249c8f..3462d0143f 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -24,6 +24,8 @@
>>  #include "qemu/qemu-print.h"
>>  
>>  #include "cpu.h"
>> +#include "tcg-cpu.h"
>> +#include "helper-tcg.h"
>>  #include "exec/exec-all.h"
>>  #include "sysemu/kvm.h"
>>  #include "sysemu/reset.h"
>> @@ -1495,7 +1497,8 @@ static inline uint64_t x86_cpu_xsave_components(X86CPU *cpu)
>>             cpu->env.features[FEAT_XSAVE_COMP_LO];
>>  }
>>  
>> -const char *get_register_name_32(unsigned int reg)
>> +/* Return name of 32-bit register, from a R_* constant */
>> +static const char *get_register_name_32(unsigned int reg)
>>  {
>>      if (reg >= CPU_NB_REGS32) {
>>          return NULL;
>> @@ -7012,13 +7015,6 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr value)
>>      cpu->env.eip = value;
>>  }
>>  
>> -static void x86_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
>> -{
>> -    X86CPU *cpu = X86_CPU(cs);
>> -
>> -    cpu->env.eip = tb->pc - tb->cs_base;
>> -}
>> -
>>  int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
>>  {
>>      X86CPU *cpu = X86_CPU(cs);
>> @@ -7252,17 +7248,18 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>>      cc->class_by_name = x86_cpu_class_by_name;
>>      cc->parse_features = x86_cpu_parse_featurestr;
>>      cc->has_work = x86_cpu_has_work;
>> +
>>  #ifdef CONFIG_TCG
>> -    cc->do_interrupt = x86_cpu_do_interrupt;
>> -    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
>> -#endif
>> +    tcg_cpu_common_class_init(cc);
> 
> Are we likely to have clashing names here as other arches get converted?
> tcg_x86_cpu_common_class_init or x86_cpu_common_class_init?


well, not in the same binary I presume? But I can add an x86 in front.


> 
> <snip>
>> diff --git a/target/i386/tcg-cpu.c b/target/i386/tcg-cpu.c
>> new file mode 100644
>> index 0000000000..628dd29fe7
>> --- /dev/null
>> +++ b/target/i386/tcg-cpu.c
>> @@ -0,0 +1,71 @@
> <snip>
>> +
>> +void tcg_cpu_common_class_init(CPUClass *cc)
>> +{
>> +    cc->do_interrupt = x86_cpu_do_interrupt;
>> +    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
>> +    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
>> +    cc->cpu_exec_enter = x86_cpu_exec_enter;
>> +    cc->cpu_exec_exit = x86_cpu_exec_exit;
>> +    cc->tcg_initialize = tcg_x86_init;
>> +    cc->tlb_fill = x86_cpu_tlb_fill;
>> +#ifndef CONFIG_USER_ONLY
>> +    cc->debug_excp_handler = breakpoint_handler;
>> +#endif
>> +}
> 
> Oh I see this moves down to target/i386/tcg/ eventually. Maybe we should
> just create the new file in place so it's easier to follow the changes
> as we convert to a proper abstracted class?
> 

Yes, will do.

Thanks,

C

