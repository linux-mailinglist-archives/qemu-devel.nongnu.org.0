Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F444B919
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 23:56:55 +0100 (CET)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mka2v-0003IF-OQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 17:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mkZzD-0000fR-5G
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 17:53:03 -0500
Received: from [2a00:1450:4864:20::42b] (port=38502
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mkZz7-0008HO-AK
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 17:52:59 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u18so610164wrg.5
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 14:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+xLp7dacCBCy4620NVyS91oE2zwQj4tmo1glBUi4mHY=;
 b=hINUKwbFhTFX4U5ayjIkuuIF5nWOtKuQBHi2vmjNQGcCMQsO4NzF47TYA0vy8RWBBn
 SegD0L8jYLlDB5V9FXDJurgFGA8YPvhsjzxu1AbP5IgQeigMpMN9qscZxTq59wmAQxkj
 Waeoj3pywydgXgbU4uJUYLQZuILwe13ol7iYtJpBYzIGTnE30EYE+ZbBdwNi06+m2/+x
 uXigLU1UUeN1ESyZiPBiqEmV0g6BMR4QArB5e47wU+xHNQl0HHH5jK08zNh9sIZ/o9Yj
 e0E4GPMSA5ASmva3L73EHgwNeoqpOrz6ngsxQjFKM1N65RtcxdQNhEdgRf087kMCXTFD
 ZkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+xLp7dacCBCy4620NVyS91oE2zwQj4tmo1glBUi4mHY=;
 b=GPN2BvlbqPdnSwX7bLAYAjP79bKg/DupZW0f8wrbYbwUJo4mD2zbOfJ+Lv1WD2PY8j
 5pZcWI2deKKpe1ISqVhC+uly3rtvKo3JhYqnUqnDh81u0bE/7qiCi9dPfunJo9xBilYY
 6VPAcynkFrjMU3EGEJMtjntVNgs04nufFB6DjgedkPFTZbX2+vH/J3xzHmShmzrNcpbn
 6a/tGdlxvYQyc6ywTxu/O32ekwhXkaotdLSsYtw/LzLIdHRdb9RNrme+pRSFh+RrcDqW
 0HvKJi6XfILwmgO95J7lQ7mHdAEOd9t5XxIiI74SbEAUY9//eH0SsmOxkfY+e0VLccE4
 m8rQ==
X-Gm-Message-State: AOAM531FNYEl3uZK48GBaXbDLkX/qm99KOYJoJS534aJLdYK7O/iT/WH
 vDiq2dq7xJtlcB1MV5Ws84R3sw==
X-Google-Smtp-Source: ABdhPJz0wCoPAnFy8NcRn69idxtU95iybhRMj66V/MpwJ0sKaa1Zdw4qaru4WTntviC59LWWkoDTqg==
X-Received: by 2002:adf:8008:: with SMTP id 8mr13554790wrk.188.1636498374289; 
 Tue, 09 Nov 2021 14:52:54 -0800 (PST)
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net.
 [82.11.186.48])
 by smtp.gmail.com with ESMTPSA id d6sm20859488wrx.60.2021.11.09.14.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 14:52:53 -0800 (PST)
Date: Tue, 9 Nov 2021 22:52:51 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20211109225251.gfr2mvm3jynvdsnk@leviathan>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
 <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
 <20211109204249.usvfatm3frar3u7a@leviathan>
 <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42b.google.com
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 21:21:46 +0000, Peter Maydell wrote:
> > Hmm, right. So you're thinking containing the versioning fully in the
> > interfaces presented by the model:
> > - Is the version node present?
> >   - If so, is it greater than X?
> >     - If so, is it great enough to support the SCP interface?
> > And let the firmware deal with that?
> 
> How the model tells the firmware about the presence/absence of
> certain things and whether it's one version or another is
> a different question again :-) I guess since we're using DTB
> already for passing some info to the firmware that that would be
> the way to continue. Whether it's better to have a simple
> "version" node or property, or to have perhaps distinct things
> in the DTB to indicate presence/absence of important features I
> don't know and leave up to you.

Right. So my preference is to communicate the version only, and then
have that version let firmware know whether there are now other
interfaces available (i.e. an SCP) to gather additional system
information.

> > I was kind of thinking it was expected for incompatible machine
> > versions to be qemu versioned. But I'm good with skipping that bit if
> > it's not.
> 
> The other thing we should nail down is how the user is going to
> select which flavour of machine they want to provide. Three
> options:
>  (1) no control, QEMU just emulates whatever the newest flavour is.
> User needs to go find a firmware image new enough to cope.
>  (2) different flavours exposed as different machine types
> (analogous to how we have musca-a and musca-b1, or raspi3ap and
> raspi3b, for instance). Old user command lines keep working
> because -M sbsa-ref doesn't change; the new stuff would be
> available via -M sbsa-ref-2 or whatever.
>  (3) different flavours exposed via a property
> (so you would have -M sbsa-ref,machine-revision=2 or something).
> If the revision defaults to 1 then old user setups still work
> but everybody starts to have to cart around an extra command
> line argument. If it defaults to "newest we know about" you
> get the opposite set of tradeoffs.

I'm leaning towards (1), at least while working towards a "complete"
platform (when we may still add/change features, but not how those
features are communicated to the firmware).

Once the platform is complete, I would very much want to
support (3), for example to tweak GIC layout to match GIC-600 or
GIC-700, with different configurations.

/
     Leif

