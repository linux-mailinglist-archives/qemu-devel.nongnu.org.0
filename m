Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556494AD58D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:39:53 +0100 (CET)
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNua-0005OS-29
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:39:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNhh-00060r-MK
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:26:35 -0500
Received: from [2a00:1450:4864:20::436] (port=39824
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNhd-0005hm-MQ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:26:32 -0500
Received: by mail-wr1-x436.google.com with SMTP id d27so1526448wrc.6
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NOesRABDfJPtUzBYH5mBS29oNnu3OG0vv++W9T+UjBk=;
 b=qmQemYUSrdrZHlc3X0X1yuq9ASBs7JRHeTzolWyGv6wREK8wgsTDWsCNy0cbFhbl/S
 tjN+Ny+4v9XKpGHof1KlViwNxeT4z5R0ZRCvkPaUguEuiSGQki0a0oTsUZ5NJhk3cuuD
 O2czWl5k7QlOyw2CzLg6JUHJvHnsWCt+OjitCb74qeMpkpHPhNSrJr26XLE+Lpmunkw/
 Zka0/lPefG48XjJoYCpw2D920wspK4YO4vx02iUoNVrYuOFgYnTNmF0CtvtznJdNLyvS
 YALnM9w458bG93ph9DnO8Ov++xM+xoRz5DXhIe+WRkQnhq69WLvYG4XAcHB2/J4sJD2S
 1wfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NOesRABDfJPtUzBYH5mBS29oNnu3OG0vv++W9T+UjBk=;
 b=T6QWSk7rieFzSf3P7zEo5baAKFYGSjuswT5ySwTUkTwyNiLJzq/3LCoxtEJAt2IGYb
 6JJzncASWdNqWEC3I/XzYrSzkRO2YPShziMcukjboNUBPTZKJYB/RzKVA0jsgQpTHEdO
 YRWf0L26AkxT74Ygn5ebd7+evmxfDUQXAfbtQmdXrq/WvN+W9pV88dvMds3dXirQLebh
 5n1jzTm4YhNhTYpfjXpWWGNiA2wMW7iGtCO7J5AG6xsj9sb/D2+j1jnfw9qDsLgMAiy5
 VeboS85P8KTYSvyVhPOTG9KfFyafdvXL6JcUd9XiLcnI8orV07/m4+PNMaS86PqdXDkO
 G0Lw==
X-Gm-Message-State: AOAM531x6UwT98DzC4wEjdFbCXCRpVDwMVuisRWhRgAacsnfHdZq0bOM
 jyiyfg3/7hos01HBWmxs92XxoTKjoU+U56rTSs8bWw==
X-Google-Smtp-Source: ABdhPJybPLDhhG7G1h1pfFlXAHsLbHyBtK1AeLkkVYgqAfk60xJINvMGvESFzK03YTWzdK3lNwHxTnV63CicHvse1Nw=
X-Received: by 2002:adf:e18d:: with SMTP id az13mr3059153wrb.521.1644315987955; 
 Tue, 08 Feb 2022 02:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-6-thuth@redhat.com>
In-Reply-To: <20220208101311.1511083-6-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 10:26:17 +0000
Message-ID: <CAFEAcA_xMXYyMvaC8B=x1N7wX-=8y1XMTJouJvetqFYX87z1dQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] tests: Do not treat the iotests as separate meson
 test target anymore
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 10:18, Thomas Huth <thuth@redhat.com> wrote:
>
> Now that we add the single iotests directly in meson.build, we do
> not have to separate the block suite from the other suites anymore.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson.build            | 6 +++---
>  scripts/mtest2make.py  | 4 ----
>  tests/Makefile.include | 9 +--------
>  3 files changed, 4 insertions(+), 15 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 5f43355071..b203402ee1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3,9 +3,9 @@ project('qemu', ['c'], meson_version: '>=0.58.2',
>                            'b_staticpic=false', 'stdsplit=false'],
>          version: files('VERSION'))
>
> -add_test_setup('quick', exclude_suites: ['block', 'slow', 'thorough'], is_default: true)
> -add_test_setup('slow', exclude_suites: ['block', 'thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
> -add_test_setup('thorough', exclude_suites: ['block'], env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
> +add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
> +add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
> +add_test_setup('thorough', env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
>
>  not_found = dependency('', required: false)
>  keyval = import('keyval')
> diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
> index 4d542e8aaa..304634b71e 100644
> --- a/scripts/mtest2make.py
> +++ b/scripts/mtest2make.py
> @@ -101,10 +101,6 @@ def emit_suite(name, suite, prefix):
>  testsuites = defaultdict(Suite)
>  for test in introspect['tests']:
>      process_tests(test, targets, testsuites)
> -# HACK: check-block is a separate target so that it runs with --verbose;
> -# only write the dependencies
> -emit_suite_deps('block', testsuites['block'], 'check')
> -del testsuites['block']

This code being deleted claims to be doing something to ensure that
the tests get run and output the useful messages on failure.
What is the mechanism for this in the new meson setup ?
(As far as I can tell at the moment this is broken. At some
point I will start agitating for reverting that conversion if
it isn't fixed :-))

-- PMM

