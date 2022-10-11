Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5945FB69D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:09:03 +0200 (CEST)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiGsP-000814-K9
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiGgc-00075Y-Gx
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:56:55 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:38972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiGga-0006Ov-98
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:56:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5EA9611D6;
 Tue, 11 Oct 2022 14:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9218CC433C1;
 Tue, 11 Oct 2022 14:56:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="S345a0FZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665500196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxAGmXh3efN5w/CP8oFKPpSb9XU8O30jbhNp4+y/BO0=;
 b=S345a0FZxmY64nbMlnd6cOr0EyTwGjTp9v1D9oHpBCZSpVQ7gj5hYkDS+Qrx3XDN0oK0GF
 FpsMBCdjRRX4yGEY5HgJFMlOfyLQ7uExnywbcSOHq7NH0/6UGati1/zgwR0U/C58ROcUyi
 XBVNIiksGuqhYk5d8ocz5OtATC2kXV4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fee072f8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 11 Oct 2022 14:56:36 +0000 (UTC)
Date: Tue, 11 Oct 2022 08:56:33 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] m68k: write bootinfo as rom section and re-randomize
 on reboot
Message-ID: <Y0WC1i1fWi9Q8WsJ@zx2c4.com>
References: <20221002103707.909560-1-Jason@zx2c4.com>
 <20221003110221.971024-1-Jason@zx2c4.com>
 <ebeb90c7-8f46-4af0-073d-6f1710d3eeb2@vivier.eu>
 <CAFEAcA-0Uz_nT6V5_7Mkqrg17sX-syrxfyBjZQFUjU5UnPdPcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-0Uz_nT6V5_7Mkqrg17sX-syrxfyBjZQFUjU5UnPdPcg@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=aME8=2M=zx2c4.com=Jason@kernel.org;
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

On Tue, Oct 11, 2022 at 10:29:45AM +0100, Peter Maydell wrote:
> On Tue, 11 Oct 2022 at 09:41, Laurent Vivier <laurent@vivier.eu> wrote:
> >
> > Le 03/10/2022 à 13:02, Jason A. Donenfeld a écrit :
> > > Rather than poking directly into RAM, add the bootinfo block as a proper
> > > ROM, so that it's restored when rebooting the system. This way, if the
> > > guest corrupts any of the bootinfo items, but then tries to reboot,
> > > it'll still be restored back to normal as expected.
> > >
> > > Then, since the RNG seed needs to be fresh on each boot, regenerate the
> > > RNG seed in the ROM when reseting the CPU.
> >
> > As it's needed to be refreshed, I think it would better not to use a ROM and to regenerate all the
> > bootinfo data on the reset.
> 
> I quite liked the use of a rom blob in this patch -- it gets rid
> of a lot of direct stl_phys() calls (which is a semi-deprecated
> API because it ignores the possibility of failure).

A ROM is also how other archs do it. I'm good either way though.
Laurent/Peter - can you guys decide something and let me know if I need
a v+1 that avoids the ROM, or if you'll go with this v3 that uses the
ROM? Just make a decision, and I'll follow it.

Jason

