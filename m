Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286993DD595
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:23:44 +0200 (CEST)
Received: from localhost ([::1]:49246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWyt-0003Kb-6J
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <macro@orcam.me.uk>) id 1mAWuL-0003fJ-75
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:19:01 -0400
Received: from angie.orcam.me.uk ([78.133.224.34]:33240)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <macro@orcam.me.uk>) id 1mAWuJ-0001ug-6y
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:19:00 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 3F40892009C; Mon,  2 Aug 2021 14:18:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 37F6B92009B;
 Mon,  2 Aug 2021 14:18:36 +0200 (CEST)
Date: Mon, 2 Aug 2021 14:18:36 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.1?] target/mips: Remove MOVZ/MOVN opcodes from
 Loongson 2E
In-Reply-To: <47f2912c-4933-aa78-de1d-f85884fddded@amsat.org>
Message-ID: <alpine.DEB.2.21.2108021412470.62025@angie.orcam.me.uk>
References: <20210731144155.2738493-1-f4bug@amsat.org>
 <47f2912c-4933-aa78-de1d-f85884fddded@amsat.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Received-SPF: none client-ip=78.133.224.34; envelope-from=macro@orcam.me.uk;
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 yangxiaojuan@loongson.cn, Song Gao <gaosong@loongson.cn>,
 Mark Shinwell <shinwell@codesourcery.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Aug 2021, Philippe Mathieu-Daudé wrote:

> > Per the "Godson-2E User Manual v0.6", the Loongson 2E processor
> > does not implement the MOVZ/MOVN instructions
> 
> I'm confused because I can't find MOVZ/MOVN in the 2E manual and
> the 2F explicits the difference. However looking at binutils,
> these opcodes are also emited on the 2E:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=350cc38db21f1cd651a6d46687542a0fce5e0303;hp=569502941afa825c5278b320ccedeefc82e8ed0e

 I find the manual a bit messy.  It does say however:

"3.2.3 Instruction set mode

"Godson-2E processor implements a full feature MIPS III Instruction Set 
Architecture (ISA) plus some MIPS IV ISA instructions, like paired single, 
move condition and multiply add."

> Cc'ing Mark & Maciej in case they can enlighten me, and few
> Loongson develeper in case they could check, because I don't
> have 2E hardware to test.

 At least this trivial program:

int main(void)
{
	asm volatile(".set push; .set mips4; movn $0,$0,$0; .set pop");
	return 0;
}

does not trap on actual hardware.  I may not be able to find time right 
now for a more exhaustive test.

  Maciej

