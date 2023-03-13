Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C6D6B8406
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 22:36:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbppY-00034E-Rg; Mon, 13 Mar 2023 17:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbppS-00033u-6Q
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 17:35:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbppQ-0002CS-LB
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 17:35:37 -0400
Received: by mail-pf1-x42b.google.com with SMTP id fd25so8539783pfb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 14:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678743335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/KiiHFEfaXWnm+sHx7txOoG33p1V9KpHpy5ZFBA32w4=;
 b=r14mc1+iS17Elff/YGYu0lrnAeotbLmEl4AA2cp/E7SOLS4+0zch7+rJKes8mRSz4Z
 ZVb5QACbPv7z73OM/sL359oanum6Ux1sFQwvGvGP24L3LmApjKABf2er1mCjaGKCsw2E
 7zDIxKyLQZHluPnO1/5XTHiDMe2jyYMxhAM43pVT68lVW1L5uo1uhkJ7g29FOc7tv6Ry
 AGaK+6qM+t4pEQ+FFojnOmeiDGzLwpMK0MNBhFuxSpokV7kpDKXA8SgwRoOWeFPyFyrH
 1N2j8RrjiQWEND+1+wP2gEL83bMX/PIRbuQlLVtdroFnNPojdIvT6hoBvjY55X+Vfsy1
 12kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678743335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/KiiHFEfaXWnm+sHx7txOoG33p1V9KpHpy5ZFBA32w4=;
 b=jCDpo2r7KCBcd32KHOci774cFNh3eQsUL3rOhtmGX/P1Azy6SWkwdppRCTRvonuSpV
 RM4E/8MJaokODIhHdS/nHW/DtM7PKPrFaDmEeOUYEkb5xzfYIgZMEbVk7LmAHRelr0di
 bfhFaajaQJPV/+Sa3J1p7RlmHid2RBodBcIrHPyRuQpwq4LDuWK6m4hIBR2hwWehvF6v
 lRyXHGhmozcrixhRbipZawXRX0DzSGgt1n0uRfL+R+iQMyEpZF2nsXAHXdZfm9oo+lHT
 kxPZbxNHrSjVXLTONzFKuaRt2rDesV5eGMryyemVmk/0PWtYpUQ+5pGnHOyqnzOS2Skx
 bAIQ==
X-Gm-Message-State: AO0yUKXu+vrpUKnN7ac2J2fDdlmh17mcAcyiY1JCyzJkg7v+bKtU1S9H
 LRofZlJl5OllaiX/QnDdrY6p7V9wEyGJfIQyBq/T0w==
X-Google-Smtp-Source: AK7set++knaXFFSCmZIMRE0GQ+YYYKa0qnBAERFCsVxi7NQRyxrT2KRKxBChlfaHZGq8XuzL2Cc0ca+z9gicP/bHCRs=
X-Received: by 2002:a65:6812:0:b0:50a:c06f:4186 with SMTP id
 l18-20020a656812000000b0050ac06f4186mr1763988pgt.6.1678743334823; Mon, 13 Mar
 2023 14:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org>
 <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
 <29307e46-00f1-9e02-94a3-de8b4a399ada@linaro.org>
In-Reply-To: <29307e46-00f1-9e02-94a3-de8b4a399ada@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 21:35:23 +0000
Message-ID: <CAFEAcA_8LQUA45rEu5WmGqvVGrxu2_CaVf1AQLOsW3WBDa0qAg@mail.gmail.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Machado <luis.machado@arm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Mon, 13 Mar 2023 at 19:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/13/23 04:44, Luis Machado wrote:
> >> Luis: I think that rather than doing (2) with a QEMU namespace,
> >> we should define a gdb namespace for this. That makes it clear
> >> that this is still a gdb-upstream-sanctioned way of exposing
> >> the pauth registers.
> >
> > That should be fine as well, and would work to side-step the gdb 12 bug so it doesn't crash.
> >
> > We could name the feature "org.gnu.gdb.aarch64.pauth_v2" or somesuch, and slowly stop
> > using the original
> > "org.gnu.gdb.aarch64.pauth" feature. I can document the requirements for a compliant
> > pauth_v2.
>
> What if we leave the original two registers, pauth_[cd]mask, in org.gnu.gdb.aarch64.pauth
> and move the new *_high registers into a different feature?  That would maximize the set
> of gdb version for which the original user-only support is functional.

If that avoids the gdb crash, sure. But I had the impression from
Luis' description of it that that would not help (i.e. that it was
the not-used-by-gdb registers in other XML sections like sysregs
that resulted in it getting confused about the register number
for its internal pauth-related register).

thanks
-- PMM

