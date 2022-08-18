Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E0D5987A1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:41:14 +0200 (CEST)
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhdx-0005Go-Ox
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=cnMf=YW=zx2c4.com=Jason@kernel.org>)
 id 1oOhbp-00023B-9J
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:39:01 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=cnMf=YW=zx2c4.com=Jason@kernel.org>)
 id 1oOhbn-0004Pn-4P
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:39:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98AFB6149E;
 Thu, 18 Aug 2022 15:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1BAC433C1;
 Thu, 18 Aug 2022 15:38:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ldr/BVSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1660837122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C1nUSHzbEorkvLX3MaeFGTOlIHQ34YWBsx68QaCBcpE=;
 b=ldr/BVSajANhMyo8M2QlK0j5wFH5b+wGmzIcpEBAabO4kC72DNi4UdtUwLGA9gISH8bMKf
 8PQ7pR7A/7kdmVJ5w+9lPjkkjcwTbMKH4pgJWWjM4jkWO0oquMGe2eZehvGYTUpE8UN3Y8
 JtOGI9wfypoX3RM4FGN+aQNynFpRVr4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5be51194
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 18 Aug 2022 15:38:41 +0000 (UTC)
Date: Thu, 18 Aug 2022 17:38:37 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 linux-efi <linux-efi@vger.kernel.org>
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
Message-ID: <Yv5c/UMrEhTUlIID@zx2c4.com>
References: <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com> <Yuu1kX9CAqSUNNAj@zx2c4.com>
 <Yuu3ee1iB3IoLdZS@redhat.com>
 <CAMj1kXFAz1ttRmt5_utReSC=TjdfmrgwbwSaAZTDnx6OPGuRRg@mail.gmail.com>
 <cf60456e-a2cd-a64d-0cee-4bea30708fc9@redhat.com>
 <CAHmME9pUdckUwei234Xdge_G-=b6q2e9a8mTVExrV4WE=6TLig@mail.gmail.com>
 <20220816085511.nw5w3wt5vemkyryt@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220816085511.nw5w3wt5vemkyryt@sirius.home.kraxel.org>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=cnMf=YW=zx2c4.com=Jason@kernel.org;
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

Hey Gerd,

On Tue, Aug 16, 2022 at 10:55:11AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > We can make setup_data chaining work with OVMF, but the whole chain
> > > should be located in a GPA range that OVMF dictates.
> > 
> > It sounds like what you describe is pretty OVMF-specific though,
> > right? Do we want to tie things together so tightly like that?
> > 
> > Given we only need 48 bytes or so, isn't there a more subtle place we
> > could just throw this in ram that doesn't need such complex
> > coordination?
> 
> Joining the party late (and still catching up the thread).  Given we
> don't need that anyway with EFI, only with legacy BIOS:  Can't that just
> be a protocol between qemu and pc-bios/optionrom/*boot*.S on how to pass
> those 48 bytes random seed?

Actually, I want this to work with EFI, very much so.

If our objective was to just not break EFI, the solution would be
simple: in the kernel we can have EFISTUB ignore the setup_data field
from the image, and then bump the boot header protocol number. If QEMU
sees the boot protocol number is below this one, then it won't set
setup_data. Done, fixed.

Except I think there's value in passing seeds even through with EFI.

Your option ROM idea is interesting; somebody mentioned that elsewhere
too I think. I'm wondering, though: do option ROMs still run when
EFI/OVMF is being used?

Jason

