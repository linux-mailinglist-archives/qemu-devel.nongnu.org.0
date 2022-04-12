Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5494FCC37
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 04:11:31 +0200 (CEST)
Received: from localhost ([::1]:33314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne60A-0003u2-4t
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 22:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ne5xu-0002co-4n
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 22:09:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ne5xr-0001K3-Sl
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 22:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649729346;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQRTCdYnUVnxvFF4EycVANBE39ROB+aoAwgV2aW9yqc=;
 b=S0GVxv6jimMmMWltM2/7CG9BQhPUUGf1t0e86FWZHv25R+JbIC0aMEKyN7OMr8TiW7F2Gb
 j533wMU2OZHeLiYD2Y/6x2LDGMrfGTs7kYM0vVqodoCQWdANKVLkYr9iTCokTrDBcssKWP
 4yYdEzN4+O7NQjs+VycthifF5njGhP0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-BR6OIHo3PuCn8vM2jjtatw-1; Mon, 11 Apr 2022 22:09:03 -0400
X-MC-Unique: BR6OIHo3PuCn8vM2jjtatw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01B39101AA46;
 Tue, 12 Apr 2022 02:09:03 +0000 (UTC)
Received: from [10.72.12.73] (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E114854AC81;
 Tue, 12 Apr 2022 02:08:54 +0000 (UTC)
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
 <20220411120216.63r7ggy43y7ttvhp@gator>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <a7cf6aa7-6773-3ba1-c029-a42e995697b4@redhat.com>
Date: Tue, 12 Apr 2022 10:08:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220411120216.63r7ggy43y7ttvhp@gator>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: agraf@csgraf.de, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 4/11/22 8:02 PM, Andrew Jones wrote:
> On Mon, Apr 11, 2022 at 10:22:59AM +0100, Peter Maydell wrote:
>> On Mon, 11 Apr 2022 at 07:59, Gavin Shan <gshan@redhat.com> wrote:
>>>
>>> There are two arrays for each CPU, to store the indexes and values of the
>>> coprocessor registers. Currently, 8 bytes fixed storage space is reserved
>>> for each coprocessor register. However, larger coprocessor registers have
>>> been defined and exposed by KVM. Except SVE registers, no coprocessor
>>> register exceeds 8 bytes in size. It doesn't mean large coprocessor registers
>>> won't be exploited in future. For example, I'm looking into SDEI virtualization
>>> support, which isn't merged into Linux upstream yet. I have plan to add
>>> several coprocessor ("firmware pseudo") registers to assist the migration.
>>
>> So, can you give an example of coprocessor registers which are
>> not 8 bytes in size? How are they accessed by the guest?
>> If we need to support them then we need to support them, but this
>> cover letter/series doesn't seem to me to provide enough detail
>> to make the case that they really are necessary.
>>
>> Also, we support SVE today, and we don't have variable size
>> coprocessor registers. Is there a bug here that we would be
>> fixing ?
> 
> SVE registers are KVM_REG_SIZE_U2048 and KVM_REG_SIZE_U256 sized
> registers. They work fine (just like the VFP registers which are
> KVM_REG_SIZE_U128 sized). They work because they don't get stored in the
> cpreg list. SVE and CORE (which includes VFP) registers are filtered
> out by kvm_arm_reg_syncs_via_cpreg_list(). Since they're filtered
> out they need to be handled specifically by kvm_arch_get/put_registers()
> 
> I asked Gavin to check if following the SVE pattern made sense for his
> use case prior to sending this series, but I don't see the rationale for
> not following the SVE pattern in this cover letter. Gavin, can you please
> explain why following the SVE pattern doesn't work? Or, are you trying to
> avoid adding an additional special case?
> 

Yes, SVE registers are special case. They're not synchronized through
coprocessor register list as you mentioned. For SDEI, we mimic PSCI
because both of them are firmware interfaces.

PSCI's pseudo-registers are synchronized and migrated through the
coprocessor register list. Besides, treating SDEI as additional
special case should work, but more maintaining load will be introduced.
We need separate functions to get/set SDEI's pseudo registers, like
what we did for SVE.

Thanks,
Gavin


