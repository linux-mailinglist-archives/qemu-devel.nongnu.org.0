Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D39030F5A9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:01:02 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7g7x-0000M9-As
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7g4x-0006qn-9h
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:57:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:39590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7g4v-0008SU-Au
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:57:55 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5283AD4E;
 Thu,  4 Feb 2021 14:57:51 +0000 (UTC)
Subject: Re: [PATCH v15 21/23] hw/core/cpu: call qemu_init_vcpu in
 cpu_common_realizefn
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-22-cfontana@suse.de> <871rdxrt08.fsf@linaro.org>
 <7500a412-c94a-6990-eb48-9ee78bfb94e3@suse.de>
 <05980f44-88a6-6ef7-b263-07c2d898b8f0@redhat.com>
 <483bc092-cf71-d2c2-59d7-861f3131c8e4@suse.de>
 <CAFEAcA_ArFBhfasRHQ3VbmKisnP7i2rm48vmji9RB5ub+dzStA@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5dd69da8-44cd-83c9-4494-03ab41a2e626@suse.de>
Date: Thu, 4 Feb 2021 15:57:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ArFBhfasRHQ3VbmKisnP7i2rm48vmji9RB5ub+dzStA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 3:24 PM, Peter Maydell wrote:
> On Thu, 4 Feb 2021 at 14:18, Claudio Fontana <cfontana@suse.de> wrote:
>> If we could consistently move not only qemu_vcpu_init, but also reset in the common code in cpu_common_realizefn,
>> and force the sequence: qemu_vcpu_init(); cpu_reset(); in there,
>>
>> and this actually works for all targets, maybe this could actually be an improvement.
> 
> So my question here would be: what is special about CPUs that
> we have to reset them in their realize function?  For other
> devices, we don't reset them in the init/realize sequence;
> we rely on the whole system getting reset and that doing
> reset of devices.
> 
> There almost certainly *is* a reason here (my guess would be
> that it's related to the mess that is reset and in particular
> that CPU objects don't get automatically reset on system reset
> because they're not on a qbus). But if we're thinking about
> aspirational goals, I think the aspiration should be to not
> need to reset the CPU in its own realize function at all...
> 
> thanks
> -- PMM
> 

Ok, but if we want to be really aspirational, the whole realizefn mechanism for cpu should be revisited.

The current calling sequence is nonsensical,
and probably leads to the kind of issues we see, as the target realizefn is the only real thing that controls the sequence of events really.

The object and device hierarchy and initialization order is completely ignored, and there is no structure provided by the framework as seen by the target implementer to incentive the right behavior when implementing a target.

Even the cpu_list_add is actually controlled via target realizefn, via cpu_exec_realizefn(). With other components that came to depend on this for cpu_index update.

In my view most of the code we currently see in target/xxx/cpu.c cpu_realize_fn should not be there at all,
and should be in the framework instead, with only the creation of resources specific to that target cpu needed to be there in realizefn ultimately.

Currently we have this situation:

static void xxx_cpu_realizefn(DeviceState *dev, Error **errp)
{
    Error local_err = NULL;
    CPUState *cs = CPU(dev);

    /* mix of target-specific resource creation here */

    /* mix of accelerator specific resource creation here */

    cpu_exec_realizefn(cs, &local_err); /* this updates the "cpus" list in cpus-common.c, and registers vmstate for the cpu */

    if (local_err != NULL) {
        error_propagate(errp, local_err);
        return;
    }

    /* mix of target-specific resource creation here */

    qemu_init_vcpu(cs); /* somewhere in the sequence somewhere after cpu_exec_realizefn

    /* mix of target-specific resource creation here */

    cpu_reset(cs); /* sometimes present, somewhere in the sequence after cpu_exec_realizefn, sometimes before init_vcpu, sometimes after.
    

    tcc->parent_realize(dev, errp); /* here we call the parent cpu_common_realizefn, which in case of hotplug does cpu_synchronize_post_init and cpu_resume.

    /* mix of target-specific resource creation here */
}


Can we do some of this boilerplate in the framework?

All of this is repeated every single time:

cpu_exec_realizefn()
qemu_init_vpcu()
cpu_reset() /* sometimes */
parent_realize()

with slight order variation between targets and apparently with bug potential.

Could we consolidate some or all of this?

Ciao, thanks,

Claudio




