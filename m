Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AF569726
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 03:07:07 +0200 (CEST)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Fz0-0007zJ-F2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 21:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=oW6x=XM=zx2c4.com=Jason@kernel.org>)
 id 1o9Fx6-0006XD-VC
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:05:13 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:55750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=oW6x=XM=zx2c4.com=Jason@kernel.org>)
 id 1o9Fx4-0005Do-Vm
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:05:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B0BEB80DEA;
 Thu,  7 Jul 2022 01:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B515C3411C;
 Thu,  7 Jul 2022 01:04:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="EWJ4kaUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657155894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bnallzYwiVPcx76TTsFB7abClHf+tiQF/gf0NwYQ3EI=;
 b=EWJ4kaUJqY+fIybxznUbrdsP/TqA1ddM85P1s5h8kDHWfZtK1b4G9wR3eBdjL2/eJ8Lrq6
 GtkMjoGLAAfuBTUNtV1/lHxJ3L/lsGSti9Er7cKQoUUnO7qb+9InK8ee3Qh4BXGK1AJDq8
 P1puVXY7EGLMpw5Fb+xYl3Fu+9K23sk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d99679c8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 7 Jul 2022 01:04:53 +0000 (UTC)
Date: Thu, 7 Jul 2022 03:04:51 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
Message-ID: <YsYxM6gmJf7y/nJc@zx2c4.com>
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
 <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=oW6x=XM=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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

Hey Alistair,

On Tue, Jul 05, 2022 at 03:09:09AM +0200, Jason A. Donenfeld wrote:
> Hi Alistair,
> 
> On Wed, Jun 29, 2022 at 4:09 AM Alistair Francis <alistair23@gmail.com> wrote:
> > I have a Linux 5.8 test case that is failing due to this patch.
> 
> Before I started fixing things in random.c, there were a lot of early
> boot bugs with the RNG in Linux. I backported the fixes for these to
> all stable kernels. It's a bummer that risc-v got hit by these bugs,
> but I think that's just the way things go unfortunately.
> 
> Jason
> 

By the way, I still can't find this in your github tree. I was hoping we
could get this in for 7.1.

As for your 5.8 issue, I've been trying to reproduce that to understand
more about it, but I'm unable to. I've been trying with
nommu_virt_defconfig using my patch ontop of qemu master. Maybe it's
possible in testing this out you were testing the wrong branch? Anyway,
it'd be nice to get this queued up...

Jason

