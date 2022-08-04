Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A350158A3B7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 00:58:07 +0200 (CEST)
Received: from localhost ([::1]:42368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJjn4-0001my-CH
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 18:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJjlJ-0000Af-Mf
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 18:56:17 -0400
Received: from sin.source.kernel.org ([145.40.73.55]:48640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJjlH-0001UA-EU
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 18:56:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1ADBECE26F3;
 Thu,  4 Aug 2022 22:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E57C433D6;
 Thu,  4 Aug 2022 22:56:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gz+bXkLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659653766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hD6z8veO6eb05DcK1fTPRt9+fi4P9XPTHuLXyF8CHZ0=;
 b=gz+bXkLdKjQuCg+i5hQXzVzTSWWJzsvuf+kKt8mnOlOA3YGq3C+0dHdJxwlsX3VlHPFu/G
 u2mPOiIjoXStoZzAwOFw4wAbJIzrgIqU7tcSnbonsolTS3oUJtzPrR0fkNDOTPqSjVpsy+
 Ora4NsNVl728QebMyD2cKLb+qXtaj2M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b0c2d32
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 4 Aug 2022 22:56:05 +0000 (UTC)
Date: Fri, 5 Aug 2022 00:56:02 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-efi <linux-efi@vger.kernel.org>
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
Message-ID: <YuxOgtykRQb1HU3e@zx2c4.com>
References: <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com> <Yuu1kX9CAqSUNNAj@zx2c4.com>
 <Yuu3ee1iB3IoLdZS@redhat.com>
 <CAMj1kXFAz1ttRmt5_utReSC=TjdfmrgwbwSaAZTDnx6OPGuRRg@mail.gmail.com>
 <cf60456e-a2cd-a64d-0cee-4bea30708fc9@redhat.com>
 <CAHmME9pUdckUwei234Xdge_G-=b6q2e9a8mTVExrV4WE=6TLig@mail.gmail.com>
 <8254819e-d509-59f4-79e6-e8c0ba4eb2a6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8254819e-d509-59f4-79e6-e8c0ba4eb2a6@redhat.com>
Received-SPF: pass client-ip=145.40.73.55;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
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

Hey Laszlo,

On Thu, Aug 04, 2022 at 03:56:54PM +0200, Laszlo Ersek wrote:
> - do we want setup_data chaining work generally?
> 
> - or do we want only the random seed injection to stop crashing OVMF guests?

Preferably the first - generally. Which brings us to your point:
 
> > Given we only need 48 bytes or so, isn't there a more subtle place we
> > could just throw this in ram that doesn't need such complex
> > coordination?
> 
> These tricks add up and go wrong after a while. The pedantic
> reservations in the firmware have proved necessary.
> 
> IIUC, with v2, the setup_data_base address would (most frequently) be 96
> KB. edk2 does have uses for very low memory. If OVMF's PlatformPei does
> not reserve away the area, UefiCpuPkg or other drivers might allocate an
> overlapping chunk, even if only temporarily. That might not break the
> firmware, but it could overwrite the random seed. 

Yea, so we don't want an address that something else might overwrite. So
my question is: isn't there some 48 bytes or so available in some low
address (or maybe a high one?) that is traditionally reserved for some
hardware function, and so software doesn't use it, but it turns out QEMU
doesn't use it for anything either, so we can get away placing it at
that address? It seems like there *ought* to be something like that. I
just don't (yet) know what it is...

Jason

