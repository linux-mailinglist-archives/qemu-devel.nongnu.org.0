Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F15589785
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 07:49:20 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJTjS-0003EL-S3
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 01:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJTcT-0007rN-A4
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJTcP-0004Uw-P0
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659591721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGelVrqp1ypRRln/zMIzZWfcdMfM5wxPJ3L+2FEV8iw=;
 b=ZUULl+PUJD5IgkNWennuwuS27cIlrU9W3HUYa2GQGtyqlyM0h4JF0nQTnmDd9sZlnYuTzk
 BKM0q8Kq2Lcc0iyFe2gB09vDLiwNHdNLgODNyotf33bMMeiL7NPq7v0yScOP/c1V1FJG0A
 3hUvPBK95VJWG4E8TAjA84aJ0P0bIE0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-KHVVr3qSO0e01SP1Wtwniw-1; Thu, 04 Aug 2022 01:40:40 -0400
X-MC-Unique: KHVVr3qSO0e01SP1Wtwniw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 558B9185A794;
 Thu,  4 Aug 2022 05:40:39 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64BB92166B26;
 Thu,  4 Aug 2022 05:40:36 +0000 (UTC)
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=83=c2=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Ard Biesheuvel (kernel.org address)" <ardb@kernel.org>
References: <Yukk0YOFgkPwcTzG@zx2c4.com>
 <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com> <Yuk9a0v+CNnzAX37@zx2c4.com>
 <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
 <YupTaZlkyy1/9FUC@redhat.com> <Yup0FIOLLo0thP8u@zx2c4.com>
 <Yup5TG2kZs+TifEJ@zx2c4.com> <YuqraGAFyCibc1h6@zx2c4.com>
 <20220803180115-mutt-send-email-mst@kernel.org> <Yurxx0OZ+mfWdZ5M@zx2c4.com>
 <20220803181435-mutt-send-email-mst@kernel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8bcc7826-91ab-855e-7151-2e9add88025a@redhat.com>
Date: Thu, 4 Aug 2022 07:40:34 +0200
MIME-Version: 1.0
In-Reply-To: <20220803181435-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On 08/04/22 00:23, Michael S. Tsirkin wrote:
> On Thu, Aug 04, 2022 at 12:08:07AM +0200, Jason A. Donenfeld wrote:
>> Hi Michael,
>>
>> On Wed, Aug 03, 2022 at 06:03:20PM -0400, Michael S. Tsirkin wrote:
>>> On Wed, Aug 03, 2022 at 07:07:52PM +0200, Jason A. Donenfeld wrote:
>>>> On Wed, Aug 03, 2022 at 03:34:04PM +0200, Jason A. Donenfeld wrote:
>>>>> On Wed, Aug 03, 2022 at 03:11:48PM +0200, Jason A. Donenfeld wrote:
>>>>>> Thanks for the info. Very helpful. Looking into it now.
>>>>>
>>>>> So interestingly, this is not a new issue. If you pass any type of setup
>>>>> data, OVMF appears to be doing something unusual and passing 0xffffffff
>>>>> for all the entries, rather than the actual data. The reason this isn't
>>>>> new is: try passing `-dtb any/dtb/at/all/from/anywhere` and you get the
>>>>> same page fault, on all QEMU versions. The thing that passes the DTB is
>>>>> the thing that passes the RNG seed. Same mechanism, same bug.
>>>>>
>>>>> I'm looking into it...
>>>>
>>>> Fixed with: https://lore.kernel.org/all/20220803170235.1312978-1-Jason@zx2c4.com/
>>>>
>>>> Feel free to join into the discussion there. I CC'd you.
>>>>
>>>> Jason
>>>
>>> Hmm I don't think this patch will make it in 7.1 given the
>>> timeframe. I suspect we should revert the patch for now.
>>>
>>> Which is where you maybe begin to see why we generally
>>> prefer doing it with features - one can then work around
>>> bugs by turning the feature on and off.
>>
>> The bug actually precedes this patch. Just boot with -dtb on any qemu
>> version and you'll trigger it.

Yes! That's exactly what I expected, per

https://bugzilla.redhat.com/show_bug.cgi?id=2114637#c4

There I wrote that this kind of setup_data chaining was a "first" for OVMF.

While the same logic had existed in QEMU with for chaining a dtb, there
never had been a reason (that I could imagine) for using that with OVMF
guests.

So it had to be either a preexistent bug in QEMU, or one in OVMF, that
now got triggered (as Jason's patch for chaining the seed closely
followed the pattern set by the dtb logic).

Now, regarding the patch at
<https://lore.kernel.org/all/20220803170235.1312978-1-Jason@zx2c4.com/>,
including v2 at
<https://lore.kernel.org/all/20220804004411.1343158-1-Jason@zx2c4.com/>...

I don't think this kind of setup_data block chaining, with raw
guest-physical addresses filled in by QEMU in guest RAM, in advance, is
appropriate for an edk2 guest *in general*. By the time the firmware
loads the kernel (including setup block and kernel block) from fw_cfg,
the area in question (with the seed etc) may have been overwritten
several times. Edk2 is very careful about memory ownership, but it needs
the VMM and the guest OS to play along. There is a only very small set
of "well known addresses" that are (a) open-coded in both QEMU board
code and edk2 platform code and (b) not specified by industry specs;
such addresses are used to set up everything else, and we seek not to
introduce more of them.

Consider e.g. the end of
<https://www.kernel.org/doc/Documentation/x86/boot.rst>, namely the
deprecation of the "EFI Handover Protocol". The idea is to use
well-specified information channels that don't depend on the placement
of the kernel.

At least two mechanisms exist for dealing with this; the ACPI
linker-loader, and the GUID-ed struct chaining in pflash (mostly used
with SEV and I think TDX too).

More below.

> 
> Sure but it's still a regression.
> 
>> We're still at rc0; there should be time
>> enough for a bug fix. Please do chime in on that thread and maybe we can
>> come up with something reasonable fast enough.
>>
>> Jason
> 
> Maybe.

QEMU commit 67f7e426e538 ("hw/i386: pass RNG seed via setup_data entry",
2022-07-22) references <https://git.kernel.org/tip/tip/c/68b8e9713c8>,
and the commit message on that begins with:

----------
Currently, the only way x86 can get an early boot RNG seed is via EFI,
which is generally always used now for physical machines, but is very
rarely used in VMs, especially VMs that are optimized for starting
"instantaneously", such as Firecracker's MicroVM. For tiny fast booting
VMs, EFI is not something you generally need or want.
----------

So, first, I'd quite disagree with "EFI being rarely used in VMs" (the
trend has been the opposite), and I'm not saying that because I'm
married to edk2 (I switched to a different project last summer). I do
agree with EFI being rarely used in one-shot, fast-booting VMs though.

Second, I think this segmentation of use cases is actually great. If you
need this particular kind of seed-passing for non-EFI VMs only (i.e.,
where the UEFI stub in the guest kernel cannot rely on
EFI_RNG_PROTOCOL), then implement it in both QEMU and the (guest) kernel
for non-EFI only. Both the guest kernel and QEMU can tell whether the
guest firmware is UEFI (the guest kernel can tell that precisely,
whereas in QEMU, if memory serves, we equate that with a particular
pflash setup).

Again, I don't think the setup_data chaining, using GPAs stored by QEMU
for linkage, can be salvaged at all for UEFI guests. Normally some
dedicated (possibly new) information channel would be needed that lets
the firmware stay in control, but thankfully, this use case looks
explicitly irrelevant for UEFI guests. So "just restrict the whole thing
to non-UEFI guests" would be my proposal.

(

Yes, the existent DTB linking in QEMU is broken, and has been broken
forever, for edk2 (UEFI) guests. It never mattered in practice: edk2
guest firmware very explicitly deals with DTB passing (mostly for
arm/aarch64, but maybe Gerd's microvm uses DTB too; I can't tell, I'd
not been there), so I've never seen "dtb via setup_data" in practice.
There has never been a reason to use that. On the other hand, commit
67f7e426e538 enables setup_data chaining by default, and that seems to
break UEFI guests (with direct kernel boot anyway) summarily. It's more
serious than one might think at first sight; "virt-install --location"
uses direct (= fw_cfg) kernel boot.

)

I think that restricting "seed passing via setup_data" to non-UEFI
guests should be doable during Hard Feature Freeze too. The guest kernel
patch should be possible to do later.

Sorry about the wall of text.
Laszlo


