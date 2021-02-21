Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE465320AD3
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:01:22 +0100 (CET)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpIX-0004YZ-Eu
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lDpGR-0003Tr-Qw
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:59:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:37114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lDpGL-0003Up-SR
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:59:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D410AB95;
 Sun, 21 Feb 2021 13:59:04 +0000 (UTC)
Subject: Re: [RFC v1 32/38] target/arm: cpu: do not initialize TCG PMU for KVM
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-33-cfontana@suse.de>
 <ea91e888-10db-8abe-7a62-bc4532ba99eb@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <9aacf277-cf8f-ccea-0c1d-306981aa8712@suse.de>
Date: Sun, 21 Feb 2021 14:59:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ea91e888-10db-8abe-7a62-bc4532ba99eb@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 10:53 AM, Philippe Mathieu-Daudé wrote:
> On 2/21/21 10:24 AM, Claudio Fontana wrote:
>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>
>> KVM uses its own PMU initialization.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/arm/cpu.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index a8321fecf8..d334987cad 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1648,6 +1648,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          unset_feature(env, ARM_FEATURE_PMU);
>>      }
>>      if (arm_feature(env, ARM_FEATURE_PMU)) {
>> +#ifdef CONFIG_TCG
> 
> Shouldn't this be #if !defined(CONFIG_KVM) ?

In this series pmu is built only for tcg in tcg/, and assumes the current pmu software implementation is TCG-only.

Should PMU instead be a separate feature, that is pulled in by TCG but not KVM?

Do we for example expect other hypervisors (hvf...) to use this PMU?


> 
>>          pmu_init(cpu);
>>  
>>          if (!kvm_enabled()) {
> 
> And remove this ^

Rather, maybe the check should be if (tcg_enabled()).

I think the code quoted (also in master) handles the --enable-tcg --enable-kvm build.

If you have both tcg and kvm "available" (currently controlled by what code is built, but in the future probably it will be modules),

it makes sese to only initialize the software PMU if kvm is not enabled (or, expressed better, if tcg is enabled).



> 
>> @@ -1659,6 +1660,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
>>                  cpu);
>>  #endif
>> +#endif /* CONFIG_TCG */
>>      } else {
>>          cpu->isar.id_aa64dfr0 =
>>              FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
>>
> 


