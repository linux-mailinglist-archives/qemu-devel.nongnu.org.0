Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917CA69F594
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 14:33:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUpEh-0006MZ-BJ; Wed, 22 Feb 2023 08:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pUpEb-0006If-1w
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:32:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pUpEZ-0004Wt-4j
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:32:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id k37so2715604wms.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 05:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RqB06Lwh0vJ56FAbFH2B7CgFlxs2+KZKy2fhyk0e0Qw=;
 b=WG+5d048EsoUoUYN+F9WDvkBh9Y1SgU1qrttozUt4TgZPydenet6y6Lry3mq2vmGv8
 lh12CET0qNE0MdSKpHx1NwE2b8Rs3jxQ5NfmPK/KrLEfzw1f32bFF9BjSLvCcmHRO23O
 /Wz6QIQ8IMrFaOEQZST4tGlzTI3lMzggU7ipfBf3q2hukYmlr9c8j3WtKU0PdSQbeJEj
 Wx9KkP+xhjoAhOeOXCAcozAdLR5qcKnEhlkDCmGrH0IEMTb6JmqH/50B5WbZjI7TKs9g
 tTLxt8ZXLbYYaGbIDVYtAcFKUPDxanyVmJLUq+GgzjncX82G+dm9VMxu3BUlBBSgq7KF
 GfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqB06Lwh0vJ56FAbFH2B7CgFlxs2+KZKy2fhyk0e0Qw=;
 b=sRFe07WnGZiC/fminTlRZGloFYtnquaBS03YZmZSuoX/XJzbNJup6c3OpjK7EEx5qj
 jgOtVU+76gzeXjzYrsZ4gZrYpbxCxn8xBhTQvIrl462h3M5oyFnC4j3yYqkr3rL563bA
 oCTm3jt+U5zgPLoUckOVHeyBGp8OXpx89yBJLIYyiWilFb7f38SGMkjvenFTEIa073rm
 foEGXYx45oJFz2R/g6xKtqj/DVKpRWNylMmRUroPlBVk+1bWXMaAXP1hdT0WBk+34jXd
 wUvk8raU1PuKvkNs9L0jC9YURBsz7jtVO1MwGd8ouza11dSZUPacynwF2wwyr+sean0H
 AQ7Q==
X-Gm-Message-State: AO0yUKWozt02eiNGhw1OXCYm9RKLkGbF/F5ekccFtMgXxKTiD2CT9KmP
 b13z85E1S3n56h9ELRIyo5s=
X-Google-Smtp-Source: AK7set8qtvemmLA7xtU6SIK5Jt1N3rxNRxCzJ+aWlWhGt5yfo0N+2IMuKgtm+Ioorn+iY9hqqvBfVA==
X-Received: by 2002:a05:600c:319a:b0:3df:e659:f9d9 with SMTP id
 s26-20020a05600c319a00b003dfe659f9d9mr5483879wmp.34.1677072753395; 
 Wed, 22 Feb 2023 05:32:33 -0800 (PST)
Received: from [10.95.97.18] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b003e21638c0edsm7957910wmn.45.2023.02.22.05.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 05:32:33 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <aa6273d7-5abe-f134-5339-c5cf81f14c44@xen.org>
Date: Wed, 22 Feb 2023 13:32:31 +0000
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
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
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



