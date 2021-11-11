Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027244DB90
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 19:24:55 +0100 (CET)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlEkn-0006EQ-Cj
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 13:24:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mlEhv-0005Gl-At
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:21:55 -0500
Received: from [2a00:1450:4864:20::434] (port=44772
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mlEht-0006Z7-2i
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:21:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id n29so11245266wra.11
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 10:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1nDfgExPLVmPjrHAgq5VjwgrVgGQAem5IuVIe5/76Gk=;
 b=UGhHc4TFB2k+7wS5DHjiEITIVyZrXuCcKONzlu8VgFClKneznjC3TAqo/mWe7sI3xa
 rv1CQQg7A/FOxG4XVD1vC+X50rAc+HJb2c+Lek3joHgtuES86dWD1f6U/AukNHzFHN5n
 huaf9DmwRFF/kOV3rUAndqdPQIM6NcK+JDqzhBFWGfZUh0OVamZZC6oS8vxt1e/xzsb4
 rvsOL+0/7E1y6VLc5mQmdfHrwqB+sgFHT6JaL4D36k8lOvF/4YcjFTqA4Y33ZRWX6N5i
 ZCl73Iiy1dHfd5XugPNaOEpv2bkAzHGLvg+yAwUktse0VgJpgzCfrOdorG9ETkhFcPec
 GHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1nDfgExPLVmPjrHAgq5VjwgrVgGQAem5IuVIe5/76Gk=;
 b=z5T4poLsddXLkzaEvMcQb79HSRCrRvnQnwc4ka+Qq364FsDIyWNjMhNbGmd4vCN4At
 7FxCKJ3MAfzDGFYTurR6X8b/gw39/ahiMZiuxYB2GZsqmwuK92HWesPBiHSqyfVtM1Cp
 x+SCiHeJTznUMxZSyR+oVpCLdZmiwHsqe1nGEoDkxd/lsNaq3yCgNr/vJkylAeiKiXoD
 lwLUn98DLq/HKmFAhGge1E7cQ484SXN+bSnoBBR0xvuNX1iCnaOnjEIf/bDhDz95O6t1
 sJ2Uhp6HoOwwUlNW5Zq8o7Kn4ZMZgCym7JwWCCK6dm5mNqXMdRFcd39LxrfI6jq6tFf+
 4N9Q==
X-Gm-Message-State: AOAM533tiseEHTUIjUrO65K7iVDZo9BctwUPAwU/3kJuM1LPnKHvsHkG
 EsVogjfGfjojwvYgdULphrrWRA==
X-Google-Smtp-Source: ABdhPJzfqpatzU8RaPRMu6+pUprPNM3lLb7nzJ4fswLhkBrpO8jx0tR9hTF1vJWfrLd8Nc4XpQvD0A==
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr11340278wry.101.1636654911055; 
 Thu, 11 Nov 2021 10:21:51 -0800 (PST)
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net.
 [82.11.186.48])
 by smtp.gmail.com with ESMTPSA id n32sm3374467wms.42.2021.11.11.10.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 10:21:50 -0800 (PST)
Date: Thu, 11 Nov 2021 18:21:48 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <YY1fPNywEOvSaJ/a@leviathan>
References: <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
 <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
 <20211109204249.usvfatm3frar3u7a@leviathan>
 <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
 <20211109225251.gfr2mvm3jynvdsnk@leviathan>
 <CAFEAcA-0NFAM5j8CrUf+hPmCZBGOiAkk2f-n-pfqjsv+OwM38w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-0NFAM5j8CrUf+hPmCZBGOiAkk2f-n-pfqjsv+OwM38w@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 16:55:09 +0000, Peter Maydell wrote:
> On Tue, 9 Nov 2021 at 22:52, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > On Tue, Nov 09, 2021 at 21:21:46 +0000, Peter Maydell wrote:
> > > The other thing we should nail down is how the user is going to
> > > select which flavour of machine they want to provide. Three
> > > options:
> > >  (1) no control, QEMU just emulates whatever the newest flavour is.
> > > User needs to go find a firmware image new enough to cope.
> > >  (2) different flavours exposed as different machine types
> > > (analogous to how we have musca-a and musca-b1, or raspi3ap and
> > > raspi3b, for instance). Old user command lines keep working
> > > because -M sbsa-ref doesn't change; the new stuff would be
> > > available via -M sbsa-ref-2 or whatever.
> > >  (3) different flavours exposed via a property
> > > (so you would have -M sbsa-ref,machine-revision=2 or something).
> > > If the revision defaults to 1 then old user setups still work
> > > but everybody starts to have to cart around an extra command
> > > line argument. If it defaults to "newest we know about" you
> > > get the opposite set of tradeoffs.
> >
> > I'm leaning towards (1), at least while working towards a "complete"
> > platform (when we may still add/change features, but not how those
> > features are communicated to the firmware).
> 
> That's certainly the easiest on the QEMU side; you know the
> userbase so would know whether that kind of compat break is
> going to be OK with them.
> 
> Q1: who is going to write the code for this?

Me, my team, and perhaps a little bit of help from Shashi where it
intersects his code.

> Q2: do we want to try to land "ITS in sbsa-ref" in 6.2? Given
> we're in freeze we're quite short of time even if we handwave
> the fact it's a new feature, not a bugfix, so I would lean
> towards 'no'...

Shashi - what is your feeling?
If we could make ITS support depend on the platform version being
communicated through TF-A, we could simplify the transition a lot.
But that would definitely mean missing 6.2.

Peter - could we sneak in an "add version node to DT" into 6.2?

/
    Leif

