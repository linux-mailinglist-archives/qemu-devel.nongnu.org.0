Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B8E67749D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 05:23:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJoLB-0004CB-OC; Sun, 22 Jan 2023 23:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1pJoL6-0004Bv-AA
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 23:21:48 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1pJoL2-00089k-Vp
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 23:21:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4546460D3B;
 Mon, 23 Jan 2023 04:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BACDC433EF;
 Mon, 23 Jan 2023 04:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674447692;
 bh=4Lv7ojHg0ycKwppe14qr0CFCwL5e0i7Z/jmJf8Onzzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gIMOiFjR08hPK2wzwn7/Zgepe+ecTqO4qAfNK3ve8BwkKlhkg7CXyYNgnunMkjjXR
 J1eKLoXz9M5M1weVCnbLyZ8ebDWcx7s4lPL2ZlYW+kXAyC4yi76quotgTNWGjEUtyI
 0ahcTJ1CReOz3BosxDQsAjVXzryAkeprgJDs6ef92W7UHMBBtNDfm9uwvL9VbqPXq7
 L8UOCA5qg1JULh8BFmJ5YbwcnoqYPokZV1Sp80lZzulEL4sT2mOjEiBcHjHmwYsWXD
 /QCmvHhmWMkzWEhXBZ5dKvBFke+TeiU++ydBH3veGBuWyY8wVfs9m0tP83sFQ3Myw5
 t465qIRxiDbjQ==
Date: Sun, 22 Jan 2023 20:21:30 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 pbonzini@redhat.com, Mathias Krause <minipli@grsecurity.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y84LSgtrq1Rq3ItD@sol.localdomain>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
 <Y72FmQlNwBsp8Ntc@zx2c4.com>
 <20230110125005-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110125005-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ebiggers@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Jan 10, 2023 at 12:50:42PM -0500, Michael S. Tsirkin wrote:
> On Tue, Jan 10, 2023 at 04:34:49PM +0100, Jason A. Donenfeld wrote:
> > Hi Michael,
> > 
> > Could you queue up this patch and mark it as a fix for 7.2.1? It is a
> > straight-up bug fix for a 7.2 regression that's now affected several
> > users.
> 
> OK. In the future pls cc me if you want me to merge a patch. Thanks!
> 
> > - It has two Tested-by tags on the thread.
> > - hpa, the maintainer of the kernel side of this, confirmed on one of
> >   the various tributary threads that this approach is a correct one.
> > - It doesn't introduce any new functionality.
> > 
> > For your convenience, you can grab this out of lore here:
> > 
> >   https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/
> > 
> > Or if you want to yolo it:
> > 
> >   curl https://lore.kernel.org/lkml/20221230220725.618763-1-Jason@zx2c4.com/raw | git am -s
> > 
> > It's now sat silent on the mailing list for a while. So let's please get
> > this committed and backported so that the bug reports stop coming in.
> > 

This patch still isn't on QEMU's master branch.  What happened to it?

- Eric

