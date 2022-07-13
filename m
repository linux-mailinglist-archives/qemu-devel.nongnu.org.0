Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098B7573C03
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 19:32:33 +0200 (CEST)
Received: from localhost ([::1]:58510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBgDv-0006XL-SH
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 13:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yVRI=XS=zx2c4.com=Jason@kernel.org>)
 id 1oBgAv-0004AV-17
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 13:29:25 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:45374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yVRI=XS=zx2c4.com=Jason@kernel.org>)
 id 1oBgAt-000706-9u
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 13:29:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6F5261CCD;
 Wed, 13 Jul 2022 17:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B47C34114;
 Wed, 13 Jul 2022 17:29:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="n2/7+IEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657733359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mCJki3tu1wkGcBE6jP2p+e/cC0m7ainOh4zP5SB0HP8=;
 b=n2/7+IECNuhAWznw5FE3nzqEsjFbQE6x3fIphmAIFTRkl6RmJiXW4vQGhC+DN9DEG5y83H
 JIUb+3kqa1Yp7Sr4cSQk+FSO63xj2lXNLJnigmfzo55mCym7dJ8w0B+fD45C9KPf9Uy4Rk
 yMtA8mNWQBJ5xATuEnkT5J69neypclg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cfc51f2b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 13 Jul 2022 17:29:18 +0000 (UTC)
Date: Wed, 13 Jul 2022 19:29:16 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
Message-ID: <Ys8A7NOcFkMck9Gi@zx2c4.com>
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
 <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
 <YsYxM6gmJf7y/nJc@zx2c4.com>
 <CAKmqyKNUC+eiXLqqwSC3AjmqUtBc8p59mAHdumZ2oHiCT8aT0A@mail.gmail.com>
 <CAHmME9o1AaNHacHV8O0Ni+AHdYeQZ9xjt-ygc-wwU=Vu97juCQ@mail.gmail.com>
 <CAKmqyKOJFz7i5sORoZ4sbjeLg_=b3=Nim6zfPRK0Dp1w29KfSQ@mail.gmail.com>
 <CAHmME9qqOVhKOiCc=UVZcj07GwGFcBJB6UdOY5LXpFpy9GA=Rg@mail.gmail.com>
 <CAKmqyKM16Hjwu1kQgvk-18bSszRKTTvpP7oeZx=hwP-m-KsL-w@mail.gmail.com>
 <YsxTtkdp7p10qzc3@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsxTtkdp7p10qzc3@zx2c4.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=yVRI=XS=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi again,

On Mon, Jul 11, 2022 at 06:45:42PM +0200, Jason A. Donenfeld wrote:
> I've reproduced the problem and determined the root cause. This is a
> generic issue with the mmio get_cycles() implementation before 5.9 on
> no-MMU configs, which was fixed during the 5.9 cycle. I don't believe
> that this is the only thing affected on that .0 kernel, where fixes were
> ostensibly backported. Given the relative age of risc-v, the fact that
> 5.8.0 was broken anyway, and that likely nobody is using this kernel in
> that configuration without applying updates, I'm pretty sure my patch is
> safe to apply. I'd recommend updating the broken kernel in your CI.
> 
> Meanwhile, the rng-seed field is part of the DT spec. Holding back the
> (virtual) hardware just because some random dot-zero non-LTS release had
> a quickly fixed bug seems ridiculous, and the way in which progress gets
> held up, hacks accumulate, and generally nothing good gets done. It will
> only hamper security, functionality, and boot speed, while helping no
> real practical case that can't be fixed in a better way.
> 
> So I believe you should apply the rng-seed commit so that the RISC-V
> machine honors that DT field.
> 
> Regards,
> Jason
> 

Just following up on this... Hoping we can get this into a tree soon.

Thanks,
Jason

