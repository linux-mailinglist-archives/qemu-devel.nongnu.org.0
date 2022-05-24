Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AE35321F4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 06:22:40 +0200 (CEST)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntM46-0007iz-VB
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 00:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntM1i-0006D4-5Z
 for qemu-devel@nongnu.org; Tue, 24 May 2022 00:20:10 -0400
Received: from mga02.intel.com ([134.134.136.20]:24367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntM1e-000738-NT
 for qemu-devel@nongnu.org; Tue, 24 May 2022 00:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653366006; x=1684902006;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bOEEv/vCAuWYvT9MBnYyTSaRD96dT8DA/8SxonVEvi8=;
 b=EzC7Xozs+ZQ1LPJdfjPOBhgJI6DzD9gXnf2z5nIFHk1DLtN2A/yamDt4
 qH/rOp8bkR5oGF5K+E/yql6pHOVctlrwJPpTxKySLy18xiE9PNCyKNCpp
 pt42pkSLkBncTKslvSow2u7jPP2xNDoU5F5+Wwyc6HMfOinZZvkcAenfg
 BOaFWONgdjDfEsLDEdJtMGz0jihkWKEy1VGFciUptLnUtMgjZdM1d2Z22
 v2OxSvYrNMBBDJVBACxblejaZuNp1I/cRXsBFkxpOpKuKIKnrTwNog231
 KVKlod/FB8yFQLfPGuci4xDNBFxPpzi8IN7it3b/eIEJiKwBL++HKlFkl w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="261033059"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="261033059"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 21:19:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601020801"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.170.252])
 ([10.249.170.252])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 21:19:54 -0700
Message-ID: <1e0f0051-f7c1-ed3b-be02-d16f0cf9f25d@intel.com>
Date: Tue, 24 May 2022 12:19:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 13/36] i386/tdx: Validate TD attributes
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
 <20220512031803.3315890-14-xiaoyao.li@intel.com>
 <20220523093920.o6pk5i7zig6enwnm@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220523093920.o6pk5i7zig6enwnm@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/23/2022 5:39 PM, Gerd Hoffmann wrote:
>> Validate TD attributes with tdx_caps that fixed-0 bits must be zero and
>> fixed-1 bits must be set.
> 
>> -static void setup_td_guest_attributes(X86CPU *x86cpu)
>> +static int tdx_validate_attributes(TdxGuest *tdx)
>> +{
>> +    if (((tdx->attributes & tdx_caps->attrs_fixed0) | tdx_caps->attrs_fixed1) !=
>> +        tdx->attributes) {
>> +            error_report("Invalid attributes 0x%lx for TDX VM (fixed0 0x%llx, fixed1 0x%llx)",
>> +                          tdx->attributes, tdx_caps->attrs_fixed0, tdx_caps->attrs_fixed1);
>> +            return -EINVAL;
>> +    }
> 
> So, how is this supposed to work?  Patch #2 introduces attributes as
> user-settable property.  So do users have to manually figure and pass
> the correct value, so the check passes?  Specifically the fixed1 check?
> 
> I think 'attributes' should not be user-settable in the first place.
> Each feature-bit which is actually user-settable (and not already
> covered by another option like pmu) should be a separate attribute for
> tdx-object.  Then the tdx code can create attributes from hardware
> capabilities and user settings.

In patch #2, tdx-guest.attributes is defined as a field to hold a 64 
bits value of attributes but it doesn't provide any getter/setter for 
it. So it's *not* user-settable.

Did I miss something? (I'm not good at QEMU object)

> When user-settable options might not be available depending on hardware
> capabilities best practice is to create them as OnOffAuto properties.
> 
>    Auto == qemu can pick the value, typical behavior is to enable the
>            feature if the hardware supports it.
>    On == must enable, if it isn't possible throw an error and exit.
>    Off == must disable, if it isn't possible throw an error and exit.
> 
> take care,
>    Gerd
> 


