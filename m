Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD60F6A0036
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 01:54:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUzr6-0003Fq-Le; Wed, 22 Feb 2023 19:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUzr4-0003F9-5H
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 19:53:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUzr1-0005vK-Ug
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 19:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677113578;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTwYTEGCR3XNlJQ+6gvcIOS6c6BQiCmTIACypV3HzLQ=;
 b=jAbPtE07/R4bxC10UhG7lWAM0TCmpSVvYUcyLuIVmph8NCD752BDd2s8GnhmU5a9ukHnRc
 HLWyikoCsnIPX2Ge7N3zj4Po8TsuvL6bEbmquH3W5oxIK/JRawtokjhYbciEc6Vbt168OI
 cgcF6PYI+RjheJ4edXOjd5WQD0TjJBY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-Y4EMODT7Pt2su6KShazl5Q-1; Wed, 22 Feb 2023 19:52:53 -0500
X-MC-Unique: Y4EMODT7Pt2su6KShazl5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8E003806712;
 Thu, 23 Feb 2023 00:52:52 +0000 (UTC)
Received: from [10.64.54.168] (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF35D1121314;
 Thu, 23 Feb 2023 00:52:47 +0000 (UTC)
Subject: Re: [PATCH v1 5/6] hw/arm/virt: Enable backup bitmap for dirty ring
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-6-gshan@redhat.com>
 <CAFEAcA_6pYvot1AGKfOQA89M9tdH-e6+9jkd3RtXJkGhSLdihA@mail.gmail.com>
 <0db2764b-7d27-ee6a-c7e4-7d7821986c16@redhat.com>
 <CAFEAcA_WjugivvOWxH-bVSNakPWyhX=j5pWydQQpweDVDYd2jw@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <e0044c64-02f2-32d2-b096-50f9c1f1fe19@redhat.com>
Date: Thu, 23 Feb 2023 11:52:43 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_WjugivvOWxH-bVSNakPWyhX=j5pWydQQpweDVDYd2jw@mail.gmail.com>
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
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/23/23 2:54 AM, Peter Maydell wrote:
> On Wed, 22 Feb 2023 at 04:36, Gavin Shan <gshan@redhat.com> wrote:
>>
>> On 2/22/23 3:27 AM, Peter Maydell wrote:
>>> Why does this need to be board-specific code? Is there
>>> some way we can just do the right thing automatically?
>>> Why does the GIC/ITS matter?
>>>
>>> The kernel should already know whether we have asked it
>>> to do something that needs this extra extension, so
>>> I think we ought to be able in the generic "enable the
>>> dirty ring" code say "if the kernel says we need this
>>> extra thing, also enable this extra thing". Or if that's
>>> too early, we can do the extra part in a generic hook a
>>> bit later.
>>>
>>> In the future there might be other things, presumably,
>>> that need the backup bitmap, so it would be more future
>>> proof not to need to also change QEMU to add extra
>>> logic checks that duplicate the logic the kernel already has.
>>>
>>
>> When the dirty ring is enabled, a per-vcpu buffer is used to track the dirty pages.
>> The prerequisite to use the per-vcpu buffer is existing running VCPU context. There
>> are two cases where no running VCPU context exists and the backup bitmap extension
>> is needed, as we know until now: (a) save/restore GICv3 tables; (b) save/restore ITS
>> tables; These two cases are related to KVM device "kvm-arm-gicv3" and "arm-its-kvm",
>> which are only needed by virt machine at present. So we needn't the backup bitmap
>> extension for other boards.
> 
> But we might have to for other boards we add later. We shouldn't
> put code in per-board if it's not really board specific.
> 
> Moreover, I think "we need the backup bitmap if the kernel is
> using its GICv3 or ITS implementation" is a kernel implementation
> detail. It seems to me that it would be cleaner if QEMU didn't
> have to hardcode "we happen to know that these are the situations
> when we need to do that". A better API would be "ask the kernel
> 'do we need this?' and enable it if it says 'yes'". The kernel
> knows what its implementations of ITS and GICv3 (and perhaps
> future in-kernel memory-using devices) require, after all.
> 

Well, As we know so far, the backup bitmap extension is only required by 'kvm-arm-gicv3'
and 'arm-its-kvm' device. Those two devices are only used by virt machine at present.
So it's a board specific requirement. I'm not sure about the future. We may need to
enable the extension for other devices and other boards. That time, the requirement
isn't board specific any more. However, we're uncertain for the future.

In order to cover the future requirement, the extension is needed by other boards,
the best way I can figure out is to enable the extension in generic path in kvm_init()
if the extension is supported by the host kernel. In this way, the unnecessary overhead
is introduced for those boards where 'kvm-arm-vgic3' and 'arm-its-kvm' aren't used.
The overhead should be very small and acceptable. Note that the host kernel don't know
if 'kvm-arm-vgic3' or 'arm-its-kvm' device is needed by the board in kvm_init(), which
is the generic path.

The 'kvm-arm-vgic3' and 'arm-its-kvm' devices are created in machvirt_init(), where
the memory slots are also added. Prior to the function, host kernel doesn't know if
the extension is needed by QEMU. It means we have to enable the extension in machvirt_init(),
which is exactly what we're doing. The difference is QEMU decides to enable the extension
instead of being told to enable it by host kernel. Host kernel doesn't have the answer to
"Hey host kernel, do we need to enable the extension" until machvirt_init() where the devices
are created. Besides, machvirt_init() isn't the generic path if we want to enable the extension
for all possible boards. Further more, the extension can't be enabled if memory slots have been
added.

In summary, the best way I can figure out is to enable the extension in kvm_init() if it
has been supported by host kernel, to cover all possible boards for future cases. Otherwise,
we keep what we're doing to enable the extension in machvirt_init(). Please let me know your
thoughts, Peter :)

Thanks,
Gavin


