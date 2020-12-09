Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0A2D40F7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:23:30 +0100 (CET)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxZB-0006zc-VM
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmxY1-0006XX-5c
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:22:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:50390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmxXz-0005xr-Jt
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:22:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 449AAAC94;
 Wed,  9 Dec 2020 11:22:14 +0000 (UTC)
Subject: Re: [RFC v9 17/32] accel/tcg: split TCG-only code from
 cpu_exec_realizefn
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-18-cfontana@suse.de> <87lfe7dzjv.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <365e2ba8-9105-4028-10c1-4d66c7422018@suse.de>
Date: Wed, 9 Dec 2020 12:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87lfe7dzjv.fsf@linaro.org>
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

On 12/9/20 11:42 AM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> move away TCG-only code, make it compile only on TCG.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  accel/tcg/cpu-exec.c  | 28 +++++++++++++++++
>>  cpu.c                 | 70 ++++++++++++++++++++-----------------------
>>  hw/core/cpu.c         |  6 +++-
>>  include/hw/core/cpu.h |  8 +++++
>>  4 files changed, 74 insertions(+), 38 deletions(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 64cba89356..436dfbf155 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -801,6 +801,34 @@ int cpu_exec(CPUState *cpu)
>>      return ret;
>>  }
>>  
>> +void tcg_exec_realizefn(CPUState *cpu, Error **errp)
>> +{
>> +    static bool tcg_target_initialized;
>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>> +
>> +    if (!tcg_target_initialized) {
>> +        tcg_target_initialized = true;
>> +        cc->tcg_ops.initialize();
> 
> nit: it makes no difference but stylistically it makes sense to set
> tcg_target_initialized after we have in fact initialised.
> 
> Also we've dropped the tcg_enabled() check,


The tcg_enabled() check should be there, not here but in cpu_exec_realizefn,

if (tcg_enabled()) {
  tcg_exec_realizefn(...)
}

will check, thanks!


> if indeed it will always be
> true should we not assert it to ensure the statement for tcg_exec_init
> remains the case: "Must be called before using the QEMU cpus."
> 
> Otherwise LGTM:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 


