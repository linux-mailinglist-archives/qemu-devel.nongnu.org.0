Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF06252D19
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:56:08 +0200 (CEST)
Received: from localhost ([::1]:33002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAu2B-00043e-Sf
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kAu1J-0003Q6-Bx
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:55:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kAu1G-0001Ee-H8
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598442909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lte8pj++tFHhSnVY0Itk6mFiQxbZWvHz7Bjz/sfIYqI=;
 b=hgl/pvsC6lZntwaJJwdl4nSLjcZItgTxOxv665rgjkKJJQ4ZJQwbvkpPhYKpgrb894Xadh
 gLzJoW5LRprIijGCJkPXegPKta9GDimnHVCG2TTbI9V/eE1KINKGWVZb6/V8EG19aEopOi
 RpmHrxQBUwjRUgh9Ze69D4UKKbLoo2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-IwAqu8ekMXGsxk3DToci9Q-1; Wed, 26 Aug 2020 07:55:05 -0400
X-MC-Unique: IwAqu8ekMXGsxk3DToci9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2620210A5D80;
 Wed, 26 Aug 2020 11:55:04 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFCA31972A;
 Wed, 26 Aug 2020 11:55:02 +0000 (UTC)
Date: Wed, 26 Aug 2020 13:55:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH v2 6/7] x68: acpi: trigger SMI before sending hotplug
 Notify event to OSPM
Message-ID: <20200826135501.5449641b@redhat.com>
In-Reply-To: <cfd4dd52-4827-2288-4b4e-b396d48494f0@redhat.com>
References: <20200818122208.1243901-1-imammedo@redhat.com>
 <20200818122208.1243901-7-imammedo@redhat.com>
 <382e54cc-1ac0-61e5-bf5d-0653480222a0@redhat.com>
 <cfd4dd52-4827-2288-4b4e-b396d48494f0@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 23:30:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: boris.ostrovsky@oracle.com,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, aaron.young@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Aug 2020 11:24:14 +0200
Laszlo Ersek <lersek@redhat.com> wrote:

> Hi Igor,
> 
> On 08/25/20 19:25, Laszlo Ersek wrote:
> 
> > So I would suggest fetching the CNEW array element back into "uid"
> > first, then using "uid" for both the NOTIFY call, and the (currently
> > missing) restoration of CSEL. Then we can write 1 to CINS.
> >
> > Expressed as a patch on top of yours:
> >  
> >> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> >> index 4864c3b39694..2bea6144fd5e 100644
> >> --- a/hw/acpi/cpu.c
> >> +++ b/hw/acpi/cpu.c
> >> @@ -564,8 +564,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >>              aml_append(method, aml_store(zero, cpu_idx));
> >>              while_ctx = aml_while(aml_lless(cpu_idx, num_added_cpus));
> >>              {
> >> -                aml_append(while_ctx, aml_call2(CPU_NOTIFY_METHOD,
> >> -                    aml_derefof(aml_index(new_cpus, cpu_idx)), dev_chk));
> >> +                aml_append(while_ctx,
> >> +                    aml_store(aml_derefof(aml_index(new_cpus, cpu_idx)), uid));
> >> +                aml_append(while_ctx,
> >> +                    aml_call2(CPU_NOTIFY_METHOD, uid, dev_chk));
> >> +                aml_append(while_ctx, aml_store(uid, cpu_selector));
> >>                  aml_append(while_ctx, aml_store(one, ins_evt));
> >>                  aml_append(while_ctx, aml_increment(cpu_idx));
> >>              }  
> >
> > This effects the following change, in the decompiled method:
> >  
> >> @@ -37,15 +37,17 @@
> >>      If ((Local_NumAddedCpus != Zero))
> >>      {
> >>          \_SB.PCI0.SMI0.SMIC = 0x04
> >>      }
> >>
> >>      Local_CpuIdx = Zero
> >>      While ((Local_CpuIdx < Local_NumAddedCpus))
> >>      {
> >> -        CTFY (DerefOf (CNEW [Local_CpuIdx]), One)
> >> +        Local_Uid = DerefOf (CNEW [Local_CpuIdx])
> >> +        CTFY (Local_Uid, One)
> >> +        \_SB.PCI0.PRES.CSEL = Local_Uid
> >>          \_SB.PCI0.PRES.CINS = One
> >>          Local_CpuIdx++
> >>      }
> >>
> >>      Release (\_SB.PCI0.PRES.CPLK)
> >>  }  
> >
> > With this change, the
> >
> >   virsh setvcpus DOMAIN 8 --live
> >
> > command works for me. The topology in my test domain has CPU#0 and
> > CPU#2 cold-plugged, so the command adds 6 VCPUs. Viewed from the
> > firmware side, the 6 "device_add" commands, issued in close succession
> > by libvirtd, coalesce into 4 "batches". (And of course the firmware
> > sees the 4 batches back-to-back.)  
> 
> unfortunately, with more testing, I have run into two more races:
> 
> (1) When a "device_add" occurs after the ACPI loop collects the CPUS
>     from the register block, but before the SMI.
> 
>     Here, the "stray CPU" is processed fine by the firmware. However,
>     the CTFY loop in ACPI does not know about the CPU, so it doesn't
>     clear the pending insert event for it. And when the firmware is
>     entered with an SMI for the *next* time, the firmware sees the same
>     CPU *again* as pending, and tries to relocate it again. Bad things
>     happen.
>
> (2) When a "device_add" occurs after the SMI, but before the firmware
>     collects the pending CPUs from the register block.
> 
>     Here, the firmware collects the "stray CPU". However, the "broadcast
>     SMI", with which we entered the firmware, did *not* cover the stray
>     CPU -- the CPU_FOREACH() loop in ich9_apm_ctrl_changed() could not
>     make the SMI pending for the new CPU, because at that time, the CPU
>     had not been added yet. As a result, when the firmware sends an
>     INIT-SIPI-SIPI to the new CPU, expecting it to boot right into SMM,
>     the new CPU instead boots straight into the post-RSM (normal mode)
>     "pen", skipping its initial SMI handler. Meaning that the CPU halts
>     nicely, but its SMBASE is never relocated, and the SMRAM message
>     exchange with the BSP falls apart.
> 
> Possible mitigations I can think of:
> 
> For problem (1):
> 
>   (1a) Change the firmware so it notices that it has relocated the
>        "stray" CPU before -- such CPUs should be simply skipped in the
>        firmware. The next time the CTFY loop runs in ACPI, it will clear
>        the pending event.
> 
>   (1b) Alternatively, stop consuming the hotplug register block in the
>        firmware altogether, and work out general message passing, from
>        ACPI to firmware. See the outline here:
> 
>          http://mid.mail-archive.com/cf887d74-f65d-602a-9629-3d25cef93a69@redhat.com
> 
> For problem (2):
> 
>   (2a) Change the firmware so that it sends a directed SMI as well to
>        each CPU, just before sending an INIT-SIPI-SIPI. This should be
>        idempotent -- if the broadcast SMI *has* covered the the CPU,
>        then sending a directed SMI should make no difference.
may be still racy, as new cpus can arrive diring/after direct broadcast.
better would be ignore stray CPUs that didn't pass through SMM
relocation.

> 
>   (2b) Alternatively, change the "device_add" command in QEMU so that,
>        if "CPU hotplug with SMI" has been negotiated, the new CPU is
>        added with the SMI made pending for it at once. (That is, no
>        hot-plugged CPU would exist with the directed SMI *not* pending
>        for it.)
> 
>   (2c) Alternatively, approach (1b) would fix problem (2) as well -- the
>        firmware would only relocate such CPUs that ACPI collected before
>        injecting the SMI. So all those CPUs would have the SMI pending.
> 
> 
> I can experiment with (1a) and (2a), but note that for unplug, we're
> likely going to need the array passing method (1b) anyway. I'm concerned
> that (1a) and (2a) together may not fix all possible races (i.e. we
> might see more kinds).

Given async nature of device_add, (1a) and (2a) are expected
(I've thought it were already handled by fw),
so I'd prefer to continue with current approach if possible.
(if fw is not able to deal with 2a without QEMU help,
maybe we could add an extra flag in register block to help,
though my preference is to avoid it if it's possible)

(2b) if twisting CPU state in QEMU were acceptable we would have
had a lot of helping quirks that would put CPU in some desired
for a a particular guest code state, and why stop there just
discard firmware and configure all devices right from QEMU
to and start executing OS code strait away. (it would be
faster than going through what real hw does) (I'm afraid it's
not going to fly).

(1c) it's still very unclear what direction to take there,
 * one as you mentioned, would be introducing new protocol for
   message passing between acpi and fw.
   (so far I've was thinking that payload should be UID of CPU)
 * another approach, I was considering was adding an additional
   flag to register block. So CPU._EJ0 would mark CPU as pending
   for removal and do SMI upcall to fw to act on it.
 
> What's important is that, *IF* we need to change anything in the
> firmware for fixing these races, then we either need to do so urgently,
> *or* I have to revert OVMF commit 5ba203b54e59 ("OvmfPkg/SmmControl2Dxe:
> negotiate ICH9_LPC_SMI_F_CPU_HOTPLUG", 2020-08-24).
> 
> That's because we're in feature freeze for edk2-stable202008
> 
>   https://github.com/tianocore/tianocore.github.io/wiki/EDK-II-Release-Planning#edk2-stable202008-tag-planning
> 
> and we shouldn't make a release with ICH9_LPC_SMI_F_CPU_HOTPLUG
> negotiated, knowing that there are races.
> 
> 
> Please advise!
> 
> Thanks,
> Laszlo


