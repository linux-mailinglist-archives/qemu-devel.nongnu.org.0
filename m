Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B44E589B19
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 13:35:23 +0200 (CEST)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZ8M-0008Rj-5T
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 07:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJZ4u-0006JT-JF
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJZ4q-0000yy-W6
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659612704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6/238KjNtRbNKJ0OoJtmxuRsMMyg5R1/++hLMv5XGo=;
 b=B9b07z4vKVAx6H8A1Y5vndohivt/XaF8yK4B+KB3MuZFkaKN6RGxpmnQBuwBhf0Dcm4wI5
 4USnPuDVCzYskVYk5VLy+dXLO1oCquqEm0vGEmHE058jpldMztOk+TQEEXmE4hxSa8yN5d
 85xvrsOkIblcR4Fa3a+0P5xh6mDG9L0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-smDot8U6NlOhEHoPv4wzAA-1; Thu, 04 Aug 2022 07:31:40 -0400
X-MC-Unique: smDot8U6NlOhEHoPv4wzAA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 983131C16B4D;
 Thu,  4 Aug 2022 11:31:39 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70B7C492C3B;
 Thu,  4 Aug 2022 11:31:37 +0000 (UTC)
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: Ard Biesheuvel <ardb@kernel.org>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-efi <linux-efi@vger.kernel.org>
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com>
 <CAMj1kXFr6Bv4_G0-wCTu4fp_iCrG060NHJx_j2dbnyiFJKYYeQ@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <eadc852a-63f9-a017-aef7-f046eb56e28f@redhat.com>
Date: Thu, 4 Aug 2022 13:31:36 +0200
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFr6Bv4_G0-wCTu4fp_iCrG060NHJx_j2dbnyiFJKYYeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On 08/04/22 12:26, Ard Biesheuvel wrote:
> On Thu, 4 Aug 2022 at 11:25, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Thu, Aug 04, 2022 at 10:58:36AM +0200, Laszlo Ersek wrote:
>>> On 08/04/22 09:03, Michael S. Tsirkin wrote:
>>>> On Thu, Aug 04, 2022 at 02:44:11AM +0200, Jason A. Donenfeld wrote:
>>>>> The boot parameter header refers to setup_data at an absolute address,
>>>>> and each setup_data refers to the next setup_data at an absolute address
>>>>> too. Currently QEMU simply puts the setup_datas right after the kernel
>>>>> image, and since the kernel_image is loaded at prot_addr -- a fixed
>>>>> address knowable to QEMU apriori -- the setup_data absolute address
>>>>> winds up being just `prot_addr + a_fixed_offset_into_kernel_image`.
>>>>>
>>>>> This mostly works fine, so long as the kernel image really is loaded at
>>>>> prot_addr. However, OVMF doesn't load the kernel at prot_addr, and
>>>>> generally EFI doesn't give a good way of predicting where it's going to
>>>>> load the kernel. So when it loads it at some address != prot_addr, the
>>>>> absolute addresses in setup_data now point somewhere bogus, causing
>>>>> crashes when EFI stub tries to follow the next link.
>>>>>
>>>>> Fix this by placing setup_data at some fixed place in memory, relative
>>>>> to real_addr, not as part of the kernel image, and then pointing the
>>>>> setup_data absolute address to that fixed place in memory. This way,
>>>>> even if OVMF or other chains relocate the kernel image, the boot
>>>>> parameter still points to the correct absolute address.
>>>>>
>>>>> Fixes: 3cbeb52467 ("hw/i386: add device tree support")
>>>>> Reported-by: Xiaoyao Li <xiaoyao.li@intel.com>
>>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>> Cc: linux-efi@vger.kernel.org
>>>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>>>
>>>> Didn't read the patch yet.
>>>> Adding Laszlo.
>>>
>>> As I said in
>>> <http://mid.mail-archive.com/8bcc7826-91ab-855e-7151-2e9add88025a@redhat.com>,
>>> I don't believe that the setup_data chaining described in
>>> <https://www.kernel.org/doc/Documentation/x86/boot.rst> can be made work
>>> for UEFI guests at all, with QEMU pre-populating the links with GPAs.
>>>
>>> However, rather than introducing a new info channel, or reusing an
>>> existent one (ACPI linker/loader, GUID-ed structure chaining in pflash),
>>> for the sake of this feature, I suggest simply disabling this feature
>>> for UEFI guests. setup_data chaining has not been necessary for UEFI
>>> guests for years (this is the first time I've heard about it in more
>>> than a decade), and the particular use case (provide guests with good
>>> random seed) is solved for UEFI guests via virtio-rng / EFI_RNG_PROTOCOL.
>>>
>>> ... Now, here's my problem: microvm, and Xen.
>>>
>>> As far as I can tell, QEMU can determine (it already does determine)
>>> whether the guest uses UEFI or not, for the "pc" and "q35" machine
>>> types. But not for microvm or Xen!
>>>
>>> Namely, from pc_system_firmware_init() [hw/i386/pc_sysfw.c], we can
>>> derive that
>>>
>>>   pflash_cfi01_get_blk(pcms->flash[0])
>>>
>>> returning NULL vs. non-NULL stands for "BIOS vs. UEFI". Note that this
>>> is only valid after the inital part of pc_system_firmware_init() has run
>>> ("Map legacy -drive if=pflash to machine properties"), but that is not a
>>> problem, given the following call tree:
>>
>> I don't beleve that's a valid check anymore since Gerd introduced the
>> ability to load UEFI via -bios, for UEFI builds without persistent
>> variables. ( a8152c4e4613c70c2f0573a82babbc8acc00cf90 )
>>
> 
> I think there is a fundamental flaw in the QEMU logic where it adds
> setup_data nodes to the *file* representation of the kernel image.
> 
> IOW, loading the kernei image at address x, creating setup_data nodes
> in memory relative to x and then invoking the kernel image directly
> (as kexec does as well, AIUI) is perfectly fine.
> 
> Managing a file system abstraction and a generic interface to load its
> contents, and using it to load the kernel image anywhere in memory is
> also fine, and OVMF -kernel relies on this.
> 
> It is the combination of the two that explodes, unsurprisingly. Making
> inferences about which kind of firmware is invoking the file loading
> interface, and gating this behavior accordingly just papers over the
> problem.
> 
> Jason and I have been discussing this over IRC, and there are
> essentially 3 places we could address this:
> 1) in the Linux/x86 EFI stub, which has a 'pure EFI' entrypoint and a
> 'EFI handover protocol' entrypoint, and we could simply wipe the
> setup_data pointer in the former;
> 2) in OVMF's kernel loader, where we could 'fix up' the setup_data field
> 3) in QEMU, which [as I laid out above] does something it shouldn't be doing.
> 
> I strongly object to 2), as it would involve teaching OVMF's 'pure
> EFI' boot path about the intricacies of struct boot_params etc, which
> defeats the purpose of having a generic EFI boot path (Note that much
> of my work on the Linux/EFI subsystem over the past years has been
> focused on getting rid of all the arch-specific hacks and layering
> violations and making as much of the EFI code in Linux arch-agnostic
> and adhere to EFI principles and APIs)
> 
> Given that neither SETUP_DTB nor SETUP_RNG_SEED are particularly
> relevant for pure EFI boot, clearing setup_data in the pure EFI
> entrypoint in the EFI stub is not unreasonable, but not very future
> proof, given that it limits how we might use setup_data for other
> purposes in the future (although one might argue we could just drop
> code again from the stub when new uses of setup_data are introduced
> into the kernel)
> 
> However, our conclusion was that it is really QEMU that is doing
> something strange here, so IMHO, fixing QEMU is really the most
> suitable approach.
> 

I'm not sure if this can be solved arch-independently and
firmware-independently.

ACPI and SMBIOS look "independent" of arch and firmware if you squint,
but that's only because the specs describe the entry points for
different firmwares differently, thereby hiding the problem from the
rest of the world. Also because the various virtual firmwares receive
the ACPI and SMBIOS contents from the VMM(s) differently. However, ACPI
and SMBIOS are probably too late for the kernel to consume the random seed.

A different example for information that's needed really early is the
serial port's location (see "earlyprintk" e.g.). That gets passed on the
command line (and the usual values strongly differ between arm64 and
x864_64). But, I guess passing the random seed on the kernel cmdline is
considered insecure.

None of the existing info passing methods seem early enough, generic
enough, and secure enough (at the same time)...


