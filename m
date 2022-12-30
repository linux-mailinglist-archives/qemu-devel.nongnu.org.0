Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D858659BC6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 20:55:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBLSc-0002r7-ER; Fri, 30 Dec 2022 14:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBLSZ-0002qf-9C
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 14:54:31 -0500
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBLSQ-0007Y0-4h
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 14:54:28 -0500
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 38F521EC0453;
 Fri, 30 Dec 2022 20:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1672430056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=4d9mZokcf7UfkVL0VJHyHQx1vADaAzgo+xzFXO0gE5U=;
 b=W3nWTuFC4+SoGZ4dg81fPRaAAOUn4LHr8f0gnB3ufyE6nEkFfLvxLQNpkbhC44gAyUUF6Z
 7mUlobY/V4ClDBHLImUQq70yjMtiydadbCZ+vL782EL3ew4sB2C7+rqkiqROk6kI48xHlF
 Y9y8ACSasRhvBCzpFWIu1WVIfz2q/vk=
Date: Fri, 30 Dec 2022 20:54:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y69B40T9kWfxZpmf@zn.tnic>
References: <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
 <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y62MdawGaasXmoVL@zn.tnic> <Y68Js5b0jW/2nLU4@zx2c4.com>
 <Y68Zf/MKmX3Rr18E@zn.tnic>
 <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
Received-SPF: pass client-ip=2a01:4f8:190:11c2::b:1457;
 envelope-from=bp@alien8.de; helo=mail.skyhub.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Fri, Dec 30, 2022 at 06:07:24PM +0100, Jason A. Donenfeld wrote:
> Look closer at the boot process. The compressed image is initially at
> 0x100000, but it gets relocated to a safer area at the end of
> startup_64:

That is the address we're executing here from, rip here looks like 0x100xxx.

> /*
>  * Copy the compressed kernel to the end of our buffer
>  * where decompression in place becomes safe.
>  */
>         pushq   %rsi
>         leaq    (_bss-8)(%rip), %rsi
>         leaq    rva(_bss-8)(%rbx), %rdi

when you get to here, it looks something like this:

        leaq    (_bss-8)(%rip), %rsi		# 0x9e7ff8
        leaq    rva(_bss-8)(%rbx), %rdi		# 0xc6eeff8

so the source address is that _bss thing and we copy...

>         movl    $(_bss - startup_32), %ecx
>         shrl    $3, %ecx
>         std

... backwards since DF=1.

Up to:

# rsi = 0xffff8
# rdi = 0xbe06ff8

Ok, so the source address is 0x100000. Good.

> HOWEVER, qemu currently appends setup_data to the end of the
> compressed kernel image,

Yeah, you mean the kernel which starts executing at 0x100000, i.e., that part
which is compressed/head_64.S and which does the above and the relocation etc.

> and this part isn't moved, and setup_data links aren't walked/relocated. So
> that means the original address remains, of 0x100000.

See above: when it starts copying the kernel image backwards to a higher
address, that last byte is at 0x9e7ff8 so I'm guessing qemu has put setup_data
*after* that address. And that doesn't get copied ofc.

So far, so good.

Now later, we extract the compressed kernel created with the mkpiggy magic:

input_data:
.incbin "arch/x86/boot/compressed/vmlinux.bin.gz"
input_data_end:

by doing

/*
 * Do the extraction, and jump to the new kernel..
 */

        pushq   %rsi                    /* Save the real mode argument */	0x13d00
        movq    %rsi, %rdi              /* real mode address */			0x13d00
        leaq    boot_heap(%rip), %rsi   /* malloc area for uncompression */	0xc6ef000
        leaq    input_data(%rip), %rdx  /* input_data */			0xbe073a8
        movl    input_len(%rip), %ecx   /* input_len */				0x8cfe13
        movq    %rbp, %r8               /* output target address */		0x1000000
        movl    output_len(%rip), %r9d  /* decompressed length, end of relocs */
        call    extract_kernel          /* returns kernel location in %rax */
        popq    %rsi

(actual addresses at the end.)

Now, when you say you triplefault somewhere in initialize_identity_maps() when
trying to access setup_data, then if you look a couple of lines before that call
we do

	call load_stage2_idt

which sets up a boottime #PF handler do_boot_page_fault() and it actually does
call kernel_add_identity_map() so *actually* it should map any unmapped
setup_data addresses.

So why doesn't it do that and why do you triplefault?

Hmmm.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

