Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB9B60D20F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:56:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onNCE-0007Vg-QX; Tue, 25 Oct 2022 12:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onNC2-0007Fc-0P
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:54:22 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onNBv-00046C-NU
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:54:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EABCA61589;
 Tue, 25 Oct 2022 16:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC06EC433D6;
 Tue, 25 Oct 2022 16:54:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="BVZu5fS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666716841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F93PBSz6pAmO556hAZfc/k6xeWEXMB7DskMxCVAwPvo=;
 b=BVZu5fS8nSrOdv8Rb8LDrs3sntYE2a0dMUqTPkcD8EUtzkvCwbLuPKMLwDYCJH9RBv8Fy5
 S1cB3QLHBeWuIg5pKR8+lxCTvJ9LkQqd4mVFjWB0hYo4V+kgzzODyB+k18lCAzd55mQFOq
 7UxwyUsytf4LtvtyGvVe1IaUHpXd+Jo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ff2a7b8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 16:54:00 +0000 (UTC)
Date: Tue, 25 Oct 2022 18:53:57 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
	richard.henderson@linaro.org
Subject: Re: [PATCH v4 00/11] rerandomize RNG seeds on reboot and handle
 record&replay
Message-ID: <Y1gUpZPAImM2ugrM@zx2c4.com>
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <CAFEAcA89uq1UnO=QatVPW08t-THfkq61H7ct3yeaCm24LgoHFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA89uq1UnO=QatVPW08t-THfkq61H7ct3yeaCm24LgoHFA@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 05:39:27PM +0100, Peter Maydell wrote:
> On Tue, 25 Oct 2022 at 01:43, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > When the system reboots, the rng seed that QEMU passes should be
> > re-randomized, so that the new boot gets a new seed. This series wires
> > that up for FDT.
> >
> > Then, since the record&replay subsystem makes use of reset as well, we
> > add a new reset cause for record&replay, so that we can avoid
> > re-randomizing in these cases.
> >
> > Version 4 prevents the new reset type from leaking over QAPI, documents
> > this alongside which version it was introduced, and adds mips and m68k
> > machine types to the queue.
> >
> > Jason A. Donenfeld (11):
> >   reset: allow registering handlers that aren't called by snapshot
> >     loading
> >   device-tree: add re-randomization helper function
> >   x86: do not re-randomize RNG seed on snapshot load
> >   arm: re-randomize rng-seed on reboot
> >   riscv: re-randomize rng-seed on reboot
> >   m68k/virt: do not re-randomize RNG seed on snapshot load
> >   m68k/q800: do not re-randomize RNG seed on snapshot load
> >   mips/boston: re-randomize rng-seed on reboot
> >   mips/malta: pass RNG seed via env var and re-randomize on reboot
> >   openrisc: re-randomize rng-seed on reboot
> >   rx: re-randomize rng-seed on reboot
> 
> Hi; I've taken all of these except the mips/malta patch into
> target-arm.next. I have some comments on that one but I
> don't see any reason to hold up the rest of these while we
> sort those out.

Too bad. Philippe does not respond to my emails, so no discussion has
been possible. If you or someone more responsive would like to take over
in that discussion, that'd be great. Let's talk.

Jason

