Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5665769EDFA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 05:37:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUgrf-0003UZ-8w; Tue, 21 Feb 2023 23:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUgrZ-0003TC-Lp
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUgrX-0007xX-Iz
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677040573;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9GaOIeIsg/f2K7YaLsA1s6GTEYz4G5fk3/qaTYYYoM=;
 b=L/5z+NAMScNVaifJTepedu6MyIKYjWOrMEK6FVFsCrJT0bxesBurpYZGiM7bAInvlG8sOH
 69jQyDCP5HBs3iDVjdBB/fQ0LR6e2Sf0P89nsdfwf761Jp9DcFSPR6L3+lmaEPh0buGL3I
 zdnikX/K7aPgFAvgSVssa1ebRqdx6TI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-LQuFvXUENfC7V5YDT1CRug-1; Tue, 21 Feb 2023 23:36:09 -0500
X-MC-Unique: LQuFvXUENfC7V5YDT1CRug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 886A180D101;
 Wed, 22 Feb 2023 04:36:08 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E18F01121314;
 Wed, 22 Feb 2023 04:35:58 +0000 (UTC)
Subject: Re: [PATCH v1 5/6] hw/arm/virt: Enable backup bitmap for dirty ring
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-6-gshan@redhat.com>
 <CAFEAcA_6pYvot1AGKfOQA89M9tdH-e6+9jkd3RtXJkGhSLdihA@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <0db2764b-7d27-ee6a-c7e4-7d7821986c16@redhat.com>
Date: Wed, 22 Feb 2023 15:35:53 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6pYvot1AGKfOQA89M9tdH-e6+9jkd3RtXJkGhSLdihA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/22/23 3:27 AM, Peter Maydell wrote:
> On Mon, 13 Feb 2023 at 00:40, Gavin Shan <gshan@redhat.com> wrote:
>>
>> When KVM device "kvm-arm-gicv3" or "arm-its-kvm" is used, we have to
>> enable the backup bitmap for the dirty ring. Otherwise, the migration
>> will fail because those two devices are using the backup bitmap to track
>> dirty guest memory, corresponding to various hardware tables.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   hw/arm/virt.c        | 26 ++++++++++++++++++++++++++
>>   target/arm/kvm64.c   | 25 +++++++++++++++++++++++++
>>   target/arm/kvm_arm.h | 12 ++++++++++++
>>   3 files changed, 63 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 75f28947de..ea9bd98a65 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2024,6 +2024,8 @@ static void machvirt_init(MachineState *machine)
>>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>       const CPUArchIdList *possible_cpus;
>> +    const char *gictype = NULL;
>> +    const char *itsclass = NULL;
>>       MemoryRegion *sysmem = get_system_memory();
>>       MemoryRegion *secure_sysmem = NULL;
>>       MemoryRegion *tag_sysmem = NULL;
>> @@ -2071,6 +2073,30 @@ static void machvirt_init(MachineState *machine)
>>        */
>>       finalize_gic_version(vms);
>>
>> +    /*
>> +     * When "kvm-arm-gicv3" or "arm-its-kvm" is used, the backup dirty
>> +     * bitmap has to be enabled for KVM dirty ring, before any memory
>> +     * slot is added. Otherwise, the migration will fail with the dirty
>> +     * ring.
>> +     */
>> +    if (kvm_enabled()) {
>> +        if (vms->gic_version != VIRT_GIC_VERSION_2) {
>> +            gictype = gicv3_class_name();
>> +        }
>> +
>> +        if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
>> +            itsclass = its_class_name();
>> +        }
>> +
>> +        if (((gictype && !strcmp(gictype, "kvm-arm-gicv3")) ||
>> +             (itsclass && !strcmp(itsclass, "arm-its-kvm"))) &&
>> +            !kvm_arm_enable_dirty_ring_with_bitmap()) {
>> +            error_report("Failed to enable the backup bitmap for "
>> +                         "KVM dirty ring");
>> +            exit(1);
>> +        }
>> +    }
> 
> Why does this need to be board-specific code? Is there
> some way we can just do the right thing automatically?
> Why does the GIC/ITS matter?
> 
> The kernel should already know whether we have asked it
> to do something that needs this extra extension, so
> I think we ought to be able in the generic "enable the
> dirty ring" code say "if the kernel says we need this
> extra thing, also enable this extra thing". Or if that's
> too early, we can do the extra part in a generic hook a
> bit later.
> 
> In the future there might be other things, presumably,
> that need the backup bitmap, so it would be more future
> proof not to need to also change QEMU to add extra
> logic checks that duplicate the logic the kernel already has.
> 

When the dirty ring is enabled, a per-vcpu buffer is used to track the dirty pages.
The prerequisite to use the per-vcpu buffer is existing running VCPU context. There
are two cases where no running VCPU context exists and the backup bitmap extension
is needed, as we know until now: (a) save/restore GICv3 tables; (b) save/restore ITS
tables; These two cases are related to KVM device "kvm-arm-gicv3" and "arm-its-kvm",
which are only needed by virt machine at present. So we needn't the backup bitmap
extension for other boards.

The host kernel always exports the capability KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP
for ARM64. The capability isn't exported for x86 because we needn't it there. The
generic path to enable the extension would be in kvm_init(). I think the extension
is enabled unconditionally if it has been exported by host kernel. It means there
will be unnecessary overhead to synchronize the backup bitmap when the aforementioned
KVM devices aren't used, but the overhead should be very small and acceptable. The
only concern is host kernel has to allocate the backup bitmap, which is totally no
use. Please let me know your thoughts, Peter.


qemu_init
   qemu_create_machine
     :
     :
   configure_accelerators
     do_configure_accelerator
       accel_init_machine
         kvm_init                            // Where the dirty ring is eanbled. Would be best
           kvm_arch_init                     // place to enable the backup bitmap extension regardless
     :                                       // of 'kvm-arm-gicv3' and 'arm-its-kvm' are used
     :
   qmp_x_exit_preconfig
     qemu_init_board
       machine_run_board_init
         machvirt_init                      // memory slots are added here and where we know the KVM devices
     :                                      // are used
     :
   accel_setup_post                         // no backend for KVM yet, xen only

Note that the capability KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP can't be enabled if
the dirty ring isn't enabled or memory slots have been added.

Thanks,
Gavin


