Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24BA57E0DD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 13:35:21 +0200 (CEST)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEqwC-0006Ds-EP
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 07:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KPWh=X3=zx2c4.com=Jason@kernel.org>)
 id 1oEqny-0007kH-9s
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:26:51 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:55038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KPWh=X3=zx2c4.com=Jason@kernel.org>)
 id 1oEqnt-0004Qm-UR
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:26:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EAF57615F0;
 Fri, 22 Jul 2022 11:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED06FC341C6;
 Fri, 22 Jul 2022 11:26:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AuQGjUm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658489195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ax3JZPyQ46FbdGJOsVlKk9TPN3tdi/vPlXv7s6hELuQ=;
 b=AuQGjUm29kyArlBj5CdhJ4t5fe90KLGTSvfX4YHcL0ruTC7cEqPWvPym4qMIEvwJrSIB+/
 WTK4aK68nRIl4pajMTt81HMmG7MNBhkyBcpVXMD2yhXeSKOrkFP8ExfPHeUDAeocaHFz6q
 BvLcapBNOuHxbR8eT1WDTCkba1P+z48=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a719bc9d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 22 Jul 2022 11:26:35 +0000 (UTC)
Date: Fri, 22 Jul 2022 13:26:33 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 7/9] hw/guest-loader: pass random seed to fdt
Message-ID: <YtqJaf5gSyj9cVt6@zx2c4.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-8-pbonzini@redhat.com>
 <87tu7az28k.fsf@linaro.org> <Ytm1KiyFGNqAo/Af@zx2c4.com>
 <87o7xhscey.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7xhscey.fsf@linaro.org>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=KPWh=X3=zx2c4.com=Jason@kernel.org;
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

Hey Alex,

On Fri, Jul 22, 2022 at 10:45:19AM +0100, Alex Bennée wrote:
> All the guest-loader does is add the information about where in memory a
> guest and/or it's initrd have been placed in memory to the DTB. It's
> entirely up to the initial booted code (usually a hypervisor in this
> case) to decide what gets passed up the chain to any subsequent guests.

I think that's also my understanding, but let me tell you what I was
thinking with regards to rng-seed there, and you can tell me if I'm way
off.

The guest-loader puts in memory various loaders in a multistage boot.
Let's call it stage0, stage1, stage2, and finally the kernel. Normally,
rng-seed is only given to one of these stages. That stage may or may not
pass it to the next one, and it most probably does not. And why should
it? The host is in a better position to generate these seeds, rather
than adding finicky and fragile crypto ratcheting code into each stage
bootloader. So, instead, QEMU can just give each stage its own seed, for
it to do whatever with. This way, if stage1 does nothing, at least
there's a fresh unused one available for the kernel when it finally gets
there.

Does what I describe correspond at all with the use of guest-loader? If
so, maybe this patch should stay? If not, discard it as rubbish.

Jason

