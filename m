Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC42D3271
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:56:12 +0100 (CET)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmi9j-0003c9-8w
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <macro@linux-mips.org>)
 id 1kmhxX-0000NS-Cj
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:43:37 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:44218
 helo=cvs.linux-mips.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <macro@linux-mips.org>) id 1kmhxV-0002Tl-NV
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:43:35 -0500
Received: from localhost.localdomain ([127.0.0.1]:56252 "EHLO localhost"
 rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
 id S23993170AbgLHSnWur9JW (ORCPT <rfc822;qemu-devel@nongnu.org>);
 Tue, 8 Dec 2020 19:43:22 +0100
Date: Tue, 8 Dec 2020 18:43:22 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.2?] target/mips/translate: Check R6 reserved encoding
 for Load Linked Word
In-Reply-To: <CAAdtpL7zG6Ocbv0ChjQUArGkmTEegzC5AW5O3DjiDxFK7oEMWg@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2012081838061.2104409@eddie.linux-mips.org>
References: <20201124134557.569388-1-f4bug@amsat.org>
 <5bcade19-de8c-8521-f77c-599e3c9d40a0@linaro.org>
 <e983c95c-5713-3b5b-0c3c-e0d6bf8244c6@amsat.org>
 <CAAdtpL7zG6Ocbv0ChjQUArGkmTEegzC5AW5O3DjiDxFK7oEMWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Received-SPF: none client-ip=148.251.95.138; envelope-from=macro@linux-mips.org;
 helo=cvs.linux-mips.org
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.4,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020, Philippe Mathieu-Daudé wrote:

> Duh I hit that again, read the patch again, looks correct. I guess
> I got confused myself reviewing the offending patch...
> So I'm applying this patch to mips-next queue, using
> Fixes: d9224450208 ("target-mips: Tighten ISA level checks")

 What's wrong with current code?  What I can see is:

    case OPC_LL: /* Load and stores */
        check_insn(ctx, ISA_MIPS2);
        if (ctx->insn_flags & INSN_R5900) {
            check_insn_opc_user_only(ctx, INSN_R5900);
        }
        /* Fallthrough */
    case OPC_LWL:
    case OPC_LWR:
        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         /* Fallthrough */
    case OPC_LB:
    case OPC_LH:
    case OPC_LW:
    case OPC_LWPC:
    case OPC_LBU:
    case OPC_LHU:
         gen_ld(ctx, op, rt, rs, imm);
         break;

which looks absolutely right to me: LL is accepted with MIPS2--MIPS32R5 
(including R5900 in user emulation only), LWL/LWR are accepted with 
MIPS1--MIPS32R5 and the remaining loads are accepted everywhere.  What 
else do you need?

  Maciej

