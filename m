Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA06258BEE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 11:45:47 +0200 (CEST)
Received: from localhost ([::1]:36856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD2rK-0003dA-4Q
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 05:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kD2qE-0002hW-VM
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:44:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:48172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kD2qC-0002GL-VV
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 05:44:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A095AC97;
 Tue,  1 Sep 2020 09:44:35 +0000 (UTC)
Subject: Re: [PATCH v6 11/16] cpus: remove checks for non-NULL cpus_accel
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200901072201.7133-1-cfontana@suse.de>
 <20200901072201.7133-12-cfontana@suse.de>
 <20200901093418.GC22344@SPB-NB-133.local>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ec4310eb-c5fc-2bca-37d5-ffe800c8c7c8@suse.de>
Date: Tue, 1 Sep 2020 11:44:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901093418.GC22344@SPB-NB-133.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:13:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.13,
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alberto Garcia <berto@igalia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, haxm-team@intel.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/20 11:34 AM, Roman Bolshakov wrote:
> On Tue, Sep 01, 2020 at 09:21:56AM +0200, Claudio Fontana wrote:
>> now that all accelerators support the CpusAccel interface,
>> we can remove most checks for non-NULL cpus_accel,
>> we just add a sanity check/assert at vcpu creation.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  softmmu/cpus.c | 33 +++++++++++++++++++++------------
>>  1 file changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
>> index 3d8350fba9..f32ecb4bb9 100644
>> --- a/softmmu/cpus.c
>> +++ b/softmmu/cpus.c
>> @@ -166,34 +166,46 @@ void cpu_synchronize_all_pre_loadvm(void)
>>  
>>  void cpu_synchronize_state(CPUState *cpu)
>>  {
>> -    if (cpus_accel && cpus_accel->synchronize_state) {
>> +    if (cpus_accel->synchronize_state) {
>>          cpus_accel->synchronize_state(cpu);
>>      }
>>  }
>>  
>>  void cpu_synchronize_post_reset(CPUState *cpu)
>>  {
>> -    if (cpus_accel && cpus_accel->synchronize_post_reset) {
>> +    if (cpus_accel->synchronize_post_reset) {
>>          cpus_accel->synchronize_post_reset(cpu);
>>      }
>>  }
>>  
>>  void cpu_synchronize_post_init(CPUState *cpu)
>>  {
>> -    if (cpus_accel && cpus_accel->synchronize_post_init) {
>> +    if (cpus_accel->synchronize_post_init) {
>>          cpus_accel->synchronize_post_init(cpu);
>>      }
>>  }
>>  
>>  void cpu_synchronize_pre_loadvm(CPUState *cpu)
>>  {
>> -    if (cpus_accel && cpus_accel->synchronize_pre_loadvm) {
>> +    if (cpus_accel->synchronize_pre_loadvm) {
>>          cpus_accel->synchronize_pre_loadvm(cpu);
>>      }
>>  }
>>  
>>  int64_t cpus_get_virtual_clock(void)
>>  {
>> +    /*
>> +     * XXX
>> +     *
>> +     * need to check that cpus_accel is not NULL, because qcow2 calls
>> +     * qemu_get_clock_ns(CLOCK_VIRTUAL) without any accel initialized and
>> +     * with ticks disabled in some io-tests:
>> +     * 030 040 041 060 099 120 127 140 156 161 172 181 191 192 195 203 229 249 256 267
>> +     *
>> +     * is this expected?
>> +     *
>> +     * XXX
>> +     */
>>      if (cpus_accel && cpus_accel->get_virtual_clock) {
>>          return cpus_accel->get_virtual_clock();
>>      }
>> @@ -207,7 +219,7 @@ int64_t cpus_get_virtual_clock(void)
>>   */
>>  int64_t cpus_get_elapsed_ticks(void)
>>  {
>> -    if (cpus_accel && cpus_accel->get_elapsed_ticks) {
>> +    if (cpus_accel->get_elapsed_ticks) {
>>          return cpus_accel->get_elapsed_ticks();
>>      }
>>      return cpu_get_ticks();
>> @@ -399,7 +411,7 @@ void cpus_kick_thread(CPUState *cpu)
>>  void qemu_cpu_kick(CPUState *cpu)
>>  {
>>      qemu_cond_broadcast(cpu->halt_cond);
>> -    if (cpus_accel && cpus_accel->kick_vcpu_thread) {
>> +    if (cpus_accel->kick_vcpu_thread) {
>>          cpus_accel->kick_vcpu_thread(cpu);
>>      } else { /* default */
>>          cpus_kick_thread(cpu);
>> @@ -573,12 +585,9 @@ void qemu_init_vcpu(CPUState *cpu)
>>          cpu_address_space_init(cpu, 0, "cpu-memory", cpu->memory);
>>      }
>>  
>> -    if (cpus_accel) {
>> -        /* accelerator already implements the CpusAccel interface */
>> -        cpus_accel->create_vcpu_thread(cpu);
>> -    } else {
>> -        g_assert_not_reached();
>> -    }
>> +    /* accelerators all implement the CpusAccel interface */
>> +    g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
>> +    cpus_accel->create_vcpu_thread(cpu);
>>  
>>      while (!cpu->created) {
>>          qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
>> -- 
>> 2.26.2
>>
> 
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> 
> but I still find the condition (if cpus_accel->func) redundant, is it
> feasible to drop it?
> 
> Regards,
> Roman
> 

Hi Roman,

indeed currently not, because currently we use a NULL function pointer to mean "use generic/default behaviour".
This is one of the open questions in the cover letter.

It has the advantage that only "interesting" information is present in each data structure,
with only non-default behaviour being explicit, this has been changed to satisfy Paolo's requirement.

It has the disadvantage of an additional check.

I am ok with both outcomes, but I'd like Paolo's take on this if we are to change this again?

Thanks,

Claudio



