Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D28A5FE6B2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 03:47:40 +0200 (CEST)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj9nW-0001qm-Si
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 21:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org>)
 id 1oj9kV-00008j-Iv
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 21:44:31 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:36994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org>)
 id 1oj9kT-0005ck-KY
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 21:44:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADB1761990;
 Fri, 14 Oct 2022 01:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CB4C433D7;
 Fri, 14 Oct 2022 01:44:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KfQOQlSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665711864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rtqXbxlJS/J8KFTKLoBUXD5oEqpa1hS3NlK3lB7beh8=;
 b=KfQOQlSCtLdNqihh9s0G46LW8yhg7I16DnUXx6PK9UAETCaoSoNpeuo21hakwCWvk6cAvJ
 SbrkNHHSYn9HUdLuzBiXeUbWBGm/Z5HFLvuCmmhMDSSVtfbqiQ09/grW/MyPNKrqe9jqHX
 /siFIjwUU+9XG43DS6NfdNs2IT4Vkqc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eadbe0d5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 14 Oct 2022 01:44:24 +0000 (UTC)
Date: Thu, 13 Oct 2022 19:44:21 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/8] rerandomize RNG seeds on reboot and handle
 record&replay
Message-ID: <Y0i+9aM9dV77d5X4@zx2c4.com>
References: <20221011204645.1160916-1-Jason@zx2c4.com>
 <6be37344-0c0e-9641-550b-3e1a32726035@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6be37344-0c0e-9641-550b-3e1a32726035@linaro.org>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 14, 2022 at 05:13:58AM +1100, Richard Henderson wrote:
> On 10/12/22 13:46, Jason A. Donenfeld wrote:
> > When the system reboots, the rng seed that QEMU passes should be
> > re-randomized, so that the new boot gets a new seed. This series wires
> > that up for FDT.
> > 
> > Then, since the record&replay subsystem makes use of reset as well, we
> > add a new reset cause for record&replay, so that we can avoid
> > re-randomizing in these cases.
> > 
> > Jason A. Donenfeld (8):
> >    device-tree: add re-randomization helper function
> >    arm: re-randomize rng-seed on reboot
> >    riscv: re-randomize rng-seed on reboot
> >    openrisc: re-randomize rng-seed on reboot
> >    rx: re-randomize rng-seed on reboot
> >    mips: re-randomize rng-seed on reboot
> >    reset: allow registering handlers that aren't called by snapshot
> >      loading
> >    reset: do not re-randomize RNG seed on snapshot load
> 
> You need to invert the patch order so that the series is bisectable.
> At the moment you still introduce the reported bug, then fix it in the final patch.

I was afraid of that. Okay, will do. v+1 coming your way.

Jason

