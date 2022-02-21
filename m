Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9033D4BED73
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:52:45 +0100 (CET)
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHXw-0002R7-M9
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:52:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMHQq-0008Ke-Te
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:45:25 -0500
Received: from [2a00:1450:4864:20::629] (port=46069
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMHQo-0001Z7-TC
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:45:24 -0500
Received: by mail-ej1-x629.google.com with SMTP id lw4so36883014ejb.12
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 14:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s9UH0OQzTyvI5ZX3X9ki9ZvoaHx9Ghhh/PrApjXLlkw=;
 b=r9tGMr0kpmOXQNWbCAmchYExk0e28cwldBW08TgX3kYed77iSxQLWkyE/nQJlHZVV7
 SWQsYjbctHsBJEYGyiFBJoAhplUjJMpejzfN+0lmmXNSIno4VN2FwyMrQp24bl2st/tO
 bjE5avdFDveojv7Tb8vIv7DeLactDkDrZEgO1HxoZ1KwdbRiTN6wSh9f9buNCNUzAE0Q
 XMGWmPSr5NcX9ZAXlIGcYVlnsOExNhLJ9xCgPxDlhWOReEcYf3wHnPp7U+ZIyW1Qj0Vb
 O+TKIIouf6pg1ta4c7qY795epD7+HnPwe86K+c7N1vu4vaRf4iOwWpktAyA+4PgkYifo
 SsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s9UH0OQzTyvI5ZX3X9ki9ZvoaHx9Ghhh/PrApjXLlkw=;
 b=DNvhpUw3kGNSF8FQZ783PJLgW6Uy4xGd9iSFU58Cnbq+GLhG0TkOID0iayCjuGEQ5p
 579HXgMLZjRPCT9cCo1s7G31oRPYl/D9xyG2/cbfKn+R4URBU9o4pUqHIWGMU3jG6nqC
 728h5WE6ub69lX3PrqXM2g3FPpqWzm9uWa1BHnIGp0R2dzeJnUnthhCVqMj4MVsKbbfk
 3fGlXWvvVeWF6c1SHUwcuw2nryEhU/IQzQoBgwsnuRUjgUsWiz9h/vCtiG7FOo9jWQ5+
 Y8c5Nxh4Gvj3sDVofma0wrP13X9/LLS0QSmtxO6JZhDw20RqrtCKZzZTGsBI/vLiXDdL
 PMRQ==
X-Gm-Message-State: AOAM533TtzmzUtkkE9FGQRptCfyMcI9pYeUF28DwQfeusGyv8WNzarcl
 h52hc2R1Rvjph50zkV5+VPrQdg==
X-Google-Smtp-Source: ABdhPJwsf1y8nMuR/ix45N0E47vIRkogotn1TZPixMcM5PWeHPQeHEZpFaE8ZOGnPzF0iMoy4I/pvQ==
X-Received: by 2002:a17:906:4443:b0:6cf:6a7d:5f9b with SMTP id
 i3-20020a170906444300b006cf6a7d5f9bmr17287712ejp.12.1645483520458; 
 Mon, 21 Feb 2022 14:45:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id hp7sm473895ejc.144.2022.02.21.14.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 14:45:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADDDE1FFB7;
 Mon, 21 Feb 2022 22:45:18 +0000 (GMT)
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
 <87h78sm9oo.fsf@linaro.org>
 <CAFEAcA-thpNdaTVUXrfHG5+pPD8RyORQXWG9V7eCFMp97y_56g@mail.gmail.com>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Date: Mon, 21 Feb 2022 22:45:04 +0000
In-reply-to: <CAFEAcA-thpNdaTVUXrfHG5+pPD8RyORQXWG9V7eCFMp97y_56g@mail.gmail.com>
Message-ID: <87czjfn8jl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>, qemu-arm@nongnu.org,
 Andrew Strauss <astrauss11@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 21 Feb 2022 at 17:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> The previous numbers were a guess at best and rather arbitrary without
>> >> taking into account anything that might be loaded. Instead of using
>> >> guesses based on the state of registers implement a new function that:
>> >>
>> >>  a) scans the MemoryRegions for the largest RAM block
>> >>  b) iterates through all "ROM" blobs looking for the biggest gap
>> >>
>> >> The "ROM" blobs include all code loaded via -kernel and the various
>> >> -device loader techniques.
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> Cc: Andrew Strauss <astrauss11@gmail.com>
>> >> Cc: Keith Packard <keithp@keithp.com>
>> >> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>> >>
>> >
>> >
>> >> +/*
>> >> + * Sort into address order. We break ties between rom-startpoints
>> >> + * and rom-endpoints in favour of the startpoint, by sorting the 0->1
>> >> + * transition before the 1->0 transition. Either way round would
>> >> + * work, but this way saves a little work later by avoiding
>> >> + * dealing with "gaps" of 0 length.
>> >> + */
>> >> +static gint sort_secs(gconstpointer a, gconstpointer b)
>> >> +{
>> >> +    RomSec *ra =3D (RomSec *) a;
>> >> +    RomSec *rb =3D (RomSec *) b;
>> >> +
>> >> +    if (ra->base =3D=3D rb->base) {
>> >> +        return ra->se - rb->se;
>> >> +    }
>> >> +    return ra->base > rb->base ? 1 : -1;
>> >> +}
>> >
>> > This sort comparator still doesn't report the equality
>> > case as actually equal.
>>
>> When ra->se and rb->se are the same it returns 0. Is that not what you w=
ant?
>
> Oops, yes it does. I misread it because I was expecting it to be
> structured differently. (AFAIK there is no "standard" way to
> structure a comparator-function that works with multiple fields,
> so the way you have it is fine.)

The other options were all ugly ;-)

--=20
Alex Benn=C3=A9e

