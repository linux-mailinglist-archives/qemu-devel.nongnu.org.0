Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A0C5AE896
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:41:17 +0200 (CEST)
Received: from localhost ([::1]:59978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXtE-0007W9-J6
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVWBY-0003Xb-7v
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:52:05 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:56676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVWBW-0002oa-A9
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:52:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9E0A8B81630;
 Tue,  6 Sep 2022 10:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53993C433C1;
 Tue,  6 Sep 2022 10:51:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="XKtkOR/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662461513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37UFh+rhw1ybvWb0RBntJmUoa1a1ej7qgp8+WtJPZMc=;
 b=XKtkOR/qOQAwL/lIVqkfwMgD6xg+CCpSA2JxhRzdLut4mZlB+fhRKEoi41UE8Ku2VAQ3WY
 VjQ3eUGGG+jHikgnnmmJeUJ71NjUCMLDV5xSklFfYXZ4sH6APMdiZvnwQz6WMmpLZ9hOej
 g6g2D63HM7GrgAd2TNDK6zw0dE9hLHc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 93d5f7f7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 6 Sep 2022 10:51:53 +0000 (UTC)
Date: Tue, 6 Sep 2022 12:51:50 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
Message-ID: <YxcmRhwrtGBsMGev@zx2c4.com>
References: <20220906103657.282785-1-Jason@zx2c4.com>
 <20220906063954-mutt-send-email-mst@kernel.org>
 <CAHmME9oyf5MmZ4gXkbm+dA3t1NBYB6XdPrk8N1OyKLi5Lke0Rg@mail.gmail.com>
 <20220906064500-mutt-send-email-mst@kernel.org>
 <YxclCJ3FKSE6neu/@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxclCJ3FKSE6neu/@zx2c4.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

On Tue, Sep 06, 2022 at 12:46:32PM +0200, Jason A. Donenfeld wrote:
> On Tue, Sep 06, 2022 at 06:45:34AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Sep 06, 2022 at 12:43:55PM +0200, Jason A. Donenfeld wrote:
> > > On Tue, Sep 6, 2022 at 12:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
> > > > > It's only safe to modify the setup_data pointer on newer kernels where
> > > > > the EFI stub loader will ignore it. So condition setting that offset on
> > > > > the newer boot protocol version. While we're at it, gate this on SEV too.
> > > > > This depends on the kernel commit linked below going upstream.
> > > > >
> > > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > > Cc: Laurent Vivier <laurent@vivier.eu>
> > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > > > Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > > > Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@zx2c4.com/
> > > > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > >
> > > > BTW what does it have to do with SEV?
> > > > Is this because SEV is not going to trust the data to be random anyway?
> > > 
> > > Daniel (now CC'd) pointed out in one of the previous threads that this
> > > breaks SEV, because the image hash changes.
> > > 
> > > Jason
> > 
> > Oh I see. I'd add a comment maybe and definitely mention this
> > in the commit log.
> 
> Sure, will do.

Actually, I'm wrong. This is already done implicitly below with a huge
comment:

    /*
     * If we're starting an encrypted VM, it will be OVMF based, which uses the
     * efi stub for booting and doesn't require any values to be placed in the
     * kernel header.  We therefore don't update the header so the hash of the
     * kernel on the other side of the fw_cfg interface matches the hash of the
     * file the user passed in.
     */
    if (!sev_enabled()) {
        memcpy(setup, header, MIN(sizeof(header), setup_size));
    }

So I'll remove the SEV bit from this commit. Whoops. Glad you asked
about it.

Jason

