Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3FB6606D6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:58:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDruy-0001gW-8l; Fri, 06 Jan 2023 13:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDruw-0001gO-FA
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:58:14 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDruu-00080g-RA
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:58:14 -0500
Received: by mail-pl1-x62a.google.com with SMTP id jn22so2541600plb.13
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 10:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fvb+PzQ/cMEUL7r6fr3+13TOCRJ28/iSyk8ATqSCa/4=;
 b=w2ZuYhSAQv3p1wC/7ARkUYN/M4scO4gw92tzJ1Ng3np2OF2Mca7/w9xWN4JyjBQkJZ
 55ZX5pYFpOmGbnPpNwqXevz/7RRv4oLZCoAMAYh66XiPRGJKX206t6UcGSbP/f4T1ZdB
 OIQbnjFcD9oASy/E4XlVlGH2QcfVZUr8wQ4dGE6VOUFv5lwVvszVK3VHNlgIxQgh/hLO
 CmGw+74JHtR0CED3hY4uTozmLmSWdJQTYUeMrHRBO/d8+uJoPw3+iCJ3EOmCvffgDkMZ
 B2PIm4vCv0wate9G0MhP5VMBInHXWXeWnjIT6g6wTXB13aBKHJM8qTgNK4penSJwQYaF
 xKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fvb+PzQ/cMEUL7r6fr3+13TOCRJ28/iSyk8ATqSCa/4=;
 b=6YpFKOtPGSil8GTwpGNJnHOGmskbCWqk/cb/hmRheglDX8Ciw5GBwfoc5DxigwcNH+
 PqCTdY8sljmH2xO7F88oJwiLdNcibUbfW+klJMEQtgWlJjEIZsjxpMjSkgUEaAsxAFZ3
 UH+We+E2T6iTqjEQSr+9AQy4joPLH7BWzXUy9mcEAvzAmG39MEyCvrumAuk4AYW16AlZ
 fpkDzamLueLwtpm1DmNIIzkBmw11SZcI/cLL4cItzQwQp50ckGlxTu3Jh8RCSuo+EAWa
 GYud5rXpaegDVW0E2lzFYl1DDn/SAXE7fXffBO6112g0EjNbxYGkhkdaL1W8+Reoyt4Z
 FkYQ==
X-Gm-Message-State: AFqh2kpDfwSS66FHGA38dV28RKmjpuF2xj9IsEYacjuelF9cKxeGSp/a
 nw+MQHfTYl3hCorrtSHUjoXCsYQzq+uVyuAjFX2BEQ==
X-Google-Smtp-Source: AMrXdXt9v8Z7k4b0Vy586iy565EH2Xm3FHlf772pLrlDnvqZ9IZ9WhbG+SNWL7PXwPSvhU5tMngQl5+dxe85NWpiCUs=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr4486970pjs.19.1673031491534; Fri, 06 Jan
 2023 10:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
 <CAFEAcA-z7+X9-c43EmhoRBTrOYC9RtyHc5sgPamGRd_o+-tT_Q@mail.gmail.com>
 <871qo7pszr.fsf@linaro.org>
 <CAFEAcA_9db5ijSTW1JBiC7kLUe+E=+OCAHg0xaoa-0p09Wbt3g@mail.gmail.com>
 <f2182772-661a-c021-061e-642ef3aea942@linux.microsoft.com>
In-Reply-To: <f2182772-661a-c021-061e-642ef3aea942@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 18:58:00 +0000
Message-ID: <CAFEAcA_TWOxz52q0EY0Bfvpwmg9bkVD1pSndiyQhfOtXOrtDMA@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, bmeng.cn@gmail.com, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 6 Jan 2023 at 18:22, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
>
> On 1/6/2023 17:28, Peter Maydell wrote:
> > On Fri, 6 Jan 2023 at 15:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> > I think the theory when the semihosting API was originally designed
> > decades ago was basically "when the guest does fopen(...) this
> > should act like it does on the host". So as a bit of portable
> > guest code you would say whether you wanted a binary or a text
> > file, and the effect would be that if you were running on Windows
> > and you output a text file then you'd get \r\n like the user
> > probably expected, and if on Linux you get \n.

> If SYS_OPEN is supposed to call fopen (i didn't actually know that..)
> then it does make more sense for binary/text mode to be propagated from
> guest.

It's not required to literally call fopen(). It just has to
give the specified semantics for when the guest passes it a
mode integer, which is defined in terms of the ISO C
fopen() string semantics for "r", "rb", "r+", "r+b", etc.

> Qemu's implementation calls open(2) though, which is not correct
> at all then. Well, as long as qemu does that, there is no
> posix-compliant way to tell open(2) if it should use binary or text
> mode, there is no notion of that as far as posix (and most
> implementations) is concerned.

QEMU doesn't have to be pure POSIX compliant: we know what our
supported host platforms are and we can freely use extensions
they provide. If we want to achieve the semantics that semihosting
asks for then we can do that with open(), by passing O_BINARY when
the mode integer from the guest corresponds to a string with "b" in it.

I'm about 50:50 on whether we should do that vs documenting and
commenting that we deliberately produce the same behaviour on all
platforms by ignoring the 'b' flag, though.

thanks
-- PMM

