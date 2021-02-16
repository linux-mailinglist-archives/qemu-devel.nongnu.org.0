Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED83831C6B2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:07:32 +0100 (CET)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBuSJ-0003kO-OM
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lBuQu-0002bN-Gn
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:06:05 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:61986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lBuQs-0008Hl-H6
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:06:04 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 75FAC3F51C;
 Tue, 16 Feb 2021 08:05:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id byuTMIw8cTWD; Tue, 16 Feb 2021 08:05:58 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 642C53F4DE;
 Tue, 16 Feb 2021 08:05:57 +0100 (CET)
Date: Tue, 16 Feb 2021 08:05:57 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC PATCH 28/42] target/mips/tx79: Move RDHWR usermode kludge
 to trans_SQ()
Message-ID: <YCtu1czHMjeixsj+@sx9>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-29-f4bug@amsat.org>
 <d47d5ab7-9663-8647-483f-878e0bcb3bbe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d47d5ab7-9663-8647-483f-878e0bcb3bbe@linaro.org>
Received-SPF: softfail client-ip=213.80.101.70; envelope-from=noring@nocrew.org;
 helo=ste-pvt-msa1.bahnhof.se
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 01:01:52PM -0800, Richard Henderson wrote:
> On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> > +    /*
> > +     * The TX79-specific instruction Store Quadword
> > +     *
> > +     * +--------+-------+-------+------------------------+
> > +     * | 011111 |  base |   rt  |           offset       | SQ
> > +     * +--------+-------+-------+------------------------+
> > +     *      6       5       5                 16
> > +     *
> > +     * has the same opcode as the Read Hardware Register instruction
> > +     *
> > +     * +--------+-------+-------+-------+-------+--------+
> > +     * | 011111 | 00000 |   rt  |   rd  | 00000 | 111011 | RDHWR
> > +     * +--------+-------+-------+-------+-------+--------+
> > +     *      6       5       5       5       5        6
> > +     *
> > +     * that is required, trapped and emulated by the Linux kernel. However, all
> > +     * RDHWR encodings yield address error exceptions on the TX79 since the SQ
> > +     * offset is odd.
> 
> Not that it's odd (the final address is masked, remember), but that it a store
> to an address in the zero page.

The address always resolves to 0xffffe83b (then masked) in 32-bit KSEG2,
because rt is always $3 and rd is always $29 so -6085(zero), hence the
last page (which is much better) rather than the first, as Maciej
discovered:

https://patchwork.kernel.org/comment/23824173/

Other possible RDHWR encodings are no longer used, and can therefore be
ignored and revert to SQ:

https://patchwork.kernel.org/comment/23842167/

Notice also the oddity of 32-bit R5900 addresses that doesn't matter here
but has implications for n32 and system emulation.

> I would do this as
> 
> {
>   RDHWR_user  011111 00000 ..... ..... 00000 111011   @rd_rt
>   SQ          011111 ..... ..... ................     @ldst
> }

Both rd and rt have fixed values, as mentioned.

For reference, RDHWR is currently done like this in the Linux kernel:

	if (IS_ENABLED(CONFIG_CPU_R5900)) {
		/*
		 * On the R5900, a valid RDHWR instruction
		 *
		 *     +--------+-------+----+----+-------+--------+
		 *     | 011111 | 00000 | rt | rd | 00000 | 111011 |
		 *     +--------+-------+----+----+-------+--------+
		 *          6       5      5    5     5        6
		 *
		 * having rt $3 (v1) and rd $29 (MIPS_HWR_ULR) is
		 * interpreted as the R5900 specific SQ instruction
		 *
		 *     +--------+-------+----+---------------------+
		 *     | 011111 |  base | rt |        offset       |
		 *     +--------+-------+----+---------------------+
		 *          6       5      5            16
		 *
		 * with
		 *
		 *     sq v1,-6085(zero)
		 *
		 * that asserts an address exception since -6085(zero)
		 * always resolves to 0xffffe83b in 32-bit KSEG2.
		 *
		 * Other legacy values of rd, such as MIPS_HWR_CPUNUM,
		 * are ignored.
		 */
		if (insn.r_format.func == rdhwr_op &&
		    insn.r_format.rd == MIPS_HWR_ULR &&
		    insn.r_format.rt == 3 &&
		    insn.r_format.rs == 0 &&
		    insn.r_format.re == 0) {
			if (compute_return_epc(regs) < 0 ||
			    simulate_rdhwr(regs, insn.r_format.rd,
					   insn.r_format.rt) < 0)
				goto sigill;
			return;
		}
		goto sigbus;
	} else ...

Fredrik

