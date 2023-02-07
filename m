Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9C668E35A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 23:19:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWI3-0000Lz-6g; Tue, 07 Feb 2023 17:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPWI1-0000Lr-R5
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:18:13 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPWHz-00050z-S6
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:18:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3438EB81B2C;
 Tue,  7 Feb 2023 22:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7772CC433EF;
 Tue,  7 Feb 2023 22:18:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="XxHKFd3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675808284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p4CmkDL4MdZNvmDqcvDs2MjBA8da39i2EjmL5GmURPw=;
 b=XxHKFd3eC1VQ5/C/tLi+C/Ppy2WTP/QKJAF6k+jqf7dE6R7I8PJNUVvTVNaAF05ujBJTZL
 nVdLqU98CKwp65OWA39MZfbdQRcqrIP8P0SCNkhAnWApa0zt/is0mwh/XrQem4RdJHPssL
 fCIKT2qvnP/deskfZvMAoXeHX0eOJ/k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 093e3543
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 7 Feb 2023 22:18:03 +0000 (UTC)
Date: Tue, 7 Feb 2023 19:17:58 -0300
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org,
 Tom Lendacky <thomas.lendacky@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Message-ID: <Y+LOFgCuC9wjKpsL@zx2c4.com>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230207164117-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

On Tue, Feb 07, 2023 at 04:45:19PM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
> > Recent feature to supply RNG seed to the guest kernel modifies the
> > kernel command-line by adding extra data at its end; this breaks
> > measured boot with SEV and OVMF, and possibly signed boot.
> > 
> > Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
> > which has its own way of getting random seed (not to mention that
> > getting the random seed from the untrusted host breaks the confidential
> > computing trust model).
> 
> Nope - getting a random seed from an untrusted source should not break
> anything assuming you also have some other randomness source.
> If you don't then you have other problems.
> 
> > Disable the RNG seed feature in SEV guests.
> > 
> > Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> > Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> > Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> > 
> > ---
> > 
> > There might be a need for a wider change to the ways setup_data entries
> > are handled in x86_load_linux(); here I just try to restore the
> > situation for SEV guests prior to the addition of the SETUP_RNG_SEED
> > entry.
> > 
> > Recent discussions on other (safer?) ways to pass this setup_data entry:
> > [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
> > 
> > Note that in qemu 7.2.0 this is broken as well -- there the
> > SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
> > modifies and breaks the measurement of the kernel in SEV measured boot).
> > A similar fix will be needed there (but I fear this patch cannot be
> > applied as-is).
> 
> So it's not a regression, is it?

I think that note is actually wrong. There prior was the sev_enabled()
check elsewhere, which should have worked. I remember we originally had
that problem with 7.1 and fixed it. So this is a new issue. I'll take
care of it.

> 
> > ---
> >  hw/i386/x86.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index eaff4227bd..e65a83f8df 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
> >          load_image_size(dtb_filename, setup_data->data, dtb_size);
> >      }
> >  
> > -    if (!legacy_no_rng_seed && protocol >= 0x209) {
> > +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
> >          setup_data_offset = cmdline_size;
> >          cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
> >          kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
> > 
> > base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
> 
> I am beginning to think we have been hasty here. no rng seed
> should have been then default and requested with a flag.
> Then we'd avoid all this heartburn - and SEV might not be the
> only workload broken.
> Maybe not too late. Jason - objections?

Yes, highly object. If it's not here by default, it's completely useless
from my perspective and I'll just stop working on this feature. There's
no reason we can't make this work. It's turned out to have a lot of
technical landmines, but that doesn't mean it's infeasible. I'll keep
hammering away at it.

Anyway, I'll send a v2 of this patch, and also address another thing
left out of the previous fix.

(And meanwhile, James and hpa@ seem to be having some discussion about
introducing an even better mechanism; we'll see if that materializes.)

Jason

