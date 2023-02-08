Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E2B68F6DF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:27:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPp9D-0007tN-Qo; Wed, 08 Feb 2023 13:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPp9C-0007tE-Fj
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:26:22 -0500
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPp99-0001Wx-Qd
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:26:22 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BCCF3CE22A1;
 Wed,  8 Feb 2023 18:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4528DC433EF;
 Wed,  8 Feb 2023 18:26:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="K016IqpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675880768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCSHh9btcXlPeIxqS7Vnjq7SvncmmzKeuueAf8BLbAM=;
 b=K016IqpBZGA7LezMxCzNAa8KQu7tOeXAnvBayzcwxf1XKrOkTqt0p6OAen++ODnrawSB0B
 HSc6oxzqkecWNJk3KYjgW2DNgcTuiMHWX65Ryb5DWIQQPrK2qqHcbupSnJeKuekANtyr3w
 e16cxN0xX3noXJfdHwWnC1LBqH+nWVM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a8c39eaf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 8 Feb 2023 18:26:08 +0000 (UTC)
Date: Wed, 8 Feb 2023 19:26:05 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] x86: temporarily remove all attempts to provide setup_data
Message-ID: <Y+PpPRvnlakC78Is@zx2c4.com>
References: <20230208180835.234638-1-Jason@zx2c4.com>
 <20230208131125-mutt-send-email-mst@kernel.org>
 <CAHmME9rMnbGDZ+Rq8ao=gZd10kBp5ni=73HcPpFC58ChoKZObA@mail.gmail.com>
 <20230208131805-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230208131805-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=145.40.73.55;
 envelope-from=SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
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

On Wed, Feb 08, 2023 at 01:18:37PM -0500, Michael S. Tsirkin wrote:
> On Wed, Feb 08, 2023 at 03:14:38PM -0300, Jason A. Donenfeld wrote:
> > On Wed, Feb 8, 2023 at 3:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Feb 08, 2023 at 03:08:35PM -0300, Jason A. Donenfeld wrote:
> > > > All attempts at providing setup_data have been made as an iteration on
> > > > whatever was there before, stretching back to the original
> > > > implementation used for DTBs that [mis]used the kernel image itself.
> > > > We've now had a dozen rounds of bugs and hacks, and the result is
> > > > turning into a pile of unmaintainable and increasingly brittle hacks.
> > > >
> > > > Let's just rip out all the madness and start over. We can re-architect
> > > > this based on having a separate standalone setup_data file, which is how
> > > > it should have been done in the first place. This is a larger project
> > > > with a few things to coordinate, but we can't really begin thinking
> > > > about that while trying to play whack-a-mole with the current buggy
> > > > implementation.
> > > >
> > > > So this commit removes the setup_data setting from x86_load_linux(),
> > > > while leaving intact the infrastructure we'll need in the future to try
> > > > again.
> > > >
> > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > Cc: Dov Murik <dovmurik@linux.ibm.com>
> > > > Cc: Tom Lendacky <thomas.lendacky@amd.com>
> > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > > Cc: H. Peter Anvin <hpa@zytor.com>
> > > > Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > > Cc: Nathan Chancellor <nathan@kernel.org>
> > > > Cc: Borislav Petkov <bp@alien8.de>
> > > > Cc: Eric Biggers <ebiggers@kernel.org>
> > > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > >
> > > I think I'll be happier if this is just a revert of
> > > the relevant commits in reverse order to make life easier
> > > for backporters.
> > > Unless that's too much work as we made other changes around
> > > this code?
> > 
> > I think that's going to be messy. And it won't handle the dtb stuff
> > either straightforwardly.
> 
> List of Fixes tags so people can at least figure out whether they
> have a version that needs this fix then?

7.2 is when the functionality started causing problems for most people.
But the buggy code goes back to 3cbeb524 in 2016.

Jason

