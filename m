Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEF8519E9D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:55:10 +0200 (CEST)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDb3-0004I3-Jo
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=BVmj=VM=zx2c4.com=Jason@kernel.org>)
 id 1nmCtx-0004D5-MJ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:10:38 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:59744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=BVmj=VM=zx2c4.com=Jason@kernel.org>)
 id 1nmCtr-0002lU-1c
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:10:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FA6261B75
 for <qemu-devel@nongnu.org>; Wed,  4 May 2022 11:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE9CC385AE
 for <qemu-devel@nongnu.org>; Wed,  4 May 2022 11:10:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kyRhvdzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651662616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sChtuXGZ9YP+4H0o5k4v/GPndPTTWnkPojaSeBimyOM=;
 b=kyRhvdzKz9H+ZU4RPqEcqPiXLYj1YbA3Oxi2R34QJnIuisAir7Ml0yWY8uKwtieIKuIM3w
 yWTa2iDsdIQx7P4YyVFhOCuWsapeoBiWz3fu8KZDJSxVxL7vBq4Vm/hA53X8sip88FRgDu
 PXP377wfz7IBIoq/SFPwMPzAWoO/qtk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 327a62fd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 4 May 2022 11:10:16 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2f7d19cac0bso11040477b3.13
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 04:10:15 -0700 (PDT)
X-Gm-Message-State: AOAM532gIo40rmJMOLUEEM3fAlJzxV7cWjgNoLnu+AGx2XGLpGSAopCb
 bDf9hTva3P0vuOfRPQx4YpraDPqObRSOd9gxbEo=
X-Google-Smtp-Source: ABdhPJwMiZUuiuxWJRySwh0SK+aGojTawLBmdtaeP3evtNqT/kWZFLtbBfHaiI5YSEXGP27AJzWPXE74J1gpzuBA2lo=
X-Received: by 2002:a81:2541:0:b0:2f8:efd7:8962 with SMTP id
 l62-20020a812541000000b002f8efd78962mr17268902ywl.404.1651662615314; Wed, 04
 May 2022 04:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <20220503094533.402157-1-Jason@zx2c4.com> <YnGPDumfp1+6DUQG@antec>
In-Reply-To: <YnGPDumfp1+6DUQG@antec>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 May 2022 13:10:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9prmCzpg6h-j3o7zUiYzePuegqJOAGSH167H4L-DH=QMg@mail.gmail.com>
Message-ID: <CAHmME9prmCzpg6h-j3o7zUiYzePuegqJOAGSH167H4L-DH=QMg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/openrisc: use right OMPIC size variable
To: Stafford Horne <shorne@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openrisc@lists.librecores.org, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=BVmj=VM=zx2c4.com=Jason@kernel.org;
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

On Tue, May 3, 2022 at 10:22 PM Stafford Horne <shorne@gmail.com> wrote:
>
> On Tue, May 03, 2022 at 11:45:33AM +0200, Jason A. Donenfeld wrote:
> > This appears to be a copy and paste error. The UART size was used
> > instead of the much smaller OMPIC size. But actually that smaller OMPIC
> > size is wrong too and doesn't allow the IPI to work in Linux. So set it
> > to the old value.
> >
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >  hw/openrisc/openrisc_sim.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> > index 99b14940f4..3218db6656 100644
> > --- a/hw/openrisc/openrisc_sim.c
> > +++ b/hw/openrisc/openrisc_sim.c
> > @@ -78,7 +78,7 @@ static const struct MemmapEntry {
> >      [OR1KSIM_DRAM] =      { 0x00000000,          0 },
> >      [OR1KSIM_UART] =      { 0x90000000,      0x100 },
> >      [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
> > -    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
> > +    [OR1KSIM_OMPIC] =     { 0x98000000,      0x100 },
>
> Right, I missed this as part of my series.  OMPIC will allocate 2 32-bit
> registers per CPU.  I documented this here:
>
>   - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-ompic.c
>
> I think what we will want here is something like:
>
> [OR1KSIM_OMPIC] =     { 0x98000000, 8 * OR1KSIM_CPUS_MAX },

Do you want a v3 or are you going to fix it up yourself?

Jason

