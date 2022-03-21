Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2704E203D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 06:52:23 +0100 (CET)
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWAxq-0003kD-2s
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 01:52:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWAje-0001dh-19
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:37:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:9935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWAjb-0007JY-Hh
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647841059; x=1679377059;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GYSqGCaVhZ+z/tBBw/krL6zxCL+qnMdvWRk0OPnpUco=;
 b=NIoBfOlLwnp0aE4GyrAie1vQok3AUw1q5WQ+GcGglIavECENxUxuqN/W
 wvZmcJIlB9MJOYVH+ovaLdF2p8GoIv7yhIdWaI0X1sWJPC4J/1BsYiOhj
 HNHiMY89PYWNR2xKd3Dv9YUrr6c9NSIvMeySdXwbREnrbGYxBhrb4Kdpx
 lIIK8qJh94JL7J1FHFny/6F8zVNMY3X0eWLS8Xo/EvonfH2L/U2clOMym
 LqBN8+AZTAzMrExldtPAe9R7qcS9xvkbu1/rnsU95VFlIW85owExDu1mw
 a447Uxhnxr0xBd2SH20Q/qXSSw3hdmXZQiwNxhAM2H6cUPaT7bWoee0Xx w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="318182781"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="318182781"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 22:37:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="559709308"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.245])
 ([10.249.169.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 22:37:05 -0700
Message-ID: <7c92b415-8357-b35d-ac46-299d55989a62@intel.com>
Date: Mon, 21 Mar 2022 13:37:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 08/36] i386/tdx: Adjust get_supported_cpuid() for
 TDX VM
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-9-xiaoyao.li@intel.com>
 <20220318165529.GA4049379@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220318165529.GA4049379@ls.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/2022 12:55 AM, Isaku Yamahata wrote:
> On Thu, Mar 17, 2022 at 09:58:45PM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
...
>> +void tdx_get_supported_cpuid(uint32_t function, uint32_t index, int reg,
>> +                             uint32_t *ret)
>> +{
>> +    switch (function) {
>> +    case 1:
>> +        if (reg == R_ECX) {
>> +            *ret &= ~CPUID_EXT_VMX;
>> +        }
>> +        break;
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
>> +    case KVM_CPUID_FEATURES:
>> +        if (reg == R_EAX) {
>> +            *ret &= ~((1ULL << KVM_FEATURE_CLOCKSOURCE) |
>> +                      (1ULL << KVM_FEATURE_CLOCKSOURCE2) |
>> +                      (1ULL << KVM_FEATURE_CLOCKSOURCE_STABLE_BIT) |
>> +                      (1ULL << KVM_FEATURE_ASYNC_PF) |
>> +                      (1ULL << KVM_FEATURE_ASYNC_PF_VMEXIT) |
>> +                      (1ULL << KVM_FEATURE_ASYNC_PF_INT));
> 
> Because new feature bit may be introduced in future (it's unlikely though),
> *ret &= (supported_bits) is better than *ret &= ~(unsupported_bits)
> 

Good point, I will introduce supported_kvm_features for it.


