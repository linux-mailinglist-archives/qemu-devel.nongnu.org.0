Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD42C7D01
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:50:49 +0100 (CET)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZH6-0004Fk-6Z
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZ8p-0001QC-Cw; Sun, 29 Nov 2020 21:42:19 -0500
Received: from mail.csgraf.de ([188.138.100.120]:34018
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZ8l-0006qo-F9; Sun, 29 Nov 2020 21:42:15 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 8768439001C1;
 Mon, 30 Nov 2020 03:42:09 +0100 (CET)
Subject: Re: [PATCH 6/8] hvf: Use OS provided vcpu kick function
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-7-agraf@csgraf.de>
 <20201126221808.GU2271382@habkost.net>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <2281f481-d64a-1750-0bd2-e7f52b26da51@csgraf.de>
Date: Mon, 30 Nov 2020 03:42:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201126221808.GU2271382@habkost.net>
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 26.11.20 23:18, Eduardo Habkost wrote:
> On Thu, Nov 26, 2020 at 10:50:15PM +0100, Alexander Graf wrote:
>> When kicking another vCPU, we get an OS function that explicitly does that for us
>> on Apple Silicon. That works better than the current signaling logic, let's make
>> use of it there.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> ---
>>   accel/hvf/hvf-cpus.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
>> index b9f674478d..74a272d2e8 100644
>> --- a/accel/hvf/hvf-cpus.c
>> +++ b/accel/hvf/hvf-cpus.c
>> @@ -418,8 +418,20 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
>>                          cpu, QEMU_THREAD_JOINABLE);
>>   }
>>   
>> +#ifdef __aarch64__
>> +static void hvf_kick_vcpu_thread(CPUState *cpu)
>> +{
>> +    if (!qemu_cpu_is_self(cpu)) {
>> +        hv_vcpus_exit(&cpu->hvf_fd, 1);
>> +    }
>> +}
>> +#endif
>> +
>>   static const CpusAccel hvf_cpus = {
>>       .create_vcpu_thread = hvf_start_vcpu_thread,
>> +#ifdef __aarch64__
>> +    .kick_vcpu_thread = hvf_kick_vcpu_thread,
>> +#endif
> Interesting.  We have considered the possibility of adding
> arch-specific TYPE_ACCEL subclasses when discussing Claudio's,
> series.  Here we have another arch-specific hack that could be
> avoided if we had a TYPE_ARM_HVF_ACCEL QOM class.


I don't think that's necessary in this case. I don't see how you could 
ever have aarch64 and x86 HVF backends compiled into the same binary. 
The header files even have a lot of #ifdef's.

Either way, I've changed it to a weak function in v2. That way it's a 
bit easier to read.


Alex



