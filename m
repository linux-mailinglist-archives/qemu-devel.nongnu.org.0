Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892A54FED3B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 04:57:48 +0200 (CEST)
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neTCV-0001np-6o
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 22:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1neTAY-00010S-EM
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 22:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1neTAV-0007uD-JD
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 22:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649818542;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acnOdcqbdLCeiRWIl7NHWQrI712aVuzhm/jY/W794YY=;
 b=WzmymcavjtcmhRJ0IfNwP8sviOW1szJ+pnaLcbJJewEfSG8ZVtP/OtBe2Fo5e2GjnP/E+2
 HIX/ALcAGBISHDvUsgDUa0bJvJbv4Br9pPAKX5kbKA8FwtDdru1UcadGK0hHR8lyHPWLpa
 9KMXLHc5FepMHX6OBBIx+Sn4Tya5XNo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-wjVduh93Oc6t47hm3LI8Wg-1; Tue, 12 Apr 2022 22:55:39 -0400
X-MC-Unique: wjVduh93Oc6t47hm3LI8Wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99F74299E77A;
 Wed, 13 Apr 2022 02:55:38 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 923C62166B1B;
 Wed, 13 Apr 2022 02:55:29 +0000 (UTC)
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
 <20220411120216.63r7ggy43y7ttvhp@gator>
 <CAFEAcA_PfakDVFvNCF55FGoV0A=141CNdtqvgPjheSGvpVqh+A@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <0eb22327-0724-769c-11ea-1c57086e09fe@redhat.com>
Date: Wed, 13 Apr 2022 10:55:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PfakDVFvNCF55FGoV0A=141CNdtqvgPjheSGvpVqh+A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: agraf@csgraf.de, Oliver Upton <oupton@google.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com,
 Raghavendra Rao Ananta <rananta@google.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 4/11/22 8:10 PM, Peter Maydell wrote:
> On Mon, 11 Apr 2022 at 13:02, Andrew Jones <drjones@redhat.com> wrote:
>> On Mon, Apr 11, 2022 at 10:22:59AM +0100, Peter Maydell wrote:
>>> Also, we support SVE today, and we don't have variable size
>>> coprocessor registers. Is there a bug here that we would be
>>> fixing ?
>>
>> SVE registers are KVM_REG_SIZE_U2048 and KVM_REG_SIZE_U256 sized
>> registers. They work fine (just like the VFP registers which are
>> KVM_REG_SIZE_U128 sized). They work because they don't get stored in the
>> cpreg list. SVE and CORE (which includes VFP) registers are filtered
>> out by kvm_arm_reg_syncs_via_cpreg_list(). Since they're filtered
>> out they need to be handled specifically by kvm_arch_get/put_registers()
> 
> Right, this is the distinction between ONE_REG registers and
> coprocessor registers (which are a subset of ONE_REG registers).
> We wouldn't want to handle SVE regs in the copro list anyway,
> I think, because we want their state to end up in env->vfp.zregs[]
> so the gdbstub can find it there. And we wouldn't have benefited
> from the copro regs handling's "no need for new QEMU to handle
> migrating state of a new register" because we needed a lot of
> special case code for SVE and couldn't enable it by default
> for other reasons.
> 

Yep, those new introduced SDEI pseudo-registers, the intention
is to avoid the special case code. So the coprocessor register
list fits the need well. The only barrier to use the coprocessor
register list is the variable register sizes.

> If we do add non-64-bit cpregs on the kernel side then we need to
> make those new registers opt-in, because currently deployed QEMU
> will refuse to start if the kernel passes it a register in the
> KVM_GET_REG_LIST that is larger than 64 bits and isn't
> KVM_REG_ARM_CORE or KVM_REG_ARM64_SVE (assuming I'm not misreading
> the QEMU code).
> 

Yes, we need make those new registers opt-in absolutely. Otherwise,
the old qemu, which doesn't have variable sized registers supported,
will crash on host kernel, where large sized registers are exposed
unconditionally.

I spent some time to think of the mechanisms for opt-in. There are
two options as I can figure out: (1) Using KVM_CAP_ARM_SDEI to check
if the large sized registers exist. (2) Using newly introduced
pseudo-register ("KVM_REG_ARM_STD_BMAP") in Raghavendra's series [1].
The individual bit in this pseudo-register corresponds to one
service in "standard hypervisor" category, where SDEI falls into.

I prefer (2) because those services or firmware interfaces are
exposed in a collective way by KVM_REG_ARM_STD_BMAP, comparing
to the individual capabilities. However, they are same in essence.
Another benefit to use KVM_REG_ARM_STD_BMAP is hiding SDEI interface
and the large sized registers for old QEMU.

[1] https://lore.kernel.org/linux-arm-kernel/20220407011605.1966778-10-rananta@google.com/T/#m0bc1aa4048ca157e8e99c593b3f349b879032543

Thanks,
Gavin


