Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3749E304322
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:55:35 +0100 (CET)
Received: from localhost ([::1]:42886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Qgn-0005x8-VL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4Qff-000580-Vb
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:54:23 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4Qfe-0004RP-1h
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 10:54:23 -0500
Received: by mail-ed1-x52a.google.com with SMTP id b21so20332779edy.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OxST30yERnyzfADRKkXg00thgMVYejKkhfuLMBdF43E=;
 b=FlUqbu0ZNxO4et8WHT5tZ5CN/F+KA3yPxzmhFMijMFxDxV4DRMVLvZaj0ZN6S3fDh1
 pNP8ZcAoLyXPvCFF76pnasOQnOCefn/QbOFT8y6m1Hh4p1iB8ShH9qEaRwjAZRckq6W3
 E6YDQOUcLfxnivbkrMI/g9skOPOZgz6RA6IcDXAl4oZnXoT83+Pxa7ohSpMZiIaX/pA7
 XIohwNzCLObk/n9zzrQc53JJ+jRgV1pD48UsowCeKsyFsXXHuDhyTBDwVxFgbPBxoC+0
 Z+oiSs9ZG6QnqhFF2uGDzECOgBqVDSNTfNHE1GWxU+98cIj7Ju9xC47H0/HFClvyvTcq
 BA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OxST30yERnyzfADRKkXg00thgMVYejKkhfuLMBdF43E=;
 b=LBWxAkkBdLEnuxbosOBx3KMopXhKF4WAmZinFVzNPLXsdS3i4R5FF7NnSkU/4dQxA7
 XK4xAnFgEWSuB6Eo4OhS5nQJ/CBEYHtP9AhRxCuObrbpbRO+YiBtWDlhHjqXaOeicN2K
 ASiqjViOqOQnBvj7mm92CaKDzFj09p3VyA0h7TB0+EddOwQzldwtDNFedCg2h8RLDgxi
 gPIPR9eJArhWZDFk10CC7VVMaIZztE+ENnreda+MDbeqYi3XKu7WRQQuZTvXz2kWuxm1
 UZQeZhqEp0hZaf7rKy99tq/OPnJM35iawh7+KbYx4G2NbUidYys4kRhKK8pwD1D03g+y
 i53A==
X-Gm-Message-State: AOAM53387XVrF52y+pGlnjDz2RWakeN9kGpdiMDxxT9v0qBJTdjCTQt2
 YkmZJdzHu3jA3lyBfiiblmC9VpFCQlVUMVHnu8TTzw==
X-Google-Smtp-Source: ABdhPJz6hzlmR3ZuYh9hicXf701oBL7kWML1NLmUNTV9I8G+kOJwFsoB/zAkoqiY5lgVR8wQEtFlg7y7ePeg+JRHVQA=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr5069494edv.36.1611676460457; 
 Tue, 26 Jan 2021 07:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-10-j@getutm.app>
In-Reply-To: <20210126012457.39046-10-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jan 2021 15:54:09 +0000
Message-ID: <CAFEAcA9+t5bcwN1XMCG94vv0A5cG0yac7_Ke28hjsiSf-5tjJA@mail.gmail.com>
Subject: Re: [PATCH v9 09/11] block: check availablity for preadv/pwritev on
 mac
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 01:38, Joelle van Dyne <j@getutm.app> wrote:
>
> macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configure
> will succeed with CONFIG_PREADV even when targeting a lower OS version.

I just ran into this this afternoon. It turns out that all our OSX
CI configs pass --enable-werror or equivalent to configure, which
means that when the configure test provokes the warning that
"'preadv' is only available on macOS 11.0 or newer", that is a
compile error due to -Werror, and configure decides preadv is
not available. But if you do a configure for the default setup that
doesn't add -Werror then the test passes and then the binaries
fail at runtime... and this is the first time I'd happened to do
a build with the newer XCode SDK and without -Werror enabled.

So I think that leaves two points for this patch:

(1) we need to fix the configure test so that it either
succeeds without warnings or fails, so that --enable-werror
and --disable-werror configures make the same decision about
preadv support.

(2) we need to decide whether we want to support the OSX idea
that you can compile in support for a function like preadv()
and then find that it's not present at runtime, or if we just
want to make the choice at configure time. I'm on the fence about
this.

I'm going to send out a patch which converts the configure
test to a meson.build one-liner -- this fixes (1) and
(by default) leaves the answer to (2) at "no" (you get preadv()
only if you built on macOS 11 for macOS 11; if you build with
10.x support then you dont' get it).

I'm agnostic about the final answer to (2) -- we do have the
support for the runtime preadv_present flag in this file already,
after all -- so I guess I'll leave that to the block maintainers.
In the meantime we can fix the non-controversial part.

thanks
-- PMM

