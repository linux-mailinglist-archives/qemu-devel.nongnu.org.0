Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B153496A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 05:45:30 +0200 (CEST)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu4RF-0007EX-4m
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 23:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nu4QC-0006Zx-9J
 for qemu-devel@nongnu.org; Wed, 25 May 2022 23:44:24 -0400
Received: from mga05.intel.com ([192.55.52.43]:1477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nu4Q9-00037w-N5
 for qemu-devel@nongnu.org; Wed, 25 May 2022 23:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653536661; x=1685072661;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oLdKtrVWRz08CWT64PN6UcYHzqiEl/ro32pb6xYNL4E=;
 b=jm6BzpG+e26Abe/uDd5g4Bbd7uuZMt4Zly4KSt2C2wJD35KRyD1Ae8EL
 OTe9m0B2+m/3m11rNM9QAxnkqxDHMxH9Atx50zfP4uBHS64je4+jjbFwP
 WlahwzwH89nX8rs9NIsfJYfJOEdg1pfPoCdR8h0rba743Fh+eggsX3dBs
 YoTAeRwjJeLuKJxqo67hGldWyX87yYoTpcqfuVABcwjJq14zuuAMqRLQu
 4bV9FSy2DoE6rvQ4Q6y2N2i4o/LLLaQLwigtArGdkMcPevnzCU/Un8kuU
 4fMF9yAXS9Z86T18IYhI1tPXklgw6YFjLTTO5czU8OohysBqBp8tOT/mC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="360409880"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="360409880"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 20:44:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="573662025"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.212])
 ([10.255.28.212])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 20:44:09 -0700
Message-ID: <641d640a-398c-3004-382f-f208e779a26e@intel.com>
Date: Thu, 26 May 2022 11:44:06 +0800
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
 <1e0f0051-f7c1-ed3b-be02-d16f0cf9f25d@intel.com>
 <20220524065959.umzmlhwcspfwi7m2@sirius.home.kraxel.org>
 <89534991-1850-be09-8abd-6d29bef5958e@intel.com>
 <20220524082939.2clruwficvkdwnzh@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220524082939.2clruwficvkdwnzh@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=xiaoyao.li@intel.com;
 helo=mga05.intel.com
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

On 5/24/2022 4:29 PM, Gerd Hoffmann wrote:
> On Tue, May 24, 2022 at 04:11:56PM +0800, Xiaoyao Li wrote:
>> On 5/24/2022 2:59 PM, Gerd Hoffmann wrote:
>>> On Tue, May 24, 2022 at 12:19:51PM +0800, Xiaoyao Li wrote:
>>>> On 5/23/2022 5:39 PM, Gerd Hoffmann wrote:
>>>>> So, how is this supposed to work?  Patch #2 introduces attributes as
>>>>> user-settable property.  So do users have to manually figure and pass
>>>>> the correct value, so the check passes?  Specifically the fixed1 check?
>>>>>
>>>>> I think 'attributes' should not be user-settable in the first place.
>>>>> Each feature-bit which is actually user-settable (and not already
>>>>> covered by another option like pmu) should be a separate attribute for
>>>>> tdx-object.  Then the tdx code can create attributes from hardware
>>>>> capabilities and user settings.
>>>>
>>>> In patch #2, tdx-guest.attributes is defined as a field to hold a 64 bits
>>>> value of attributes but it doesn't provide any getter/setter for it. So it's
>>>> *not* user-settable.
>>>
>>> Ok.  Why it is declared as object property in the first place then?
>>
>> Is there another way to define a member/field of object besides property?
> 
> Well, the C object struct is completely independent from the qapi
> struct.  Typically qapi-generated structs are added as struct fields.
> Look at ui/input-linux.c for example.
> 
> struct InputLinux holds all the object state.  It has a GrabToggleKeys
> field, that is a qapi-generated enum (see qapi/common.json) and is
> user-configurable (there are getter and setter for it).
> 
> So, you can have a private 'attributes' struct field in your tdx class,
> but the field doesn't have to be in the qapi struct for that.

I see. Thanks for the explanation!

I will remove the qom property definition in patch 2.

> HTH,
>    Gerd
> 


