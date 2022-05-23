Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E17B5311A6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:39:12 +0200 (CEST)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntA9H-0007Oy-1W
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntA7h-00063f-2x
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:37:33 -0400
Received: from mga06b.intel.com ([134.134.136.31]:19031 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntA7f-0005Ra-0G
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653320250; x=1684856250;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h1HbB3DDLhhFuCUQQLlXpf9LZqQh0bJznUSAY7BwaBU=;
 b=iNS7hYSwbZKs2HUCCYLDHMtU9n0F+6JeP3LCs9bPoienG/NhM//0tiWh
 p4t13kUTtafZZVF+rmLbUd1e3b3+aPyKuRI+nzcyNkAz3K+XQ4tqGULQn
 G4p+idMeLcjm4RZ8Qi03qjWXttVIIhOHq3JpUOowT6Ttg/ljr0Ddy2F7a
 w3vcngHkzaTNfpF1eYJYW9JURgfvuXtFHJ4IdNetx0Bh0VbEYPTG6U1KM
 8184KoQmv5ghHkp/gk9pucvBt3nz9K9rp52VL0OSs5HcuSAfXN2aVVRRY
 8BnMa6h3k9oW0J/t7cokZFgCDzGkhFjJoA4DKRrmVG8rf8Q6GPzzVvbxq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="333903421"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="333903421"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:37:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600709334"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.171.127])
 ([10.249.171.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:37:21 -0700
Message-ID: <7b167777-c33f-b99f-5377-bdf909c8dbee@intel.com>
Date: Mon, 23 May 2022 23:37:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 08/36] i386/tdx: Adjust get_supported_cpuid() for
 TDX VM
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-9-xiaoyao.li@intel.com>
 <20220523090133.tdctqihkmwv7nlog@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220523090133.tdctqihkmwv7nlog@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/23/2022 5:01 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> - The supported XCR0 and XSS bits needs to be cap'ed by tdx_caps, because
>>    KVM uses them to setup XFAM of TD.
> 
>> +    case 0xd:
>> +        if (index == 0) {
>> +            if (reg == R_EAX) {
>> +                *ret &= (uint32_t)tdx_caps->xfam_fixed0 & XCR0_MASK;
>> +                *ret |= (uint32_t)tdx_caps->xfam_fixed1 & XCR0_MASK;
>> +            } else if (reg == R_EDX) {
>> +                *ret &= (tdx_caps->xfam_fixed0 & XCR0_MASK) >> 32;
>> +                *ret |= (tdx_caps->xfam_fixed1 & XCR0_MASK) >> 32;
>> +            }
>> +        } else if (index == 1) {
>> +            /* TODO: Adjust XSS when it's supported. */
>> +        }
>> +        break;
> 
>> +    default:
>> +        /* TODO: Use tdx_caps to adjust CPUID leafs. */
>> +        break;
> 
> Hmm, that looks all a bit messy and incomplete, also the commit
> message doesn't match the patch (describes XSS which isn't actually
> implemented).

For XSS, QEMU recently got XSS MASK defined, I will use it in this patch.

For other CPUID leaves, we have following patches (a series) to enable 
fine-grained feature control for TDX guest and CPU model for it. So the 
plan is to make it functional with no error in this basic series. Anyway 
I will update the commit message to describe clearly.

> take care,
>    Gerd
> 


