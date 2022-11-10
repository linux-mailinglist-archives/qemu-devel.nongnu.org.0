Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD66624DB6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 23:44:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otGFv-0001EV-1A; Thu, 10 Nov 2022 17:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1otGFq-0001E7-0U
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 17:42:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1otGFn-0000wJ-AA
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 17:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668120153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRg4ZLb9jR+tt4vSSmthL49tGpokVleM/HtSY9iZpKg=;
 b=CiDphJfOmluLcnprelSWjRMvgWkCOH63qyCzuf9bu2fgmYGzp9qkaLwc5cXbRqxkfNAZB8
 P9CGwerYZcvUfqDw/SsIuVeK+FfKMaNg7yjY0wv28iw0IUzCAKK7dWV0x90IL1bXYpyC9Y
 NZC6zL8tRdNOdGOxHsbTa4s2vlFnrj0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-NtfWd9-bO8qfKf-ai6bnCg-1; Thu, 10 Nov 2022 17:42:32 -0500
X-MC-Unique: NtfWd9-bO8qfKf-ai6bnCg-1
Received: by mail-qk1-f197.google.com with SMTP id
 q14-20020a05620a0d8e00b006ef0350dae1so3345986qkl.12
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 14:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cRg4ZLb9jR+tt4vSSmthL49tGpokVleM/HtSY9iZpKg=;
 b=6SlWe6If2Q0ryrvb2nUndMNTb26TUgYRG5GpCDGwj/dJMDxEAOf+Kd1sp5j6FuWjrB
 tmRm9cT2UR5acqlU1m10posa6R5jTtDJt8Z1Whe01t+eg0UAbZ62ZXmAN38YHR2PVmLW
 hI4/Mp+iXhghmu8pRH1+aNfSrMUeVzdBhYeSmZFWy/49YTkNUfHTWVjnXC+qYnj4Wbmw
 rPTLDEz9k5z28j3W8pGda1Gx61oWTjXUuSELWojGmGaJcejDm/OQPOYUBkTNbhVRrJTO
 kUAV3XxSxxt/PzXROmy9C7RTGSpxvYYd8rk6F5OFaMScZwOqbZ6yjrQgnblxaoIUsFBj
 Cq3Q==
X-Gm-Message-State: ACrzQf2ZBAbZzuk2ZFmVR2epKNujMcrEGJ9YLkn4KOZdau14Bgo3pDc5
 7n7ZI8XMwILqnfziGpwv/mMRZiV1yfKb6peR0nvzvumxmcnjgjclR1uxMDGRSbdohNwzSFzZMhu
 Jn6CaUvxfGYSomfY=
X-Received: by 2002:a37:5586:0:b0:6fa:d64:c018 with SMTP id
 j128-20020a375586000000b006fa0d64c018mr2148596qkb.145.1668120151117; 
 Thu, 10 Nov 2022 14:42:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6NrIavyS7ElZ+24ZlB/FhLKwix3v/z/MGMFDH50jk/vpIPuFgQGfN7RG0oYGTgIy26gjjdag==
X-Received: by 2002:a37:5586:0:b0:6fa:d64:c018 with SMTP id
 j128-20020a375586000000b006fa0d64c018mr2148583qkb.145.1668120150819; 
 Thu, 10 Nov 2022 14:42:30 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 x1-20020a05620a448100b006cec8001bf4sm427256qkp.26.2022.11.10.14.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 14:42:30 -0800 (PST)
Date: Thu, 10 Nov 2022 17:42:28 -0500
From: Peter Xu <peterx@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu-daude@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: should ioapic_service really be modelling cpu writes?
Message-ID: <Y21+VFqKpF6LGz2C@x1n>
References: <874jv6enct.fsf@linaro.org>
 <87zgcyd70g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgcyd70g.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Hi, Alex,

On Thu, Nov 10, 2022 at 05:55:51PM +0000, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > Hi,
> >
> > I've been trying to remove current_cpu hacks from our hw/ emulation and
> > replace them with an explicit cpu_index derived from MemTxAttrs. So far
> > this has been going mostly ok but I've run into problems on x86 due to
> > the way the apic/ioapic are modelled. It comes down to the function
> > ioapic_service() which eventually does:
> >
> >    /* No matter whether IR is enabled, we translate
> >     * the IOAPIC message into a MSI one, and its
> >     * address space will decide whether we need a
> >     * translation. */
> >    stl_le_phys(ioapic_as, info.addr, info.data);
> >
> > Which essentially calls the memory API to simulate a memory write.
> > However to generate a properly formed MemTxAttrs we need to know what
> > CPU we are running on. In the case of ioapic_service() we may well be in
> > the main thread either for an expiring timer:
> >
> >  hpet_timer->qemu_set_irq->ioapic_set_irq
> >
> > or for reset handling:
> >
> >  pc_machine_reset->hpet_reset->qemu_set_irq->ioapic_set_irq
> >
> > neither of which can get a associated CPU. I assume if the actual writes
> > are triggered we never actually actioned stuff because we had:
> >
> >   DeviceState *cpu_get_current_apic(void)
> >   {
> >       if (current_cpu) {
> >           X86CPU *cpu = X86_CPU(current_cpu);
> >           return cpu->apic_state;
> >       } else {
> >           return NULL;
> >       }
> >   }
> >
> > which basically causes the updates to be dropped on the floor.

I think it shouldn't?  Normally the irq will be in MSI format (IOAPIC will
translate to an MSI in QEMU, per ioapic_entry_parse()).

I had a feeling that it'll just go the shortcut here (MSI always starts
with 0xfeeXXXXX so definitely bigger than 0xfff):

    if (addr > 0xfff || !index) {
        /* MSI and MMIO APIC are at the same memory location,
         * but actually not on the global bus: MSI is on PCI bus
         * APIC is connected directly to the CPU.
         * Mapping them on the global bus happens to work because
         * MSI registers are reserved in APIC MMIO and vice versa. */
        MSIMessage msi = { .address = addr, .data = val };
        apic_send_msi(&msi);
        return;
    }

apic_send_msi() doesn't need a cpu context.

> > However
> > during the conversion I went with something like:
> >
> >   if (attrs.requester_type != MTRT_CPU) {
> >       return MEMTX_ACCESS_ERROR;
> >   }
> >   dev = cpu_get_current_apic(attrs.requester_id);
> >
> > but that breaks current behaviour. It makes me wonder if the modelling
> > of the APIC is really representative of what the real HW does or if the
> > memory writes are simply a shortcut that happens to work?

No expert on that, but per my understanding ioapic isn't really bound to
any apic, so it doesn't need any cpu context.  As a quick reference of
that, one can look at Intel SDM Vol 3 Chap 10, figure 10.3 will be a
generic modern x86_64 system APIC structure.

In hardware there should have a 3-wire apic bus that take care of all the
messaging, including at least not only ioapic irqs to any cores, or IPIs
between the cores.  The messages coming from the ioapic should not require
any apic too as it can come from devices, just like what we do with qemu
when the device does things like pci_set_irq(), iiuc.

> 
> And indeed we see call chains like this:
> 
>   #0  apic_mem_write (opaque=0x555556fb1d40, addr=4100, val=16417, size=4, attrs=...) at ../../hw/intc/apic.c:754
>   #1  0x0000555555da4f89 in memory_region_write_with_attrs_accessor (mr=0x555556fb1de0, addr=4100, value=0x7ffff094f2c8, size=4, shift=0, mask=4294967295, attrs=...) at ../../
>   softmmu/memory.c:513
>   #2  0x0000555555da50ce in access_with_adjusted_size (addr=4100, value=0x7ffff094f2c8, size=4, access_size_min=1, access_size_max=4, access_fn=0x555555da4e8b <memory_region_w
>   rite_with_attrs_accessor>, mr=0x555556fb1de0, attrs=...) at ../../softmmu/memory.c:554
>   #3  0x0000555555da82ef in memory_region_dispatch_write (mr=0x555556fb1de0, addr=4100, data=16417, op=MO_32, attrs=...) at ../../softmmu/memory.c:1521
>   #4  0x0000555555db7ecd in address_space_stl_internal (as=0x555557b786c8, addr=4276097028, val=16417, attrs=..., result=0x0, endian=DEVICE_LITTLE_ENDIAN) at /home/alex.bennee
>   /lsrc/qemu.git/memory_ldst.c.inc:319
>   #5  0x0000555555db800c in address_space_stl_le (as=0x555557b786c8, addr=4276097028, val=16417, attrs=..., result=0x0) at /home/alex.bennee/lsrc/qemu.git/memory_ldst.c.inc:35
>   7
>   #6  0x0000555555a0ac53 in pci_msi_trigger (dev=0x555557b78490, msg=...) at ../../hw/pci/pci.c:326
>   #7  0x0000555555a07374 in msi_send_message (dev=0x555557b78490, msg=...) at ../../hw/pci/msi.c:378
>   #8  0x0000555555a07327 in msi_notify (dev=0x555557b78490, vector=0) at ../../hw/pci/msi.c:373
>   #9  0x00005555559572a6 in ahci_irq_raise (s=0x555557b78eb0) at ../../hw/ide/ahci.c:187
>   #10 0x0000555555957401 in ahci_check_irq (s=0x555557b78eb0) at ../../hw/ide/ahci.c:221
>   #11 0x00005555559574ea in ahci_trigger_irq (s=0x555557b78eb0, d=0x555557b7adb0, irqbit=AHCI_PORT_IRQ_BIT_PSS) at ../../hw/ide/ahci.c:240
>   #12 0x000055555595a6b9 in ahci_pio_transfer (dma=0x555557b7adb0) at ../../hw/ide/ahci.c:1402
>   #13 0x000055555595e948 in ide_transfer_start_norecurse (s=0x555557b7ae70, buf=0x555557b84800 "@", size=512, end_transfer_func=0x55555595ea51 <ide_transfer_stop>) at ../../hw
>   /ide/core.c:566
>   #14 0x000055555595e981 in ide_transfer_start (s=0x555557b7ae70, buf=0x555557b84800 "@", size=512, end_transfer_func=0x55555595ea51 <ide_transfer_stop>) at ../../hw/ide/core.
>   c:573
>   #15 0x0000555555960e0d in cmd_identify (s=0x555557b7ae70, cmd=236 '\354') at ../../hw/ide/core.c:1441
>   #16 0x0000555555962759 in ide_exec_cmd (bus=0x555557b7ade8, val=236) at ../../hw/ide/core.c:2149
>   #17 0x000055555595a12d in handle_reg_h2d_fis (s=0x555557b78eb0, port=0, slot=0 '\000', cmd_fis=0x7fff5dca0500 "'\200", <incomplete sequence \354>) at ../../hw/ide/ahci.c:127
>   1
>   #18 0x000055555595a39a in handle_cmd (s=0x555557b78eb0, port=0, slot=0 '\000') at ../../hw/ide/ahci.c:1322
>   #19 0x000055555595817f in check_cmd (s=0x555557b78eb0, port=0) at ../../hw/ide/ahci.c:594
>   #20 0x00005555559579ae in ahci_port_write (s=0x555557b78eb0, port=0, offset=56, val=1) at ../../hw/ide/ahci.c:374
>   #21 0x0000555555957f16 in ahci_mem_write (opaque=0x555557b78eb0, addr=312, val=1, size=4) at ../../hw/ide/ahci.c:515
>   #22 0x0000555555da4e80 in memory_region_write_accessor (mr=0x555557b78ee0, addr=312, value=0x7ffff094f868, size=4, shift=0, mask=4294967295, attrs=...) at ../../softmmu/memo
>   ry.c:492
>   #23 0x0000555555da50ce in access_with_adjusted_size (addr=312, value=0x7ffff094f868, size=4, access_size_min=1, access_size_max=4, access_fn=0x555555da4d86 <memory_region_wr
>   ite_accessor>, mr=0x555557b78ee0, attrs=...) at ../../softmmu/memory.c:554
>   #24 0x0000555555da82b1 in memory_region_dispatch_write (mr=0x555557b78ee0, addr=312, data=1, op=MO_32, attrs=...) at ../../softmmu/memory.c:1514
>   #25 0x0000555555e391ac in io_writex (env=0x555557171eb0, full=0x7fffe89ebba8, mmu_idx=2, val=1, addr=18446632136124748088, retaddr=140734909768034, op=MO_32) at ../../accel/
>   tcg/cputlb.c:1434
>   #26 0x0000555555e3b861 in store_helper (env=0x555557171eb0, addr=18446632136124748088, val=1, oi=34, retaddr=140734909768034, op=MO_32) at ../../accel/tcg/cputlb.c:2375
>   #27 0x0000555555e3bbd7 in full_le_stl_mmu (env=0x555557171eb0, addr=18446632136124748088, val=1, oi=34, retaddr=140734909768034) at ../../accel/tcg/cputlb.c:2463
>   #28 0x0000555555e3bc15 in helper_le_stl_mmu (env=0x555557171eb0, addr=18446632136124748088, val=1, oi=34, retaddr=140734909768034) at ../../accel/tcg/cputlb.c:2469
>   #29 0x00007fff664de162 in code_gen_buffer ()
>   #30 0x0000555555e268f9 in cpu_tb_exec (cpu=0x555557171110, itb=0x7fffa64ddfc0, tb_exit=0x7ffff094ffd0) at ../../accel/tcg/cpu-exec.c:438
>   #31 0x0000555555e275c3 in cpu_loop_exec_tb (cpu=0x555557171110, tb=0x7fffa64ddfc0, pc=18446744071770558920, last_tb=0x7ffff094ffe0, tb_exit=0x7ffff094ffd0) at ../../accel/tc
>   g/cpu-exec.c:868
>   #32 0x0000555555e279bb in cpu_exec (cpu=0x555557171110) at ../../accel/tcg/cpu-exec.c:1032
>   #33 0x0000555555e54d99 in tcg_cpus_exec (cpu=0x555557171110) at ../../accel/tcg/tcg-accel-ops.c:69
>   #34 0x0000555555e55481 in mttcg_cpu_thread_fn (arg=0x555557171110) at ../../accel/tcg/tcg-accel-ops-mttcg.c:95
>   #35 0x00005555560553fe in qemu_thread_start (args=0x555556aa22e0) at ../../util/qemu-thread-posix.c:505
>   #36 0x00007ffff5201b43 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
>   #37 0x00007ffff5293a00 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
> 
> So the CPU has triggered an access to the AHCI controller which then
> triggers pci_msi_trigger() and in the old world assumed the MSI IRQ
> would arrive at the same CPU. Is this how PCI IRQs work? Can you not
> control which lane of the APIC receives a given IRQ line from the PCI
> bus?

AFAICT apic_mem_write() doesn't mean that this cpu will take this IRQ.  The
target core to respond to the IRQ will be defined in the dest ID field of
either an MSI message or embeded in the IOAPIC entry being setup by the
guest driver.  E.g. MSI message format can also be found in SDM Vol 3 chap
10.11.1, in QEMU we can refer to "dest" field of apic_send_msi().

Thanks,

-- 
Peter Xu


