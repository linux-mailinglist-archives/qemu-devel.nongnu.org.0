Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E4401DAE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:35:12 +0200 (CEST)
Received: from localhost ([::1]:35484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGeN-0003vJ-JN
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andre.przywara@arm.com>)
 id 1mNGdd-0003F8-9J
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:34:25 -0400
Received: from foss.arm.com ([217.140.110.172]:49406)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andre.przywara@arm.com>) id 1mNGda-0003oZ-LU
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:34:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7228D31B;
 Mon,  6 Sep 2021 08:34:19 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E03483F766;
 Mon,  6 Sep 2021 08:34:18 -0700 (PDT)
Date: Mon, 6 Sep 2021 16:34:03 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Adam Lackorzynski <adam@l4re.org>
Subject: Re: arm: Launching EFI-enabled arm32 Linux
Message-ID: <20210906163403.7b091544@slackpad.fritz.box>
In-Reply-To: <YTPIdbUCmwagL5/D@os.inf.tu-dresden.de>
References: <YTPIdbUCmwagL5/D@os.inf.tu-dresden.de>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=andre.przywara@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 4 Sep 2021 21:26:45 +0200
Adam Lackorzynski <adam@l4re.org> wrote:

Hi Adam,

> while trying to launch an EFI-enabled arm32 Linux binary (zImage) I
> noticed I get an undefined instruction exception on the first
> instruction. Now this is a bit special because Linux uses a nop
> instruction there that also is a PE file signature ('MZ') such that the
> CPU runs over it and the file is still recognized as a PE binary. Linux
> uses 0x13105a4d (tstne r0, #0x4d000) as the instruction (see also
> arch/arm/boot/compressed/head.S and efi-header.S in Linux).
> However, QEMU's instruction decoder will only recognize TST with bits
> 12-15 being 0, which this instruction is not fullfilling, and thus the
> undef exception. I guess other CPU implementations will allow this
> encoding. So while investigating I was doing the following to make Linux
> proceed. I also believe this was working in a previous version of QEMU.
> 
> diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> index fcd8cd4f7d..222553750e 100644
> --- a/target/arm/a32.decode
> +++ b/target/arm/a32.decode
> @@ -127,7 +127,7 @@ ADD_rri          .... 001 0100 . .... .... ............       @s_rri_rot
>  ADC_rri          .... 001 0101 . .... .... ............       @s_rri_rot
>  SBC_rri          .... 001 0110 . .... .... ............       @s_rri_rot
>  RSC_rri          .... 001 0111 . .... .... ............       @s_rri_rot
> -TST_xri          .... 001 1000 1 .... 0000 ............       @S_xri_rot
> +TST_xri          .... 001 1000 1 .... ---- ............       @S_xri_rot
>  TEQ_xri          .... 001 1001 1 .... 0000 ............       @S_xri_rot
>  CMP_xri          .... 001 1010 1 .... 0000 ............       @S_xri_rot
>  CMN_xri          .... 001 1011 1 .... 0000 ............       @S_xri_rot
> 
> 
> Any thoughts on this?

thanks for the report, I was looking at this and have a kernel patch
to fix this properly as Peter suggested. And while I agree on the
problem, I was struggling to reproduce this in reality: both with
-kernel and when booting through U-Boot the "Z" bit is set, which lets
QEMU not even bother about the rest of the encoding - the condition
flags don't match, so it proceeds. If I change the __nop to use "tsteq",
I see it hanging due to the missing exception handler, but not with
"tstne".
So can you say how you spotted this issue? This would be needed as a
justification for patching the guts of the ARM Linux kernel port.

Cheers,
Andre

