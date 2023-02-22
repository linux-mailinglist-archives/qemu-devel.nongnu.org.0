Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3254669F595
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 14:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUpDi-0005vW-4X; Wed, 22 Feb 2023 08:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pUpDf-0005vN-HZ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:31:39 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pUpDc-0004QY-I4
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:31:38 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bo30so7171022wrb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RqB06Lwh0vJ56FAbFH2B7CgFlxs2+KZKy2fhyk0e0Qw=;
 b=WCvcd25Ker7Z3SsHTv9lCQTZ8yLMg36EM8/MFGhwftFE68cJyBXSaoG4tRpiOMqXdF
 5Vf7mw5syru74EUOg4sInOsizKWGGzEx8P0+UXQthOQET0DbjKRq5OyvcvlB2uPv8uko
 Q2jut7/f2KlG00dpxwAnJnLU+BB195nzAVNwrTVinpGI0B9aNsj7OatDDdbEXxClrkcB
 aZtkvvdEQEgv0yxgUX1ut4Mw0cJlewdLDMfXu8Li+gW135qe5Jl12eu2bC3B0ClgwESu
 cVi62ZHxGU3eW5SyLYFRjVLPisCAxQz2QRkGgLgRzxZRb+9fQB8NF23fYq5J9CccXpU4
 Q7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqB06Lwh0vJ56FAbFH2B7CgFlxs2+KZKy2fhyk0e0Qw=;
 b=Eq+aeQuQ7L5q+j1yeF/WeqAux0NOqTpzhvL2gRaCUO4LC4o4eULwvS2Lvc4tGhOC27
 voiwICn5WWJNlBTmYA0B4k+572dL0n64eWgyCH+z8p+MkKthd0FM/QzeJUrOxLj7wsbB
 bRkizuIQ7Ea8B923z2dN4Q+hHqeyppIjyW99cEzaT25oNy8JHPDdFt3taKvsLkNiZ9xu
 CFRMoMquttkk7VBOMQyVHvj5qmOTMmXDDytzXnbCKXCh1Nm/013QYdnaUHgx/gVKy69T
 mFViUPBFXcd9cDbNPLvCs2AzQWuh4K+7GhzWavuq5bStn+PiUOYncJT+7VFgurj49FSy
 5D5g==
X-Gm-Message-State: AO0yUKW/MvYwEmAwGbgoG4V6H9fReCRs+Kmuisvqo5zT1NqHcKdcDTlc
 +s4q3hWr9f8gtFpxXRGWg14=
X-Google-Smtp-Source: AK7set8f5ONcOx8kTHJsCi+zybuQYp1GVfqkBvMEBFFVU7h/HyM7Hn3kYO6tvyluOBSgx09FAcH3wg==
X-Received: by 2002:adf:fcd2:0:b0:2c5:46f1:bdb2 with SMTP id
 f18-20020adffcd2000000b002c546f1bdb2mr7729672wrs.14.1677072693909; 
 Wed, 22 Feb 2023 05:31:33 -0800 (PST)
Received: from [10.95.97.18] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 h3-20020adff4c3000000b002c70a0e2cd0sm2085757wrp.101.2023.02.22.05.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 05:31:33 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6d9a1874-63e8-0d85-2b4b-837c6e0cdf36@xen.org>
Date: Wed, 22 Feb 2023 13:31:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 47/60] i386/xen: handle PV timer hypercalls
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Paul Durrant
 <xadimgnik@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
References: <20230220204736.2639601-1-dwmw2@infradead.org>
 <20230220204736.2639601-48-dwmw2@infradead.org>
 <c92e355e101669f8473a695ad4abfc555765e5be.camel@infradead.org>
 <54ddce90-a55c-b1f6-59ad-35f7fada4999@xen.org>
 <11a088aa-aea1-bd0a-5537-fdbab65870f8@xen.org>
 <2AB12E9D-BEDE-4227-8360-EE953524B802@infradead.org>
Organization: Xen Project
In-Reply-To: <2AB12E9D-BEDE-4227-8360-EE953524B802@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/02/2023 12:51, David Woodhouse wrote:
> 
> On 22 February 2023 12:14:00 GMT, Paul Durrant <xadimgnik@gmail.com> wrote:
>> On 22/02/2023 12:03, Paul Durrant wrote:
>>> On 22/02/2023 09:21, David Woodhouse wrote:
>>>> On Mon, 2023-02-20 at 20:47 +0000, David Woodhouse wrote:
>>>>> @@ -1246,6 +1470,16 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
>>>>>        }
>>>>>        switch (code) {
>>>>> +    case __HYPERVISOR_set_timer_op:
>>>>> +        if (exit->u.hcall.longmode) {
>>>>> +            return kvm_xen_hcall_set_timer_op(exit, cpu,
>>>>> +                                              exit->u.hcall.params[0]);
>>>>> +        } else {
>>>>> +            /* In 32-bit mode, the 64-bit timer value is in two args. */
>>>>> +            uint64_t val = ((uint64_t)exit->u.hcall.params[1]) << 32 |
>>>>> +                (uint32_t)exit->u.hcall.params[0];
>>>>> +            return kvm_xen_hcall_set_timer_op(exit, cpu, val);
>>>>> +        }
>>>>
>>>> Argh, there I'm returning -errno from a function that ought to set it
>>>> in exit->u.hcall.result and return 'true' for a handled syscall. Again.
>>>>
>>>> Still *slightly* regretting my life choices there and wishing the
>>>> compiler caught that for me, but not enough to change it because we
>>>> really *do* want to track which unhandled calls guests are trying to
>>>> make. I'll fix it and then (if I make load_multiboot() tolerate 64-bit
>>>> binaries as previously discussed) the XTF tests work:
>>>>
>>>>    $ ./bkvm/qemu-system-x86_64 -serial mon:stdio  -accel kvm,xen-version=0x4000a,kernel-irqchip=split -cpu host -display none -kernel$XTFDIR/tests/set_timer_op/test-hvm64-set_timer_op
>>>> --- Xen Test Framework ---
>>>> Environment: HVM 64bit (Long mode 4 levels)
>>>> Test hypercall set_timer_op
>>>> Test result: SUCCESS
>>>> ******************************
>>>> PANIC: xtf_exit(): hypercall_shutdown(SHUTDOWN_poweroff) returned
>>>> ******************************
>>>> QEMU: Terminated
>>>> $ ./bkvm/qemu-system-x86_64 -serial mon:stdio  -accel kvm,xen-version=0x4000a,kernel-irqchip=split -cpu host -display none -kernel $XTFDIR/tests/set_timer_op/test-hvm32-set_timer_op
>>>> --- Xen Test Framework ---
>>>> Environment: HVM 32bit (No paging)
>>>> Test hypercall set_timer_op
>>>> Test result: SUCCESS
>>>> ******************************
>>>> PANIC: xtf_exit(): hypercall_shutdown(SHUTDOWN_poweroff) returned
>>>> ******************************
>>>> QEMU: Terminated
>>>>
>>>>
>>>> (Dunno why it whines about poweroff; it isn't even calling the
>>>> hypercall. And the test to explicitly test that hypercall does work.)
>>>>
>>>>
>>>> --- a/target/i386/kvm/xen-emu.c
>>>> +++ b/target/i386/kvm/xen-emu.c
>>>> @@ -1118,14 +1118,18 @@ static int vcpuop_stop_singleshot_timer(CPUState *cs)
>>>>        return 0;
>>>>    }
>>>> -static int kvm_xen_hcall_set_timer_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>>>> -                                      uint64_t timeout)
>>>> +static bool kvm_xen_hcall_set_timer_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>>>> +                                       uint64_t timeout)
>>>>    {
>>>> +    int err;
>>>> +
>>>>        if (unlikely(timeout == 0)) {
>>>> -        return vcpuop_stop_singleshot_timer(CPU(cpu));
>>>> +        err = vcpuop_stop_singleshot_timer(CPU(cpu));
>>>>        } else {
>>>> -        return do_set_singleshot_timer(CPU(cpu), timeout, false, true);
>>>> +        err = do_set_singleshot_timer(CPU(cpu), timeout, false, true);
>>>>        }
>>>> +    exit->u.hcall.result = err;
>>>> +    return true;
>>>>    }
>>>>    static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>>>>
>>>
>>> That looks better :-)
>>>
>>
>> NB I think you still need to fix kvm_xen_hcall_vcpu_op() to not return the -ENOENT too.
> 
> 
>   Didn't I already do that?

Ah, so you did. So many versions... but with the above change 
incorporated...

Reviewed-by: Paul Durrant <paul@xen.org>



