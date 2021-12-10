Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43646FE50
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:59:57 +0100 (CET)
Received: from localhost ([::1]:33390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvch2-0003m2-9A
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mvcbf-00045T-UD
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 04:54:23 -0500
Received: from mga18.intel.com ([134.134.136.126]:18483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mvcbc-00084f-FP
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 04:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639130060; x=1670666060;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i5mi2ux2NWMV234M1FllWOI2g2yLlRa0QdVRhusT3Og=;
 b=IVEeO3aMvRER6qkW1xQIVBtWp3nczvD6DQ+8iJo42RBfB6pVTaQ5RnEg
 77xte2j8IKEiOJHoyTmuUYozRHTro8C/4hwwWfiuxds69XLpNInZYK3OZ
 VreHaF+nKwTqNmjSetbmKigD1LACmSTQSMf7FXh4jE2OUkDs9L0Kb4XZS
 E9fYsUDDBDxRhGXWzYsAuWyaItZUeYmt+376VggtjZbobPaQZbmR5JiZ/
 aLvefOpgaKbtNJc8fmCy++Jl33mrfAA3vheXO0LIdD6Su6tb80Jz1CC/V
 U8StE/r2U5XRUicP1DdSM61xxSDSmNMEUfjdde79mcMsfttBVxpWZf3+W Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225185190"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="225185190"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 01:54:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="503868624"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.249.171.165])
 ([10.249.171.165])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 01:54:13 -0800
Message-ID: <6031a4ed-1544-c563-9f05-cfcf2ae351b6@intel.com>
Date: Fri, 10 Dec 2021 17:54:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [RFC PATCH v2 34/44] target/i386/tdx: set reboot action to
 shutdown when tdx
Content-Language: en-US
To: Connor Kuehl <ckuehl@redhat.com>, isaku.yamahata@gmail.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, seanjc@google.com,
 erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <d1afced8a92c01367d0aed7c6f82659c9bf79956.1625704981.git.isaku.yamahata@intel.com>
 <0ccf5a5c-2322-eae3-bd4b-9e72e2f4bbd1@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <0ccf5a5c-2322-eae3-bd4b-9e72e2f4bbd1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=xiaoyao.li@intel.com; helo=mga18.intel.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/2021 1:54 AM, Connor Kuehl wrote:
> On 7/7/21 7:55 PM, isaku.yamahata@gmail.com wrote:
>> From: Isaku Yamahata <isaku.yamahata@intel.com>
>>
>> In TDX CPU state is also protected, thus vcpu state can't be reset by 
>> VMM.
>> It assumes -action reboot=shutdown instead of silently ignoring vcpu 
>> reset.
>>
>> TDX module spec version 344425-002US doesn't support vcpu reset by 
>> VMM.  VM
>> needs to be destroyed and created again to emulate REBOOT_ACTION_RESET.
>> For simplicity, put its responsibility to management system like libvirt
>> because it's difficult for the current qemu implementation to destroy and
>> re-create KVM VM resources with keeping other resources.
>>
>> If management system wants reboot behavior for its users, it needs to
>>   - set reboot_action to REBOOT_ACTION_SHUTDOWN,
>>   - set shutdown_action to SHUTDOWN_ACTION_PAUSE optionally and,
>>   - subscribe VM state change and on reboot, (destroy qemu if
>>     SHUTDOWN_ACTION_PAUSE and) start new qemu.
>>
>> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>> ---
>>   target/i386/kvm/tdx.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
>> index 1316d95209..0621317b0a 100644
>> --- a/target/i386/kvm/tdx.c
>> +++ b/target/i386/kvm/tdx.c
>> @@ -25,6 +25,7 @@
>>   #include "qapi/qapi-types-misc-target.h"
>>   #include "standard-headers/asm-x86/kvm_para.h"
>>   #include "sysemu/sysemu.h"
>> +#include "sysemu/runstate-action.h"
>>   #include "sysemu/kvm.h"
>>   #include "sysemu/kvm_int.h"
>>   #include "sysemu/tdx.h"
>> @@ -363,6 +364,19 @@ static void tdx_guest_init(Object *obj)
>>       qemu_mutex_init(&tdx->lock);
>> +    /*
>> +     * TDX module spec version 344425-002US doesn't support reset of 
>> vcpu by
>> +     * VMM.  VM needs to be destroyed and created again to emulate
>> +     * REBOOT_ACTION_RESET.  For simplicity, put its responsibility to
>> +     * management system like libvirt.
>> +     *
>> +     * Management system should
>> +     *  - set reboot_action to REBOOT_ACTION_SHUTDOWN
>> +     *  - set shutdown_action to SHUTDOWN_ACTION_PAUSE
>> +     *  - subscribe VM state and on reboot, destroy qemu and start 
>> new qemu
>> +     */
>> +    reboot_action = REBOOT_ACTION_SHUTDOWN;
>> +
>>       tdx->debug = false;
>>       object_property_add_bool(obj, "debug", tdx_guest_get_debug,
>>                                tdx_guest_set_debug);
>>
> 
> I think the same effect could be accomplished with modifying
> kvm_arch_cpu_check_are_resettable.
> 

Yes. Thanks for pointing it out. We will take this approach.

