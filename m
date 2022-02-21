Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616514BDB25
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:17:54 +0100 (CET)
Received: from localhost ([::1]:58744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCJs-0003hR-Ry
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMC8V-0006Mg-Q1
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:06:07 -0500
Received: from [2a00:1450:4864:20::42d] (port=39612
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMC8R-0004pu-GZ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:06:07 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d27so28240603wrc.6
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vt/wjmuCt/6P5jJomUkVu8vD22cDvs0Q0ewT0nTcoRo=;
 b=jynwcnc2mZ4k1FhopFaBU/t0avubfIsqQ7jtW3Od6zfglncMcQ6+AiUqXu0TJhGpzV
 CGuDpdK1wK6xPEhu3ijrAat6aDSfWJFBBR4Bii/jJR5BGOJupPwnmYDG8dbcbQoPce8c
 z3UXlHNn5ogBmyexSBVGV/IIPya73oaIKFRHyU6LwHLKiOXiTDhn1x2LKPpibcZIrRvD
 GKl3O0wi/XPjNRLetko2kenRsOqH60t9kKvek9ewX0xH2Rz0Qb2UF+GFuSR6eG1KyBGQ
 HxNavsDbmNwlXzRUv01aVtk7IcXmxeIlp+HleGsL/zxakjnEagsq71czcGJkI+7+bJC1
 wfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vt/wjmuCt/6P5jJomUkVu8vD22cDvs0Q0ewT0nTcoRo=;
 b=1oKabNTUgbpqig8JLYknNXMfb+lzC/R19hUvAt1YVgAmbXzAo+eVBY+ffGS3Fvm0vi
 K24YXOf/1Jjc+BV+brYvsGei9F+hTWDm06hkx4YfKoF/EO6mUeseOzW1aZIKeYMf32MY
 RDmmcwzaomuQ80pSlXvXG34y+ciq9Eos5RRuWoxZ8QRnsZoka4LA0N8mK0m9VRQPV1Bq
 zEkcWx+0IOi7R+GQelcIfvZ+1WVYk9Xk8jIe1/py3BleXBayrX05ez3/ouyJ+o2a9v/8
 YzTRtr+vapEVkDxwTq6U1dF7f6y2NnfyKGT5WCE3jjFkMsMPhgbyF6tefjF3kB7L9Ni+
 /oUg==
X-Gm-Message-State: AOAM533/Ghb7LypmG0o3XcfJ9uVnWS9Vo75K4GXMMrKGz0sA17twsvp7
 M6IHzl1aya0bF0w8rNRkPGrIoA==
X-Google-Smtp-Source: ABdhPJyqmJK6Oik/0PmZuxwmSUMbUy899YPlagWTZQVozA+1sqh1W3JeowyKziJCJZdCKkcRjlg2eg==
X-Received: by 2002:a5d:5988:0:b0:1e8:b518:ad7f with SMTP id
 n8-20020a5d5988000000b001e8b518ad7fmr15996893wri.193.1645463161608; 
 Mon, 21 Feb 2022 09:06:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c26c800b0037bec3c03c9sm480469wmv.2.2022.02.21.09.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 09:06:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 906E61FFB7;
 Mon, 21 Feb 2022 17:05:59 +0000 (GMT)
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Date: Mon, 21 Feb 2022 17:03:14 +0000
In-reply-to: <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
Message-ID: <87h78sm9oo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The previous numbers were a guess at best and rather arbitrary without
>> taking into account anything that might be loaded. Instead of using
>> guesses based on the state of registers implement a new function that:
>>
>>  a) scans the MemoryRegions for the largest RAM block
>>  b) iterates through all "ROM" blobs looking for the biggest gap
>>
>> The "ROM" blobs include all code loaded via -kernel and the various
>> -device loader techniques.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Andrew Strauss <astrauss11@gmail.com>
>> Cc: Keith Packard <keithp@keithp.com>
>> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>>
>
>
>> +/*
>> + * Sort into address order. We break ties between rom-startpoints
>> + * and rom-endpoints in favour of the startpoint, by sorting the 0->1
>> + * transition before the 1->0 transition. Either way round would
>> + * work, but this way saves a little work later by avoiding
>> + * dealing with "gaps" of 0 length.
>> + */
>> +static gint sort_secs(gconstpointer a, gconstpointer b)
>> +{
>> +    RomSec *ra =3D (RomSec *) a;
>> +    RomSec *rb =3D (RomSec *) b;
>> +
>> +    if (ra->base =3D=3D rb->base) {
>> +        return ra->se - rb->se;
>> +    }
>> +    return ra->base > rb->base ? 1 : -1;
>> +}
>
> This sort comparator still doesn't report the equality
> case as actually equal.

When ra->se and rb->se are the same it returns 0. Is that not what you want?

>
>>      /*
>> -     * Find the chunk of R/W memory containing the address.  This is
>> -     * used for the SYS_HEAPINFO semihosting call, which should
>> -     * probably be using information from the loaded application.
>> +     * If we have found the RAM lets iterate through the ROM blobs to
>> +     * workout the best place for the remainder of RAM and split it
>
> "work out"
>
>> +     * equally between stack and heap.
>>       */
>
>> @@ -1201,12 +1205,15 @@ target_ulong do_common_semihosting(CPUState *cs)
>>              retvals[2] =3D ts->stack_base;
>>              retvals[3] =3D 0; /* Stack limit.  */
>>  #else
>> -            limit =3D current_machine->ram_size;
>> -            /* TODO: Make this use the limit of the loaded application.=
  */
>> -            retvals[0] =3D rambase + limit / 2;
>> -            retvals[1] =3D rambase + limit;
>> -            retvals[2] =3D rambase + limit; /* Stack base */
>> -            retvals[3] =3D rambase; /* Stack limit.  */
>> +            /*
>> +             * Reporting 0 indicates we couldn't calculate the real
>> +             * values which should force most software to fall back to
>> +             * using information it has.
>> +             */
>
> What is this comment referring to? We aren't obviously
> reporting 0 here...

Stale comment, deleted.

>
>> +            retvals[0] =3D info.heapbase;  /* Heap Base */
>> +            retvals[1] =3D info.heaplimit; /* Heap Limit */
>> +            retvals[2] =3D info.heaplimit; /* Stack base */
>> +            retvals[3] =3D info.heapbase;  /* Stack limit.  */
>>  #endif
>>
>>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> -- PMM


--=20
Alex Benn=C3=A9e

