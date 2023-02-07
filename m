Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E8368E36F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 23:33:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWVA-00054D-Eb; Tue, 07 Feb 2023 17:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPWV7-00052T-3x
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPWV3-0007X8-Nq
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675809098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tOWCgXPt1KLWy6PPm+cYvynE76BinFcZkLhwjyYLuqY=;
 b=abFpcotBqERFbhqR65F/taUdYYm0icDhqBB3jBZUQOF4qMCaXt0wX9MDkniW+xb03NV5do
 1kOquz3MiEx41UdlnJQyMfmHLtpiDpQ344CM7OOwMjRa9FwlMoYYasGsF+OXstFS8iwWe5
 9ZFMRCA3ORdI/Jd+qkboeLXZTBic+Ts=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-uONGNeADOtaid4MsFUjXCQ-1; Tue, 07 Feb 2023 17:31:37 -0500
X-MC-Unique: uONGNeADOtaid4MsFUjXCQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 a6-20020a05620a102600b00729952b4c73so10650935qkk.6
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 14:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOWCgXPt1KLWy6PPm+cYvynE76BinFcZkLhwjyYLuqY=;
 b=TomB+SBLFNqdxNfAYJ4UI5Kh4WzuyCZLlvTwszl1BHUzBdX8W5y9SgE/ZO57qUOvIM
 4r/HVk9uDmx4ZcLW2Xlz4lI63hIjA6yR90jUyC9c7RIQYm5OubgW0bLCXGOZ1rahMg4c
 4hHhH7KH131lJTZwxF/CQ3XVkMV2qzO85C3calNVX83m6n/FSLUZf5cnYk09DMdHCaxV
 o7ZeaA8IC/XYo+FeV+T4yTho/R6m2VOkbBykc870CvVzoPD/+MFFo5QkwjNn1I+vKJJu
 sVrDKboYAJkUZR2cXidVG0oApdit7bAtRsXmrHK35QBabRVQgm49uc9QjKclrPYSWsR2
 nyKQ==
X-Gm-Message-State: AO0yUKXIUAE8hr+SwyG+7gAuODe1iyTGqRSA6/4azTmEIabamQbt33tu
 PHUPbaFTxP24sQu9IOcN9mPgXtzfK/AS7wXzisZcVt7rzRhmr0q8uoZwyE4+ifiO+hvPF/zvrFT
 FtyH4Jsx9uvQS/5Q=
X-Received: by 2002:ac8:5c50:0:b0:3b8:2d45:4760 with SMTP id
 j16-20020ac85c50000000b003b82d454760mr8291166qtj.61.1675809096597; 
 Tue, 07 Feb 2023 14:31:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8IZmNzMVHgR2DI/yov8SR443k8jD0QhTWROn9IxLRgw8Px3YRPpP/xKKoGR0GYjtKXXaqMxg==
X-Received: by 2002:ac8:5c50:0:b0:3b8:2d45:4760 with SMTP id
 j16-20020ac85c50000000b003b82d454760mr8291122qtj.61.1675809096288; 
 Tue, 07 Feb 2023 14:31:36 -0800 (PST)
Received: from redhat.com ([37.19.196.65]) by smtp.gmail.com with ESMTPSA id
 e18-20020ac86712000000b003b9a505627bsm10187145qtp.79.2023.02.07.14.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 14:31:35 -0800 (PST)
Date: Tue, 7 Feb 2023 17:31:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org,
 Tom Lendacky <thomas.lendacky@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Message-ID: <20230207173008-mutt-send-email-mst@kernel.org>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <Y+LOFgCuC9wjKpsL@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+LOFgCuC9wjKpsL@zx2c4.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 07, 2023 at 07:17:58PM -0300, Jason A. Donenfeld wrote:
> On Tue, Feb 07, 2023 at 04:45:19PM -0500, Michael S. Tsirkin wrote:
> > On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
> > > Recent feature to supply RNG seed to the guest kernel modifies the
> > > kernel command-line by adding extra data at its end; this breaks
> > > measured boot with SEV and OVMF, and possibly signed boot.
> > > 
> > > Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
> > > which has its own way of getting random seed (not to mention that
> > > getting the random seed from the untrusted host breaks the confidential
> > > computing trust model).
> > 
> > Nope - getting a random seed from an untrusted source should not break
> > anything assuming you also have some other randomness source.
> > If you don't then you have other problems.
> > 
> > > Disable the RNG seed feature in SEV guests.
> > > 
> > > Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> > > Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> > > Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> > > 
> > > ---
> > > 
> > > There might be a need for a wider change to the ways setup_data entries
> > > are handled in x86_load_linux(); here I just try to restore the
> > > situation for SEV guests prior to the addition of the SETUP_RNG_SEED
> > > entry.
> > > 
> > > Recent discussions on other (safer?) ways to pass this setup_data entry:
> > > [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
> > > 
> > > Note that in qemu 7.2.0 this is broken as well -- there the
> > > SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
> > > modifies and breaks the measurement of the kernel in SEV measured boot).
> > > A similar fix will be needed there (but I fear this patch cannot be
> > > applied as-is).
> > 
> > So it's not a regression, is it?
> 
> I think that note is actually wrong. There prior was the sev_enabled()
> check elsewhere, which should have worked. I remember we originally had
> that problem with 7.1 and fixed it. So this is a new issue. I'll take
> care of it.
> 
> > 
> > > ---
> > >  hw/i386/x86.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > > index eaff4227bd..e65a83f8df 100644
> > > --- a/hw/i386/x86.c
> > > +++ b/hw/i386/x86.c
> > > @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
> > >          load_image_size(dtb_filename, setup_data->data, dtb_size);
> > >      }
> > >  
> > > -    if (!legacy_no_rng_seed && protocol >= 0x209) {
> > > +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
> > >          setup_data_offset = cmdline_size;
> > >          cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
> > >          kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
> > > 
> > > base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
> > 
> > I am beginning to think we have been hasty here. no rng seed
> > should have been then default and requested with a flag.
> > Then we'd avoid all this heartburn - and SEV might not be the
> > only workload broken.
> > Maybe not too late. Jason - objections?
> 
> Yes, highly object. If it's not here by default, it's completely useless
> from my perspective and I'll just stop working on this feature. There's
> no reason we can't make this work. It's turned out to have a lot of
> technical landmines, but that doesn't mean it's infeasible. I'll keep
> hammering away at it.
> 
> Anyway, I'll send a v2 of this patch, and also address another thing
> left out of the previous fix.
> 
> (And meanwhile, James and hpa@ seem to be having some discussion about
> introducing an even better mechanism; we'll see if that materializes.)
> 
> Jason


OK I guess ... objections to a reverse flag disabling this?
Will at least allow a work-around for sev and friends ...

-- 
MST


