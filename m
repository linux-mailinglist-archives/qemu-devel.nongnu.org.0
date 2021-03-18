Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3890A340293
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:58:26 +0100 (CET)
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpQ9-0003Uk-A2
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMpOj-0002An-5Y; Thu, 18 Mar 2021 05:56:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:41410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMpOe-0001eF-Qo; Thu, 18 Mar 2021 05:56:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00064AC75;
 Thu, 18 Mar 2021 09:56:50 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
Date: Thu, 18 Mar 2021 10:56:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 10:47 AM, Philippe Mathieu-Daudé wrote:
> Hi Peter,
> 
> On 3/11/21 11:43 AM, Claudio Fontana wrote:
>> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>>> KVM requires the target cpu to be at least ARMv8 architecture
>>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>>> "target/arm: Remove KVM support for 32-bit Arm hosts").
>>>
>>> A KVM-only build won't be able to run TCG cpus, move the
>>> v7A CPU definitions to cpu_tcg.c.
>>>
>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>>
>> Here I think it's better to keep the "a15" cpu around,
>> until we fix the board configuration situation.
>>
>> I added a patch that does that into my KVM-only build series, to avoid the resulting breakages.
> 
> Actually I got a downstream report that this break migration from QEMU
> 5.2 to QEMU 6.0.
> 
> I first thought it was on an old kernel (with 32-bit KVM enabled),
> but not, it is for Aarch64 VMs on recent KVM (without 32-bit support)
> but the 'virt' machines were started with default Cortex-A15 CPU...
> 
>     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> 
> I'm not sure upstream should care about this case, but I though
> maybe you could give me hints about the best way to keep old VMs
> working, as this likely affects any distribution. Obviously not
> upgrading QEMU is not a solution :)
> 
> The simplest seems to revert 82bf7ae84ce and this patch, but I
> doubt this will be enough.
> 
> Maybe there is some clever thing to do before reverting 82bf7ae84ce,
> that could also benefit upstream, by doing something with versioned
> machines? I have no idea (yet) how that work and if it could work.

Does just applying my series fix it?

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg06463.html

Ie, I have resurrected specifically the a15 to keep things working for "virt".

Patch 22/50. Maybe I am missing something though?

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg06494.html

Ciao,

Claudio

