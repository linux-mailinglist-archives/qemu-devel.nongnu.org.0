Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24365664575
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:59:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGep-0000G1-U5; Tue, 10 Jan 2023 10:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=vBZq=5H=zx2c4.com=Jason@kernel.org>)
 id 1pFGea-0000C0-0l
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:35:17 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=vBZq=5H=zx2c4.com=Jason@kernel.org>)
 id 1pFGeX-0007t1-Vd
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:35:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E0C761798;
 Tue, 10 Jan 2023 15:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1A2C433D2;
 Tue, 10 Jan 2023 15:34:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GrYnIo+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1673364894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XDH00etmdS8/BILcXpN5zPvqj8ZbmM2o4PpcSzT1ImI=;
 b=GrYnIo+9SqLJ3MTOK77uQTBueKyCj8KmmXIflSTKMvXwXgvfrG5VHkI3FIePYv2NU0AMB3
 YGcugcvBs6iE+agfYwviK9pKj4bbNLp8xhVO+CaR676F9ddNXcJdwdWr37mgSiMi8vJbqb
 mTQQOdaGw6F3bg13P5Sxtg/4TMaFlO0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 08ece292
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Jan 2023 15:34:53 +0000 (UTC)
Date: Tue, 10 Jan 2023 16:34:49 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 pbonzini@redhat.com, ebiggers@kernel.org,
 Mathias Krause <minipli@grsecurity.net>, qemu-devel@nongnu.org
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y72FmQlNwBsp8Ntc@zx2c4.com>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221230220725.618763-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=vBZq=5H=zx2c4.com=Jason@kernel.org;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Michael,

Could you queue up this patch and mark it as a fix for 7.2.1? It is a
straight-up bug fix for a 7.2 regression that's now affected several
users.

- It has two Tested-by tags on the thread.
- hpa, the maintainer of the kernel side of this, confirmed on one of
  the various tributary threads that this approach is a correct one.
- It doesn't introduce any new functionality.

For your convenience, you can grab this out of lore here:

  https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/

Or if you want to yolo it:

  curl https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/raw | git am -s

It's now sat silent on the mailing list for a while. So let's please get
this committed and backported so that the bug reports stop coming in.

Thanks,
Jason

