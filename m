Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76BB68EAB0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:12:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgV0-0001oa-8j; Wed, 08 Feb 2023 04:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPgUu-0001nn-VR
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:12:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPgUh-0007M9-8Z
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675847512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNk41LPGcVfIE3jR4ReMGhtM/nM23wQmboVpi+1mse8=;
 b=LrzA5PlCj2QJyyTThNOH8fxGtBRn0rg/tzfszfZHsGrqu6+zePmAEzjcVB0JjpBmTGHxyk
 qIjfXNPM8IRyJ5vtYBR/hS1gS6AezQwskdRtRGBrTMjIUInd7pG1x0BFjYSCv4PjuSuMSO
 A9K1krx/MyNuVUaX/H9jb7b4Rrbtawc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-VKdx4nyHP3-IZHVQH33XhA-1; Wed, 08 Feb 2023 04:11:51 -0500
X-MC-Unique: VKdx4nyHP3-IZHVQH33XhA-1
Received: by mail-ej1-f70.google.com with SMTP id
 lt13-20020a170906fa8d00b008aab3c58bf7so2275130ejb.22
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 01:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNk41LPGcVfIE3jR4ReMGhtM/nM23wQmboVpi+1mse8=;
 b=rAxmjNuvl2UbbZqiT77tEoNHIYBsRrs7WMyqj82QCbsESCxRVhRhnOh/AtGeRm4FMO
 kwstcE133w1A9c7eqIQAkcN9uPJdYtTEwGqkwHfzupOW/EWoV3TcpaY4edZ5AAbViQxo
 k8gAmm/oqpouIfC8VmsKuN6UqEb0YFDjKL3hghADaGgunW5AA41UoAIlG6bTCNXBNZg4
 hKq9UloiDQmKMjgArhzri0Wq1k6gjkiru6pOhEj5TWJGOzr8qYO4EeSmMnxrkcq/HpBY
 RBecQYL5DJfcCZ54zl3SxiwfSvCCUTIDmg4ScTFzNnUSFWvx2YTL/Pcw60IPax4t9Jsm
 qkIA==
X-Gm-Message-State: AO0yUKVpd/7n1VqJw0/Wrm8R6HaeMSlyFm5XNjQzPOhtHtRgWk/J9jvW
 SVhU+ds1kINrJ+uHnbxS/b4dBhlMlGvKNs8BwLnI308C5LUUZteGYqjU9AKlZ51UDnKLBK6vBRc
 3jPIuH3feJ8/3d2o=
X-Received: by 2002:a17:907:6e88:b0:8aa:be3c:decf with SMTP id
 sh8-20020a1709076e8800b008aabe3cdecfmr5169831ejc.17.1675847510205; 
 Wed, 08 Feb 2023 01:11:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/lFpKR4M54K2hXEaGFW45oGMnG3YBdTQ+KFpHs9E38eNGxIO0J9VsW0Zv8HLrne4gswOAxEw==
X-Received: by 2002:a17:907:6e88:b0:8aa:be3c:decf with SMTP id
 sh8-20020a1709076e8800b008aabe3cdecfmr5169813ejc.17.1675847509994; 
 Wed, 08 Feb 2023 01:11:49 -0800 (PST)
Received: from redhat.com ([2.52.156.127]) by smtp.gmail.com with ESMTPSA id
 y7-20020a170906470700b0088cdb05f1d5sm8009569ejq.113.2023.02.08.01.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 01:11:49 -0800 (PST)
Date: Wed, 8 Feb 2023 04:11:45 -0500
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
Message-ID: <20230208041042-mutt-send-email-mst@kernel.org>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <Y+LOFgCuC9wjKpsL@zx2c4.com>
 <20230207173008-mutt-send-email-mst@kernel.org>
 <CAHmME9pUe48qQRDwhWSK5ba=3Jj-qNYS8ZV9ZFEZeTi=MvEm6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9pUe48qQRDwhWSK5ba=3Jj-qNYS8ZV9ZFEZeTi=MvEm6w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 07, 2023 at 07:33:09PM -0300, Jason A. Donenfeld wrote:
> On Tue, Feb 7, 2023 at 7:31 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Feb 07, 2023 at 07:17:58PM -0300, Jason A. Donenfeld wrote:
> > > On Tue, Feb 07, 2023 at 04:45:19PM -0500, Michael S. Tsirkin wrote:
> > > > On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
> > > > > Recent feature to supply RNG seed to the guest kernel modifies the
> > > > > kernel command-line by adding extra data at its end; this breaks
> > > > > measured boot with SEV and OVMF, and possibly signed boot.
> > > > >
> > > > > Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
> > > > > which has its own way of getting random seed (not to mention that
> > > > > getting the random seed from the untrusted host breaks the confidential
> > > > > computing trust model).
> > > >
> > > > Nope - getting a random seed from an untrusted source should not break
> > > > anything assuming you also have some other randomness source.
> > > > If you don't then you have other problems.
> > > >
> > > > > Disable the RNG seed feature in SEV guests.
> > > > >
> > > > > Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> > > > > Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> > > > > Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> > > > >
> > > > > ---
> > > > >
> > > > > There might be a need for a wider change to the ways setup_data entries
> > > > > are handled in x86_load_linux(); here I just try to restore the
> > > > > situation for SEV guests prior to the addition of the SETUP_RNG_SEED
> > > > > entry.
> > > > >
> > > > > Recent discussions on other (safer?) ways to pass this setup_data entry:
> > > > > [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
> > > > >
> > > > > Note that in qemu 7.2.0 this is broken as well -- there the
> > > > > SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
> > > > > modifies and breaks the measurement of the kernel in SEV measured boot).
> > > > > A similar fix will be needed there (but I fear this patch cannot be
> > > > > applied as-is).
> > > >
> > > > So it's not a regression, is it?
> > >
> > > I think that note is actually wrong. There prior was the sev_enabled()
> > > check elsewhere, which should have worked. I remember we originally had
> > > that problem with 7.1 and fixed it. So this is a new issue. I'll take
> > > care of it.
> > >
> > > >
> > > > > ---
> > > > >  hw/i386/x86.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > > > > index eaff4227bd..e65a83f8df 100644
> > > > > --- a/hw/i386/x86.c
> > > > > +++ b/hw/i386/x86.c
> > > > > @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
> > > > >          load_image_size(dtb_filename, setup_data->data, dtb_size);
> > > > >      }
> > > > >
> > > > > -    if (!legacy_no_rng_seed && protocol >= 0x209) {
> > > > > +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
> > > > >          setup_data_offset = cmdline_size;
> > > > >          cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
> > > > >          kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
> > > > >
> > > > > base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
> > > >
> > > > I am beginning to think we have been hasty here. no rng seed
> > > > should have been then default and requested with a flag.
> > > > Then we'd avoid all this heartburn - and SEV might not be the
> > > > only workload broken.
> > > > Maybe not too late. Jason - objections?
> > >
> > > Yes, highly object. If it's not here by default, it's completely useless
> > > from my perspective and I'll just stop working on this feature. There's
> > > no reason we can't make this work. It's turned out to have a lot of
> > > technical landmines, but that doesn't mean it's infeasible. I'll keep
> > > hammering away at it.
> > >
> > > Anyway, I'll send a v2 of this patch, and also address another thing
> > > left out of the previous fix.
> > >
> > > (And meanwhile, James and hpa@ seem to be having some discussion about
> > > introducing an even better mechanism; we'll see if that materializes.)
> > >
> > > Jason
> >
> >
> > OK I guess ... objections to a reverse flag disabling this?
> > Will at least allow a work-around for sev and friends ...
> 
> I think we should generally try to make this work right as-is, without
> needing to introduce knobs. The SEV stuff seems really simple to fix.
> I'll have a 2 patch series for you in the next 20 minutes if all goes
> well.

Absolutely. A knob can be a fallback though in the likely case
we missed something else. I'm inclined to
an on/off/auto knob which can either force it or let qemu
decide. Objections?

-- 
MST


