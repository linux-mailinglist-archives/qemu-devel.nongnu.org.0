Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DBA5899A5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 11:02:13 +0200 (CEST)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJWk8-0002k2-Nz
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 05:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJWgp-0008CO-S9
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:58:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJWgm-00014M-Nq
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659603523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3y6KCoedlux+KdrTMBBmhq7L6tec0WN+KxhgAFWNJWk=;
 b=ILrY2XhRLuzbCFNhDy8z1s7vRhrH6i8d02VXmB+UFUpUhIBt2bi5d47ZYn0FGx/HFkk0C0
 jjxHvjVPDmuAhUsI5vvTbShQBmjFo4675s/1T1f79cleBnD1+nFjj7ndneF2sQocl2MT1O
 XptQOrdYvN0HaOuG2uX1kzoSLgjhDeI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-DYMp_i-sMRa0BMNXb5WTeA-1; Thu, 04 Aug 2022 04:58:40 -0400
X-MC-Unique: DYMp_i-sMRa0BMNXb5WTeA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 070A129AB3F8;
 Thu,  4 Aug 2022 08:58:40 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFCE7492C3B;
 Thu,  4 Aug 2022 08:58:37 +0000 (UTC)
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
Date: Thu, 4 Aug 2022 10:58:36 +0200
MIME-Version: 1.0
In-Reply-To: <20220804030012-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=windows-1252
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

On 08/04/22 09:03, Michael S. Tsirkin wrote:
> On Thu, Aug 04, 2022 at 02:44:11AM +0200, Jason A. Donenfeld wrote:
>> The boot parameter header refers to setup_data at an absolute address,
>> and each setup_data refers to the next setup_data at an absolute address
>> too. Currently QEMU simply puts the setup_datas right after the kernel
>> image, and since the kernel_image is loaded at prot_addr -- a fixed
>> address knowable to QEMU apriori -- the setup_data absolute address
>> winds up being just `prot_addr + a_fixed_offset_into_kernel_image`.
>>
>> This mostly works fine, so long as the kernel image really is loaded at
>> prot_addr. However, OVMF doesn't load the kernel at prot_addr, and
>> generally EFI doesn't give a good way of predicting where it's going to
>> load the kernel. So when it loads it at some address != prot_addr, the
>> absolute addresses in setup_data now point somewhere bogus, causing
>> crashes when EFI stub tries to follow the next link.
>>
>> Fix this by placing setup_data at some fixed place in memory, relative
>> to real_addr, not as part of the kernel image, and then pointing the
>> setup_data absolute address to that fixed place in memory. This way,
>> even if OVMF or other chains relocate the kernel image, the boot
>> parameter still points to the correct absolute address.
>>
>> Fixes: 3cbeb52467 ("hw/i386: add device tree support")
>> Reported-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: linux-efi@vger.kernel.org
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Didn't read the patch yet.
> Adding Laszlo.

As I said in
<http://mid.mail-archive.com/8bcc7826-91ab-855e-7151-2e9add88025a@redhat.com>,
I don't believe that the setup_data chaining described in
<https://www.kernel.org/doc/Documentation/x86/boot.rst> can be made work
for UEFI guests at all, with QEMU pre-populating the links with GPAs.

However, rather than introducing a new info channel, or reusing an
existent one (ACPI linker/loader, GUID-ed structure chaining in pflash),
for the sake of this feature, I suggest simply disabling this feature
for UEFI guests. setup_data chaining has not been necessary for UEFI
guests for years (this is the first time I've heard about it in more
than a decade), and the particular use case (provide guests with good
random seed) is solved for UEFI guests via virtio-rng / EFI_RNG_PROTOCOL.

... Now, here's my problem: microvm, and Xen.

As far as I can tell, QEMU can determine (it already does determine)
whether the guest uses UEFI or not, for the "pc" and "q35" machine
types. But not for microvm or Xen!

Namely, from pc_system_firmware_init() [hw/i386/pc_sysfw.c], we can
derive that

  pflash_cfi01_get_blk(pcms->flash[0])

returning NULL vs. non-NULL stands for "BIOS vs. UEFI". Note that this
is only valid after the inital part of pc_system_firmware_init() has run
("Map legacy -drive if=pflash to machine properties"), but that is not a
problem, given the following call tree:

  pc_memory_init()            [hw/i386/pc.c]
    pc_system_firmware_init() [hw/i386/pc_sysfw.c]
    x86_load_linux()          [hw/i386/x86.c]

That is, when we call x86_load_linux() from pc_memory_init(), we can set
the last argument of x86_load_linux() from *both* the compat knob *and*
pflash_cfi01_get_blk(pcms->flash[0]).

Unluckily however, we have two more x86_load_linux() calls where this
does not work.

The first is xen_load_linux() [hw/i386/pc.c], which is used for "xen HVM
direct kernel boot" [hw/i386/pc_piix.c] -- there we certainly don't use
flash. I don't know if Xen HVM direct kernel boot is possible with UEFI.
If so, we have a problem, if UEFI is out of the question there, then
enabling setup_data passing is fine.

The other problematic x86_load_linux() call is in MicroVM --
microvm_memory_init() [hw/i386/microvm.c]. This is a real problem
unfortunately, as MicroVM can be used with SeaBIOS, QBoot, and even
OVMF, *but* even in the last case, it runs OVMF *without* flash (just
from ROM). So not only is MicroVM not a descendant of the PC Machine
Class (so it has no access to PC Machine State either -- such as
pcms->flash), it never *uses* flash in fact.

Which is a big problem for my idea, because QEMU has no way of
identifying whether microvm is going to boot a custom SeaBIOS binary
(where the current setup_data chaining is OK) or a custom OVMF binary
(where the current setup_data chaining crashes the guest kernel).

So I thought that for pc and q35, I should be able to propose a fix,
based on:

  pflash_cfi01_get_blk(pcms->flash[0])

but it turns out I don't know what to do about Xen; and worse, for
MicroVM, it's currently *impossible* for QEMU to tell apart UEFI from
other guest firmwares.

For now I suggest either reverting the original patch, or at least not
enabling the knob by default for any machine types. In particular, when
using MicroVM, the user must leave the knob disabled when direct booting
a kernel on OVMF, and the user may or may not enable the knob when
direct booting a kernel on SeaBIOS.

Thanks
Laszlo


