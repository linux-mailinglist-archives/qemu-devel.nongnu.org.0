Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90181413804
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 19:07:27 +0200 (CEST)
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSjEs-0006HW-4j
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 13:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mSjCj-0004HF-G5; Tue, 21 Sep 2021 13:05:14 -0400
Received: from mail.csgraf.de ([85.25.223.15]:54180 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mSjCh-00038f-Ek; Tue, 21 Sep 2021 13:05:13 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-007-123-111.77.7.pool.telefonica.de [77.7.123.111])
 by csgraf.de (Postfix) with ESMTPSA id 2EB3B60800D4;
 Tue, 21 Sep 2021 19:05:08 +0200 (CEST)
Subject: Re: [PATCH v12 04/10] hvf: Add Apple Silicon support
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-5-agraf@csgraf.de>
 <CAFEAcA-Us-4H8FTFCY38s3=65imNGJ6WP_WYup_EoAxPyDghKQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <d0456d36-1ac0-56cd-0f84-ed80cae2361f@csgraf.de>
Date: Tue, 21 Sep 2021 19:05:09 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Us-4H8FTFCY38s3=65imNGJ6WP_WYup_EoAxPyDghKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 21.09.21 17:30, Peter Maydell wrote:
> On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
>> With Apple Silicon available to the masses, it's a good time to add support
>> for driving its virtualization extensions from QEMU.
>>
>> This patch adds all necessary architecture specific code to get basic VMs
>> working, including save/restore.
>>
>> Known limitations:
>>
>>   - WFI handling is missing (follows in later patch)
>>   - No watchpoint/breakpoint support
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> Reviewed-by: Sergio Lopez <slp@redhat.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> This broke compilation on x86 osx:
>
>> --- a/target/i386/hvf/hvf.c
>> +++ b/target/i386/hvf/hvf.c
>> @@ -206,6 +206,11 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
>>      return env->apic_bus_freq != 0;
>>  }
>>
>> +void hvf_kick_vcpu_thread(CPUState *cpu)
>> +{
>> +    cpus_kick_thread(cpu);
>> +}
> This won't build without an extra #include "sysemu/cpus.h".
> I've folded in the fix.


Thanks a lot! I test compiled all the earlier versions of the patch set
on x86 as well, but no longer have easy access to an x86 macOS system
:(. They're just so insanely slow in comparison!


Alex


