Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2498679245
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 08:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKE2U-0007WL-F2; Tue, 24 Jan 2023 02:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valesini@yandex-team.ru>)
 id 1pKDME-0001UN-EO
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:04:38 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valesini@yandex-team.ru>)
 id 1pKDMC-0001ZH-3S
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:04:38 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id B82F75F4A4;
 Tue, 24 Jan 2023 09:57:14 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b080:7201::1:43] (unknown
 [2a02:6b8:b080:7201::1:43])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 CvHAIF1XlCg1-lJfphdHh; Tue, 24 Jan 2023 09:57:13 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674543433; bh=LKjtxm3QtAGm7tvK6S0c7jQNOfsUTb27vrWv1059/8A=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=0NIWrWUnS4EaJ7doegFHVbUu2fyTcWoxCpDCe0g+EWS4b2TVdUEMsT8TANOyI39Nx
 +L/1nbQqvrVJjU3kSys1ctoqBIKyD3A+s17Sgr1c9062GUvy51aY/Dof1K+c6PL3Mf
 kzcEBMoSkrOHWDxTnNhhpBd0auiGhe+hbkH7/MME=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1bac1145-1ce6-3277-7c9a-f593d94661e8@yandex-team.ru>
Date: Tue, 24 Jan 2023 11:57:11 +0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v0 0/4] backends/hostmem: add an ability to specify
 prealloc timeout
Content-Language: ru, en-US
To: Daniil Tatianin <d-tatianin@yandex-team.ru>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Igor Mammedov <imammedo@redhat.com>, yc-core@yandex-team.ru
References: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
 <338cbc9a-4eea-a76c-8042-98372fb70854@redhat.com>
 <ace54833-f254-1b30-b720-c530e60c8266@yandex-team.ru>
 <Y86QBGquzIOb96MU@redhat.com>
 <aacfa4a8-21bc-6401-10e0-25b84155c9cf@yandex-team.ru>
From: Valentin Sinitsyn <valesini@yandex-team.ru>
In-Reply-To: <aacfa4a8-21bc-6401-10e0-25b84155c9cf@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=valesini@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 24 Jan 2023 02:48:16 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

On 23.01.2023 19:14, Daniil Tatianin wrote:
> On 1/23/23 4:47 PM, Daniel P. Berrangé wrote:
>> On Mon, Jan 23, 2023 at 04:30:03PM +0300, Daniil Tatianin wrote:
>>> On 1/23/23 11:57 AM, David Hildenbrand wrote:
>>>> On 20.01.23 14:47, Daniil Tatianin wrote:
>>>>> This series introduces new qemu_prealloc_mem_with_timeout() api,
>>>>> which allows limiting the maximum amount of time to be spent on memory
>>>>> preallocation. It also adds prealloc statistics collection that is
>>>>> exposed via an optional timeout handler.
>>>>>
>>>>> This new api is then utilized by hostmem for guest RAM preallocation
>>>>> controlled via new object properties called 'prealloc-timeout' and
>>>>> 'prealloc-timeout-fatal'.
>>>>>
>>>>> This is useful for limiting VM startup time on systems with
>>>>> unpredictable page allocation delays due to memory fragmentation or 
>>>>> the
>>>>> backing storage. The timeout can be configured to either simply emit a
>>>>> warning and continue VM startup without having preallocated the entire
>>>>> guest RAM or just abort startup entirely if that is not acceptable for
>>>>> a specific use case.
>>>>
>>>> The major use case for preallocation is memory resources that cannot be
>>>> overcommitted (hugetlb, file blocks, ...), to avoid running out of such
>>>> resources later, while the guest is already running, and crashing it.
>>>
>>> Wouldn't you say that preallocating memory for the sake of speeding 
>>> up guest
>>> kernel startup & runtime is a valid use case of prealloc? This way we 
>>> can
>>> avoid expensive (for a multitude of reasons) page faults that will 
>>> otherwise
>>> slow down the guest significantly at runtime and affect the user 
>>> experience.
>>>
>>>> Allocating only a fraction "because it takes too long" looks quite
>>>> useless in that (main use-case) context. We shouldn't encourage QEMU
>>>> users to play with fire in such a way. IOW, there should be no way
>>>> around "prealloc-timeout-fatal". Either preallocation succeeded and the
>>>> guest can run, or it failed, and the guest can't run.
>>>
>>> Here we basically accept the fact that e.g with fragmented memory the 
>>> kernel
>>> might take a while in a page fault handler especially for hugetlb 
>>> because of
>>> page compaction that has to run for every fault.
>>>
>>> This way we can prefault at least some number of pages and let the guest
>>> fault the rest on demand later on during runtime even if it's slow 
>>> and would
>>> cause a noticeable lag.
>>
>> Rather than treat this as a problem that needs a timeout, can we
>> restate it as situations need synchronous vs asynchronous
>> preallocation ?
>>
>> For the case where we need synchronous prealloc, current QEMU deals
>> with that. If it doesn't work quickly enough, mgmt can just kill
>> QEMU already today.
>>
>> For the case where you would like some prealloc, but don't mind
>> if it runs without full prealloc, then why not just treat it as an
>> entirely asynchronous task ? Instead of calling qemu_prealloc_mem
>> and waiting for it to complete, just spawn a thread to run
>> qemu_prealloc_mem, so it doesn't block QEMU startup. This will
>> have minimal maint burden on the existing code, and will avoid
>> need for mgmt apps to think about what timeout value to give,
>> which is good because timeouts are hard to get right.
>>
>> Most of the time that async background prealloc will still finish
>> before the guest even gets out of the firmware phase, but if it
>> takes longer it is no big deal. You don't need to quit the prealloc
>> job early, you just need it to not delay the guest OS boot IIUC.
>>
>> This impl could be done with the 'prealloc' property turning from
>> a boolean on/off, to a enum  on/async/off, where 'on' == sync
>> prealloc. Or add a separate 'prealloc-async' bool property
> 
> I like this idea, but I'm not sure how we would go about writing to live 
> guest memory. Is that something that can be done safely without racing 
> with the guest?

Don't forget that prealloc threads will need some CPUs to run, which 
would likely result in increased steal time during preallocation for the 
guest.

Likely not a big deal, but something to keep in mind.

Best,
Valentine


