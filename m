Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FABA368A89
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 03:49:22 +0200 (CEST)
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZkwb-0007XF-FE
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 21:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lZkvq-0006zh-Er
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 21:48:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:24095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lZkvn-0005hK-Fo
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 21:48:34 -0400
IronPort-SDR: ZoHEWlmUqYxnAQPP8X1ztabO6EDxuvbpftBvo7b7mWXuTEybhrcSKaymBljcDdISgKrV2zvWDd
 I9Ue6yMiriKQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="175488293"
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="175488293"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 18:48:27 -0700
IronPort-SDR: eF127b23ITrEtpOSSlWrKdZOB2NdTlLADHlnOyUA5XdVE/5xKWwG/Z7Rm3hOEJAKVTUKkJcV6X
 W5l5JMhvtJEA==
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="421595252"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.0.120])
 ([10.238.0.120])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 18:48:25 -0700
Subject: Re: [PATCH v2] i386: Add ratelimit for bus locks acquired in guest
To: Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
References: <20210420093736.17613-1-chenyi.qiang@intel.com>
 <20210420163417.lbns24ypfqz7icxg@habkost.net>
 <df860e12-cea5-3d88-ba16-0dd1f8f975cb@intel.com>
 <20210421141210.mx5mt7kewahj7eij@habkost.net>
 <a73d4f4e-d7b2-b187-d13b-d23989976f49@intel.com>
 <20210421151818.3svsnpmch5gswtpe@habkost.net>
From: Chenyi Qiang <chenyi.qiang@intel.com>
Message-ID: <6cb71de2-5191-c845-a046-1e17c7291bdd@intel.com>
Date: Fri, 23 Apr 2021 09:48:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210421151818.3svsnpmch5gswtpe@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=chenyi.qiang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/21/2021 11:18 PM, Eduardo Habkost wrote:
> On Wed, Apr 21, 2021 at 10:50:10PM +0800, Xiaoyao Li wrote:
>> On 4/21/2021 10:12 PM, Eduardo Habkost wrote:
>>> On Wed, Apr 21, 2021 at 02:26:42PM +0800, Chenyi Qiang wrote:
>>>> Hi, Eduardo, thanks for your comments!
>>>>
>>>>
>>>> On 4/21/2021 12:34 AM, Eduardo Habkost wrote:
>>>>> Hello,
>>>>>
>>>>> Thanks for the patch.  Comments below:
>>>>>
>>>>> On Tue, Apr 20, 2021 at 05:37:36PM +0800, Chenyi Qiang wrote:
>>>>>> Virtual Machines can exploit bus locks to degrade the performance of
>>>>>> system. To address this kind of performance DOS attack, bus lock VM exit
>>>>>> is introduced in KVM and it will report the bus locks detected in guest,
>>>>>> which can help userspace to enforce throttling policies.
>>>>>>
>>>>>
>>>>> Is there anything today that would protect the system from
>>>>> similar attacks from userspace with access to /dev/kvm?
>>>>>
>>>>
>>>> I can't fully understand your meaning for "similar attack with access to
>>>> /dev/kvm". But there are some similar associated detection features on bare
>>>> metal.
>>>
>>> What I mean is: you say guests can make a performance DoS attack
>>> on the host, and your patch mitigates that.
>>>
>>> What would be the available methods to prevent untrusted
>>> userspace running on the host with access to /dev/kvm from making
>>> a similar DoS attack on the host?
> 
> Thanks for all the clarifications below.  Considering them,
> what's the answer to the question above?
> 

Hi Eduardo,

Just make it more clear.

Bus lock detection contains two sub-features. One is bus lock debug 
exception, and the other is bus lock VM exit.

Bus lock #DB exception can help detect the bus locks acquired in user 
space and bus lock VM exit detects the bus locks insides VMs. To address 
the attacks from non-VM userspace attackers against VM, Bus lock #DB 
exception can help.

The Bus lock #DB exception support 
(https://lore.kernel.org/lkml/20210322135325.682257-3-fenghua.yu@intel.com/) 
extends the  existing kernel command line parameter "split_lock_detect=" 
also applying to non-wb bus lock.
For example, split_lock_detect=fatal will send SIGBUS to the attackers 
once this kind of #DB is detected.

>>>
>>>>
>>>> 1. Split lock detection:https://lore.kernel.org/lkml/158031147976.396.8941798847364718785.tip-bot2@tip-bot2/
>>>> Some CPUs can raise an #AC trap when a split lock is attempted.
>>>
>>> Would split_lock_detect=fatal be enough to prevent the above attacks?
>>
>> NO.
>>
>> There are two types bus lock:
>> 1. split lock - lock on cacheable memory while the memory across two cache
>> lines.
>> 2. non-wb lock - lock on non-writableback memory (you can find it on Intel
>> ISE chapter 8, https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html)
>>
>> split lock detection can only prevent 1)
>>
>>> Is split_lock_detect=fatal the only available way to prevent them?
>>
>> as above, 2) non-wb lock can be prevented by "non-wb lock disable" feature
> 
> Bus lock VM exit applies to both 1 and 2, correct?
> 
>>
>>>
>>>>
>>>> 2. Bus lock Debug Exception:
>>>> https://lore.kernel.org/lkml/20210322135325.682257-1-fenghua.yu@intel.com/
>>>> The kernel can be notified by an #DB trap after a user instruction acquires
>>>> a bus lock and is executed.
>>>
>>> I see a rate limit option mentioned at the above URL.  Would a
>>> host kernel bus lock rate limit option make this QEMU patch
>>> redundant?
>>>
>>
>> No. Bus lock Debug exception cannot be used to detect the bus lock happens
>> in guest (vmx non-root mode).
>>
>> We have patch to virtualize this feature for guest
>> https://lore.kernel.org/kvm/20210202090433.13441-1-chenyi.qiang@intel.com/
>>
>> that guest will have its own setting of bus lock debug exception on or off.
>>
>> What's more important is that, even we force set the
>> MSR_DEBUGCTL.BUS_LOCK_DETECT for guest, guest still can escape from it.
>> Because bus lock #DB is a trap which is delivered after the instruction
>> completes. If the instruction acquires bus lock subsequently faults e.g.,
>> #PF, then no bus lock #DB generated. But the bus lock does happen.
>>
>> But with bus lock VM exit, even the instruction faults, it will cause a BUS
>> LOCK VM exit.
>>
>>
> 

