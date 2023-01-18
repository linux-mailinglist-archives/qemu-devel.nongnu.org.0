Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0145167236E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 17:34:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIBNH-000438-Qq; Wed, 18 Jan 2023 11:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIBNB-0003vm-Mu; Wed, 18 Jan 2023 11:33:13 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIBN9-0007ZG-Rc; Wed, 18 Jan 2023 11:33:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04915618B9;
 Wed, 18 Jan 2023 16:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF45C433D2;
 Wed, 18 Jan 2023 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674059588;
 bh=EvloRG3EpfE933ID5KKedUR5tkgFonAHLOduo6HbtG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=abtW4dQI+3LDjGvw6JeLEt2l4OVehlfTuATrnFUwBWaRLZ9EKrPA/GbEXCkt+EIa0
 FBDab+1gwIkHMUs4vimUQfxJk60llHIE+1qEyHTcn1ZPXBJea/K43+Qzgnz8DIyDJJ
 lnySsJi8M8SrPvpzSScNL1X4BOIBpuoTvpWj2oI5fflJ65Q4LbMCZJjKvorPurNFSI
 nLBf904KFVmekKYUDEfjo8hScVKEaqVD1230jWH9Vf4Tyu5W7P8MR6qmEJbhOwGZET
 uF57Pg/4FZkAFJGXe0g+yQxWqCH55Djp4DwvXh9ojUJLM36N/r/zvdGoYZbwW0Du4f
 lj8AF3Hf4QUnA==
Date: Wed, 18 Jan 2023 09:33:05 -0700
From: Keith Busch <kbusch@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <its@irrelevant.dk>,
 Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8gfQXPYdHKd1v4I@kbusch-mbp>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local> <Y8Yq5faCjAKzMa9O@kbusch-mbp>
 <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Jan 18, 2023 at 03:04:06PM +0000, Peter Maydell wrote:
> On Tue, 17 Jan 2023 at 19:21, Guenter Roeck <linux@roeck-us.net> wrote:
> > Anyway - any idea what to do to help figuring out what is happening ?
> > Add tracing support to pci interrupt handling, maybe ?
> 
> For intermittent bugs, I like recording the QEMU session under
> rr (using its chaos mode to provoke the failure if necessary) to
> get a recording that I can debug and re-debug at leisure. Usually
> you want to turn on/add tracing to help with this, and if the
> failure doesn't hit early in bootup then you might need to
> do a QEMU snapshot just before point-of-failure so you can
> run rr only on the short snapshot-to-failure segment.
> 
> https://translatedcode.wordpress.com/2015/05/30/tricks-for-debugging-qemu-rr/
> https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-qemu-savevm-snapshots/
> 
> This gives you a debugging session from the QEMU side's perspective,
> of course -- assuming you know what the hardware is supposed to do
> you hopefully wind up with either "the guest software did X,Y,Z
> and we incorrectly did A" or else "the guest software did X,Y,Z,
> the spec says A is the right/a permitted thing but the guest got confused".
> If it's the latter then you have to look at the guest as a separate
> code analysis/debug problem.

Here's what I got, though I'm way out of my depth here.

It looks like Linux kernel's fasteoi for RISC-V's PLIC claims the
interrupt after its first handling, which I think is expected. After
claiming, QEMU masks the pending interrupt, lowering the level, though
the device that raised it never deasserted.

