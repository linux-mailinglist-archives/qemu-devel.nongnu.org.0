Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35655B6508
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 03:18:32 +0200 (CEST)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXuZL-0004x6-D7
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 21:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oXuVH-0003Kg-W6
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 21:14:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:3369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oXuVE-0006Bk-Nl
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 21:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663031656; x=1694567656;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jwYI7Y+ErustrW+xyMACGSP6kr582mwHq0bLbgyd9ec=;
 b=A+/7+lib6QPnQQK/AwcnViRo5RmhR8CAeWhAgxmQ3Sn15umx33g38QAu
 AEPfruJH6uLxSjB4aOdsUVxZBNUb/VEWdoCy3aNUErq1dEkl4H86n31iC
 dS2GY6deP0K7Jd65ozl4ySsI3WRFMt6ppdSFyviOAxt3cNHUuT3O8KiZq
 nF3osQPwweipDB+TINg6o4yAJlG72tzLJ7Wb0xxcIY+qT6LQewDffI46m
 RJQzUYS+y4WXxr8szQGADY+4wsKlP7BaCsK+FGOsCyxkT2ZbP/z7A0tD3
 dI/3teC6dtgA5IVhQhGQF4SrtGrgXIQEM5xrOftsX/xPXg/OVB6h/4/O0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="384304416"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="384304416"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 18:14:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="944852505"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.0.135])
 ([10.238.0.135])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 18:13:58 -0700
Message-ID: <db7834a7-5006-4345-3c66-2277c68d29e3@intel.com>
Date: Tue, 13 Sep 2022 09:13:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v5 3/3] i386: Add notify VM exit support
To: Peter Xu <peterx@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Xiaoyao Li <xiaoyao.li@intel.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220817020845.21855-1-chenyi.qiang@intel.com>
 <20220817020845.21855-4-chenyi.qiang@intel.com>
 <YxtpBMZmrDK3cghT@xz-m1.local>
Content-Language: en-US
From: Chenyi Qiang <chenyi.qiang@intel.com>
In-Reply-To: <YxtpBMZmrDK3cghT@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chenyi.qiang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.153, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 9/10/2022 12:25 AM, Peter Xu wrote:
> On Wed, Aug 17, 2022 at 10:08:45AM +0800, Chenyi Qiang wrote:
>> There are cases that malicious virtual machine can cause CPU stuck (due
>> to event windows don't open up), e.g., infinite loop in microcode when
>> nested #AC (CVE-2015-5307). No event window means no event (NMI, SMI and
>> IRQ) can be delivered. It leads the CPU to be unavailable to host or
>> other VMs. Notify VM exit is introduced to mitigate such kind of
>> attacks, which will generate a VM exit if no event window occurs in VM
>> non-root mode for a specified amount of time (notify window).
>>
>> A new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT is exposed to user space
>> so that the user can query the capability and set the expected notify
>> window when creating VMs. The format of the argument when enabling this
>> capability is as follows:
>>    Bit 63:32 - notify window specified in qemu command
>>    Bit 31:0  - some flags (e.g. KVM_X86_NOTIFY_VMEXIT_ENABLED is set to
>>                enable the feature.)
>>
>> Because there are some concerns, e.g. a notify VM exit may happen with
>> VM_CONTEXT_INVALID set in exit qualification (no cases are anticipated
>> that would set this bit), which means VM context is corrupted. To avoid
>> the false positive and a well-behaved guest gets killed, make this
>> feature disabled by default. Users can enable the feature by a new
>> machine property:
>>      qemu -machine notify_vmexit=on,notify_window=0 ...
> 
> The patch looks sane to me; I only read the KVM interface, though.  Worth
> add a section to qemu-options.hx?  It'll also be worthwhile to mention the
> valid range of notify_window and meaning of zero (IIUC that's also a valid
> input, just use the hardware default window size).
> 

Thanks Peter for your review.

I'll add some doc in qemu-option.hx and also the commit message about 
the valid range in next version.

> Thanks,
> 
>>
>> A new KVM exit reason KVM_EXIT_NOTIFY is defined for notify VM exit. If
>> it happens with VM_INVALID_CONTEXT, hypervisor exits to user space to
>> inform the fatal case. Then user space can inject a SHUTDOWN event to
>> the target vcpu. This is implemented by injecting a sythesized triple
>> fault event.
> 

