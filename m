Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1065E5D5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 08:15:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDKRr-0002VX-VR; Thu, 05 Jan 2023 02:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pDKRp-0002Tz-Dr
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 02:13:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pDKRm-0000YJ-Dx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 02:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672902832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/0EIvw08X0afVi2xOYk3Ng6wDfbkqkHTtBK1BAAr0s=;
 b=Wu+w69UqaBSEtL/QUCOivWrDf9JFbmC5FazoHyP8LRZDqlzCTaLSZlHzKN/qls62409FJb
 fqjBI1q+FLYfMsdRqTkA8Iw/oUze8EX8/c73cPkctWiOc7evV9+yXaMsqLq27cJPIbGh1Q
 CMXoSCuJUmuPIG5IfvU012sWKF6tBJQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-yezz9iw1OwGK-xq98Xw5HQ-1; Thu, 05 Jan 2023 02:13:48 -0500
X-MC-Unique: yezz9iw1OwGK-xq98Xw5HQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A60F8039AC;
 Thu,  5 Jan 2023 07:13:48 +0000 (UTC)
Received: from [10.39.192.44] (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72552492C1B;
 Thu,  5 Jan 2023 07:13:40 +0000 (UTC)
Message-ID: <7122894b-ccbf-9d30-ee54-c23c25c0f82b@redhat.com>
Date: Thu, 5 Jan 2023 08:13:39 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to the
 legacy reg block
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu devel list <qemu-devel@nongnu.org>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230104090138.214862-1-lersek@redhat.com>
 <20230104072457-mutt-send-email-mst@kernel.org>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230104072457-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/4/23 13:35, Michael S. Tsirkin wrote:
> On Wed, Jan 04, 2023 at 10:01:38AM +0100, Laszlo Ersek wrote:
>> The modern ACPI CPU hotplug interface was introduced in the following
>> series (aa1dd39ca307..679dd1a957df), released in v2.7.0:
>>
>>   1  abd49bc2ed2f docs: update ACPI CPU hotplug spec with new protocol
>>   2  16bcab97eb9f pc: piix4/ich9: add 'cpu-hotplug-legacy' property
>>   3  5e1b5d93887b acpi: cpuhp: add CPU devices AML with _STA method
>>   4  ac35f13ba8f8 pc: acpi: introduce AcpiDeviceIfClass.madt_cpu hook
>>   5  d2238cb6781d acpi: cpuhp: implement hot-add parts of CPU hotplug
>>                   interface
>>   6  8872c25a26cc acpi: cpuhp: implement hot-remove parts of CPU hotplug
>>                   interface
>>   7  76623d00ae57 acpi: cpuhp: add cpu._OST handling
>>   8  679dd1a957df pc: use new CPU hotplug interface since 2.7 machine type
>>
>> Before patch#1, "docs/specs/acpi_cpu_hotplug.txt" only specified 1-byte
>> accesses for the hotplug register block.  Patch#1 preserved the same
>> restriction for the legacy register block, but:
>>
>> - it specified DWORD accesses for some of the modern registers,
>>
>> - in particular, the switch from the legacy block to the modern block
>>   would require a DWORD write to the *legacy* block.
>>
>> The latter functionality was then implemented in cpu_status_write()
>> [hw/acpi/cpu_hotplug.c], in patch#8.
>>
>> Unfortunately, all DWORD accesses depended on a dormant bug: the one
>> introced
>
> introduced

Huh, thanks. :)

... Because I'm proposing this for stable as well, I figure if I post a
v2 just with this small update, too.

(and I'm just noticing that Phil pointed out the same typo earlier --
sorry Phil, I scrolled through that, my apologies, and thanks for
catching it on your end as well!)

>
>> in earlier commit a014ed07bd5a ("memory: accept mismatching sizes
>> in memory_region_access_valid", 2013-05-29); first released in v1.6.0.
>> Due to commit a014ed07bd5a, the DWORD accesses to the *legacy* CPU hotplug
>> register block would work in spite of the above series *not* relaxing
>> "valid.max_access_size = 1" in "hw/acpi/cpu_hotplug.c":
>>
>>> static const MemoryRegionOps AcpiCpuHotplug_ops = {
>>>     .read = cpu_status_read,
>>>     .write = cpu_status_write,
>>>     .endianness = DEVICE_LITTLE_ENDIAN,
>>>     .valid = {
>>>         .min_access_size = 1,
>>>         .max_access_size = 1,
>>>     },
>>> };
>>
>> Later, in commits e6d0c3ce6895 ("acpi: cpuhp: introduce 'Command data 2'
>> field", 2020-01-22) and ae340aa3d256 ("acpi: cpuhp: spec: add typical
>> usecases", 2020-01-22), first released in v5.0.0, the modern CPU hotplug
>> interface (including the documentation) was extended with another DWORD
>> *read* access, namely to the "Command data 2" register, which would be
>> important for the guest to confirm whether it managed to switch the
>> register block from legacy to modern.
>>
>> This functionality too silently depended on the bug from commit
>> a014ed07bd5a.
>>
>> In commit 5d971f9e6725 ('memory: Revert "memory: accept mismatching sizes
>> in memory_region_access_valid"', 2020-06-26), first released in v5.1.0,
>> the bug from commit a014ed07bd5a was fixed (the commit was reverted).
>> That swiftly exposed the bug in "AcpiCpuHotplug_ops", still present from
>> the v2.7.0 series quoted at the top -- namely the fact that
>> "valid.max_access_size = 1" didn't match what the guest was supposed to
>> do, according to the spec ("docs/specs/acpi_cpu_hotplug.txt").
>>
>> The symptom is that the "modern interface negotiation protocol"
>> described in commit ae340aa3d256:
>>
>>> +      Use following steps to detect and enable modern CPU hotplug interface:
>>> +        1. Store 0x0 to the 'CPU selector' register,
>>> +           attempting to switch to modern mode
>>> +        2. Store 0x0 to the 'CPU selector' register,
>>> +           to ensure valid selector value
>>> +        3. Store 0x0 to the 'Command field' register,
>>> +        4. Read the 'Command data 2' register.
>>> +           If read value is 0x0, the modern interface is enabled.
>>> +           Otherwise legacy or no CPU hotplug interface available
>>
>> falls apart for the guest: steps 1 and 2 are lost, because they are DWORD
>> writes; so no switching happens.  Step 3 (a single-byte write) is not
>> lost, but it has no effect; see the condition in cpu_status_write() in
>> patch#8.  And step 4 *misleads* the guest into thinking that the switch
>> worked: the DWORD read is lost again -- it returns zero to the guest
>> without ever reaching the device model, so the guest never learns the
>> switch didn't work.
>>
>> This means that guest behavior centered on the "Command data 2" register
>> worked *only* in the v5.0.0 release; it got effectively regressed in
>> v5.1.0.
>>
>> To make things *even more* complicated, the breakage was (and remains, as
>> of today) visible with TCG acceleration only.  Commit 5d971f9e6725 makes
>> no difference with KVM acceleration -- the DWORD accesses still work,
>> despite "valid.max_access_size = 1".
>
> BTW do you happen to know why that's the case for KVM? Because if kvm
> ignores valid.max_access_size generally then commit 5d971f9e6725 is
> incomplete, and we probably have some related kvm-only bugs.

It remains a mystery for me why KVM accel does not enforce
"valid.max_access_size".

In the thread I started earlier (which led to this patch), at

  "IO port write width clamping differs between TCG and KVM"
  https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html

I included a backtrace of the call stack, taken when KVM *let through*
the DWORD access (and it got split into 4 single-byte accesses). I don't
want to quote the entire stack trace, but I'll quote my (rudimentary)
understanding of it:

On 1/3/23 18:42, Laszlo Ersek wrote:
> Now, if I look at the above-quoted backtrace, I see that, from frame#5
> to frame#4, a kind of "streaming" happens (with KVM only). Because,
> len=4 is there, but "l=1" appears upon entry to
> flatview_write_continue():
>
>   flatview_write()                         [softmmu/physmem.c]
>     flatview_translate()                   [softmmu/physmem.c]
>       flatview_do_translate()              [softmmu/physmem.c]
>         address_space_translate_internal() [softmmu/physmem.c]
>     flatview_write_continue()              [softmmu/physmem.c]
>
> And then I vaguely feel that this is somehow related to the following
> big comment in address_space_translate_internal() [softmmu/physmem.c]:
>
>>     /* MMIO registers can be expected to perform full-width accesses based only
>>      * on their address, without considering adjacent registers that could
>>      * decode to completely different MemoryRegions.  When such registers
>>      * exist (e.g. I/O ports 0xcf8 and 0xcf9 on most PC chipsets), MMIO
>>      * regions overlap wildly.  For this reason we cannot clamp the accesses
>>      * here.
>>      *
>>      * If the length is small (as is the case for address_space_ldl/stl),
>>      * everything works fine.  If the incoming length is large, however,
>>      * the caller really has to do the clamping through memory_access_size.
>>      */
>
> What I don't understand is the *difference* in behavior between KVM
> and TCG. The above reasoning either applies to both KVM and TCG, or it
> applies to neither, right?

I can try one more thing. I'll set another breakpoint on
cpu_status_write(), and get a backtrace when it is hit on *TCG* (now
with this patch applied). Then compare the backtrace with that taken
from the KVM run (which had no fix applied). There could be a
difference.

... Oh yeah, it's a *completely* different stack trace. OK, I've changed
my mind about not including the KVM stack trace here -- I need to do
that now, for comparison.

So, this is the KVM stack trace again, with the DWORD access succeeding,
*without* this patch applied to QEMU:

> #0  cpu_status_write (opaque=0x5555572b9880, addr=0, data=0, size=1) at ../../src/upstream/qemu/hw/acpi/cpu_hotplug.c:42
> #1  0x0000555555d3d34f in memory_region_write_accessor (mr=0x5555572b9890, addr=0, value=0x7fffe6412fe8, size=1, shift=0, mask=255, attrs=...) at ../../src/upstream/qemu/softmmu/memory.c:493
>         tmp = 0
> #2  0x0000555555d3d595 in access_with_adjusted_size (addr=0, value=0x7fffe6412fe8, size=1, access_size_min=1, access_size_max=4, access_fn=0x555555d3d259 <memory_region_write_accessor>, mr=0x5555572b9890, attrs=...)
>     at ../../src/upstream/qemu/softmmu/memory.c:555
>         access_mask = 255
>         access_size = 1
>         i = 0
>         r = 0
> #3  0x0000555555d406d8 in memory_region_dispatch_write (mr=0x5555572b9890, addr=0, data=0, op=MO_8, attrs=...) at ../../src/upstream/qemu/softmmu/memory.c:1515
>         size = 1
> #4  0x0000555555d4e320 in flatview_write_continue (fv=0x7fffdc0141e0, addr=3288, attrs=..., ptr=0x7ffff7fbd000, len=4, addr1=0, l=1, mr=0x5555572b9890) at ../../src/upstream/qemu/softmmu/physmem.c:2825
>         ram_ptr = 0x4 <error: Cannot access memory at address 0x4>
>         val = 0
>         result = 0
>         release_lock = true
>         buf = 0x7ffff7fbd000 ""
> #5  0x0000555555d4e483 in flatview_write (fv=0x7fffdc0141e0, addr=3288, attrs=..., buf=0x7ffff7fbd000, len=4) at ../../src/upstream/qemu/softmmu/physmem.c:2867
>         l = 4
>         addr1 = 0
>         mr = 0x5555572b9890
> #6  0x0000555555d4e833 in address_space_write (as=0x55555690d000 <address_space_io>, addr=3288, attrs=..., buf=0x7ffff7fbd000, len=4) at ../../src/upstream/qemu/softmmu/physmem.c:2963
>         _rcu_read_auto = 0x1
>         result = 0
>         fv = 0x7fffdc0141e0
> #7  0x0000555555d4e8a0 in address_space_rw (as=0x55555690d000 <address_space_io>, addr=3288, attrs=..., buf=0x7ffff7fbd000, len=4, is_write=true) at ../../src/upstream/qemu/softmmu/physmem.c:2973
> #8  0x0000555555de1c6e in kvm_handle_io (port=3288, attrs=..., data=0x7ffff7fbd000, direction=1, size=4, count=1) at ../../src/upstream/qemu/accel/kvm/kvm-all.c:2639
>         i = 0
>         ptr = 0x7ffff7fbd000 ""
> #9  0x0000555555de240e in kvm_cpu_exec (cpu=0x555556d42db0) at ../../src/upstream/qemu/accel/kvm/kvm-all.c:2890
>         attrs = {unspecified = 0, secure = 0, user = 0, memory = 0, requester_id = 0, byte_swap = 0, target_tlb_bit0 = 0, target_tlb_bit1 = 0, target_tlb_bit2 = 0}
>         run = 0x7ffff7fbc000
>         ret = 0
>         run_ret = 0
> #10 0x0000555555de51a2 in kvm_vcpu_thread_fn (arg=0x555556d42db0) at ../../src/upstream/qemu/accel/kvm/kvm-accel-ops.c:51
>         cpu = 0x555556d42db0
>         r = 65536
> #11 0x0000555555feb23a in qemu_thread_start (args=0x555556d46240) at ../../src/upstream/qemu/util/qemu-thread-posix.c:505
>         __cancel_buf =
>             {__cancel_jmp_buf = {{__cancel_jmp_buf = {140737056437824, -6609603676087882481, 140737056437824, 7, 140737304061232, 0, -6609603676064813809, -1076185459444912881}, __mask_was_saved = 0}}, __pad = {0x7fffe6413330, 0x0, 0x0, 0x0}}
>         __cancel_routine = 0x555555feb0e9 <qemu_thread_atexit_notify>
>         __cancel_arg = 0x0
>         __not_first_call = 0
>         qemu_thread_args = 0x555556d46240
>         start_routine = 0x555555de50d6 <kvm_vcpu_thread_fn>
>         arg = 0x555556d42db0
>         r = 0x0
> #12 0x00007ffff503e802 in start_thread () at /lib64/libc.so.6
> #13 0x00007ffff4fde450 in clone3 () at /lib64/libc.so.6


And the following is the TCG stack trace, with the patch *applied*:


> #0  cpu_status_write (opaque=0x55555733cd10, addr=0, data=0, size=1) at ../../src/upstream/qemu/hw/acpi/cpu_hotplug.c:42
> #1  0x0000555555d3fc48 in memory_region_write_accessor (mr=0x55555733cd20, addr=0, value=0x7fffe65d1ac8, size=1, shift=0, mask=255, attrs=...) at ../../src/upstream/qemu/softmmu/memory.c:493
>         tmp = 0
> #2  0x0000555555d3fe8e in access_with_adjusted_size (addr=0, value=0x7fffe65d1ac8, size=4, access_size_min=1, access_size_max=1, access_fn=0x555555d3fb52 <memory_region_write_accessor>, mr=0x55555733cd20, attrs=...)
>     at ../../src/upstream/qemu/softmmu/memory.c:555
>         access_mask = 255
>         access_size = 1
>         i = 0
>         r = 0
> #3  0x0000555555d42fd1 in memory_region_dispatch_write (mr=0x55555733cd20, addr=0, data=0, op=MO_32, attrs=...) at ../../src/upstream/qemu/softmmu/memory.c:1515
>         size = 4
> #4  0x0000555555d527a9 in address_space_stl_internal (as=0x555556912900 <address_space_io>, addr=3288, val=0, attrs=..., result=0x0, endian=DEVICE_NATIVE_ENDIAN) at /home/lacos/src/upstream/qemu/memory_ldst.c.inc:319
>         ptr = 0x555556d67920 "@\210\v\230\377\177"
>         mr = 0x55555733cd20
>         l = 4
>         addr1 = 0
>         r = 8606785
>         release_lock = true
> #5  0x0000555555d528a0 in address_space_stl (as=0x555556912900 <address_space_io>, addr=3288, val=0, attrs=..., result=0x0) at /home/lacos/src/upstream/qemu/memory_ldst.c.inc:350
> #6  0x0000555555bc69a4 in helper_outl (env=0x555556d5d410, port=3288, data=0) at ../../src/upstream/qemu/target/i386/tcg/sysemu/misc_helper.c:55
> #7  0x00007fff5812602e in code_gen_buffer ()
> #8  0x0000555555dbed82 in cpu_tb_exec (cpu=0x555556d5c6a0, itb=0x7fff9813d740, tb_exit=0x7fffe65d2158) at ../../src/upstream/qemu/accel/tcg/cpu-exec.c:438
>         env = 0x555556d5d410
>         ret = 93825001053227
>         last_tb = 0x83a067
>         tb_ptr = 0x7fff5813d800 <code_gen_buffer+1300435>
>         __PRETTY_FUNCTION__ = "cpu_tb_exec"
> #9  0x0000555555dbfa2a in cpu_loop_exec_tb (cpu=0x555556d5c6a0, tb=0x7fff9813d740, pc=8626279, last_tb=0x7fffe65d2170, tb_exit=0x7fffe65d2158) at ../../src/upstream/qemu/accel/tcg/cpu-exec.c:868
>         insns_left = 0
>         __PRETTY_FUNCTION__ = "cpu_loop_exec_tb"
> #10 0x0000555555dbfe10 in cpu_exec (cpu=0x555556d5c6a0) at ../../src/upstream/qemu/accel/tcg/cpu-exec.c:1032
>         tb = 0x7fff9813d740
>         flags = 4194992
>         cflags = 4278714368
>         cs_base = 0
>         pc = 8626279
>         last_tb = 0x7fff9813d640
>         tb_exit = 0
>         ret = 32767
>         sc = {diff_clk = 0, last_cpu_icount = 0, realtime_clock = 0}
>         __func__ = "cpu_exec"
> #11 0x0000555555deb245 in tcg_cpus_exec (cpu=0x555556d5c6a0) at ../../src/upstream/qemu/accel/tcg/tcg-accel-ops.c:69
>         ret = 21845
>         __PRETTY_FUNCTION__ = "tcg_cpus_exec"
> #12 0x0000555555deb8fd in mttcg_cpu_thread_fn (arg=0x555556d5c6a0) at ../../src/upstream/qemu/accel/tcg/tcg-accel-ops-mttcg.c:95
>         r = 65536
>         force_rcu = {notifier = {notify = 0x555555deb766 <mttcg_force_rcu>, node = {le_next = 0x0, le_prev = 0x7fffe65d64a0}}, cpu = 0x555556d5c6a0}
>         cpu = 0x555556d5c6a0
>         __PRETTY_FUNCTION__ = "mttcg_cpu_thread_fn"
>         __func__ = "mttcg_cpu_thread_fn"
> #13 0x0000555555fee5a2 in qemu_thread_start (args=0x555556d899a0) at ../../src/upstream/qemu/util/qemu-thread-posix.c:505
>         __cancel_buf =
>             {__cancel_jmp_buf = {{__cancel_jmp_buf = {140737058268736, 8614073237258514976, 140737058268736, 0, 140737304061232, 0, 8614073237214474784, 2512501441319154208}, __mask_was_saved = 0}}, __pad = {0x7fffe65d2330, 0x0, 0x0, 0x0}}
>         __cancel_routine = 0x555555fee451 <qemu_thread_atexit_notify>
>         __cancel_arg = 0x0
>         __not_first_call = 0
>         qemu_thread_args = 0x555556d899a0
>         start_routine = 0x555555deb7a8 <mttcg_cpu_thread_fn>
>         arg = 0x555556d5c6a0
>         r = 0x0
> #14 0x00007ffff503e802 in start_thread () at /lib64/libc.so.6
> #15 0x00007ffff4fde450 in clone3 () at /lib64/libc.so.6

Almost entirely different. They only join at
memory_region_dispatch_write(), and you'll notice that, for
memory_region_dispatch_write(), the operation is different: in the
unpatched-QEMU-with-KVM case, it is MO_8, in the patched-QEMU-with-TCG
case, it is MO_32. So whatever does the verification and splitting for
KVM runs *earlier* (more outwards on the stack) than
memory_region_dispatch_write() -- in the somewhere in the parts that
differ between TCG and KVM.

So commit 5d971f9e6725 made a difference for helper_outl() /
address_space_stl() / address_space_stl_internal(), by modifying
(restricting) memory_region_access_valid(). The some modification does
not play a role, apparently, for the "flatview" stuff that is in use on
KVM!

Ah, found something else. Set a breakpoint like this, in the
patched-QEMU-with-TCG case:

(gdb) break memory_region_access_valid if mr->ops==&AcpiCpuHotplug_ops

The backtrace I got for that is this:

> #0  memory_region_access_valid (mr=0x55555733cd20, addr=0, size=4, is_write=true, attrs=...) at ../../src/upstream/qemu/softmmu/memory.c:1380
> #1  0x0000555555d42f11 in memory_region_dispatch_write (mr=0x55555733cd20, addr=0, data=0, op=MO_32, attrs=...) at ../../src/upstream/qemu/softmmu/memory.c:1502
> #2  0x0000555555d527a9 in address_space_stl_internal (as=0x555556912900 <address_space_io>, addr=3288, val=0, attrs=..., result=0x0, endian=DEVICE_NATIVE_ENDIAN) at /home/lacos/src/upstream/qemu/memory_ldst.c.inc:319
> #3  0x0000555555d528a0 in address_space_stl (as=0x555556912900 <address_space_io>, addr=3288, val=0, attrs=..., result=0x0) at /home/lacos/src/upstream/qemu/memory_ldst.c.inc:350
> #4  0x0000555555bc69a4 in helper_outl (env=0x555556d5d410, port=3288, data=0) at ../../src/upstream/qemu/target/i386/tcg/sysemu/misc_helper.c:55
> #5  0x00007fff5812602e in code_gen_buffer ()
> #6  0x0000555555dbed82 in cpu_tb_exec (cpu=0x555556d5c6a0, itb=0x7fff9813d740, tb_exit=0x7fffe65d2158) at ../../src/upstream/qemu/accel/tcg/cpu-exec.c:438
> #7  0x0000555555dbfa2a in cpu_loop_exec_tb (cpu=0x555556d5c6a0, tb=0x7fff9813d740, pc=8626279, last_tb=0x7fffe65d2170, tb_exit=0x7fffe65d2158) at ../../src/upstream/qemu/accel/tcg/cpu-exec.c:868
> #8  0x0000555555dbfe10 in cpu_exec (cpu=0x555556d5c6a0) at ../../src/upstream/qemu/accel/tcg/cpu-exec.c:1032
> #9  0x0000555555deb245 in tcg_cpus_exec (cpu=0x555556d5c6a0) at ../../src/upstream/qemu/accel/tcg/tcg-accel-ops.c:69
> #10 0x0000555555deb8fd in mttcg_cpu_thread_fn (arg=0x555556d5c6a0) at ../../src/upstream/qemu/accel/tcg/tcg-accel-ops-mttcg.c:95
> #11 0x0000555555fee5a2 in qemu_thread_start (args=0x555556d899a0) at ../../src/upstream/qemu/util/qemu-thread-posix.c:505
> #12 0x00007ffff503e802 in start_thread () at /lib64/libc.so.6
> #13 0x00007ffff4fde450 in clone3 () at /lib64/libc.so.6

This explains why commit 5d971f9e6725 makes no difference for KVM.

Namely, in case of TCG, memory_region_dispatch_write() is entered with
op=MO_32, and *then* memory_region_access_valid() verifies that, with
size=4. Commit 5d971f9e6725 restricts memory_region_access_valid(), so
-- without the present patch -- it returns "false", and then
memory_region_dispatch_write() fails too, returning MEMTX_DECODE_ERROR.

But in case of KVM, memory_region_dispatch_write() is *already* entered
with op=MO_8, due to the splitting happening earlier -- and therefore
memory_region_access_valid() is perfectly happy with size=1 (even
without this patch).

As I wrote earlier, the splitting on KVM definitely happens between
flatview_write() (frame#5) and flatview_write_continue() (frame#4). Let
me try check that...

OK, I think I've found it. Unfortuntely, it was not easy. You'll see
above in the KVM stack trace:

> #4  0x0000555555d4e320 in flatview_write_continue (fv=0x7fffdc0141e0, addr=3288, attrs=..., ptr=0x7ffff7fbd000, len=4, addr1=0, l=1, mr=0x5555572b9890) at ../../src/upstream/qemu/softmmu/physmem.c:2825

which might tempt you to set a breakpoint like this:

(gdb) break flatview_write_continue if addr==3288 && len==4 && l==1

However, this breakpoint never will be hit, even though the stack frame
*does* exist like shown, when cpu_status_write() is reached.

The solution to the riddle is that flatview_write_continue() actually
gets "l==4" from the outside... and then internally, it overwrites the
parameter "l". :( What the heck. Terrible programming practice.

So the breakpoint to set is actually (note "l==4"):

(gdb) break flatview_write_continue if addr==3288 && len==4 && l==4

And yes, that gives us the solution -- please locate line *2809* below,
at first:

  2733	int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
  2734	{
  2735	    unsigned access_size_max = mr->ops->valid.max_access_size;
  2736
  2737	    /* Regions are assumed to support 1-4 byte accesses unless
  2738	       otherwise specified.  */
  2739	    if (access_size_max == 0) {
  2740	        access_size_max = 4;
  2741	    }
  2742
  2743	    /* Bound the maximum access by the alignment of the address.  */
  2744	    if (!mr->ops->impl.unaligned) {
  2745	        unsigned align_size_max = addr & -addr;
  2746	        if (align_size_max != 0 && align_size_max < access_size_max) {
  2747	            access_size_max = align_size_max;
  2748	        }
  2749	    }
  2750
  2751	    /* Don't attempt accesses larger than the maximum.  */
  2752	    if (l > access_size_max) {
  2753	        l = access_size_max;
  2754	    }
  2755	    l = pow2floor(l);
  2756
  2757	    return l;
  2758	}
[...]
  2786	static bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
  2787	                                    hwaddr addr, hwaddr len)
  2788	{
  2789	    if (likely(!attrs.memory)) {
  2790	        return true;
  2791	    }
  2792	    if (memory_region_is_ram(mr)) {
  2793	        return true;
  2794	    }
  2795	    qemu_log_mask(LOG_GUEST_ERROR,
  2796	                  "Invalid access to non-RAM device at "
  2797	                  "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
  2798	                  "region '%s'\n", addr, len, memory_region_name(mr));
  2799	    return false;
  2800	}
  2801
  2802	/* Called within RCU critical section.  */
  2803	static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
  2804	                                           MemTxAttrs attrs,
  2805	                                           const void *ptr,
  2806	                                           hwaddr len, hwaddr addr1,
  2807	                                           hwaddr l, MemoryRegion *mr)
  2808	{
  2809	    uint8_t *ram_ptr;
  2810	    uint64_t val;
  2811	    MemTxResult result = MEMTX_OK;
  2812	    bool release_lock = false;
  2813	    const uint8_t *buf = ptr;
  2814
  2815	    for (;;) {
  2816	        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
  2817	            result |= MEMTX_ACCESS_ERROR;
  2818	            /* Keep going. */
  2819	        } else if (!memory_access_is_direct(mr, true)) {
  2820	            release_lock |= prepare_mmio_access(mr);
  2821	            l = memory_access_size(mr, l, addr1);
  2822	            /* XXX: could force current_cpu to NULL to avoid
  2823	               potential bugs */
  2824	            val = ldn_he_p(buf, l);
  2825	            result |= memory_region_dispatch_write(mr, addr1, val,
  2826	                                                   size_memop(l), attrs);

So we enter at line 2809 with addr==3288 && len==4 && l==4.

The flatview_access_allowed() function -- defined at line 2786 --
returns "true", from line 2790, taking the (!attrs.memory) branch.

Note that flatview_access_allowed() doesn't check *len* at all. Not sure
if that's right.

Either way, back in flatview_write_continue(), we proceed to line 2821,
and call memory_access_size(), and assign the result to "l". This
assignment reduces "l" from 4 to 1:

- memory_access_size() is defined at line 2733, see above. In it,
  "access_size_max" is initialized to 1, on line 2735 -- this patch is
  not applied, so "AcpiCpuHotplug_ops.valid.max_access_size" is still 1.

- On line 2745, "align_size_max" is initialized to 0, so line 2747 is
  not reached, and "access_size_max" remains 1.

- Then the branch on line 2752 is taken, and on line 2753, "l" is set to
  1.

- Line 2755 leaves "l" at 1.

Back in flatview_write_continue(), on line 2825, we call
memory_region_dispatch_write() with "op" being set from "size_memop(l)",
where "l" is now 1 -- hence op=MO_8 in frame#3
(memory_region_dispatch_write()).

So, I think the bug is somehow "distributed" between
flatview_write_continue(), flatview_access_allowed(), and
memory_access_size(). flatview_access_allowed() does not care about "l"
at all, when it should (maybe?) compare it against
"mr->ops->valid.max_access_size". In turn, memory_access_size()
*silently* reduces the access width, based on
"->ops->valid.max_access_size".

And all this this *precedes* the call to memory_region_access_valid(),
which is only called from within memory_region_dispatch_write(), which
already gets the reduced width only.

Now, flatview_access_allowed() is from commit 3ab6fdc91b72
("softmmu/physmem: Introduce MemTxAttrs::memory field and
MEMTX_ACCESS_ERROR", 2022-03-21), and the fact it does not check "len"
seems intentional -- it only takes "len" for logging.

Hmm. After digging a lot more, I find the issue may have been introduced
over three commits:

- 82f2563fc815 ("exec: introduce memory_access_size", 2013-05-29), which
  (IIUC) was the first step towards automatically reducing the address
  width, but at first only based on alignment,

- 23326164ae6f ("exec: Support 64-bit operations in address_space_rw",
  2013-07-14), which extended the splitting based on
  "MemoryRegionOps.impl",

- e1622f4b1539 ("exec: fix incorrect assumptions in memory_access_size",
  2013-07-18), which flipped the splitting basis to
  "MemoryRegionOps.valid".

To me, 23326164ae6f seems *vaguely* correct ("vague" is not criticism
for the commit, it's criticism for my understanding :)); after all we're
on our way towards the device model, and the device model exposes via
"MemoryRegionOps.impl" what it can handle. Plus, commit 5d971f9e6725
does direct us towards "MemoryRegionOps.impl"!

But clearly there must have been something wrong with 23326164ae6f,
according to e1622f4b1539...

The latter is what introduced the current "silent splitting of access
based on 'valid'". The message of commit e1622f4b1539 says, almost like
an afterthought:

>     access_size_max can be mr->ops->valid.max_access_size because memory.c
>     can and will still break accesses bigger than
>     mr->ops->impl.max_access_size.

I think this argument may have been wrong: if "impl.max_access_size" is
large (such as: unset), but "valid.max_access_size" is small, that just
means:

  the implementation is flexible and can deal with any access widths (so
  "memory.c" *need not* break up accesses for the device model's sake),
  but the device should restrict the *guest* to small accesses. So if
  the guest tries something larger, we shouldn't silently accommodate
  that.

I have zero idea how to fix this, but I feel that the quoted argument
from commit e1622f4b1539 is the reason why KVM accel is so lenient that
it sort of "de-fangs" commit 5d971f9e6725.

Laszlo


