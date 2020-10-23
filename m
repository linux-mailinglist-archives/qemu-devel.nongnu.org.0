Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960B296B0A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 10:17:39 +0200 (CEST)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVsGY-0007Ye-EF
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 04:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kVsFo-000783-R5
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 04:16:52 -0400
Received: from mail.ispras.ru ([83.149.199.84]:43578)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kVsFl-0001OI-RQ
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 04:16:52 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 08D4C40A1DCC;
 Fri, 23 Oct 2020 08:16:45 +0000 (UTC)
Subject: Re: [PATCH] cpus: verify that number of created cpus do not exceed
 smp params
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <160343848141.8350.10469322440262034340.stgit@pasha-ThinkPad-X280>
 <8a4ef7ec-47e8-909b-d724-f3db2ca69379@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <2a75debb-b941-c257-347b-c98e9d48640a@ispras.ru>
Date: Fri, 23 Oct 2020 11:16:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8a4ef7ec-47e8-909b-d724-f3db2ca69379@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 03:34:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.107,
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
Cc: pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.10.2020 11:10, Philippe Mathieu-Daudé wrote:
> On 10/23/20 9:34 AM, Pavel Dovgalyuk wrote:
>> Machine definitions may miss some vCPU-related parameters.
>> E.g., xlnx-versal-virt missed min_cpus and it was set to 1 by default.
>> This allowed using -smp 1 command line argument. But the machine
>> still created 2 vCPUs and passed all checks.
>> This patch adds one more check that does not allow creating
>> extra cpus that exceed the values specified in machine/smp.
>>
>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>> ---
>>   0 files changed
>>
>> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
>> index 47cceddd80..da74794e09 100644
>> --- a/softmmu/cpus.c
>> +++ b/softmmu/cpus.c
>> @@ -603,6 +603,11 @@ void qemu_init_vcpu(CPUState *cpu)
>>   {
>>       MachineState *ms = MACHINE(qdev_get_machine());
>> +    if (cpu->cpu_index >= ms->smp.cpus) {
>> +        fprintf(stderr, "Machine definition error: trying to create 
>> too many CPUs\n");
>> +        exit(1);
> 
> Shouldn't this be an assert()?

I thought about this.
Bugs could be unnoticed and reveal in release. Therefore user should 
know the details and shouldn't see an assert.

> 
>> +    }
>> +
>>       cpu->nr_cores = ms->smp.cores;
>>       cpu->nr_threads =  ms->smp.threads;
>>       cpu->stopped = true;
>>
>>
> 


