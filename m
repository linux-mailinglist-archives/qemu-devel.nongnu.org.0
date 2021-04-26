Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B239936B241
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 13:17:26 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lazEz-0005YG-BC
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 07:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lazCb-0004iY-Ps
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 07:14:58 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lazCY-0003yI-5q
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 07:14:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a4so55460155wrr.2
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 04:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G6ghuMtLgr8diLeSVXcFEZtJzpmUpVCS203hhJc161s=;
 b=PxmhycqZaLguLulIpxmOMAClFQ/DQbCB7A4BkSa5ZZwjuEzZyKV0H1Nau1sYLQhNWI
 8NUNVYb+BWS1gQcnCJ5M2vmTBSECVhTUYUt8MUGA7L1ERU+2BebjP8u6JbjUzozcJE/A
 qMPiAcC6momQQ5n1IC+y9WzJJqQO07JnxiGk2tHSjdStuwQxPATj5wGI5/VxSTljMtOT
 29pubLf526QtWtwYBjsClZAkiDnGe7NIG0npTEcItGOMue9u2zEBn3C0BpvqFDfD0YRb
 0v96KTVe6oJOMLjxbLAKCuypg4guz6hMoXmwzUEUZDsmwOAPj1VYXsNCNmqGEnkSu/7B
 2xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G6ghuMtLgr8diLeSVXcFEZtJzpmUpVCS203hhJc161s=;
 b=jWMPYaa5xgwwLgLTGLxErCYNvdYFmHI1Gftxoh9vsFWqRZ4q+g2uAwqeDFdkQMZDXX
 upbWE9ZB3EoPhPucyMxVSNn2weThv2S3Al/39wqw/cKQ7oCUVxSII+yUDC9TphekJEV/
 E5rPqspwZCtCVAnQUnvhZnRMSLpDHDRnVHy/umpsgcK/TccCNWQvsnw83PMIBt+ls6P5
 a8XjyB+CHyg1NewkuYZmomyZ+1t3NGitBjFWZ1RoXIKg/oKZQNBIkP/QvbFbAkGPspyI
 9UACrSIoHNdUfdCH9AQXAdciDwubBVt+ypxf+un4XmD1dj0D2kaBVsTiKqan4rHHDCOQ
 dzvw==
X-Gm-Message-State: AOAM530nzoQ8LfgZi2VfXu6tQNXBlK+u5CIPol+1SABsY2XUFjkmdQfI
 K2fVmlGFbAC9u2xWrXcXWJU=
X-Google-Smtp-Source: ABdhPJw021R//xESd7LRsS+l3oTsEMKGAgBDBvVzoBPw7s9ncNtqS16ckT6PoI0SpJ0bGJUYRClECw==
X-Received: by 2002:a5d:4fc9:: with SMTP id h9mr22064546wrw.172.1619435691320; 
 Mon, 26 Apr 2021 04:14:51 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y15sm21297236wrh.8.2021.04.26.04.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 04:14:50 -0700 (PDT)
Subject: Re: Resetting non-qdev children in a 3-phase reset device
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 <87y2datpyw.fsf@dusky.pond.sub.org>
 <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
 <2f4155ca-ee84-75f0-8b35-aac6b18ee4f0@amsat.org>
 <3dcb8efa-8f6b-0f45-a753-cc58d3bf9855@amsat.org>
 <87im4cb6ag.fsf@dusky.pond.sub.org>
 <b7f6752b-6f4c-a3d2-074c-0b41094d7dfa@amsat.org>
 <CAFEAcA__LbLXA3b8U_-wHrxcET7OwCTOoL_8kYAYsd3LTKEOZQ@mail.gmail.com>
 <b3f8daaf-521d-edbe-c2f3-4af9cd74e46e@amsat.org>
 <CAFEAcA_8TR6B0Ffz3aqxX4_2LJCsxfcR7D7zB0TYHONWG-57zw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f6a10e9e-1183-f747-e339-59e7128697d7@amsat.org>
Date: Mon, 26 Apr 2021 13:14:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_8TR6B0Ffz3aqxX4_2LJCsxfcR7D7zB0TYHONWG-57zw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/21 11:33 AM, Peter Maydell wrote:
> On Mon, 26 Apr 2021 at 10:23, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 4/25/21 8:33 PM, Peter Maydell wrote:
>>> On Sat, 24 Apr 2021 at 14:04, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>> I now understand better the diag288 case, but I still don't understand
>>>> the TYPE_APIC one. It has no DeviceClass::reset(), its abstract parent
>>>> TYPE_APIC_COMMON register apic_reset_common() but being TYPE_DEVICE it
>>>> is not on a qbus. It is somehow connected to the X86CPU object, but the
>>>> single call to apic_init_reset() is from do_cpu_init() - not a reset
>>>> method -.
>>>
>>> pc_machine_reset() calls device_legacy_reset(cpu->apic_state)
>>> which is to say it invokes the DeviceState::reset method,
>>> which is either kvm_apic_reset or apic_reset_common.
>>
>> Oh, thanks! I guess "convoluted" is the proper adjective to describe
>> this reset logic. I suppose APIC is a very old device, part of the
>> Frankenstein PC, so hard to rework (because we are scared of the
>> implications of changing old & heavily used devices).
> 
> This is mostly just another instance of "our reset logic doesn't
> deal well with devices which aren't on buses". The APIC isn't on a bus,
> so the machine that uses it has a local workaround to manually arrange
> for it to reset, just as it does for the CPU.

But the APIC is created within the CPU realize():

static void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
{
    APICCommonState *apic;
    ObjectClass *apic_class = OBJECT_CLASS(apic_get_class());

    cpu->apic_state = DEVICE(object_new_with_class(apic_class));
    ...

... so I'd expect the CPU (TYPE_X86_CPU) to reset the APIC in its
reset(), not the machine (regardless how the CPU itself is reset).

*But* there is an undocumented MachineClass::wakeup() handler which
complicates the picture:

static void pc_machine_reset(MachineState *machine)
{
    CPUState *cs;
    X86CPU *cpu;

    qemu_devices_reset();

    /* Reset APIC after devices have been reset to cancel
     * any changes that qemu_devices_reset() might have done.
     */
    CPU_FOREACH(cs) {
        cpu = X86_CPU(cs);

        if (cpu->apic_state) {
            device_legacy_reset(cpu->apic_state);
        }
    }
}

static void pc_machine_wakeup(MachineState *machine)
{
    cpu_synchronize_all_states();
    pc_machine_reset(machine);
    cpu_synchronize_all_post_reset();
}

It is called once:

/*
 * Wake the VM after suspend.
 */
static void qemu_system_wakeup(void)
{
    MachineClass *mc;

    mc = current_machine ? MACHINE_GET_CLASS(current_machine) : NULL;

    if (mc && mc->wakeup) {
        mc->wakeup(current_machine);
    }
}

and TYPE_PC_MACHINE is the single object implementing it.

This wakeup is handled in main_loop_should_exit() after the
qemu_reset_requested() check, and pc_machine_wakeup calls
cpu_synchronize_all_post_reset().

Could a 3-phase CPU reset simplify all this?

I agree it is 'mostly just another instance of "our reset logic
doesn't deal well with devices which aren't on buses"', but a
very convoluted one IMHO.

Regards,

Phil.

