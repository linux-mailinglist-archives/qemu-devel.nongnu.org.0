Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E1C5AE8A6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:46:25 +0200 (CEST)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXyC-0007VK-PS
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVW8L-0001jf-Lq
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:48:57 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:57128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVW8J-0002GC-11
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:48:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 985E76134E;
 Tue,  6 Sep 2022 10:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116A9C433C1;
 Tue,  6 Sep 2022 10:48:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aJIkrgPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662461318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CrozTLj9IfkpWyw66D2T8/mCPqgGiTpLjM/xLlRUnG4=;
 b=aJIkrgPLyMh33Bl+/REIZ8efngaTsuLuWqx0ze/0nADFH19OsEhorRMK3memeeU+BjLS/b
 9G8mwkf5JaZGZZlKKHSxd2L9V8EeG0Zgr1D9KhHmYeh8TPvKE/pFrnschFcWDo7M9C9ftN
 euHIMjUbOqfCdHO0McbDv0gGV8oB58M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 963512d6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 6 Sep 2022 10:48:38 +0000 (UTC)
Date: Tue, 6 Sep 2022 12:48:36 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
Message-ID: <YxclhFwCad/6QE1Y@zx2c4.com>
References: <20220906103657.282785-1-Jason@zx2c4.com>
 <20220906104624.ensm5txdil5ieyae@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906104624.ensm5txdil5ieyae@sirius.home.kraxel.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

On Tue, Sep 06, 2022 at 12:46:24PM +0200, Gerd Hoffmann wrote:
> On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
> > It's only safe to modify the setup_data pointer on newer kernels where
> > the EFI stub loader will ignore it. So condition setting that offset on
> > the newer boot protocol version. While we're at it, gate this on SEV too.
> > This depends on the kernel commit linked below going upstream.
> > 
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@zx2c4.com/
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks for the ack. Just FYI, we should probably wait until Ard sends
the kernel side of things up to Linus before committing this to QEMU.

Jason

