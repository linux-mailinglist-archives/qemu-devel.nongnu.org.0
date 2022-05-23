Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3655311B3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:49:13 +0200 (CEST)
Received: from localhost ([::1]:58378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntAIy-0003rR-Ac
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntAD2-00036m-1i
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:43:04 -0400
Received: from mga06b.intel.com ([134.134.136.31]:19612 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntACv-0006mu-WF
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653320577; x=1684856577;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q+ZiO1z9B8ZfHHXuPMSjVYlMGYaRBpz3wImSx3yeLTc=;
 b=Mm13ZffBQO6h2BurmMIuJjXMo8TRhmOkRKY3z9XL4MctP8Kq1zjzARsw
 z72MISxFWxxBvYmFiw9o4GROnoW/1QSSQI9Ts5ZuFoQlam6YE+2s+lRlg
 CAFZBqj/q2ioH5TwzV0FpzAqczEpDe4giI4A8duRupyvHOq2bqfUNXUuc
 UbTewYwngQl29ONjKA2y0vp0g3TMEb2ztA0eUFniVZmp6ym/WBNP+HOzd
 WKvC30tImuBWhXoP6nOGZn2eJQAKinNaL+jtuevOlBvVeuE2yqdj63hi9
 TE5JcDWxLFhfjSRNsfiBu0lJarPxVtJD2FGqrs/25acLoQqbW11RMgGaI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="333905284"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="333905284"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:42:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600713440"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.171.127])
 ([10.249.171.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:42:51 -0700
Message-ID: <d3e967f3-917f-27ce-1367-2dba23e5c241@intel.com>
Date: Mon, 23 May 2022 23:42:47 +0800
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
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220523092003.lm4vzfpfh4ezfcmy@sirius.home.kraxel.org>
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

On 5/23/2022 5:20 PM, Gerd Hoffmann wrote:
>> +int tdx_pre_create_vcpu(CPUState *cpu)
>> +{
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    X86CPU *x86cpu = X86_CPU(cpu);
>> +    CPUX86State *env = &x86cpu->env;
>> +    struct kvm_tdx_init_vm init_vm;
>> +    int r = 0;
>> +
>> +    qemu_mutex_lock(&tdx_guest->lock);
>> +    if (tdx_guest->initialized) {
>> +        goto out;
>> +    }
>> +
>> +    memset(&init_vm, 0, sizeof(init_vm));
>> +    init_vm.cpuid.nent = kvm_x86_arch_cpuid(env, init_vm.entries, 0);
>> +
>> +    init_vm.attributes = tdx_guest->attributes;
>> +    init_vm.max_vcpus = ms->smp.cpus;
>> +
>> +    r = tdx_vm_ioctl(KVM_TDX_INIT_VM, 0, &init_vm);
>> +    if (r < 0) {
>> +        error_report("KVM_TDX_INIT_VM failed %s", strerror(-r));
>> +        goto out;
>> +    }
>> +
>> +    tdx_guest->initialized = true;
>> +
>> +out:
>> +    qemu_mutex_unlock(&tdx_guest->lock);
>> +    return r;
>> +}
> 
> Hmm, hooking *vm* initialization into *vcpu* creation looks wrong to me.

That's because for TDX, it has to do VM-scope (feature) initialization 
before creating vcpu. This is new to KVM and QEMU, that every feature is 
vcpu-scope and configured per-vcpu before.

To minimize the change to QEMU, we want to utilize @cpu and @cpu->env to 
grab the configuration info. That's why it goes this way.

Do you have any better idea on it?

> take care,
>    Gerd
> 


