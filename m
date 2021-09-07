Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A03403180
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 01:27:18 +0200 (CEST)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNkUn-0000CR-AL
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 19:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1mNkSn-0007n1-Sp
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:25:14 -0400
Received: from os.inf.tu-dresden.de ([141.76.48.99]:47568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1mNkSl-000329-5P
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:25:13 -0400
Received: from erwin.inf.tu-dresden.de ([141.76.48.80]
 helo=os.inf.tu-dresden.de)
 by os.inf.tu-dresden.de with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256) (Exim
 4.94.2) id 1mNkSh-0001gx-4R; Wed, 08 Sep 2021 01:25:07 +0200
Date: Wed, 8 Sep 2021 01:25:04 +0200
From: Adam Lackorzynski <adam@l4re.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: arm: Launching EFI-enabled arm32 Linux
Message-ID: <YTf00ErKBqiDz9ZG@os.inf.tu-dresden.de>
References: <YTPIdbUCmwagL5/D@os.inf.tu-dresden.de>
 <20210906163403.7b091544@slackpad.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210906163403.7b091544@slackpad.fritz.box>
User-Agent: Mutt/2.0.5 (2021-01-21)
Received-SPF: none client-ip=141.76.48.99; envelope-from=adam@l4re.org;
 helo=os.inf.tu-dresden.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Andre,

On Mon Sep 06, 2021 at 16:34:03 +0100, Andre Przywara wrote:
> On Sat, 4 Sep 2021 21:26:45 +0200
> Adam Lackorzynski <adam@l4re.org> wrote:
> 
> Hi Adam,
> 
> > while trying to launch an EFI-enabled arm32 Linux binary (zImage) I
> > noticed I get an undefined instruction exception on the first
> > instruction. Now this is a bit special because Linux uses a nop
> > instruction there that also is a PE file signature ('MZ') such that the
> > CPU runs over it and the file is still recognized as a PE binary. Linux
> > uses 0x13105a4d (tstne r0, #0x4d000) as the instruction (see also
> > arch/arm/boot/compressed/head.S and efi-header.S in Linux).
> > However, QEMU's instruction decoder will only recognize TST with bits
> > 12-15 being 0, which this instruction is not fullfilling, and thus the
> > undef exception. I guess other CPU implementations will allow this
> > encoding. So while investigating I was doing the following to make Linux
> > proceed. I also believe this was working in a previous version of QEMU.
> > 
> > diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> > index fcd8cd4f7d..222553750e 100644
> > --- a/target/arm/a32.decode
> > +++ b/target/arm/a32.decode
> > @@ -127,7 +127,7 @@ ADD_rri          .... 001 0100 . .... .... ............       @s_rri_rot
> >  ADC_rri          .... 001 0101 . .... .... ............       @s_rri_rot
> >  SBC_rri          .... 001 0110 . .... .... ............       @s_rri_rot
> >  RSC_rri          .... 001 0111 . .... .... ............       @s_rri_rot
> > -TST_xri          .... 001 1000 1 .... 0000 ............       @S_xri_rot
> > +TST_xri          .... 001 1000 1 .... ---- ............       @S_xri_rot
> >  TEQ_xri          .... 001 1001 1 .... 0000 ............       @S_xri_rot
> >  CMP_xri          .... 001 1010 1 .... 0000 ............       @S_xri_rot
> >  CMN_xri          .... 001 1011 1 .... 0000 ............       @S_xri_rot
> > 
> > 
> > Any thoughts on this?
> 
> thanks for the report, I was looking at this and have a kernel patch
> to fix this properly as Peter suggested. And while I agree on the
> problem, I was struggling to reproduce this in reality: both with
> -kernel and when booting through U-Boot the "Z" bit is set, which lets
> QEMU not even bother about the rest of the encoding - the condition
> flags don't match, so it proceeds. If I change the __nop to use "tsteq",
> I see it hanging due to the missing exception handler, but not with
> "tstne".
> So can you say how you spotted this issue? This would be needed as a
> justification for patching the guts of the ARM Linux kernel port.

Good point with the condition flags. I'm doing this with our own vmm
where I'm loading the binary directly as the payload (as mandated by the
header), and where psr is set to a defined value with all flags cleared.
If I set the Z bit than it also works (of course).
Looking a bit around in QEMU as well as u-boot I it looks like this is
rather by luck how flags are set.

Thanks for doing the Linux patch, I'll scrap mine, and also thanks to
Peter for the idea!


Adam

