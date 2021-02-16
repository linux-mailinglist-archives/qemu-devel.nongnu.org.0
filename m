Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7AC31CA84
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 13:22:58 +0100 (CET)
Received: from localhost ([::1]:42404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBzNY-0004fL-N0
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 07:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <macro@orcam.me.uk>) id 1lBzMK-0003ln-D9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:21:40 -0500
Received: from angie.orcam.me.uk ([2001:4190:8020::4]:44296)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <macro@orcam.me.uk>) id 1lBzMI-0006JR-9Z
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:21:40 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 57F6092009D; Tue, 16 Feb 2021 13:21:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 51A2392009C;
 Tue, 16 Feb 2021 13:21:34 +0100 (CET)
Date: Tue, 16 Feb 2021 13:21:34 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Fredrik Noring <noring@nocrew.org>
Subject: Re: [RFC PATCH 28/42] target/mips/tx79: Move RDHWR usermode kludge
 to trans_SQ()
In-Reply-To: <YCtu1czHMjeixsj+@sx9>
Message-ID: <alpine.DEB.2.21.2102161244430.1521@angie.orcam.me.uk>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-29-f4bug@amsat.org>
 <d47d5ab7-9663-8647-483f-878e0bcb3bbe@linaro.org> <YCtu1czHMjeixsj+@sx9>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2001:4190:8020::4; envelope-from=macro@orcam.me.uk;
 helo=angie.orcam.me.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021, Fredrik Noring wrote:

> > Not that it's odd (the final address is masked, remember), but that it a store
> > to an address in the zero page.
> 
> The address always resolves to 0xffffe83b (then masked) in 32-bit KSEG2,
> because rt is always $3 and rd is always $29 so -6085(zero), hence the
> last page (which is much better) rather than the first, as Maciej
> discovered:
> 
> https://patchwork.kernel.org/comment/23824173/
> 
> Other possible RDHWR encodings are no longer used, and can therefore be
> ignored and revert to SQ:
> 
> https://patchwork.kernel.org/comment/23842167/

 Or rather were never used in the general case (I can't rule out someone 
using that stuff for something, but I wouldn't call it supported; I used 
some of it internally while evaluating the speed of RDHWR emulation before 
the use of $3 or indeed RDHWR was settled in the TLS psABI, though the 
actual code that ultimately went into Linux was developed independently).

> > I would do this as
> > 
> > {
> >   RDHWR_user  011111 00000 ..... ..... 00000 111011   @rd_rt
> >   SQ          011111 ..... ..... ................     @ldst
> > }
> 
> Both rd and rt have fixed values, as mentioned.

 I would suggest actually supporting variable `rt', see below.  Would it 
be a problem?

> For reference, RDHWR is currently done like this in the Linux kernel:
> 
> 	if (IS_ENABLED(CONFIG_CPU_R5900)) {
> 		/*
> 		 * On the R5900, a valid RDHWR instruction
> 		 *
> 		 *     +--------+-------+----+----+-------+--------+
> 		 *     | 011111 | 00000 | rt | rd | 00000 | 111011 |
> 		 *     +--------+-------+----+----+-------+--------+
> 		 *          6       5      5    5     5        6
> 		 *
> 		 * having rt $3 (v1) and rd $29 (MIPS_HWR_ULR) is
> 		 * interpreted as the R5900 specific SQ instruction
> 		 *
> 		 *     +--------+-------+----+---------------------+
> 		 *     | 011111 |  base | rt |        offset       |
> 		 *     +--------+-------+----+---------------------+
> 		 *          6       5      5            16
> 		 *
> 		 * with
> 		 *
> 		 *     sq v1,-6085(zero)
> 		 *
> 		 * that asserts an address exception since -6085(zero)
> 		 * always resolves to 0xffffe83b in 32-bit KSEG2.
> 		 *
> 		 * Other legacy values of rd, such as MIPS_HWR_CPUNUM,
> 		 * are ignored.
> 		 */
> 		if (insn.r_format.func == rdhwr_op &&
> 		    insn.r_format.rd == MIPS_HWR_ULR &&
> 		    insn.r_format.rt == 3 &&

 I suggest leaving the `rt' check out for consistency, as changing the 
register to read the value of UserLocal into from psABI-mandated $3 does 
not cause any issue with the R5900 (the `rt' field overlaps between both 
machine instructions, so the encoding placed there does not affect the 
KSEG2 access trap caused) and those encodings are also emulated in the 
slow path for other legacy ISA CPUs:

	case MIPS_HWR_ULR:		/* Read UserLocal register */
		regs->regs[rt] = ti->tp_value;
		return 0;


 So e.g. `rdhwr $25, $29' is interpreted as `sq $25,-6085($0)' by the 
R5900 => no issue, it still traps.

 I know I have previously written that we can ignore `rt' encodings other 
than $3, but they are harmless and handling them saves a couple of machine 
instructions needed to make the check, so I think while we can, we do not 
actually have to ignore them.

> 		    insn.r_format.rs == 0 &&
> 		    insn.r_format.re == 0) {
> 			if (compute_return_epc(regs) < 0 ||
> 			    simulate_rdhwr(regs, insn.r_format.rd,
> 					   insn.r_format.rt) < 0)
> 				goto sigill;
> 			return;
> 		}
> 		goto sigbus;
> 	} else ...

 Code continuation quoted left for reference.

  Maciej

