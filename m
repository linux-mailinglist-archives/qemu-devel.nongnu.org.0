Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC585825EA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 13:53:37 +0200 (CEST)
Received: from localhost ([::1]:42668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGfbc-0007sR-OK
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 07:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Hqxn=YA=zx2c4.com=Jason@kernel.org>)
 id 1oGfZS-0006Me-E1
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:51:23 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:58410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Hqxn=YA=zx2c4.com=Jason@kernel.org>)
 id 1oGfZQ-0002Fo-18
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:51:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1894CB82013;
 Wed, 27 Jul 2022 11:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379E3C433D7;
 Wed, 27 Jul 2022 11:51:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="BZqyk/qq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658922674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z8W14I7wUhx3RZAQ+EsMwkqwUxx1lBkwWa1qaotw70U=;
 b=BZqyk/qqDwCCCtPb0x/xLXFJS58rqk8ou9c4epRh0EBa4hKtouFq9KmtXob2tCLOjV0qxs
 lSGNtxWF20U4VoJnXLHBnhMb3NpXXtbV0H8Q1cevX91g+E7G7dx5XvNFnjruns/tq6vtL+
 i2DLbMH0xqQevqplRvqzYO1WXaIUmHQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e46645e1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 27 Jul 2022 11:51:14 +0000 (UTC)
Date: Wed, 27 Jul 2022 13:51:12 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] hw/microblaze: pass random seed to fdt
Message-ID: <YuEmsNkrwldSFYnf@zx2c4.com>
References: <20220719122334.136290-1-Jason@zx2c4.com>
 <CAJy5ezq7_F6uDrY6RuXe5ru0mAbmx-pBTQoFCtZj4DhEM7EZpw@mail.gmail.com>
 <CAHmME9opYzwtK4oJo1bZo+9FDbXt6TfgybtFTfQpxqx6pOoGWA@mail.gmail.com>
 <CAJy5ezp-x2R=4yg=S6Tq2U67N8J2mkXNJ=wkv1oqB3r37hiunQ@mail.gmail.com>
 <CAHmME9r1L5PV8GB4HL+7QW7LRmy1fEh54A57M3aQ+0K_OwLPdQ@mail.gmail.com>
 <0c5d679f-367f-080d-7c46-137383fd054c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0c5d679f-367f-080d-7c46-137383fd054c@linaro.org>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=Hqxn=YA=zx2c4.com=Jason@kernel.org;
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

Hi Richard,

On Tue, Jul 26, 2022 at 08:13:09PM -0700, Richard Henderson wrote:
> On 7/26/22 18:49, Jason A. Donenfeld wrote:
> > Hi Edgar,
> > 
> > On Thu, Jul 21, 2022 at 8:43 PM Edgar E. Iglesias
> > <edgar.iglesias@gmail.com> wrote:
> >> Ah OK, Paolo, it would be great if you would take this via your tree!
> > 
> > It looks like Paolo never did this. So you might want to queue this
> > somewhere, or bug him to take it, or something. I don't know how this
> > works with 7.1-rc0 just being tagged, but I assume this means this has
> > to wait until 7.2
> 
> Yes, it has missed the window by over a week now: soft freeze.
> You really should have kept all of these in one thread.

Shoulda woulda coulda. It doesn't really matter to me much when the
microblaze one goes in, just that it can exist in some maintainer tree.
I'd like to be able to remove this from my "pending patch list" that I
have to monitor lest things be forgotten.

Jason

