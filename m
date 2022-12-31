Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC4265A43D
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 13:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBbP5-00025H-VK; Sat, 31 Dec 2022 07:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org>)
 id 1pBbOr-000239-TU
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 07:55:46 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org>)
 id 1pBbOq-0003yH-A6
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 07:55:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61ED760A05;
 Sat, 31 Dec 2022 12:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2C3C433D2;
 Sat, 31 Dec 2022 12:55:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Zj+6Yeu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672491338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WtAEE7+A30698oarN7kLZng0aHalPx3eHSCK0c4NZ4Q=;
 b=Zj+6Yeu6IKHkbjh3w8ulIKp0JX/VtWBFOj14CAflyHJ+n8iXBigBmLi7IeaTq0LN/SwKvo
 TV9V5xhqF6m/qbS4UeCrqxRQdy4gg7/2lkMvFtOC395/Sk28Aolfo81AtWtFKmIOux4I0i
 ZyK6onKXNIvl4UIycmmga0mTpmPM5oM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3a678b71
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 31 Dec 2022 12:55:38 +0000 (UTC)
Date: Sat, 31 Dec 2022 13:55:32 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7AxRMn7l8J512eZ@zx2c4.com>
References: <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y62MdawGaasXmoVL@zn.tnic> <Y68Js5b0jW/2nLU4@zx2c4.com>
 <Y68Zf/MKmX3Rr18E@zn.tnic>
 <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
 <Y69B40T9kWfxZpmf@zn.tnic>
 <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
 <Y69h6ur79SMhu61F@zx2c4.com>
 <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

On Fri, Dec 30, 2022 at 05:06:55PM -0800, H. Peter Anvin wrote:
> 
> 
> On 12/30/22 14:10, Jason A. Donenfeld wrote:
> > On Fri, Dec 30, 2022 at 01:58:39PM -0800, H. Peter Anvin wrote:
> >> See the other thread fork. They have identified the problem already.
> > 
> > Not sure I follow. Is there another thread where somebody worked out why
> > this 62meg limit was happening?
> > 
> > Note that I sent v2/v3, to fix the original problem in a different way,
> > and if that looks good to the QEMU maintainers, then we can all be happy
> > with that. But I *haven't* addressed and still don't fully understand
> > why the 62meg limit applied to my v1 in the way it does. Did you find a
> > bug there to fix? If so, please do CC me.
> > 
> 
> Yes, you yourself posted the problem:
> 
> > Then build qemu. Run it with `-kernel bzImage`, based on the kernel
> > built with the .config I attached.
> > 
> > You'll see that the CPU triple faults when hitting this line:
> > 
> >         sd = (struct setup_data *)boot_params->hdr.setup_data;
> >         while (sd) {
> >                 unsigned long sd_addr = (unsigned long)sd;
> > 
> >                 kernel_add_identity_map(sd_addr, sd_addr + sizeof(*sd) + sd->len);  <----
> >                 sd = (struct setup_data *)sd->next;
> >         }
> > 
> > , because it dereferences *sd. This does not happen if the decompressed
> > size of the kernel is < 62 megs.
> > 
> > So that's the "big and pretty serious" bug that might be worthy of
> > investigation.
> 
> This needs to be something like:
> 
> kernel_add_identity_map(sd_addr, sd_addr + sizeof(*sd));
> kernel_add_identity_map(sd_addr + sizeof(*sd),
> 	sd_addr + sizeof(*sd) + sd->len);
> 

Oh, right, duh. Thanks for spelling it out.

Jason

