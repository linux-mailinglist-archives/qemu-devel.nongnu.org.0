Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5965A60B
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 19:24:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBgVb-00044y-N3; Sat, 31 Dec 2022 13:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org>)
 id 1pBgVZ-00044i-Oe
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 13:23:01 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org>)
 id 1pBgVX-0000BQ-Tg
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 13:23:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97A04B801BE;
 Sat, 31 Dec 2022 18:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3627DC433D2;
 Sat, 31 Dec 2022 18:22:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Zbi0+zXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672510970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KstZBdcZcqbHkQ2CxwtPc1Y6fLGICRufWpnz600OBT4=;
 b=Zbi0+zXEV/ee3LPUBCqdMKlQr8LNUJlwOflP3uriV2i5PKPGOGXCFqDh1mr+tcJcUpSYBA
 9SChpE00VU5jNJokTJrAOAgb4B9McJdrzcmggb6HFsqcDcxSx6ZN96cvVeyMdFEIlPycHJ
 BR2AIN6LhrSrmZMcTtXDixHLBfLZ1dc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3f12f758
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 31 Dec 2022 18:22:49 +0000 (UTC)
Date: Sat, 31 Dec 2022 19:22:47 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7B993P1+jYB/etX@zx2c4.com>
References: <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
 <Y69B40T9kWfxZpmf@zn.tnic>
 <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
 <Y69h6ur79SMhu61F@zx2c4.com>
 <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
 <Y7A76+IBS4fnucrW@zn.tnic> <Y7A8qP05B0YRbQIN@zx2c4.com>
 <Y7A9nBud6UeH+wYd@zn.tnic> <Y7A+YELM7m5E2PUQ@zx2c4.com>
 <Y7BGIAL4z6o6FEI5@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7BGIAL4z6o6FEI5@zn.tnic>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Sat, Dec 31, 2022 at 03:24:32PM +0100, Borislav Petkov wrote:
> On Sat, Dec 31, 2022 at 02:51:28PM +0100, Jason A. Donenfeld wrote:
> > That failure is unrelated to the ident mapping issue Peter and
> > I discussed. The original failure is described in the commit message:
> > decompression clobbers the data, so sd->next points to garbage.
> 
> Right

So with that understanding confirmed, I'm confused at your surprise that
hpa's unrelated fix to the different issue didn't fix this issue.

> and the fact that the kernel overwrites it still feels kinda wrong: the
> kernel knows where setup_data is - the address is in the setup header so
> *actually*, it should take care of not to clobber it.

Yea, technically the bootloader could relocate all the setup_data links
by copying them and updating ->next. This wouldn't be so hard to do.
(Special care would have to be taken, though, to zero out
SETUP_RNG_SEED, though, for forward secrecy and such.)

But since the kernel doesn't do this now, and the 62MiB bug also seems
to apply to existing kernels, for the purposes of QEMU for now, I think
the v3 patch is probably best, since it'll handle existing kernels.
Alternatively, setup_data could be relocated, the boot param protocol
could be bumped, and then QEMU could conditionalized it's use of
setup_data based on that protocol version. That'd work, but seems a bit
more involved.

So maybe for now, v3 works? Hopefully that looks like a correct approach
to hpa, anyhow:
https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/
I think it should fit with what he described would work.

Jason

