Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC1B58A41D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 02:18:33 +0200 (CEST)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJl2t-00016E-QU
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 20:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oJl0w-0007Ms-Sf
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 20:16:30 -0400
Received: from mga06b.intel.com ([134.134.136.31]:19924 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oJl0t-0005JQ-TO
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 20:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659658587; x=1691194587;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K1SdlcQDUknfyWqpf0El5/S3OXBEmuog0Lsy9lG1L3g=;
 b=mGbGYCkvZt+lH5ESMXdYqYFMP849XvBIBg+w5ZEu4aACnBzApz2M5Czq
 oPhgnfkuLH11eEK5Gf4ljUeKopZLJyYn1wAzGDoRb0ThGjjr+7Fo9r4L5
 /nxFsAjkDUIP4r5+vJifG/6Jb2DzmE+f7PUvi/9ZQuXwFSaaQxkj4icJL
 Mcz7Vid4zesLMFUuKZ4v1TSYzSPxnYI7WzkEipvJr1reiNFRLgdWMiypC
 D7XVOuA7Q4fnhUwgV7TCkJbp69EZ7TdUrmwrPnsgyBMWNl4JGCVsDqoxF
 H/aCMwvZbPbEgis15pmBSemqshU6H1e+9JXDGcY4f/RSn+YkmHp4SHc04 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="351797205"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="351797205"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 17:16:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="579293992"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.170.34])
 ([10.249.170.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 17:16:18 -0700
Message-ID: <c76a9b00-7972-dcf1-28b4-6befe621e094@intel.com>
Date: Fri, 5 Aug 2022 08:16:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v1 00/40] TDX QEMU support
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <YujzOUjMbBZRi/e6@redhat.com>
 <db14e4f1-6090-7f97-f690-176ba828500c@intel.com>
 <Yuqz6nPIIqzrlxP1@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <Yuqz6nPIIqzrlxP1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 8/4/2022 1:44 AM, Daniel P. Berrangé wrote:
> On Tue, Aug 02, 2022 at 06:55:48PM +0800, Xiaoyao Li wrote:
>> On 8/2/2022 5:49 PM, Daniel P. Berrangé wrote:
>>> On Tue, Aug 02, 2022 at 03:47:10PM +0800, Xiaoyao Li wrote:
>>
>>>> - CPU model
>>>>
>>>>     We cannot create a TD with arbitrary CPU model like what for non-TDX VMs,
>>>>     because only a subset of features can be configured for TD.
>>>>     - It's recommended to use '-cpu host' to create TD;
>>>>     - '+feature/-feature' might not work as expected;
>>>>
>>>>     future work: To introduce specific CPU model for TDs and enhance +/-features
>>>>                  for TDs.
>>>
>>> Which features are incompatible with TDX ?
>>
>> TDX enforces some features fixed to 1 (e.g., CPUID_EXT_X2APIC,
>> CPUID_EXT_HYPERVISOR)and some fixed to 0 (e.g., CPUID_EXT_VMX ).
>>
>> Details can be found in patch 8 and TDX spec chapter "CPUID virtualization"
>>
>>> Presumably you have such a list, so that KVM can block them when
>>> using '-cpu host' ?
>>
>> No, KVM doesn't do this. The result is no error reported from KVM but what
>> TD OS sees from CPUID might be different what user specifies in QEMU.
>>
>>> If so, we should be able to sanity check the
>>> use of these features in QEMU for the named CPU models / feature
>>> selection too.
>>
>> This series enhances get_supported_cpuid() for TDX. If named CPU models are
>> used to boot a TDX guest, it likely gets warning of "xxx feature is not
>> available"
> 
> If the  ',check=on' arg is given to -cpu, does it ensure that the
> guest fails to startup with an incompatible feature set ? That's
> really the key thing to protect the user from mistakes.

"check=on" won't stop startup with an incompatible feature set but 
"enforce=on". Yes, this series can ensure it with "enforce=on"

> 
>> We have another series to enhance the "-feature" for TDX, to warn out if
>> some fixed1 is specified to be removed. Besides, we will introduce specific
>> named CPU model for TDX. e.g., TDX-SapphireRapids which contains the maximum
>> feature set a TDX guest can have on SPR host.
> 
> I don't know if this is the right approach or not, but we should at least
> consider making use of CPU versioning here.  ie have a single "SapphireRapids"
> alias, which resolves to a suitable specific CPU version depending on whether
> TDX is used or not.

New version of a CPU model inherits from the last version. This fits 
well with CPU model fixup when features need to be removed/added to 
existing CPU model to make it work well with the latest kernel, and a 
new version is created.

However, I think it less proper to define a TDX variant with versioned- 
cpu model. For example, we have a SPR-V(x), then we need to define 
SPR-V(x+1) and alias it as SPR-TDX. For SPR-V(x+1), we need to add and 
remove several features. In the future, we may need a SPR-V(x+2) to fix 
up the normal SPR cpu model SPR-V(x). All the changes in V(x+1)/SPR-TDX 
  has to be reverted at first.

Anyway, we can discuss it in the future when we post the series of TDX 
CPU model. We plan to do that after this basic series gets merged. :)

> With regards,
> Daniel


