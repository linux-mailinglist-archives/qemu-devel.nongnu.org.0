Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5D53B0E2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:03:01 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZEq-0004HH-L0
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nwZDV-0003Zx-Kh
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:01:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:8663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nwZDS-0004YY-El
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654131694; x=1685667694;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0m+FnQJzo+uEfWhksV9YCoYcKMswjsWrEgsyM6SgwCc=;
 b=FPC76zJbMdd34iUYXwiRZUjP2SVLSVAiNLQWjUYK+RLgTn+v4FkzP9BU
 caPiGRXzd2iuGYpqpKJppIYsT+rfKznzCyD7v7v6oDOc8U+VLAooaDiG9
 SBWa9pVE85yL8olXFind67zkYjnp6Rw6dlD2Jb8YZ+H7Zl6tDW35GlqZu
 llQ6Cm+9Cw5lkaxV7Xv8Thf0NXyeiCEIw4oHcARM5YdAmTGfyOJDStLfA
 kngVSDC7Aam63GVUOonIcQbjrYo0zgQZEOAxY31eLRWjWG3vPJQVywMp0
 sMarDFHkVHvy5ke9lRoE9UbyDwROVkUM7Kd5QyG1p+mZqj3WG+vmHSg5+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="362153817"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="362153817"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 18:01:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="606565402"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.168.138])
 ([10.249.168.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 18:01:25 -0700
Message-ID: <9d00fd58-b957-3b8e-22ab-12214dcbbe97@intel.com>
Date: Thu, 2 Jun 2022 09:01:23 +0800
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
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220601075453.7qyd5z22ejgp37iz@sirius.home.kraxel.org>
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

On 6/1/2022 3:54 PM, Gerd Hoffmann wrote:
> On Wed, Jun 01, 2022 at 03:20:46PM +0800, Xiaoyao Li wrote:
>> On 5/24/2022 2:57 PM, Gerd Hoffmann wrote:
>>>     Hi,
>>> Maybe it's a bit more work to add VM-scope initialization support to
>>> qemu.
>>
>> If just introducing VM-scope initialization to QEMU, it would be easy. What
>> matters is what needs to be done inside VM-scope initialization.
>>
>> For TDX, we need to settle down the features that configured for the TD.
>> Typically, the features are attributes of cpu object, parsed from "-cpu"
>> option and stored in cpu object.
> 
>> 2) create a CPU object when initializing machine object and collect all the
>> info from "-cpu" and drop it in the end; then why not do it when creating
>> 1st vcpu like this patch.
> 
> Do VM-scope tdx initialization late enough that cpu objects are already
> created at that point, so you can collect the info you need without a
> dummy cpu?

new CPU object is created during creating each vcpu. So we have to use 
mutex and flag to ensure VM-scope initialization is executed only once.

And it's werid to hook  VM-scope initialization in the middle of the 
vcpu creating phase to satisfy "late enough", so we choose to do it just 
before calling KVM API to initializing vcpu.

> I guess it could be helpful for the discussion when you can outine the
> 'big picture' for tdx initialization.  How does kvm accel setup look
> like without TDX, and what additional actions are needed for TDX?  What
> ordering requirements and other constrains exist?

To boot a TDX VM, it requires several changes/additional steps in the flow:

  1. specify the vm type KVM_X86_TDX_VM when creating VM with
     IOCTL(KVM_CREATE_VM);
	- When initializing KVM accel

  2. initialize VM scope configuration before creating any VCPU;

  3. initialize VCPU scope configuration;
	- done inside machine_init_done_notifier;

  4. initialize virtual firmware in guest private memory before vcpu 
running;
	- done inside machine_init_done_notifier;

  5. finalize the TD's measurement;
	- done inside machine init_done_notifier;


And we are discussing where to do step 2).

We can find from the code of tdx_pre_create_vcpu(), that it needs
cpuid entries[] and attributes as input to KVM.

   cpuid entries[] is set up by kvm_x86_arch_cpuid() mainly based on
   'CPUX86State *env'

   attributes.pks is retrieved from env->features[]
   and attributes.pmu is retrieved from x86cpu->enable_pmu

to make VM-socpe data is consistent with VCPU data, we do choose the 
point late enough to ensure all the info/configurations from VCPU are 
settle down, that just before calling KVM API to do VCPU-scope 
configuration.

> take care,
>    Gerd
> 


