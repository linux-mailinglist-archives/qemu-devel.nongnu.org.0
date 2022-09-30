Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A855F01E3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 02:48:31 +0200 (CEST)
Received: from localhost ([::1]:42818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe4Cb-00053s-Mm
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 20:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oe4BH-0003gy-GE
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 20:47:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:7220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oe4BD-0002jx-28
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 20:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664498823; x=1696034823;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FbPamp3DuDN8VaeGpowUIlPIvBY9RjYb9w4a2lGRpuE=;
 b=QtSlpSwtMzbSFrfQ9Sl7kIvLpqQiCBPUvxLVhBO+Xzf0OHpW9jckLdc6
 Kifssx9ayYYIAw8puyzSs6a0JkrIB285sL6sQeORmTsRmlZqIQ70JjBxG
 rIMKbFy2+LFMlt3tIOrjFZU1TD++oRfOMZnqArRY3mWZJ7hJQzUqkScD7
 v5PNnUDNlj/x/r4zYNjQfjyTjCUE3MYE2exRDxRyyryY0b6cbiM5SXOF5
 0Z+yVFYQCu/nu8ZJdLEvLECOgogPhaX4V0X/FOQek2znqobFsT6gbPNa6
 8ykX4E2LnBPXxIdk/UQIjQL7yXbpW6R6sLySJOjreg9kbF+c+O2qA7QXb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="302979932"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; d="scan'208";a="302979932"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 17:42:44 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="691051266"
X-IronPort-AV: E=Sophos;i="5.93,356,1654585200"; d="scan'208";a="691051266"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.249.168.175])
 ([10.249.168.175])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 17:42:41 -0700
Message-ID: <13f628d5-3ac7-3ddb-d151-d9b22085fde0@intel.com>
Date: Fri, 30 Sep 2022 08:42:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH v8 0/4] Enable notify VM exit
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220929070341.4846-1-chenyi.qiang@intel.com>
 <d20d8f67-2ad9-7b87-71f6-011aab7b6ba5@redhat.com>
Content-Language: en-US
From: Chenyi Qiang <chenyi.qiang@intel.com>
In-Reply-To: <d20d8f67-2ad9-7b87-71f6-011aab7b6ba5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=chenyi.qiang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/30/2022 1:28 AM, Paolo Bonzini wrote:
> On 9/29/22 09:03, Chenyi Qiang wrote:
>> Notify VM exit is introduced to mitigate the potential DOS attach from
>> malicious VM. This series is the userspace part to enable this feature
>> through a new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT. The detailed
>> info can be seen in Patch 4.
>>
>> The corresponding KVM support can be found in linux 6.0-rc:
>> (2f4073e08f4c KVM: VMX: Enable Notify VM exit)
> 
> Thanks, I will queue this in my next pull request.
> 
> Paolo
> 

Thanks Paolo!

Please take the resend version at 
https://lore.kernel.org/qemu-devel/20220929072014.20705-1-chenyi.qiang@intel.com/

There's a minor compile issue in this one.

Chenyi

>> ---
>> Change logs:
>> v7 -> v8
>> - Add triple_fault_pending field transmission on migration (Paolo)
>> - Change the notify-vmexit and notify-window to the accelerator 
>> property. Add it as
>>    a x86-specific property. (Paolo)
>> - Add a preparation patch to expose struct KVMState in order to add 
>> target-specific property.
>> - Define three option for notify-vmexit. Make it on by default. (Paolo)
>> - Raise a KVM internal error instead of triple fault if invalid 
>> context of guest VMCS detected.
>> - v7: 
>> https://lore.kernel.org/qemu-devel/20220923073333.23381-1-chenyi.qiang@intel.com/
>>
>> v6 -> v7
>> - Add a warning message when exiting to userspace (Peter Xu)
>> - v6: 
>> https://lore.kernel.org/all/20220915092839.5518-1-chenyi.qiang@intel.com/
>>
>> v5 -> v6
>> - Add some info related to the valid range of notify_window in patch 
>> 2. (Peter Xu)
>> - Add the doc in qemu-options.hx. (Peter Xu)
>> - v5: 
>> https://lore.kernel.org/qemu-devel/20220817020845.21855-1-chenyi.qiang@intel.com/
>>
>> ---
>>
>> Chenyi Qiang (3):
>>    i386: kvm: extend kvm_{get, put}_vcpu_events to support pending triple
>>      fault
>>    kvm: expose struct KVMState
>>    i386: add notify VM exit support
>>
>> Paolo Bonzini (1):
>>    kvm: allow target-specific accelerator properties
>>
>>   accel/kvm/kvm-all.c      |  78 ++-----------------------
>>   include/sysemu/kvm.h     |   2 +
>>   include/sysemu/kvm_int.h |  75 ++++++++++++++++++++++++
>>   qapi/run-state.json      |  17 ++++++
>>   qemu-options.hx          |  11 ++++
>>   target/arm/kvm.c         |   4 ++
>>   target/i386/cpu.c        |   1 +
>>   target/i386/cpu.h        |   1 +
>>   target/i386/kvm/kvm.c    | 121 +++++++++++++++++++++++++++++++++++++++
>>   target/i386/machine.c    |  20 +++++++
>>   target/mips/kvm.c        |   4 ++
>>   target/ppc/kvm.c         |   4 ++
>>   target/riscv/kvm.c       |   4 ++
>>   target/s390x/kvm/kvm.c   |   4 ++
>>   14 files changed, 272 insertions(+), 74 deletions(-)
>>
> 

