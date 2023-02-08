Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A8268F6C7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:19:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPp1u-0005Fp-3h; Wed, 08 Feb 2023 13:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPp1r-0005FY-Ef
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:18:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPp1q-0008CI-2D
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675880325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIcq3P/5rIAbyviB1ugNp87Uox5xG5dLJSCsy7c3axc=;
 b=f5gj86nJl2pit31YDFEp+sDGdEUo9ZKNKbEz7xIKiJCVOw6lY6Mm1vEwf2cXWDqbE+ilFr
 NGOyemKea1mqGfKQ2TIYKbRNWiNRN920YtBTQWUri3lzf+yLykRmi53gPVcDn2mdk+vx99
 KMtc+fKLuCriHw8EZFNGOfHiL3ADKCk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-dWfswoTnPUiSZD6kFdmaaQ-1; Wed, 08 Feb 2023 13:18:44 -0500
X-MC-Unique: dWfswoTnPUiSZD6kFdmaaQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 ud13-20020a170907c60d00b0088d773d11d6so13668537ejc.17
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 10:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IIcq3P/5rIAbyviB1ugNp87Uox5xG5dLJSCsy7c3axc=;
 b=1sxER4ncyWgIezuwqsmeGpVDyUx3CQwdq3nL3UNNchFlSrALyVaR7fMXBRhI22NoRU
 36qc/v8Q4H+Jqr4aQaZLg3IkuDa1BlWCHsuIYimLGvzbMJCGb5rTczRkWQM8/D6rxepy
 SVX0j8V6wjgy2GcY1kiUJX5Xn2GvLWbO5quOZv1AcyYMpH6wZYR25MM19CzgzICkPGiE
 yL1zOZh/qEpxQUSPgs5NB4DiUkRfTAwr8d5CDc5hqdAT8s6s51c4XZI506Y/ZO6Jg9GA
 mxWIm6/8vAI2P2GSE6ZZVgmlOsGQKgLAukAas2OJNRpDCnNRUBdXx+5aAD0OFtubBf32
 vmfA==
X-Gm-Message-State: AO0yUKXtxLDH+ejTjO9aNroHN/qesAFI704HZ8K2dp84MpPOIF2+Vssk
 i3EtFuXWGsKCZ+geJVF19jNPv8aad8mNB5+ZXhvKBwu21raGCuoOSiA8uJoQeKBlrC1820jgH2H
 nMRWsAl3qi7ZMZ0c=
X-Received: by 2002:a17:907:7da8:b0:8ad:531d:3606 with SMTP id
 oz40-20020a1709077da800b008ad531d3606mr3713548ejc.35.1675880322594; 
 Wed, 08 Feb 2023 10:18:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+aC6Hz7vImfOgHT67wkp5ZsNnOrtTvqW8pQvkv83CS7iCBnpRFpNlQtr1mCGEStx+0YVRzgA==
X-Received: by 2002:a17:907:7da8:b0:8ad:531d:3606 with SMTP id
 oz40-20020a1709077da800b008ad531d3606mr3713518ejc.35.1675880322396; 
 Wed, 08 Feb 2023 10:18:42 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 n12-20020a1709065e0c00b0086a4bb74cf7sm8590060eju.212.2023.02.08.10.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 10:18:41 -0800 (PST)
Date: Wed, 8 Feb 2023 13:18:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] x86: temporarily remove all attempts to provide setup_data
Message-ID: <20230208131805-mutt-send-email-mst@kernel.org>
References: <20230208180835.234638-1-Jason@zx2c4.com>
 <20230208131125-mutt-send-email-mst@kernel.org>
 <CAHmME9rMnbGDZ+Rq8ao=gZd10kBp5ni=73HcPpFC58ChoKZObA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9rMnbGDZ+Rq8ao=gZd10kBp5ni=73HcPpFC58ChoKZObA@mail.gmail.com>
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

On Wed, Feb 08, 2023 at 03:14:38PM -0300, Jason A. Donenfeld wrote:
> On Wed, Feb 8, 2023 at 3:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Feb 08, 2023 at 03:08:35PM -0300, Jason A. Donenfeld wrote:
> > > All attempts at providing setup_data have been made as an iteration on
> > > whatever was there before, stretching back to the original
> > > implementation used for DTBs that [mis]used the kernel image itself.
> > > We've now had a dozen rounds of bugs and hacks, and the result is
> > > turning into a pile of unmaintainable and increasingly brittle hacks.
> > >
> > > Let's just rip out all the madness and start over. We can re-architect
> > > this based on having a separate standalone setup_data file, which is how
> > > it should have been done in the first place. This is a larger project
> > > with a few things to coordinate, but we can't really begin thinking
> > > about that while trying to play whack-a-mole with the current buggy
> > > implementation.
> > >
> > > So this commit removes the setup_data setting from x86_load_linux(),
> > > while leaving intact the infrastructure we'll need in the future to try
> > > again.
> > >
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Dov Murik <dovmurik@linux.ibm.com>
> > > Cc: Tom Lendacky <thomas.lendacky@amd.com>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > Cc: H. Peter Anvin <hpa@zytor.com>
> > > Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > Cc: Nathan Chancellor <nathan@kernel.org>
> > > Cc: Borislav Petkov <bp@alien8.de>
> > > Cc: Eric Biggers <ebiggers@kernel.org>
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >
> > I think I'll be happier if this is just a revert of
> > the relevant commits in reverse order to make life easier
> > for backporters.
> > Unless that's too much work as we made other changes around
> > this code?
> 
> I think that's going to be messy. And it won't handle the dtb stuff
> either straightforwardly.

List of Fixes tags so people can at least figure out whether they
have a version that needs this fix then?

-- 
MST


