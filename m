Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C216248F3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 19:02:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otBr2-0007yx-A3; Thu, 10 Nov 2022 13:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otBqw-0007yT-S0
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:00:38 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otBqu-0006DN-Km
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:00:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1695343wmb.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 10:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AsErNZtySako7Mc7SFnF1aPHavQy3ktdzC3zLicmi3Q=;
 b=rjwaffrOAy+k8VyWRIZs567hVy/R4x8wyjoj1UDQ3O033xgigD7u/v9DwZZfSTyCni
 JhCBHx8Vo+od50XnnbFzpxeeEDMeq9tzu4O8858d8k3kPJlqeUuZ0kTVBTh1zeTtxd4z
 z/ex/B89NKzejOFdQswjZqvxDruDvKJcBDaKsBdUXfwc2sCaaqQklYaqEoKj1lGwCrNd
 i5Sc+iVBWCBzxr70G1P6m1Gzh2AXIAVi1KJeTRItAl5PpLvcv49acy7WwUxG2tLGzn3H
 PxprABPhifmYu/E/pALiI2umWCuuRuAuOv29UcfPkwV+HSxjRE4GBm1igYdbvZdDIEye
 z0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AsErNZtySako7Mc7SFnF1aPHavQy3ktdzC3zLicmi3Q=;
 b=ruHumybHCSjw9OAjdGJkhfO9aiuZyPKFVOl/SMfQ9r2Bbg0V7y2aQgnHOfr1lC1Efd
 XfxVIaq3qus4csmjm37eM/ooLdZw9UTx999soUb74enGyFQCi99mN/bh6Yuuk1I1zbVz
 tIsNfEdEcm7HyHd3oEpuRfMCCs5tNcCcHsDUwAGUIN5WUQGgWNnoSqJ3ci3b2WEprLJP
 Kdf1mO6UjjBVKxldgc1K3HnY09TbbDkpZqSfZKCK/8RrqK0wc0J60wXYNlbNC4D6jG0u
 hl+dnEtkI3AUS+ldaWHOiXTVPiBpyRlKX1xd0TKhtYeFLOmGKeApq3TTGJGcPXKEwgBA
 +NAA==
X-Gm-Message-State: ACrzQf023DR2EO/0zxb/oAKdLxiupj+hm3IPw6TCGxsmQaEdJMkF83F3
 YV7G8OWPZBIxk0Z1gQpwkAKzYg==
X-Google-Smtp-Source: AMsMyM5g/YzjOFBJ/jHRuhZWmoDuZOjvUI49fOTjb/RyjltvkJ/zPWfyNESEimiKOC/g94QS9IdOUQ==
X-Received: by 2002:a05:600c:3b0d:b0:3cf:82d2:8c61 with SMTP id
 m13-20020a05600c3b0d00b003cf82d28c61mr33219892wms.0.1668103233276; 
 Thu, 10 Nov 2022 10:00:33 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003cfa3a12660sm8537052wms.1.2022.11.10.10.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:00:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 394471FFB7;
 Thu, 10 Nov 2022 18:00:31 +0000 (GMT)
References: <874jv6enct.fsf@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu-daude@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: should ioapic_service really be modelling cpu writes?
Date: Thu, 10 Nov 2022 17:55:51 +0000
In-reply-to: <874jv6enct.fsf@linaro.org>
Message-ID: <87zgcyd70g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> I've been trying to remove current_cpu hacks from our hw/ emulation and
> replace them with an explicit cpu_index derived from MemTxAttrs. So far
> this has been going mostly ok but I've run into problems on x86 due to
> the way the apic/ioapic are modelled. It comes down to the function
> ioapic_service() which eventually does:
>
>    /* No matter whether IR is enabled, we translate
>     * the IOAPIC message into a MSI one, and its
>     * address space will decide whether we need a
>     * translation. */
>    stl_le_phys(ioapic_as, info.addr, info.data);
>
> Which essentially calls the memory API to simulate a memory write.
> However to generate a properly formed MemTxAttrs we need to know what
> CPU we are running on. In the case of ioapic_service() we may well be in
> the main thread either for an expiring timer:
>
>  hpet_timer->qemu_set_irq->ioapic_set_irq
>
> or for reset handling:
>
>  pc_machine_reset->hpet_reset->qemu_set_irq->ioapic_set_irq
>
> neither of which can get a associated CPU. I assume if the actual writes
> are triggered we never actually actioned stuff because we had:
>
>   DeviceState *cpu_get_current_apic(void)
>   {
>       if (current_cpu) {
>           X86CPU *cpu =3D X86_CPU(current_cpu);
>           return cpu->apic_state;
>       } else {
>           return NULL;
>       }
>   }
>
> which basically causes the updates to be dropped on the floor. However
> during the conversion I went with something like:
>
>   if (attrs.requester_type !=3D MTRT_CPU) {
>       return MEMTX_ACCESS_ERROR;
>   }
>   dev =3D cpu_get_current_apic(attrs.requester_id);
>
> but that breaks current behaviour. It makes me wonder if the modelling
> of the APIC is really representative of what the real HW does or if the
> memory writes are simply a shortcut that happens to work?

And indeed we see call chains like this:

  #0  apic_mem_write (opaque=3D0x555556fb1d40, addr=3D4100, val=3D16417, si=
ze=3D4, attrs=3D...) at ../../hw/intc/apic.c:754
  #1  0x0000555555da4f89 in memory_region_write_with_attrs_accessor (mr=3D0=
x555556fb1de0, addr=3D4100, value=3D0x7ffff094f2c8, size=3D4, shift=3D0, ma=
sk=3D4294967295, attrs=3D...) at ../../
  softmmu/memory.c:513
  #2  0x0000555555da50ce in access_with_adjusted_size (addr=3D4100, value=
=3D0x7ffff094f2c8, size=3D4, access_size_min=3D1, access_size_max=3D4, acce=
ss_fn=3D0x555555da4e8b <memory_region_w
  rite_with_attrs_accessor>, mr=3D0x555556fb1de0, attrs=3D...) at ../../sof=
tmmu/memory.c:554
  #3  0x0000555555da82ef in memory_region_dispatch_write (mr=3D0x555556fb1d=
e0, addr=3D4100, data=3D16417, op=3DMO_32, attrs=3D...) at ../../softmmu/me=
mory.c:1521
  #4  0x0000555555db7ecd in address_space_stl_internal (as=3D0x555557b786c8=
, addr=3D4276097028, val=3D16417, attrs=3D..., result=3D0x0, endian=3DDEVIC=
E_LITTLE_ENDIAN) at /home/alex.bennee
  /lsrc/qemu.git/memory_ldst.c.inc:319
  #5  0x0000555555db800c in address_space_stl_le (as=3D0x555557b786c8, addr=
=3D4276097028, val=3D16417, attrs=3D..., result=3D0x0) at /home/alex.bennee=
/lsrc/qemu.git/memory_ldst.c.inc:35
  7
  #6  0x0000555555a0ac53 in pci_msi_trigger (dev=3D0x555557b78490, msg=3D..=
.) at ../../hw/pci/pci.c:326
  #7  0x0000555555a07374 in msi_send_message (dev=3D0x555557b78490, msg=3D.=
..) at ../../hw/pci/msi.c:378
  #8  0x0000555555a07327 in msi_notify (dev=3D0x555557b78490, vector=3D0) a=
t ../../hw/pci/msi.c:373
  #9  0x00005555559572a6 in ahci_irq_raise (s=3D0x555557b78eb0) at ../../hw=
/ide/ahci.c:187
  #10 0x0000555555957401 in ahci_check_irq (s=3D0x555557b78eb0) at ../../hw=
/ide/ahci.c:221
  #11 0x00005555559574ea in ahci_trigger_irq (s=3D0x555557b78eb0, d=3D0x555=
557b7adb0, irqbit=3DAHCI_PORT_IRQ_BIT_PSS) at ../../hw/ide/ahci.c:240
  #12 0x000055555595a6b9 in ahci_pio_transfer (dma=3D0x555557b7adb0) at ../=
../hw/ide/ahci.c:1402
  #13 0x000055555595e948 in ide_transfer_start_norecurse (s=3D0x555557b7ae7=
0, buf=3D0x555557b84800 "@", size=3D512, end_transfer_func=3D0x55555595ea51=
 <ide_transfer_stop>) at ../../hw
  /ide/core.c:566
  #14 0x000055555595e981 in ide_transfer_start (s=3D0x555557b7ae70, buf=3D0=
x555557b84800 "@", size=3D512, end_transfer_func=3D0x55555595ea51 <ide_tran=
sfer_stop>) at ../../hw/ide/core.
  c:573
  #15 0x0000555555960e0d in cmd_identify (s=3D0x555557b7ae70, cmd=3D236 '\3=
54') at ../../hw/ide/core.c:1441
  #16 0x0000555555962759 in ide_exec_cmd (bus=3D0x555557b7ade8, val=3D236) =
at ../../hw/ide/core.c:2149
  #17 0x000055555595a12d in handle_reg_h2d_fis (s=3D0x555557b78eb0, port=3D=
0, slot=3D0 '\000', cmd_fis=3D0x7fff5dca0500 "'\200", <incomplete sequence =
\354>) at ../../hw/ide/ahci.c:127
  1
  #18 0x000055555595a39a in handle_cmd (s=3D0x555557b78eb0, port=3D0, slot=
=3D0 '\000') at ../../hw/ide/ahci.c:1322
  #19 0x000055555595817f in check_cmd (s=3D0x555557b78eb0, port=3D0) at ../=
../hw/ide/ahci.c:594
  #20 0x00005555559579ae in ahci_port_write (s=3D0x555557b78eb0, port=3D0, =
offset=3D56, val=3D1) at ../../hw/ide/ahci.c:374
  #21 0x0000555555957f16 in ahci_mem_write (opaque=3D0x555557b78eb0, addr=
=3D312, val=3D1, size=3D4) at ../../hw/ide/ahci.c:515
  #22 0x0000555555da4e80 in memory_region_write_accessor (mr=3D0x555557b78e=
e0, addr=3D312, value=3D0x7ffff094f868, size=3D4, shift=3D0, mask=3D4294967=
295, attrs=3D...) at ../../softmmu/memo
  ry.c:492
  #23 0x0000555555da50ce in access_with_adjusted_size (addr=3D312, value=3D=
0x7ffff094f868, size=3D4, access_size_min=3D1, access_size_max=3D4, access_=
fn=3D0x555555da4d86 <memory_region_wr
  ite_accessor>, mr=3D0x555557b78ee0, attrs=3D...) at ../../softmmu/memory.=
c:554
  #24 0x0000555555da82b1 in memory_region_dispatch_write (mr=3D0x555557b78e=
e0, addr=3D312, data=3D1, op=3DMO_32, attrs=3D...) at ../../softmmu/memory.=
c:1514
  #25 0x0000555555e391ac in io_writex (env=3D0x555557171eb0, full=3D0x7fffe=
89ebba8, mmu_idx=3D2, val=3D1, addr=3D18446632136124748088, retaddr=3D14073=
4909768034, op=3DMO_32) at ../../accel/
  tcg/cputlb.c:1434
  #26 0x0000555555e3b861 in store_helper (env=3D0x555557171eb0, addr=3D1844=
6632136124748088, val=3D1, oi=3D34, retaddr=3D140734909768034, op=3DMO_32) =
at ../../accel/tcg/cputlb.c:2375
  #27 0x0000555555e3bbd7 in full_le_stl_mmu (env=3D0x555557171eb0, addr=3D1=
8446632136124748088, val=3D1, oi=3D34, retaddr=3D140734909768034) at ../../=
accel/tcg/cputlb.c:2463
  #28 0x0000555555e3bc15 in helper_le_stl_mmu (env=3D0x555557171eb0, addr=
=3D18446632136124748088, val=3D1, oi=3D34, retaddr=3D140734909768034) at ..=
/../accel/tcg/cputlb.c:2469
  #29 0x00007fff664de162 in code_gen_buffer ()
  #30 0x0000555555e268f9 in cpu_tb_exec (cpu=3D0x555557171110, itb=3D0x7fff=
a64ddfc0, tb_exit=3D0x7ffff094ffd0) at ../../accel/tcg/cpu-exec.c:438
  #31 0x0000555555e275c3 in cpu_loop_exec_tb (cpu=3D0x555557171110, tb=3D0x=
7fffa64ddfc0, pc=3D18446744071770558920, last_tb=3D0x7ffff094ffe0, tb_exit=
=3D0x7ffff094ffd0) at ../../accel/tc
  g/cpu-exec.c:868
  #32 0x0000555555e279bb in cpu_exec (cpu=3D0x555557171110) at ../../accel/=
tcg/cpu-exec.c:1032
  #33 0x0000555555e54d99 in tcg_cpus_exec (cpu=3D0x555557171110) at ../../a=
ccel/tcg/tcg-accel-ops.c:69
  #34 0x0000555555e55481 in mttcg_cpu_thread_fn (arg=3D0x555557171110) at .=
./../accel/tcg/tcg-accel-ops-mttcg.c:95
  #35 0x00005555560553fe in qemu_thread_start (args=3D0x555556aa22e0) at ..=
/../util/qemu-thread-posix.c:505
  #36 0x00007ffff5201b43 in start_thread (arg=3D<optimized out>) at ./nptl/=
pthread_create.c:442
  #37 0x00007ffff5293a00 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/=
clone3.S:81

So the CPU has triggered an access to the AHCI controller which then
triggers pci_msi_trigger() and in the old world assumed the MSI IRQ
would arrive at the same CPU. Is this how PCI IRQs work? Can you not
control which lane of the APIC receives a given IRQ line from the PCI
bus?

--=20
Alex Benn=C3=A9e

