Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F412AD6F2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:57:21 +0100 (CET)
Received: from localhost ([::1]:44254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcTD5-0004X8-SP
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTCI-00047G-Px
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:56:30 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43486
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTCG-0006ar-ID
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:56:30 -0500
Received: from host86-184-131-53.range86-184.btcentralplus.com
 ([86.184.131.53] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTCS-0006Cr-9h; Tue, 10 Nov 2020 12:56:40 +0000
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201105212314.9628-1-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <21cd093c-404b-cd9c-2b61-fe1c0957d7f4@ilande.co.uk>
Date: Tue, 10 Nov 2020 12:56:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105212314.9628-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.184.131.53
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-5.2 0/3] linux-user: fix various sparc64 guest bugs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/11/2020 21:23, Peter Maydell wrote:

> This set of patches fixes bugs which were preventing the
> Debian sparc64 /bin/bash from running:
>   * the target_ucontext structure put the registers in the
>     wrong place (missing alignment specifier, mostly)
>   * the set_context and get_context traps weren't saving fp
>     and i7, which meant that guest code that did a longjmp would
>     crash shortly afterwards (SPARC64 uses these traps to
>     implement setjmp/longjmp)
>   * we were trying to stuff a 64-bit PC into a uint32_t in
>     sigreturn, which caused a SEGV on return from a signal handler
> 
> Review very much desired in particular from anybody who understands
> SPARC register windows and how we handle them in linux-user for
> patch 2! The other patches are straightforward.
> 
> This patchset is sufficient that I can at least chroot into
> a Debian sparc64 chroot and run basic commands like 'ls' from
> the shell prompt (together with Giuseppe Musacchio's patch that
> fixes the stack_t struct).
> 
> There are clearly a bunch of other bugs in sparc signal handling
> (starting with the fact that rt_frame support is simply not
> implemented, but there are also some XXX/FIXME comments about TSTATE
> save/restore in set/get_context and about the FPU state in the signal
> frame code). There's also a Coverity issue about accessing off the
> end of the sregs[] array in the target_mc_fpu struct -- the error is
> actually harmless (we're accessing into the space in the union for
> dregs[16..31] which is what we want to be doing) but I'll probably
> put together a patch to make Coverity happier.

Thanks Peter! This has been broken for a very long time indeed. Once this is merged I 
should probably look at getting a test environment set up.


ATB,

Mark.

