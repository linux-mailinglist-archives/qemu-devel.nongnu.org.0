Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E92529E7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 11:25:14 +0200 (CEST)
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kArg9-0005sf-FR
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 05:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kArfM-0005DF-TU
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 05:24:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38858
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kArfL-0006TE-0J
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 05:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598433861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f9OaAyXvmlP4zEw3afs4eOwEfB03JurWomMf0MGpvGo=;
 b=R/sVmWRXLmxXPA5TLinpMV0OWfKXon5+E3zvpu0KoSIWvoj5oNHrKQGB1d0OUTvqUCX1ab
 PzlXQUiGrDZiwNxkgzh7Y+WGbbvNMXE36McxmqymWx/tgQgepQJE+caimkCbeF0jVff6Qu
 D4sQg6JWrjEK0yqAn3b+ANN4vc/Ya9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-6VZ27VBTONazBuPkqYD2EQ-1; Wed, 26 Aug 2020 05:24:17 -0400
X-MC-Unique: 6VZ27VBTONazBuPkqYD2EQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB7EE80B71A;
 Wed, 26 Aug 2020 09:24:16 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-182.ams2.redhat.com
 [10.36.114.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C6BA60D34;
 Wed, 26 Aug 2020 09:24:15 +0000 (UTC)
Subject: Re: [PATCH v2 6/7] x68: acpi: trigger SMI before sending hotplug
 Notify event to OSPM
From: Laszlo Ersek <lersek@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <20200818122208.1243901-1-imammedo@redhat.com>
 <20200818122208.1243901-7-imammedo@redhat.com>
 <382e54cc-1ac0-61e5-bf5d-0653480222a0@redhat.com>
Message-ID: <cfd4dd52-4827-2288-4b4e-b396d48494f0@redhat.com>
Date: Wed, 26 Aug 2020 11:24:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <382e54cc-1ac0-61e5-bf5d-0653480222a0@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 01:10:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.602, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, aaron.young@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 08/25/20 19:25, Laszlo Ersek wrote:

> So I would suggest fetching the CNEW array element back into "uid"
> first, then using "uid" for both the NOTIFY call, and the (currently
> missing) restoration of CSEL. Then we can write 1 to CINS.
>
> Expressed as a patch on top of yours:
>
>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
>> index 4864c3b39694..2bea6144fd5e 100644
>> --- a/hw/acpi/cpu.c
>> +++ b/hw/acpi/cpu.c
>> @@ -564,8 +564,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>              aml_append(method, aml_store(zero, cpu_idx));
>>              while_ctx = aml_while(aml_lless(cpu_idx, num_added_cpus));
>>              {
>> -                aml_append(while_ctx, aml_call2(CPU_NOTIFY_METHOD,
>> -                    aml_derefof(aml_index(new_cpus, cpu_idx)), dev_chk));
>> +                aml_append(while_ctx,
>> +                    aml_store(aml_derefof(aml_index(new_cpus, cpu_idx)), uid));
>> +                aml_append(while_ctx,
>> +                    aml_call2(CPU_NOTIFY_METHOD, uid, dev_chk));
>> +                aml_append(while_ctx, aml_store(uid, cpu_selector));
>>                  aml_append(while_ctx, aml_store(one, ins_evt));
>>                  aml_append(while_ctx, aml_increment(cpu_idx));
>>              }
>
> This effects the following change, in the decompiled method:
>
>> @@ -37,15 +37,17 @@
>>      If ((Local_NumAddedCpus != Zero))
>>      {
>>          \_SB.PCI0.SMI0.SMIC = 0x04
>>      }
>>
>>      Local_CpuIdx = Zero
>>      While ((Local_CpuIdx < Local_NumAddedCpus))
>>      {
>> -        CTFY (DerefOf (CNEW [Local_CpuIdx]), One)
>> +        Local_Uid = DerefOf (CNEW [Local_CpuIdx])
>> +        CTFY (Local_Uid, One)
>> +        \_SB.PCI0.PRES.CSEL = Local_Uid
>>          \_SB.PCI0.PRES.CINS = One
>>          Local_CpuIdx++
>>      }
>>
>>      Release (\_SB.PCI0.PRES.CPLK)
>>  }
>
> With this change, the
>
>   virsh setvcpus DOMAIN 8 --live
>
> command works for me. The topology in my test domain has CPU#0 and
> CPU#2 cold-plugged, so the command adds 6 VCPUs. Viewed from the
> firmware side, the 6 "device_add" commands, issued in close succession
> by libvirtd, coalesce into 4 "batches". (And of course the firmware
> sees the 4 batches back-to-back.)

unfortunately, with more testing, I have run into two more races:

(1) When a "device_add" occurs after the ACPI loop collects the CPUS
    from the register block, but before the SMI.

    Here, the "stray CPU" is processed fine by the firmware. However,
    the CTFY loop in ACPI does not know about the CPU, so it doesn't
    clear the pending insert event for it. And when the firmware is
    entered with an SMI for the *next* time, the firmware sees the same
    CPU *again* as pending, and tries to relocate it again. Bad things
    happen.

(2) When a "device_add" occurs after the SMI, but before the firmware
    collects the pending CPUs from the register block.

    Here, the firmware collects the "stray CPU". However, the "broadcast
    SMI", with which we entered the firmware, did *not* cover the stray
    CPU -- the CPU_FOREACH() loop in ich9_apm_ctrl_changed() could not
    make the SMI pending for the new CPU, because at that time, the CPU
    had not been added yet. As a result, when the firmware sends an
    INIT-SIPI-SIPI to the new CPU, expecting it to boot right into SMM,
    the new CPU instead boots straight into the post-RSM (normal mode)
    "pen", skipping its initial SMI handler. Meaning that the CPU halts
    nicely, but its SMBASE is never relocated, and the SMRAM message
    exchange with the BSP falls apart.

Possible mitigations I can think of:

For problem (1):

  (1a) Change the firmware so it notices that it has relocated the
       "stray" CPU before -- such CPUs should be simply skipped in the
       firmware. The next time the CTFY loop runs in ACPI, it will clear
       the pending event.

  (1b) Alternatively, stop consuming the hotplug register block in the
       firmware altogether, and work out general message passing, from
       ACPI to firmware. See the outline here:

         http://mid.mail-archive.com/cf887d74-f65d-602a-9629-3d25cef93a69@redhat.com

For problem (2):

  (2a) Change the firmware so that it sends a directed SMI as well to
       each CPU, just before sending an INIT-SIPI-SIPI. This should be
       idempotent -- if the broadcast SMI *has* covered the the CPU,
       then sending a directed SMI should make no difference.

  (2b) Alternatively, change the "device_add" command in QEMU so that,
       if "CPU hotplug with SMI" has been negotiated, the new CPU is
       added with the SMI made pending for it at once. (That is, no
       hot-plugged CPU would exist with the directed SMI *not* pending
       for it.)

  (2c) Alternatively, approach (1b) would fix problem (2) as well -- the
       firmware would only relocate such CPUs that ACPI collected before
       injecting the SMI. So all those CPUs would have the SMI pending.


I can experiment with (1a) and (2a), but note that for unplug, we're
likely going to need the array passing method (1b) anyway. I'm concerned
that (1a) and (2a) together may not fix all possible races (i.e. we
might see more kinds).

What's important is that, *IF* we need to change anything in the
firmware for fixing these races, then we either need to do so urgently,
*or* I have to revert OVMF commit 5ba203b54e59 ("OvmfPkg/SmmControl2Dxe:
negotiate ICH9_LPC_SMI_F_CPU_HOTPLUG", 2020-08-24).

That's because we're in feature freeze for edk2-stable202008

  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II-Release-Planning#edk2-stable202008-tag-planning

and we shouldn't make a release with ICH9_LPC_SMI_F_CPU_HOTPLUG
negotiated, knowing that there are races.


Please advise!

Thanks,
Laszlo


