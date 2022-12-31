Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1AD65A4AD
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 14:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBc23-0004jj-9I; Sat, 31 Dec 2022 08:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBc1q-0004hM-Cs
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 08:36:02 -0500
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBc1j-0003ZA-RN
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 08:36:02 -0500
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 61BB31EC0493;
 Sat, 31 Dec 2022 14:35:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1672493750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=o0ed0270LbR4oSMiWhqbUtlUU3rbUG/UHLY5euGcUOs=;
 b=Npfe4/LhoihV1SevMmBX/L0PSt78NsHqGVmzB3hKlCgt3vI5wBBZTADJ1os5wH8c8kZPMs
 adDfhCgU3OrNMaBcSzJC2laYCFCo/upQmZC5guvTASLpgadxlGEzkUD69TnFU+unWVdoBK
 Tu/VhcPpLsYgEgnK/VRHKVVDnxPO3Io=
Date: Sat, 31 Dec 2022 14:35:45 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7A6sTOSudSxSWLB@zn.tnic>
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
 <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y68K4mPuz6edQkCX@zx2c4.com> <Y7AFYKWPRXYs7S4m@zn.tnic>
 <Y7AxGiGQYZNJWpCr@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7AxGiGQYZNJWpCr@zx2c4.com>
Received-SPF: pass client-ip=2a01:4f8:190:11c2::b:1457;
 envelope-from=bp@alien8.de; helo=mail.skyhub.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Sat, Dec 31, 2022 at 01:54:50PM +0100, Jason A. Donenfeld wrote:
> Nothing special... `-kernel bzImage` should be enough to do it. Eric
> reported it, and then I was able to repro trivially. Sure you got the
> right version?

Yeah, qemu executables confusion here - had wrongly something older of the
version 7.1...

Now made sure I'm actually booting with the latest qemu:

QEMU emulator version 7.2.50 (v7.2.0-333-g222059a0fccf)

With that the kernel with your config hangs early during boot and the stack
trace is below.

Seeing how it says trapnr 14, then that looks like something you are seeing.

But lemme poke at it more.

#0  0xffffffff84738576 in native_halt () at ./arch/x86/include/asm/irqflags.h:57
#1  halt () at ./arch/x86/include/asm/irqflags.h:98
#2  early_fixup_exception (regs=regs@entry=0xffffffff84007dc8, trapnr=trapnr@entry=14) at arch/x86/mm/extable.c:340
#3  0xffffffff846ff465 in do_early_exception (regs=0xffffffff84007dc8, trapnr=14) at arch/x86/kernel/head64.c:424
#4  0xffffffff846ff14f in early_idt_handler_common () at arch/x86/kernel/head_64.S:483
#5  0x2404c74100000cd0 in ?? ()
#6  0xffffffffff20073c in ?? ()
#7  0x0000000000000010 in fixed_percpu_data ()
#8  0xdffffc0000000000 in ?? ()
#9  0xffffffff84007ea8 in init_thread_union ()
#10 0xffffffffff200cd0 in ?? ()
#11 0x0000000000000000 in ?? ()

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

