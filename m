Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF725420AE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 03:54:05 +0200 (CEST)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyktY-0005Uu-Pm
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 21:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nykqZ-0003Xw-Df
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:50:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:49860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nykqW-0004gO-9k
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654653056; x=1686189056;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2nQ38fddFLZDd8gkGjJtsrfacBKUhyjbYVezamAfui8=;
 b=OdGzkmP+5tOv3QmQevljW+BCrBVAML3iwyjC8YOmOj1dV8iyfzMnNcpV
 QnoAjCc+i0SdVmbgGUw2X2SoDED/YTe+9t2r+Kmx9Y+r4M2cYXLeRWWyH
 dkyG/WMII3ICdKMsaLf5YO6d7T9hvavgXmMi1izkzTeG58SxGFPzxv5B+
 VXACJMekmX5gk4himK8BIZZiX3Yn9OilE/42jxnpfcPhy/To218dNMJSg
 UUlhqZbTGQKK0wPYttt+7apNaGzoe79Z5QZ2UtHbnWDziy3JpKXayvubi
 M3+3ynS2H0rCzaB1r4aBSd4LCyl6lADao9DBvl9/eKYePZn0oRziSDcJi Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="363116071"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="363116071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 18:50:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="636468942"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.31.211])
 ([10.255.31.211])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 18:50:44 -0700
Message-ID: <83f56255-f15d-f36b-4897-06d8f954061c@intel.com>
Date: Wed, 8 Jun 2022 09:50:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 11/36] i386/tdx: Initialize TDX before creating TD
 vcpus
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
 <20220512031803.3315890-12-xiaoyao.li@intel.com>
 <20220523092003.lm4vzfpfh4ezfcmy@sirius.home.kraxel.org>
 <d3e967f3-917f-27ce-1367-2dba23e5c241@intel.com>
 <20220524065719.wyyoba2ke73tx3nc@sirius.home.kraxel.org>
 <39341481-67b6-aba4-a25a-10abb398bec4@intel.com>
 <20220601075453.7qyd5z22ejgp37iz@sirius.home.kraxel.org>
 <9d00fd58-b957-3b8e-22ab-12214dcbbe97@intel.com>
 <20220607111651.2zjm7mx2gz3irqxo@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220607111651.2zjm7mx2gz3irqxo@sirius.home.kraxel.org>
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

On 6/7/2022 7:16 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>>> I guess it could be helpful for the discussion when you can outine the
>>> 'big picture' for tdx initialization.  How does kvm accel setup look
>>> like without TDX, and what additional actions are needed for TDX?  What
>>> ordering requirements and other constrains exist?
>>
>> To boot a TDX VM, it requires several changes/additional steps in the flow:
>>
>>   1. specify the vm type KVM_X86_TDX_VM when creating VM with
>>      IOCTL(KVM_CREATE_VM);
>> 	- When initializing KVM accel
>>
>>   2. initialize VM scope configuration before creating any VCPU;
>>
>>   3. initialize VCPU scope configuration;
>> 	- done inside machine_init_done_notifier;
>>
>>   4. initialize virtual firmware in guest private memory before vcpu running;
>> 	- done inside machine_init_done_notifier;
>>
>>   5. finalize the TD's measurement;
>> 	- done inside machine init_done_notifier;
>>
>>
>> And we are discussing where to do step 2).
>>
>> We can find from the code of tdx_pre_create_vcpu(), that it needs
>> cpuid entries[] and attributes as input to KVM.
>>
>>    cpuid entries[] is set up by kvm_x86_arch_cpuid() mainly based on
>>    'CPUX86State *env'
>>
>>    attributes.pks is retrieved from env->features[]
>>    and attributes.pmu is retrieved from x86cpu->enable_pmu
>>
>> to make VM-socpe data is consistent with VCPU data, we do choose the point
>> late enough to ensure all the info/configurations from VCPU are settle down,
>> that just before calling KVM API to do VCPU-scope configuration.
> 
> So essentially tdx defines (some) vcpu properties at vm scope?  

Not TDX, but QEMU. Most of the CPU features are configrued by "-cpu" 
option not "-machine" option.

> Given
> that all vcpus typically identical (and maybe tdx even enforces this)
> this makes sense.
> 
> A comment in the source code explaining this would be good.
> 
> thanks,
>    Gerd
> 


