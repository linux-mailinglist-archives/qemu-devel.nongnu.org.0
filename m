Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC8065A4B0
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 14:42:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBc6q-0006Zi-UJ; Sat, 31 Dec 2022 08:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBc6l-0006Za-BD
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 08:41:07 -0500
Received: from mail.skyhub.de ([5.9.137.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBc6i-0005oQ-5q
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 08:41:07 -0500
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4F1041EC0493;
 Sat, 31 Dec 2022 14:41:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1672494060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=m7rCTpk9c3/hvAowOtgf/iURb5jKAxrFcYb/Bg6gYRQ=;
 b=Tjc0FU6RHjhOvvCJfJrEuEBEOAExLE5buF0lpG62t4mKcXRx7eZHjNH6zMgr4zuhVmlB+3
 HQkg3c3WFNG6YBQ17h7XTBLpD0yE3yfWEWpHL/7tl3cQtaMdI7McVw7GcdBNba16CYno0d
 NxAQ+L/Vk4LcN4m0LEUuo4cp93aDJJI=
Date: Sat, 31 Dec 2022 14:40:59 +0100
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7A76+IBS4fnucrW@zn.tnic>
References: <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y62MdawGaasXmoVL@zn.tnic> <Y68Js5b0jW/2nLU4@zx2c4.com>
 <Y68Zf/MKmX3Rr18E@zn.tnic>
 <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
 <Y69B40T9kWfxZpmf@zn.tnic>
 <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
 <Y69h6ur79SMhu61F@zx2c4.com>
 <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
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

On Fri, Dec 30, 2022 at 05:06:55PM -0800, H. Peter Anvin wrote:
> This needs to be something like:
> 
> kernel_add_identity_map(sd_addr, sd_addr + sizeof(*sd));
> kernel_add_identity_map(sd_addr + sizeof(*sd),
> 	sd_addr + sizeof(*sd) + sd->len);

It still #PFs with that:

(gdb) bt
#0  0xffffffff84738576 in native_halt () at ./arch/x86/include/asm/irqflags.h:57
#1  halt () at ./arch/x86/include/asm/irqflags.h:98
#2  early_fixup_exception (regs=regs@entry=0xffffffff84007dc8, trapnr=trapnr@entry=14) at arch/x86/mm/extable.c:340
#3  0xffffffff846ff465 in do_early_exception (regs=0xffffffff84007dc8, trapnr=14) at arch/x86/kernel/head64.c:424
#4  0xffffffff846ff14f in early_idt_handler_common () at arch/x86/kernel/head_64.S:483
#5  0xc149f9894908788d in ?? ()
#6  0xffffffffff2003fc in ?? ()
#7  0x0000000000000010 in fixed_percpu_data ()
#8  0xdffffc0000000000 in ?? ()
#9  0xffffffff84007ea8 in init_thread_union ()
#10 0xffffffffff20088d in ?? ()
#11 0x0000000000000000 in ?? ()

/me goes to dig more.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

