Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A2408939
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:38:34 +0200 (CEST)
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjM9-000635-9E
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPjK5-0004Wp-F8
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:36:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPjK1-00034m-U3
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:36:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id m9so13903070wrb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3IviRsTZgd10x9TESjwkctBQlvIbTzyJui+QZOSoWpk=;
 b=jeeuTB/9A/NC6SeBwMgnC+dbrX6LDtyc6ISFarYIV9V5Eq5TQGlfaHkJ/+DS7SV4Sb
 BTpjL0VIgeCNhxPXY7I4+Uuo3vFWImsGd0hjSf3N87e7Uk6endD5qSnOWUDxG5DYZfML
 ALJMoqR8bYPs/lmjOjNDWD77++KULULy4hBriHOtNoqYoc2ZGaqUZ+7Nzw0hNHp8Oj9C
 LN7ty9mUiBGqRgpXpQFDDAEtwchSwuBrnPtOCjWickF17of3z7NwEi5qx31ICu8DpD/V
 VWmmJLVl26r5grGd70lmmJCCEM240o6FcmFCPQr3AgIHSGspzwVwRHGiHnIASE/38+Kj
 grqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3IviRsTZgd10x9TESjwkctBQlvIbTzyJui+QZOSoWpk=;
 b=z6xLmKr0fpgl/scXuO5MwN8t+U2Y+cZnyOyc13RHMf3bqxW2DoNGiQF4BOfJ84PHYe
 /MLSCtFuyZ2c7USIHaKmT7fTirPXywMD7Zdq6KRZjLI9aUx5j95xptGzvm369B5PfCpl
 P9bBdwTx+zlyaTEh/lX/LpmLcrntp3kr2NQLHu79ZUGTF+Ct/TNKV+SGFB4WIo+45Jyn
 kRGgm9zwCoIEWsA5KMhCskAZrSsA6Zr1rgfNnTQHuuz4Tyax36zvUxIE1O/qRkBY+B6m
 xKAF/YNZsm9ylPfTFt4cla/fGgZAXBENrFYBSAfx46QTcRkT4wR8GKTtUCBkztkw+wL5
 AuuQ==
X-Gm-Message-State: AOAM531koqvQ6ZrjA4UGAJ87uXdJfifac4QNMsVpjqi+1KXSjwkczgtL
 NEseK/X/4e8Eq8i5jt3T7iO6yPlIV3JTZbwfgdPz7A==
X-Google-Smtp-Source: ABdhPJzpP4AK9LWhVd10/kDTRhonVemH90+Qfg6wQV3oGaJLTtyGHhDNiW6afsHRcTnKPJvDhIDPiE3eblYVefJtsPo=
X-Received: by 2002:adf:f185:: with SMTP id h5mr11846807wro.302.1631529379406; 
 Mon, 13 Sep 2021 03:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210913101948.12600-1-peter.maydell@linaro.org>
 <YT8n3HKfbheSjuzn@redhat.com>
In-Reply-To: <YT8n3HKfbheSjuzn@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 11:35:29 +0100
Message-ID: <CAFEAcA8-xkmZuBQRUjSxuJPbxaOyJGYpqTKCnz9D=cZTP8wa3Q@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and don't
 allow failure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 11:32, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Mon, Sep 13, 2021 at 11:19:48AM +0100, Peter Maydell wrote:
> > Currently we define a lot of jobs for our custom runners:
> > for both aarch64 and s390x we have
> >  - all-linux-static
> >  - all
> >  - alldbg
> >  - clang (manual)
> >  - tci
> >  - notcg (manual)
> >
> > This is overkill.  The main reason to run on these hosts is to get
> > coverage for the host architecture; we can leave the handling of
> > differences like debug vs non-debug to the x86 CI jobs.
> >
> > The jobs are also generally running OK; they occasionally fail due to
> > timeouts, which is likely because we're overloading the machine by
> > asking it to run 4 CI jobs at once plus the ad-hoc CI.
> >
> > Remove the 'allow_failure' tag from all these jobs, and switch the
> > s390x-alldbg, aarch64-all, s390x-tci and aarch64-tci jobs to manual.
>
> Why the difference in skipping  'alldbg' vs 'all'  ? Was that just
> to get diverse coverage of debug vs non-debug ?

Yeah, I figured we might as well run one on each.

thanks
-- PMM

