Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC2565C53B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 18:43:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClIw-0004XS-Rx; Tue, 03 Jan 2023 12:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pClIt-0004TB-3j
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:42:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pClIq-0007iP-6c
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672767738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eIyVolpyYBKU62Fi2kbpHS7yEp80wdNTsE38p3KxR7w=;
 b=Yth9f+yeh2W3PXDe9yAJDtTMwyzFbkipffCJABjZOzRiXU5Guuz5SovZrwAp06BEEhFB0Q
 Q07BXkp/8VDtItn4WdvdjlNkEJbp6P7WvOMyCw2pmOjw500FgulVFCQD/AZSy8r5u2iB/a
 sW5VZfCDFUG4ccGsWYLKFx2tDE1P1Q4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-92SzpeV7OCKKLx7aec331A-1; Tue, 03 Jan 2023 12:42:16 -0500
X-MC-Unique: 92SzpeV7OCKKLx7aec331A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95566811E6E;
 Tue,  3 Jan 2023 17:42:16 +0000 (UTC)
Received: from [10.39.192.59] (unknown [10.39.192.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DCFB140EBF4;
 Tue,  3 Jan 2023 17:42:15 +0000 (UTC)
Message-ID: <aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com>
Date: Tue, 3 Jan 2023 18:42:14 +0100
MIME-Version: 1.0
From: Laszlo Ersek <lersek@redhat.com>
Subject: IO port write width clamping differs between TCG and KVM
To: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: "Ard Biesheuvel (kernel.org address)" <ardb@kernel.org>,
 qemu devel list <qemu-devel@nongnu.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

(resending with qemu-devel on CC; sorry!)

Hi,

this is with QEMU-7.2.

"docs/specs/acpi_cpu_hotplug.rst" writes:

> Legacy ACPI CPU hotplug interface registers
> -------------------------------------------
> ...
> - The first DWORD in bitmap is used in write mode to switch from legacy
>   to modern CPU hotplug interface, write 0 into it to do switch.

and

> (x86) Detecting and enabling modern CPU hotplug interface
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> QEMU starts with legacy CPU hotplug interface enabled. Detecting and
> switching to modern interface is based on the 2 legacy CPU hotplug features:
>
> #. Writes into CPU bitmap are ignored.
> #. CPU bitmap always has bit #0 set, corresponding to boot CPU.
>
> Use following steps to detect and enable modern CPU hotplug interface:
>
> #. Store 0x0 to the 'CPU selector' register, attempting to switch to modern mode
> #. Store 0x0 to the 'CPU selector' register, to ensure valid selector value
> #. Store 0x0 to the 'Command field' register
> #. Read the 'Command data 2' register.
>    If read value is 0x0, the modern interface is enabled.
>    Otherwise legacy or no CPU hotplug interface available

OVMF does exactly that.

The detection method works on KVM, and does not work on TCG.

I've managed to track it as far as follows:

In "hw/acpi/cpu_hotplug.c", we have:

> static uint64_t cpu_status_read(void *opaque, hwaddr addr, unsigned int size)
> {
>     AcpiCpuHotplug *cpus = opaque;
>     uint64_t val = cpus->sts[addr];
>
>     return val;
> }
>
> static void cpu_status_write(void *opaque, hwaddr addr, uint64_t data,
>                              unsigned int size)
> {
>     /* firmware never used to write in CPU present bitmap so use
>        this fact as means to switch QEMU into modern CPU hotplug
>        mode by writing 0 at the beginning of legacy CPU bitmap
>      */
>     if (addr == 0 && data == 0) {
>         AcpiCpuHotplug *cpus = opaque;
>         object_property_set_bool(cpus->device, "cpu-hotplug-legacy", false,
>                                  &error_abort);
>     }
> }
>
> static const MemoryRegionOps AcpiCpuHotplug_ops = {
>     .read = cpu_status_read,
>     .write = cpu_status_write,
>     .endianness = DEVICE_LITTLE_ENDIAN,
>     .valid = {
>         .min_access_size = 1,
>         .max_access_size = 1,
>     },
> };

The cpu_status_write() function is reached with KVM acceleration, when
OVMF writes to the *DWORD* IO Port register at offset 0 (CPU selector).
The function is entered with the following parameters:

  addr=0, data=0, size=1

This means that something in the address space machinery *splits* the
DWORD access from OVMF, into single byte accesses. Consequently, the
behavior is as expected -- the object_property_set_bool() call is
reached, and the register block is switched over to "modern" mode.
Everything's fine.

The full backtrace at this moment is:

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

Further invocations of the same function happen with:

  addr=1, data=0, size=1
  addr=2, data=0, size=1
  addr=3, data=0, size=1

which are (correctly) ignored, per the (addr == 0 && data == 0)
condition inside the function.

The function is not called ever again -- that's because further accesses
to the register block happen through the "modern" memory region, set up
through the following call tree, initiated by cpu_status_write():

  ich9_pm_set_cpu_hotplug_legacy()       [hw/acpi/ich9.c]
    acpi_switch_to_modern_cphp()         [hw/acpi/cpu_hotplug.c]
      memory_region_del_subregion(...)
      cpu_hotplug_hw_init()              [hw/acpi/cpu.c]
        memory_region_init_io(...)
        memory_region_add_subregion(...)

In other words, when cpu_status_write() is reached "by design", the
original memory region that handled the trap is replaced with a new one,
and afterwards, the write handler is a different function.

So, all of this is fine.


When using TCG acceleration however, the cpu_status_write() function is
not reached by the first DWORD write (which OVMF performs according to
the spec quoted above). Instead, the first entry looks like this:

  addr=5, data=0, size=1

This corresponds to the *third* step OVMF performs:

> #. Store 0x0 to the 'Command field' register

but this write should not reach the *legacy* interface, only the
*modern* interface (on QEMU-7.2).

In other words, the first DWORD write is prevented by the memory
machinery from reaching the write handler, but *only* with TCG. And so
the switch-over never happens.

Now, of course there is another reason for the switch-over not to occur,
and that is: the QEMU version executing OVMF simply does not support the
modern interface. That's what the negotiation steps quoted above are
supposed to find out!

Namely, the last step of the spec above is:

> #. Read the 'Command data 2' register.
>    If read value is 0x0, the modern interface is enabled.
>    Otherwise legacy or no CPU hotplug interface available

However: the "command data 2" register is *also* a DWORD register!

And, with TCG, it does read as zero, but not because the modern
interface was enabled. Instead, it reads *misleadingly* as zero because
the cpu_status_read() accessor is never reached *either* (with TCG).
Something in the memory view machinery stops the access from reaching
the handler, and fakes a zero retval.

If it were only the switch-over that didn't work with TCG, but OVMF
could determine that it didn't happen, that would be fine -- we'd just
say that on TCG, you don't get CPU hot(un)plug with OVMF. But the
misbehavior on the read access *too* tricks OVMF into making the
opposite conclusion -- it assumes that the modern interface is enabled.

The rest of the CPU counting is then totally busted, as OVMF thinks it
talks to the modern interface, and "determines" that the system has 1
possible CPU, of which *zero* are present.

Now, if I look at the above-quoted backtrace, I see that, from frame#5
to frame#4, a kind of "streaming" happens (with KVM only). Because,
len=4 is there, but "l=1" appears upon entry to
flatview_write_continue():

  flatview_write()                         [softmmu/physmem.c]
    flatview_translate()                   [softmmu/physmem.c]
      flatview_do_translate()              [softmmu/physmem.c]
        address_space_translate_internal() [softmmu/physmem.c]
    flatview_write_continue()              [softmmu/physmem.c]

And then I vaguely feel that this is somehow related to the following
big comment in address_space_translate_internal() [softmmu/physmem.c]:

>     /* MMIO registers can be expected to perform full-width accesses based only
>      * on their address, without considering adjacent registers that could
>      * decode to completely different MemoryRegions.  When such registers
>      * exist (e.g. I/O ports 0xcf8 and 0xcf9 on most PC chipsets), MMIO
>      * regions overlap wildly.  For this reason we cannot clamp the accesses
>      * here.
>      *
>      * If the length is small (as is the case for address_space_ldl/stl),
>      * everything works fine.  If the incoming length is large, however,
>      * the caller really has to do the clamping through memory_access_size.
>      */

What I don't understand is the *difference* in behavior between KVM and
TCG. The above reasoning either applies to both KVM and TCG, or it
applies to neither, right?

What needs fixing here? TCG, or the CPU hotplug code?

Thanks,
Laszlo


