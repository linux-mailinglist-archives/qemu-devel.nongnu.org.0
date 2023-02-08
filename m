Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19C768EFAE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:21:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkNO-0006NO-HG; Wed, 08 Feb 2023 08:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPkNB-0006Me-L3
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPkN9-00021O-4R
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675862425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BGIa2Y3zxmOlM5ZOe4SI8GFqrl7ArMXOXgMS2370yB0=;
 b=Fh7rR1mouAbDBDURUXGLteMwictrnydR5XhCZClt4EWTmnzH5GOrZJQvM7BHvePeN5b4o6
 8YD83sRuH5o8La14RZDh7wqqaDEoOLRRPB+1wjnVtsSBnjwVdFoNdxcSEUiRk9fTUxNtcI
 cjz3GlnFafDogtdHE0n19NFxr307kOo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-543-uTZPxBnsMMuHavB2uhRA2Q-1; Wed, 08 Feb 2023 08:20:23 -0500
X-MC-Unique: uTZPxBnsMMuHavB2uhRA2Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 i9-20020a0560001ac900b002bfda39265aso2864744wry.13
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 05:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BGIa2Y3zxmOlM5ZOe4SI8GFqrl7ArMXOXgMS2370yB0=;
 b=MFg+AubErO1WQpLUMLeb2VBw0q5AtnZJInSZ31+1HWGL8jRlyJzZdL3nY9d6x7LePd
 tsig24PJYlRS4WmpoMeQVSl9YqtKcWc++2Rc4NBoDq/hBLyOy1ZDvdFo6ddscY+AuvUp
 fCszWJCmtJZaCkq1lWwqT80/+W0vzNecRMljeu7LtlL6gO0gF36ptnlX6mkoqzH/Z9sk
 ByU2hOg1SCe9bLHh7evihw2N8DeYVWGVi1lOqlPdgOk/i2u4OcU3MPWcHZWLZWv66/iQ
 AgIaM8MmbPnXG5Hv2qiI4/NYRIAm0Ah9Sy0/W9pkGgqmzOd2bPJC9xijsjANgAcWHAPD
 zJlw==
X-Gm-Message-State: AO0yUKWd1h5VIA4vouGm6GFO/JU8fVo1Y6O3KGQfUHp+iz8g8ytRrG8i
 qSxihNvU2W09sLXrNB6X6y+romED9z29u50mmCkJH+h2SKQ4cU42A6klqvrvBELAKWx4rHcwY16
 vvHXrX+TCIkLDVpA=
X-Received: by 2002:adf:f349:0:b0:2c3:eda4:ade4 with SMTP id
 e9-20020adff349000000b002c3eda4ade4mr6639052wrp.58.1675862422419; 
 Wed, 08 Feb 2023 05:20:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8gK+ruU4/sbJqZHwmjGCe5DI+WFtTGh5cjriRUgHVI2+RMCD6wpAM38OmNV24yi0KRQgiWvg==
X-Received: by 2002:adf:f349:0:b0:2c3:eda4:ade4 with SMTP id
 e9-20020adff349000000b002c3eda4ade4mr6639028wrp.58.1675862422119; 
 Wed, 08 Feb 2023 05:20:22 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 y6-20020a5d4ac6000000b002c3e18119f2sm10207636wrs.29.2023.02.08.05.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 05:20:21 -0800 (PST)
Date: Wed, 8 Feb 2023 08:20:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 Tom Lendacky <thomas.lendacky@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Message-ID: <20230208081849-mutt-send-email-mst@kernel.org>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <Y+LOFgCuC9wjKpsL@zx2c4.com>
 <20230207173008-mutt-send-email-mst@kernel.org>
 <CAHmME9pUe48qQRDwhWSK5ba=3Jj-qNYS8ZV9ZFEZeTi=MvEm6w@mail.gmail.com>
 <20230208041042-mutt-send-email-mst@kernel.org>
 <0f824626-cc06-c497-b9e4-6ee75986f52a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f824626-cc06-c497-b9e4-6ee75986f52a@linux.ibm.com>
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

On Wed, Feb 08, 2023 at 01:23:48PM +0200, Dov Murik wrote:
> Hi Michael,
> 
> On 08/02/2023 11:11, Michael S. Tsirkin wrote:
> > On Tue, Feb 07, 2023 at 07:33:09PM -0300, Jason A. Donenfeld wrote:
> >> On Tue, Feb 7, 2023 at 7:31 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>>
> >>> On Tue, Feb 07, 2023 at 07:17:58PM -0300, Jason A. Donenfeld wrote:
> >>>> On Tue, Feb 07, 2023 at 04:45:19PM -0500, Michael S. Tsirkin wrote:
> >>>>> On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
> >>>>>> Recent feature to supply RNG seed to the guest kernel modifies the
> >>>>>> kernel command-line by adding extra data at its end; this breaks
> >>>>>> measured boot with SEV and OVMF, and possibly signed boot.
> >>>>>>
> >>>>>> Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
> >>>>>> which has its own way of getting random seed (not to mention that
> >>>>>> getting the random seed from the untrusted host breaks the confidential
> >>>>>> computing trust model).
> >>>>>
> >>>>> Nope - getting a random seed from an untrusted source should not break
> >>>>> anything assuming you also have some other randomness source.
> >>>>> If you don't then you have other problems.
> >>>>>
> >>>>>> Disable the RNG seed feature in SEV guests.
> >>>>>>
> >>>>>> Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> >>>>>> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> >>>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> >>>>>>
> >>>>>> ---
> >>>>>>
> >>>>>> There might be a need for a wider change to the ways setup_data entries
> >>>>>> are handled in x86_load_linux(); here I just try to restore the
> >>>>>> situation for SEV guests prior to the addition of the SETUP_RNG_SEED
> >>>>>> entry.
> >>>>>>
> >>>>>> Recent discussions on other (safer?) ways to pass this setup_data entry:
> >>>>>> [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
> >>>>>>
> >>>>>> Note that in qemu 7.2.0 this is broken as well -- there the
> >>>>>> SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
> >>>>>> modifies and breaks the measurement of the kernel in SEV measured boot).
> >>>>>> A similar fix will be needed there (but I fear this patch cannot be
> >>>>>> applied as-is).
> >>>>>
> >>>>> So it's not a regression, is it?
> >>>>
> >>>> I think that note is actually wrong. There prior was the sev_enabled()
> >>>> check elsewhere, which should have worked. I remember we originally had
> >>>> that problem with 7.1 and fixed it. So this is a new issue. I'll take
> >>>> care of it.
> >>>>
> >>>>>
> >>>>>> ---
> >>>>>>  hw/i386/x86.c | 2 +-
> >>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> >>>>>> index eaff4227bd..e65a83f8df 100644
> >>>>>> --- a/hw/i386/x86.c
> >>>>>> +++ b/hw/i386/x86.c
> >>>>>> @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
> >>>>>>          load_image_size(dtb_filename, setup_data->data, dtb_size);
> >>>>>>      }
> >>>>>>
> >>>>>> -    if (!legacy_no_rng_seed && protocol >= 0x209) {
> >>>>>> +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
> >>>>>>          setup_data_offset = cmdline_size;
> >>>>>>          cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
> >>>>>>          kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
> >>>>>>
> >>>>>> base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
> >>>>>
> >>>>> I am beginning to think we have been hasty here. no rng seed
> >>>>> should have been then default and requested with a flag.
> >>>>> Then we'd avoid all this heartburn - and SEV might not be the
> >>>>> only workload broken.
> >>>>> Maybe not too late. Jason - objections?
> >>>>
> >>>> Yes, highly object. If it's not here by default, it's completely useless
> >>>> from my perspective and I'll just stop working on this feature. There's
> >>>> no reason we can't make this work. It's turned out to have a lot of
> >>>> technical landmines, but that doesn't mean it's infeasible. I'll keep
> >>>> hammering away at it.
> >>>>
> >>>> Anyway, I'll send a v2 of this patch, and also address another thing
> >>>> left out of the previous fix.
> >>>>
> >>>> (And meanwhile, James and hpa@ seem to be having some discussion about
> >>>> introducing an even better mechanism; we'll see if that materializes.)
> >>>>
> >>>> Jason
> >>>
> >>>
> >>> OK I guess ... objections to a reverse flag disabling this?
> >>> Will at least allow a work-around for sev and friends ...
> >>
> >> I think we should generally try to make this work right as-is, without
> >> needing to introduce knobs. The SEV stuff seems really simple to fix.
> >> I'll have a 2 patch series for you in the next 20 minutes if all goes
> >> well.
> > 
> > Absolutely. A knob can be a fallback though in the likely case
> > we missed something else. I'm inclined to
> > an on/off/auto knob which can either force it or let qemu
> > decide. Objections?
> > 
> 
> There's already a workaround for SEV: starting QEMU with
> '-machine pc-q35-7.1' (instead of '-machine q35').
> The pc-q35-7.1 model sets
> 
>     pcmc->legacy_no_rng_seed = true;
> 
> which prevents the modification of the cmdline (or modification of the
> kernel, in 7.2) -- and this allows the SEV kernel hashes to match.
> 
> Of course this means that you don't get any other features of 7.2 or
> 8.0, if you need them.  If we want to allow that, we'll need a special
> knob for turning off RNG seed.
> 
> -Dov

Right. Besides, this will also get you old bugs from 7.1 that
we kept around to stay compatible.

-- 
MST


