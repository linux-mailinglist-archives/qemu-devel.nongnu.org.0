Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F0458AB0C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 14:51:33 +0200 (CEST)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJwnb-00041e-FN
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 08:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=jDGz=YJ=zx2c4.com=Jason@kernel.org>)
 id 1oJwkj-00018z-Pa
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 08:48:34 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:43122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=jDGz=YJ=zx2c4.com=Jason@kernel.org>)
 id 1oJwkh-0003Ks-Mw
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 08:48:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7607EB828BD;
 Fri,  5 Aug 2022 12:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0263CC433D7;
 Fri,  5 Aug 2022 12:48:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="M8dPhoUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659703699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e4NrhcEjpw9Lq9/iIXgxKiypFZXFjHgXpfkuLSB3Izw=;
 b=M8dPhoUEY48No20FG6YkbwRHCVyOo2hbfFBRaKys3p2ykPnzDMAXnSDrdodxk/c7hcCHqr
 MCCIo/fHg+3jVC0W95XdNzaqnwzS9jLOf/mtIl06d2oBWY0/qt/OLsyohu/GQS5PfZGheV
 oF3ysb+lIeFp1qq2EGS7Qfv66AWzgzw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eee15885
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 5 Aug 2022 12:48:18 +0000 (UTC)
Date: Fri, 5 Aug 2022 14:47:27 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>, linux-efi@vger.kernel.org
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
Message-ID: <Yu0RX2b+e9BpGsJ6@zx2c4.com>
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
 <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=jDGz=YJ=zx2c4.com=Jason@kernel.org;
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

Hi Paolo,

On Fri, Aug 05, 2022 at 10:10:02AM +0200, Paolo Bonzini wrote:
> On 8/5/22 01:04, Jason A. Donenfeld wrote:
> > +    /* Nothing else uses this part of the hardware mapped region */
> > +    setup_data_base = 0xfffff - 0x1000;
> 
> Isn't this where the BIOS lives?  I don't think this works.

That's the segment dedicated to ROM and hardware mapped addresses. So
that's a place to put ROM material. No actual software will use it.

Jason

