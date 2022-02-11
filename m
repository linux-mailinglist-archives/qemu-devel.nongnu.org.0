Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B650A4B2788
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:11:34 +0100 (CET)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWe5-0000g7-QQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:11:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIVtg-0001OC-Nh
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:23:38 -0500
Received: from [2a00:1450:4864:20::52b] (port=41699
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIVtf-0008Ng-4E
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:23:36 -0500
Received: by mail-ed1-x52b.google.com with SMTP id cz16so16401705edb.8
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 05:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8nwI7QYmZUwCX3H87Bi+nwAHn6Q/VzGqb039FySbqmw=;
 b=fOmScm0Al0gsxHpr5vhVBH2thatcEXBnF2dVWpAI4rSJpS9OzHwjKeFqrUY68KdLZU
 UIkI918RvLg0r34J3BhApziN2V2PLaWeBLE5lmfyc2jEW8GYswuX/xRkUivWDFGSuScn
 wZMXTwuCJ1SnatUZmNEC7FCv1ygSll4oc8LhJOKoEYYuREGe1JFOmgDPtM78d2OrBRPP
 Ls0Pci5omP5s5JP3uhx1ncgZJqgmBT1i1kwfoUBJUYt1sSYKJTWwNiLZfOUbyUHOQKJ4
 lmqNzH4l5nL4/J1FViitaeVGsEieh5N8lAJLYj+ez7fA//a7Mr6+UYXP9A6sDMPg37jX
 K6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8nwI7QYmZUwCX3H87Bi+nwAHn6Q/VzGqb039FySbqmw=;
 b=MgNvN31sTNvUbQ1NoN1ZUxaRx/kbGi6pqIu7QrCd3YH+UD7+wY+8LYbPaN8Q7tYZlN
 AZetK78SWMbzLWbhezKjzQoCPR0KfVsLlYl/ipY6yFhRv7CIxzH93XXwuikHi+Vh8b4H
 sgxrwvyfkk4kt5czmWygpWFlUU5wCqhucBFV7luAFHo3lnPK5XbB1TUvXsRUis5eJZlT
 +0xqGZvDQlleBhczMjVDy1bW8u5Rq60tExfYF/WiirCb96RVAmbpNT7rFAhUvgHibyUA
 OI02Ud7/EaggmfMrwpCQfezR0vv9b3oHR6vxruR3hhz1ip3f+97hoAdPYw+tpr6nJMT6
 eXlw==
X-Gm-Message-State: AOAM532W2xv/vCbsARPvEdxeeXaazXfDJ/rxVmSMksulofJbLG85RPd9
 GG+p+GCNgp+2ZwZc/1ooEh+6nw==
X-Google-Smtp-Source: ABdhPJzIDavIum2NRdXhxf0oevpwg1N00CEY0tApZNgZi3/zVa70aaaEkd9Jm3CK+Wp0ujHs8uT4UA==
X-Received: by 2002:a50:eb46:: with SMTP id z6mr1886959edp.229.1644585813169; 
 Fri, 11 Feb 2022 05:23:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b6sm8015275ejb.80.2022.02.11.05.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 05:23:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2F731FFB7;
 Fri, 11 Feb 2022 13:23:31 +0000 (GMT)
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
 <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Date: Fri, 11 Feb 2022 13:22:43 +0000
In-reply-to: <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
Message-ID: <878ruhedv0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Keith Packard <keithp@keithp.com>, Andrew Strauss <astrauss11@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Feb 2022 at 11:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>
>> Hi Alex,
>>
>> On 10/2/22 12:30, Alex Benn=C3=A9e wrote:
>> > The previous numbers were a guess at best and rather arbitrary without
>> > taking into account anything that might be loaded. Instead of using
>> > guesses based on the state of registers implement a new function that:
>> >
>> >   a) scans the MemoryRegions for the largest RAM block
>> >   b) iterates through all "ROM" blobs looking for the biggest gap
>> >
>> > The "ROM" blobs include all code loaded via -kernel and the various
>> > -device loader techniques.
>> >
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Cc: Andrew Strauss <astrauss11@gmail.com>
>> > Cc: Keith Packard <keithp@keithp.com>
>> > Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>>
>> > +static LayoutInfo common_semi_find_bases(CPUState *cs)
>> >   {
>> > -    MemoryRegion *subregion;
>> > +    FlatView *fv;
>> > +    LayoutInfo info =3D { 0, 0, 0, 0 };
>> > +
>> > +    RCU_READ_LOCK_GUARD();
>> > +
>> > +    fv =3D address_space_to_flatview(cs->as);
>>
>> Why are we using the CPU view and not address_space_memory?
>
> If you have a choice between "use the right view of an
> address space" and "use the global address_space_memory",
> it's better to prefer the former, I think. We use the
> latter in lots of places, but it's not conceptually the
> right way to think about how the memory system works IMHO.

In this case the addresses have to be as the CPU sees them because it's
between the CPU and the semihosting backend to share data.

--=20
Alex Benn=C3=A9e

