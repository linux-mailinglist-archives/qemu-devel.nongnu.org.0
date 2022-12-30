Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F2E659ACA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 18:03:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBIm2-0003DP-3g; Fri, 30 Dec 2022 12:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBIls-00039g-Tj
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 12:02:18 -0500
Received: from mail.skyhub.de ([5.9.137.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBIlk-0002iU-1s
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 12:02:15 -0500
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6A0E21EC0354;
 Fri, 30 Dec 2022 18:01:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1672419716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=az0eqMcObaagwYoY8N4RiGpnzZ0HZwjbF/vFkgdYDtw=;
 b=BGugnp4hTFqKue1bGCy+HOyMPvdXIJAqX+Cl9hlwJgoPDYbSMvhHXZVZkZwZvjC/AvJez7
 UBYNN6PjaeQMCI1SbP/IOZesVDxGScT535IYgPeH8RgFpot5NQxUdJN52QMhx5MWvXX2j0
 EvRyO0wx6PzPmf/GqE5Uf7PJgqLjw0I=
Date: Fri, 30 Dec 2022 18:01:51 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y68Zf/MKmX3Rr18E@zn.tnic>
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
 <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y62MdawGaasXmoVL@zn.tnic> <Y68Js5b0jW/2nLU4@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y68Js5b0jW/2nLU4@zx2c4.com>
Received-SPF: pass client-ip=5.9.137.197; envelope-from=bp@alien8.de;
 helo=mail.skyhub.de
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

On Fri, Dec 30, 2022 at 04:54:27PM +0100, Jason A. Donenfeld wrote:
> > Right, with CONFIG_X86_VERBOSE_BOOTUP=y in a guest here, it says:
> > 
> > early console in extract_kernel
> > input_data: 0x000000000be073a8
> > input_len: 0x00000000008cfc43
> > output: 0x0000000001000000
> > output_len: 0x000000000b600a98
> > kernel_total_size: 0x000000000ac26000
> > needed_size: 0x000000000b800000
> > trampoline_32bit: 0x000000000009d000
> > 
> > so that's a ~9M kernel which gets decompressed at 0x1000000 and the
> > output len is, what, ~180M which looks like plenty to me...
> 
> I think you might have misunderstood the thread.

Maybe...

I've been trying to make sense of all the decompression dancing we're doing and
the diagrams you've drawn and there's a comment over extract_kernel() which
basically says that the compressed image is at the back of the memory buffer

input_data: 0x000000000be073a8

and we decompress to a smaller address

output: 0x0000000001000000

And, it *looks* like setup_data is at an address somewhere >= 0x1000000 so when
we start decompressing, we overwrite it.

I guess extract_kernel() could also dump the setup_data addresses so that we can
verify that...

> First, to reproduce the bug that this patch fixes, you need a kernel with a
> compressed size of around 16 megs, not 9.

Not only that - you need setup_data to be placed somewhere just so that it gets
overwritten during decompression. Also, see below.
 
> Secondly, that crash is well understood and doesn't need to be reproduced;

Is it?

Where do you get the 0x100000 as the starting address of the kernel image?

Because input_data above says that the input address is somewhere higher...

Btw, here's an allyesconfig:

early console in setup code
No EFI environment detected.
early console in extract_kernel
input_data: 0x000000001bd003a8
input_len: 0x000000000cde2963
output: 0x0000000001000000
output_len: 0x0000000027849d74
kernel_total_size: 0x0000000025830000
needed_size: 0x0000000027a00000
trampoline_32bit: 0x000000000009d000
Physical KASLR using RDRAND RDTSC...
Virtual KASLR using RDRAND RDTSC...

That kernel has compressed size of ~205M and the output buffer is of size ~632M.

> this patch fixes it. Rather, the question now is how to improve this patch
> to remove the 62 meg limit.

Yeah, I'm wondering what that 62M limit is too, actually.

But maybe I'm misunderstanding...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

