Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970745BF41D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 05:09:23 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaq70-0005Cj-4x
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 23:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oaq5c-0003Ev-AK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 23:07:56 -0400
Received: from mga09.intel.com ([134.134.136.24]:53830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oaq5Y-0006hN-L4
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 23:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663729672; x=1695265672;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IDL8vZTnp35Mro2Bd4eUR+qgMw9RrBkY3Hr4UHQU88A=;
 b=i/2xlX8NUO++CFVBDxABQVR0wd5ypKojXlztTmPRfrd1Fi6kT07/NGCg
 h8Ctvark2nyWndjcdgYbXiJxkgtLjg2kFCW801XVD+9YsNXV2PhG6Q92p
 X6j/gSW3glSwxcu/BDDE8KC+jgUbPaTZzxyUr9O7X7GU4TE+Z8vUc2Pky
 qLF4oDK739y2B5OjgNArQNSPcwGBXAM1/Q22e5x/PuiDL1S9Z9FFToPgX
 T0xYduHbvbhPHmJwFj1/FTMQ9AvMDP+komSW7tcj+hrgJne0wHh2BV+Ey
 xjgjUoioHTlteituO/2LbvJ6BDH7+gAEgHI7ihdKttlBBPlWx2j1aOmaF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="300718846"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="300718846"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 20:07:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="708258326"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.0.135])
 ([10.238.0.135])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 20:07:42 -0700
Message-ID: <38a4d1c0-25e6-0836-c2bc-5ae580c95715@intel.com>
Date: Wed, 21 Sep 2022 11:07:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v6 2/2] i386: Add notify VM exit support
To: Peter Xu <peterx@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Xiaoyao Li <xiaoyao.li@intel.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220915092839.5518-1-chenyi.qiang@intel.com>
 <20220915092839.5518-3-chenyi.qiang@intel.com> <YyTxL7kstA20tB5a@xz-m1.local>
 <5beb9f1c-a419-94f7-a1b9-4aeb281baa41@intel.com>
 <YyiQeD9QmJ9/eS9F@xz-m1.local>
 <ee855874-bb8b-3f43-cffe-425700b26918@intel.com>
 <YynHXI+Vtrf9J/Ae@xz-m1.local>
Content-Language: en-US
From: Chenyi Qiang <chenyi.qiang@intel.com>
In-Reply-To: <YynHXI+Vtrf9J/Ae@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=chenyi.qiang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.182, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
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



On 9/20/2022 9:59 PM, Peter Xu wrote:
> On Tue, Sep 20, 2022 at 01:55:20PM +0800, Chenyi Qiang wrote:
>>>> @@ -5213,6 +5213,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run
>>>> *run)
>>>>            break;
>>>>        case KVM_EXIT_NOTIFY:
>>>>            ret = 0;
>>>> +        warn_report_once("KVM: notify window was exceeded in guest");
>>>
>>> Is there more informative way to dump this?  If it's 99% that the guest was
>>> doing something weird and needs attention, maybe worthwhile to point that
>>> out directly to the admin?
>>>
>>
>> Do you mean to use other method to dump the info? i.e. printing a message is
>> not so clear. Or the output message ("KVM: notify window was exceeded in
>> guest") is not obvious and we need other wording.
> 
> I meant something like:
> 
>    KVM received notify exit.  It means there can be possible misbehaves in
>    the guest, please have a look.

Get your point. Then I can print this message behind as well.

Thanks.

> 
> Or something similar.  What I'm worried is the admin may not understand
> what's "notify window" and that message got simply ignored.
> 
> Though I am not even sure whether that's accurate in the wordings.
> 
>>
>>>>            if (run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID) {
>>>>                warn_report("KVM: invalid context due to notify vmexit");
>>>>                if (has_triple_fault_event) {
>>>
>>> Adding a warning looks good to me, with that (or in any better form of
>>> wording):
>>>
>> If no objection, I'll follow Xiaoyao's suggestion to form the wording like:
> 
> No objection here.  Thanks.
> 

