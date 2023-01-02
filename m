Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B438D65AD6B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 07:19:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCE93-0004Qa-AL; Mon, 02 Jan 2023 01:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pCE8x-0004QF-I3
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 01:17:55 -0500
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pCE8t-0007be-PR
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 01:17:54 -0500
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 980FE1EC0589;
 Mon,  2 Jan 2023 07:17:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1672640267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=FC+Jlf27xP9P9TCcinvw5bMB7xljXbe366COrIpKShs=;
 b=iOYzgwCH74Wo/PifxKlDVns/9RXxKV13v0caAk6oZvfoZuqKXScowtozcnk1Xgw7eFGAmc
 AGsHjUgpgFXJhBfaoPdsML6AxbeA6A8cnR96lc4GmCreLHjC+F/EhF4BYQba9zMHPRSgU/
 WElLUAk63oHjC6cLSI2FeksenwmiG90=
Date: Mon, 2 Jan 2023 07:17:43 +0100
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7J3B50kn1kWrxlk@zn.tnic>
References: <Y7A76+IBS4fnucrW@zn.tnic> <Y7A8qP05B0YRbQIN@zx2c4.com>
 <Y7A9nBud6UeH+wYd@zn.tnic> <Y7A+YELM7m5E2PUQ@zx2c4.com>
 <Y7BGIAL4z6o6FEI5@zn.tnic> <Y7B993P1+jYB/etX@zx2c4.com>
 <Y7CGzde+qPB7YJP4@zn.tnic>
 <60566f8b-c90f-12e7-c13e-94e9829eee2d@zytor.com>
 <8f072588-7d66-0932-7486-ed9159ae93ae@zytor.com>
 <Y7JzTh8JnMXM6ZPS@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7JzTh8JnMXM6ZPS@zn.tnic>
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

On Mon, Jan 02, 2023 at 07:01:50AM +0100, Borislav Petkov wrote:
> On Sat, Dec 31, 2022 at 07:31:21PM -0800, H. Peter Anvin wrote:
> > It would probably be a good idea to add a "maximum physical address for
> > initrd/setup_data/cmdline" field to struct kernel_info, though. It appears
> > right now that those fields are being identity-mapped in the decompressor,
> > and that means that if 48-bit addressing is used, physical memory may extend
> > past the addressable range.
> 
> Yeah, we will probably need that too.
> 
> Btw, looka here - it can't get any more obvious than that after dumping
> setup_data too:
> 
> early console in setup code
> early console in extract_kernel
> input_data: 0x00000000040f92bf
> input_len: 0x0000000000f1c325
> output: 0x0000000001000000
> output_len: 0x0000000003c5e7d8
> kernel_total_size: 0x0000000004428000
> needed_size: 0x0000000004600000
> boot_params->hdr.setup_data: 0x00000000010203b0
> trampoline_32bit: 0x000000000009d000
> 
> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> <EOF>
> 
> Aligning them vertically:
> 
> output:				0x0000000001000000
> output_len:			0x0000000003c5e7d8
> kernel_total_size:		0x0000000004428000
> needed_size:			0x0000000004600000
> boot_params->hdr.setup_data:	0x00000000010203b0

Ok, waait a minute:

============    ============
Field name:     pref_address
Type:           read (reloc)
Offset/size:    0x258/8
Protocol:       2.10+
============    ============

  This field, if nonzero, represents a preferred load address for the
  kernel.  A relocating bootloader should attempt to load at this
  address if possible.

  A non-relocatable kernel will unconditionally move itself and to run
  at this address.

so a kernel loader (qemu in this case) already knows where the kernel goes:

boot_params->hdr.setup_data: 0x0000000001020450
boot_params->hdr.pref_address: 0x0000000001000000
				^^^^^^^^^^^^^^^^^

now, considering that same kernel loader (qemu) knows how big that kernel is:

kernel_total_size: 0x0000000004428000

should that loader *not* put anything that the kernel will use in the range

pref_addr + kernel_total_size

?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

