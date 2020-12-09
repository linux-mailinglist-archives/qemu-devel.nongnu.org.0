Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45282D44D5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:53:53 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0qm-0000bB-NC
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kn0nz-000747-RF
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:50:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:56396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kn0ny-0003Hs-7V
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:50:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9529AAC9A;
 Wed,  9 Dec 2020 14:50:56 +0000 (UTC)
Subject: Re: [RFC v9 27/32] accel: replace struct CpusAccel with AccelOpsClass
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-28-cfontana@suse.de> <87sg8fcf3z.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <79868932-a1fe-6b1d-144e-22d310baf87a@suse.de>
Date: Wed, 9 Dec 2020 15:50:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87sg8fcf3z.fsf@linaro.org>
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

On 12/9/20 1:54 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> centralize the registration of the cpus.c module
>> accelerator operations in accel/accel-softmmu.c
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> <snip>
>> diff --git a/accel/tcg/tcg-cpus.c b/accel/tcg/tcg-cpus.c
>> index e335f9f155..38a58ab271 100644
>> --- a/accel/tcg/tcg-cpus.c
>> +++ b/accel/tcg/tcg-cpus.c
>> @@ -35,6 +35,9 @@
>>  #include "hw/boards.h"
>>  
>>  #include "tcg-cpus.h"
>> +#include "tcg-cpus-mttcg.h"
>> +#include "tcg-cpus-rr.h"
>> +#include "tcg-cpus-icount.h"
>>  
>>  /* common functionality among all TCG variants */
>>  
>> @@ -80,3 +83,43 @@ void tcg_cpus_handle_interrupt(CPUState *cpu, int mask)
>>          qatomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
>>      }
>>  }
>> +
>> +static void tcg_cpus_ops_init(AccelOpsClass *ops)
>> +{
>> +    if (qemu_tcg_mttcg_enabled()) {
>> +        ops->create_vcpu_thread = mttcg_start_vcpu_thread;
>> +        ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
>> +        ops->handle_interrupt = tcg_cpus_handle_interrupt;
>> +
>> +    } else if (icount_enabled()) {
>> +        ops->create_vcpu_thread = rr_start_vcpu_thread;
>> +        ops->kick_vcpu_thread = rr_kick_vcpu_thread;
>> +        ops->handle_interrupt = icount_handle_interrupt;
>> +        ops->get_virtual_clock = icount_get;
>> +        ops->get_elapsed_ticks = icount_get;
>> +
>> +    } else {
>> +        ops->create_vcpu_thread = rr_start_vcpu_thread;
>> +        ops->kick_vcpu_thread = rr_kick_vcpu_thread;
>> +        ops->handle_interrupt = tcg_cpus_handle_interrupt;
>> +    }
>> +}
> 
> Aren't we going backwards here by having a global function aware of the
> different accelerator types rather than encapsulating this is the
> particular accelerator machinery?
> 
> <snip>
> 

I don't fully understand what you mean here, which is the global function, what is the particular accelerator machinery?

Could you suggest an alternative for my understanding?

Thanks a lot,

Claudio

