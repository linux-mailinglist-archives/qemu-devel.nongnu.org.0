Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6D67251A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 18:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pICNY-0003kC-1n; Wed, 18 Jan 2023 12:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pICNP-0003ic-C3
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:37:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pICNN-00028e-DY
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674063448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EcOGpMJZHpvpIVLPl2NxaPq3qMDI707uF0xETD21OrE=;
 b=X0C3wHuMpF46eH+trl+uMvkRsqs3OhaekG5L9lGZMNddflN8fhpyx5W6s6Mm8HPvQkaFtc
 Zq1fr2DRCxCHjeOHo7vcHkIUZGP1pQCpG2dRc3O5dglRgBS5/vvnvC8KvQ/BMk/f1wL4h+
 KFC22fVPWnSXrmH5st6WRH2lL8HbJGQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-ppKmffdfMj6cPFITbHfZCQ-1; Wed, 18 Jan 2023 12:37:26 -0500
X-MC-Unique: ppKmffdfMj6cPFITbHfZCQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1772185A588;
 Wed, 18 Jan 2023 17:37:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1D54492B02;
 Wed, 18 Jan 2023 17:37:25 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
In-Reply-To: <b92e6786-acc6-50ef-8804-e4e3ef4eb2d6@linaro.org>
Organization: Red Hat GmbH
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <b92e6786-acc6-50ef-8804-e4e3ef4eb2d6@linaro.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 18 Jan 2023 18:37:24 +0100
Message-ID: <87fsc7oiaz.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

On Tue, Jan 17 2023, Richard Henderson <richard.henderson@linaro.org> wrote:

> On 1/11/23 06:13, Cornelia Huck wrote:
>> @@ -2136,7 +2136,7 @@ static void machvirt_init(MachineState *machine)
>>   
>>       if (vms->mte && (kvm_enabled() || hvf_enabled())) {
>>           error_report("mach-virt: %s does not support providing "
>> -                     "MTE to the guest CPU",
>> +                     "emulated MTE to the guest CPU",
>>                        kvm_enabled() ? "KVM" : "HVF");
>
> Not your bug, but noticing this should use current_accel_name().

I can fix it as I'm touching the code anyway.

(Hm... two more of these right above. Maybe better in a separate patch.)

>
>> +static inline bool arm_machine_has_tag_memory(void)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    Object *obj = object_dynamic_cast(qdev_get_machine(), TYPE_VIRT_MACHINE);
>> +
>> +    /* so far, only the virt machine has support for tag memory */
>> +    if (obj) {
>> +        VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +        return vms->mte;
>> +    }
>> +#endif
>> +    return false;
>> +}
>
> True for CONFIG_USER_ONLY, via page_get_target_data().
> You should have seen check-tcg test failures...

Weird, let me check my setup...

>
>> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
>> +{
>> +    bool enable_mte;
>> +
>> +    switch (cpu->prop_mte) {
>> +    case ON_OFF_AUTO_OFF:
>> +        enable_mte = false;
>> +        break;
>> +    case ON_OFF_AUTO_ON:
>> +        if (!kvm_enabled()) {
>
> tcg_enabled(), here and everywhere else you test for !kvm.
>
>> +#ifdef CONFIG_KVM
>> +        if (kvm_enabled() && !kvm_arm_mte_supported()) {
>
> kvm_arm.h should get a stub inline returning false, so that the ifdef is removed.
> See e.g. kvm_arm_sve_supported().

Oh, I actually did add it already...

>
>> +    default: /* AUTO */
>> +        if (!kvm_enabled()) {
>
> tcg_enabled.
>
>> +    /* accelerator-specific enablement */
>> +    if (kvm_enabled()) {
>> +#ifdef CONFIG_KVM
>> +        if (kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0)) {
>> +            error_setg(errp, "Failed to enable KVM_CAP_ARM_MTE");
>
> Ideally this ifdef could go away as well.
>
>> +        } else {
>> +            /* TODO: add proper migration support with MTE enabled */
>> +            if (!mte_migration_blocker) {
>
> Move the global variable here, as a local static?
>
> I guess this check is to avoid adding one blocker per cpu?
> I would guess the cap doesn't need enabling more than once either?

Indeed, it's a VM cap. (I only tested this on a single-cpu FVP setup.)

>
>
>> +                error_setg(&mte_migration_blocker,
>> +                           "Live migration disabled due to MTE enabled");
>> +                if (migrate_add_blocker(mte_migration_blocker, NULL)) {
>
> You pass NULL to the migrate_add_blocker errp argument...
>
>> +                    error_setg(errp, "Failed to add MTE migration blocker");
>
> ... then make up your own generic reason for why it failed.
> In this case it seems only related to another command-line option: --only-migratable.
>
>
> Anyway, I wonder about hiding all of this in target/arm/kvm.c:
>
> bool kvm_arm_enable_mte(Error *errp)
> {
>      static bool once = false;
>      Error *blocker;
>
>      if (once) {
>          return;
>      }
>      once = true;
>
>      if (kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0)) {
>          error_setg_errno(errp, "Failed to enable KVM_CAP_ARM_MTE");
>          return false;
>      }
>
>      blocker = g_new0(Error);
>      error_setg(blocker, "Live migration disabled....");
>      return !migrate_add_blocker(blocker, errp);
> }
>
> with
>
> static inline bool kvm_arm_enable_mte(Error *errp)
> {
>      g_assert_not_reached();
> }
>
> in the !CONFIG_KVM block in kvm_arm.h.

Good suggestion, I'll give that one a try.

Thanks for the feedback!


