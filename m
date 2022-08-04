Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11892589D39
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 16:07:26 +0200 (CEST)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJbVU-00014X-Bt
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 10:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJbSo-0005pc-9Z
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJbSj-0002U3-SQ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659621861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dmSVDYGbXMTeJHl9eAFOW4MPaRNS8VX4Eqhkpbr0i0=;
 b=C2/3u+BTGJP/vvmTITiwehkXeYCD5ynvAWpT7OdQPkPVhlmTtIafpN//90KXz3V+q30jrI
 ZLmmQpfUg5VDU1jeyRXSkoAc42fuetxPgso8gzDZBTDke4alATFKsmSM1RZlg5zX9/BRhf
 cWTpVw47yz+OqPO2VrfH2PKgpsp3KXA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-jeIQ9N99NYuR5JLSUctk2A-1; Thu, 04 Aug 2022 10:04:16 -0400
X-MC-Unique: jeIQ9N99NYuR5JLSUctk2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3681B85A588;
 Thu,  4 Aug 2022 14:04:16 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D12C018EB7;
 Thu,  4 Aug 2022 14:04:13 +0000 (UTC)
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
From: Laszlo Ersek <lersek@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
 <berrange@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-efi <linux-efi@vger.kernel.org>
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com> <Yuu1kX9CAqSUNNAj@zx2c4.com>
 <Yuu3ee1iB3IoLdZS@redhat.com>
 <CAMj1kXFAz1ttRmt5_utReSC=TjdfmrgwbwSaAZTDnx6OPGuRRg@mail.gmail.com>
 <cf60456e-a2cd-a64d-0cee-4bea30708fc9@redhat.com>
 <CAHmME9pUdckUwei234Xdge_G-=b6q2e9a8mTVExrV4WE=6TLig@mail.gmail.com>
 <8254819e-d509-59f4-79e6-e8c0ba4eb2a6@redhat.com>
Message-ID: <104cb8bf-f3b5-6fc0-302b-3532963ed87a@redhat.com>
Date: Thu, 4 Aug 2022 16:04:12 +0200
MIME-Version: 1.0
In-Reply-To: <8254819e-d509-59f4-79e6-e8c0ba4eb2a6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/04/22 15:56, Laszlo Ersek wrote:
> On 08/04/22 15:28, Jason A. Donenfeld wrote:
>> On Thu, Aug 4, 2022 at 3:25 PM Laszlo Ersek <lersek@redhat.com> wrote:
>>>
>>> On 08/04/22 14:16, Ard Biesheuvel wrote:
>>>> On Thu, 4 Aug 2022 at 14:11, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>
>>>>> On Thu, Aug 04, 2022 at 02:03:29PM +0200, Jason A. Donenfeld wrote:
>>>>>> Hi Daniel,
>>>>>>
>>>>>> On Thu, Aug 04, 2022 at 10:25:36AM +0100, Daniel P. Berrangé wrote:
>>>>>>> Yep, and ultimately the inability to distinguish UEFI vs other firmware
>>>>>>> is arguably correct by design, as the QEMU <-> firmware interface is
>>>>>>> supposed to be arbitrarily pluggable for any firmware implementation
>>>>>>> not  limited to merely UEFI + seabios.
>>>>>>
>>>>>> Indeed, I agree with this.
>>>>>>
>>>>>>>
>>>>>>>> For now I suggest either reverting the original patch, or at least not
>>>>>>>> enabling the knob by default for any machine types. In particular, when
>>>>>>>> using MicroVM, the user must leave the knob disabled when direct booting
>>>>>>>> a kernel on OVMF, and the user may or may not enable the knob when
>>>>>>>> direct booting a kernel on SeaBIOS.
>>>>>>>
>>>>>>> Having it opt-in via a knob would defeat Jason's goal of having the seed
>>>>>>> available automatically.
>>>>>>
>>>>>> Yes, adding a knob is absolutely out of the question.
>>>>>>
>>>>>> It also doesn't actually solve the problem: this triggers when QEMU
>>>>>> passes a DTB too. It's not just for the new RNG seed thing. This bug
>>>>>> isn't new.
>>>>>
>>>>> In the other thread I also mentioned that this RNG Seed addition has
>>>>> caused a bug with AMD SEV too, making boot measurement attestation
>>>>> fail because the kernel blob passed to the firmware no longer matches
>>>>> what the tenant expects, due to the injected seed.
>>>>>
>>>>
>>>> I was actually expecting this to be an issue in the
>>>> signing/attestation department as well, and you just confirmed my
>>>> suspicion.
>>>>
>>>> But does this mean that populating the setup_data pointer is out of
>>>> the question altogether? Or only that putting the setup_data linked
>>>> list nodes inside the image is a problem?
>>>
>>> QEMU already has to inject a whole bunch of stuff into confidential
>>> computing guests. The way it's done (IIRC) is that the non-compressed,
>>> trailing part of pflash (basically where the reset vector code lives
>>> too) is populated at OVMF build time with a chain of GUID-ed structures,
>>> and fields of those structures are filled in (at OVMF build time) from
>>> various fixed PCDs. The fixed PCDs in turn are populated from the FD
>>> files, using various MEMFD regions. When QEMU launches the guest, it can
>>> parse the GPAs from the on-disk pflash image (traversing the list of
>>> GUID-ed structs), at which addresses the guest firmware will then expect
>>> the various crypto artifacts to be injected.
>>>
>>> The point is that "who's in control" is reversed. The firmware exposes
>>> (at build time) at what GPAs it can accept data injections, and QEMU
>>> follows that. Of course the firmware ensures that nothing else in the
>>> firmware will try to own those GPAs.
>>>
>>> The only thing that needed to be hard-coded when this feature was
>>> introduced was the "entry point", that is, the flash offset at which
>>> QEMU starts the GUID-ed structure traversal.
>>>
>>> AMD and IBM developers can likely much better describe this mechanism,
>>> as I've not dealt with it in over a year. The QEMU side code is in
>>> "hw/i386/pc_sysfw_ovmf.c".
>>>
>>> We can make setup_data chaining work with OVMF, but the whole chain
>>> should be located in a GPA range that OVMF dictates.
>>
>> It sounds like what you describe is pretty OVMF-specific though,
>> right?
> 
> Yes, completely OVMF specific.
> 
>> Do we want to tie things together so tightly like that?
> 
> It depends on what the goal is:
> 
> - do we want setup_data chaining work generally?
> 
> - or do we want only the random seed injection to stop crashing OVMF guests?
> 
> In the latter case, we only need to teach QEMU to reliably recognize
> OVMF from the on-disk firmware binary (regardless of pflash use), and
> then not expose any setup_data in guest RAM. The UEFI guest kernel will
> use EFI_RNG_PROTOCOL (when available, from virtio-rng-pci), and no
> particular seed otherwise.
> 
> (This is the "papering over" case, which I don't think is necessarily
> wrong; only it should be robust. I thought pflash would be usable for
> that; turns out it isn't. Thus, we could perhaps try identifying a
> firmware binary as "OVMF" by contents.)
> 
> In the former case though, I think the "tight coupling" is unavoidable.
> As long as setup_data is needed by the kernel extremely early, no
> "firmware hiding" or "firmware independence" is in place yet.
> 
>> Given we only need 48 bytes or so, isn't there a more subtle place we
>> could just throw this in ram that doesn't need such complex
>> coordination?
> 
> These tricks add up and go wrong after a while. The pedantic
> reservations in the firmware have proved necessary.
> 
> IIUC, with v2, the setup_data_base address would (most frequently) be 96
> KB. edk2 does have uses for very low memory. If OVMF's PlatformPei does
> not reserve away the area, UefiCpuPkg or other drivers might allocate an
> overlapping chunk, even if only temporarily. That might not break the
> firmware, but it could overwrite the random seed. If the guest kernel
> somehow consumed that seed (rather than getting one from
> EFI_RNG_PROTOCOL -- what if no virtio-rng-pci device was configured?),
> that could potentially destroy the guest's security, without any
> obvious/immediate signs.

I must add however that I feel very much out of place making
authoritative-sounding statements like this. The above is my honest
opinion, and my (unpleasant) writing style, but it's just that: my
opinion & style. So much has happened in edk2 and QEMU since last summer
(without me following them closely) that I feel uncomfortable speaking
on them. Take whatever I say with a grain of salt, and definitely
research all options.

Laszlo


