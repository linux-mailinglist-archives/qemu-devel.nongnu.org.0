Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9560C301832
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 21:06:59 +0100 (CET)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3PBS-0006Ib-GK
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 15:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l3P9M-0005Ex-9v; Sat, 23 Jan 2021 15:04:49 -0500
Received: from mail-io1-f47.google.com ([209.85.166.47]:45856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l3P9K-00085g-6O; Sat, 23 Jan 2021 15:04:47 -0500
Received: by mail-io1-f47.google.com with SMTP id p72so18470566iod.12;
 Sat, 23 Jan 2021 12:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UhBu3WvML6FsMNvBa5/ICwOs9w7m/eUzcuLMIgbfHTA=;
 b=keZZkb6ccgBFOoxaITN6xo8v0gX1z8GUCaY4pSFzlQtdiDtVGuOaynUd4Mq0W1mE5k
 csOaq2YJ4jvaQ4quAfGakaaI8Rey7VXpB7+VTFQGwAek2zo1r4alhfgct+tGOhnrqTbT
 dOAYG9jsHxtJ58VE1N1O4ri1qmn4bv56twLX3/dLyL/CA1TbM/IL6425fmjtcbII71t9
 O5trIDXb3cnn0KVQRhgnJbYRa7fH7DcyIwi0Uo5LgDVgeoum3eXvgcLTkCtcD7GpsggK
 Fg/5D9MgQf1IjJ7MNK09Ng/63TRQBhjVqJmk1pxccEQAExZHynNEwllnFMM3kt7N+hFD
 GrMg==
X-Gm-Message-State: AOAM532n6j/Bh23O6R4I+5io9253loJx+jymcg4OQnm0V/V6DP9myB7S
 8zw/TJ3I2d1vIQW4UGmX8ZMNLKJ/A88=
X-Google-Smtp-Source: ABdhPJwzp3z+qekZGQuamJeOxnDOh+ok5cn6Cl0klEnmQy0V2vOJQ0pd6ROy4fxHI3Wz+RgFHShdSQ==
X-Received: by 2002:a02:9669:: with SMTP id c96mr194564jai.47.1611432282901;
 Sat, 23 Jan 2021 12:04:42 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id e1sm8702606iol.31.2021.01.23.12.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 12:04:42 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id q1so18524047ion.8;
 Sat, 23 Jan 2021 12:04:42 -0800 (PST)
X-Received: by 2002:a02:781f:: with SMTP id p31mr448630jac.14.1611432282257;
 Sat, 23 Jan 2021 12:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20210123045632.18482-1-j@getutm.app>
 <20210123045632.18482-10-j@getutm.app>
 <CAFEAcA-nxjUifZ8yb85KGAFnwwa10ZAdemxyH5YnetNLhVt8cA@mail.gmail.com>
 <CA+E+eSB6JrEzN94DaehKByG2WrZ7NLsDBC4FrKSwZ_YyoLrjMQ@mail.gmail.com>
In-Reply-To: <CA+E+eSB6JrEzN94DaehKByG2WrZ7NLsDBC4FrKSwZ_YyoLrjMQ@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 23 Jan 2021 12:04:31 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDktLsq5+4q=BsxPr-zLH9XdSDMcXN12BGd5ABqd_ewCQ@mail.gmail.com>
Message-ID: <CA+E+eSDktLsq5+4q=BsxPr-zLH9XdSDMcXN12BGd5ABqd_ewCQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] block: check availablity for preadv/pwritev on
 mac
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.47; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry to rephrase this, we would like a single binary to work on both
macOS 10.15 and macOS 11 as well as on both iOS 13 and iOS 14 while
ALSO supporting preadv/pwritev when running on the newer OS.

-j

On Sat, Jan 23, 2021 at 12:00 PM Joelle van Dyne <j@getutm.app> wrote:
>
> The problem here is that we would like to compile on macOS 11 and be
> able to run the built binaries on macOS 10.15 or lower. Without the
> runtime checks, you'll have a crash when calling preadv/pwritev.
>
> -j
>
> On Sat, Jan 23, 2021 at 5:53 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sat, 23 Jan 2021 at 05:03, Joelle van Dyne <j@getutm.app> wrote:
> > >
> > > macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configure
> > > will succeed with CONFIG_PREADV even when targeting a lower OS version.
> > > We therefore need to check at run time if we can actually use these APIs.
> >
> > If you make the preadv check be a meson.build has_function()
> > test, I think (but have not tested) that it ought to correctly
> > fail the link in the targeting-lower-OS-version case, because
> > meson.build's has_function() implementation for clang
> > https://github.com/mesonbuild/meson/blob/bad0e95caec4cf49165572df3cf2edc4832280fa/mesonbuild/compilers/mixins/clang.py#L89
> > adds -Wl,-no-weak-imports when it's building the test-case
> > exactly to force that linker visibility obeys the minimum
> > version targets for OSX.
> >
> > If that works I think it would be neater than delaying the
> > check to runtime (and it would also mean another test moved
> > out of configure and into meson.build, which is the direction
> > we're heading anyway).
> >
> > thanks
> > -- PMM

