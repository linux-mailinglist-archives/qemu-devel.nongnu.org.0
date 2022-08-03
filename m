Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EFF589491
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 00:52:08 +0200 (CEST)
Received: from localhost ([::1]:50966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJNDj-0000eC-4n
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 18:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJNCf-0007hZ-QK
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:51:01 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:56856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJNCd-0006D1-Kh
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:51:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76E4E61589;
 Wed,  3 Aug 2022 22:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B22C433D6;
 Wed,  3 Aug 2022 22:50:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Ef9YMf0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659567052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LTyfEeO9m1KFrXGl4270txc6Nr3v53BZLdMSL0IIQRk=;
 b=Ef9YMf0KczdRHsV0iUdGZveBHMm1OvFzMqT5Xeagyx44fwS5q2AAnk2Fz7zGQDSSBidCUf
 pUByTcevdvzDqIHIHjyDCTR1CThK1ElyAcD/jHxpon5R41GKi/0jSvLKGtX4DeFfNyha4c
 Xk+OOR08ADwUsEF2OYJvwPo31dysTIQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c703dd86
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 3 Aug 2022 22:50:52 +0000 (UTC)
Date: Thu, 4 Aug 2022 00:50:50 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org
Subject: Re: [PATCH RFC v1] hw/i386: place setup_data at fixed place in memory
Message-ID: <Yur7ypNrSv8eO9/Q@zx2c4.com>
References: <20220803170235.1312978-1-Jason@zx2c4.com>
 <20220803182340-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220803182340-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=hVua=YH=zx2c4.com=Jason@kernel.org;
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

Hi Michael,

On Wed, Aug 03, 2022 at 06:25:39PM -0400, Michael S. Tsirkin wrote:
> > -    /* Offset 0x250 is a pointer to the first setup_data link. */
> > -    stq_p(header + 0x250, first_setup_data);
> > +    if (first_setup_data) {
> > +            /* Offset 0x250 is a pointer to the first setup_data link. */
> > +            stq_p(header + 0x250, first_setup_data);
> > +            rom_add_blob("setup_data", setup_datas, setup_data_total_len, setup_data_total_len,
> > +                         SETUP_DATA_PHYS_BASE, NULL, NULL, NULL, NULL, false);
> > +    }
> > +
> >
> 
> Allocating memory on x86 is tricky business.  Can we maybe use bios-linker-loader
> with COMMAND_WRITE_POINTER to get an address from firmware?

Hmm. Is BIOSLinker even available to us at this stage in preparation?

One thing to note is that this memory doesn't really need to be
persistent. It's only used extreeeemely early in boot. So it could be
somewhere that gets used/remapped later on.

Jason

