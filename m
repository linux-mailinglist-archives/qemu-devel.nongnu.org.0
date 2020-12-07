Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0EE2D1888
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:30:46 +0100 (CET)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmLHY-0002j1-9N
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmL5g-0004Jw-J5
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:18:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:60820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmL5d-0006o6-SV
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:18:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 841DEAD6A;
 Mon,  7 Dec 2020 18:18:24 +0000 (UTC)
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <08bd6211-1ac8-593c-0d95-a8b26a1b3745@suse.de>
Date: Mon, 7 Dec 2020 19:18:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 7:07 PM, Peter Maydell wrote:
> On Mon, 7 Dec 2020 at 17:49, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> arm_v7m_class_init() (used by cortex-* CPU models) overrides it.
>> Those CPU models as "TCG CPUs" in the code, but I don't see what
>> makes them TCG-specific.
> 
> They're TCG specific because the Arm Virtualization Extension
> is for A-profile only and only supports virtualization of
> A-profile CPUs. You can't accelerate an M-profile CPU with it.
> (Similarly, you can't use the Virtualization Extension to
> accelerate a pre-v7 CPU, which is why CPUs like the arm1176
> are also TCG-only, and you can't use it to accelerate a CPU
> which has TrustZone enabled.)
> 
> (M-profile CPUs override cc->do_interrupt() because their
> exception and interrupt handling logic is totally different
> to A-profile.)
> 
>> What exactly is the expected behavior
>> if using, e.g., "-cpu cortex-m33 -accel kvm"?
> 
> It ought to print a useful error message telling you
> that that CPU type isn't compatible with KVM.
> 
> As it happens, you get an assertion failure for cortex-m33:
> 
> $ ./build/all/qemu-system-aarch64 -accel kvm -M mps2-an505 -display none
> qemu-system-aarch64: ../../softmmu/physmem.c:745:
> cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()'
> failed.
> Aborted
> 
> because the M33 has TrustZone enabled (which is not compatible
> with KVM) and we don't check that before we hit the assertion.
> We should fix that :-)
> 
> If you try it with a non-TrustZone M-profile core like the M3 then
> you do get a better error message:
> 
> $ ./build/all/qemu-system-aarch64 -accel kvm -M mps2-an385 -display none
> qemu-system-aarch64: KVM is not supported for this guest CPU type
> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0):
> Invalid argument
> 
> If you try this with the "virt" board then you'll run into the
> virt board's own sanity checking of CPU types instead:
> 
> $ ./build/all/qemu-system-aarch64 -accel kvm -M virt -cpu cortex-m33
> -display none
> qemu-system-aarch64: mach-virt: CPU type cortex-m33-arm-cpu not supported
> 
> All of that said, I think I agree with you -- we have this
> indirect mechanism for invoking class methods on the CPU
> object, why is it necessary for this KVM-specific code to
> call the implementation function directly?
> 
> thanks
> -- PMM
> 

Hi Peter,

the initial attempt there was to mark do_interrupt as a TCG-only operation,
to move to a separate tcg_ops structure in CPUClass like for the others,

but countrary to the other ops I noticed that ARM is the only target that is calling cc->do_interrupt() for KVM too.

I might have to either leave do_interrupt() out of the refactoring, or find a way to avoid accessing cc->do_interrupt on KVM.

Thanks,

Claudio

