Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B54C35B0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:19:53 +0100 (CET)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJea-0007ta-PG
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:19:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nNJYc-0002vz-So; Thu, 24 Feb 2022 14:13:44 -0500
Received: from [2607:f8b0:4864:20::82a] (port=33326
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nNJYa-0000TW-ES; Thu, 24 Feb 2022 14:13:42 -0500
Received: by mail-qt1-x82a.google.com with SMTP id bt3so389148qtb.0;
 Thu, 24 Feb 2022 11:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=bFEruGA+OweHptuTvlA9tj0ExJ4k/aBLOidZg/Cqzu4=;
 b=SYRRfmBQ2uC9KYYGTt+re0jQHwrwAhS6Wjt20e16zQjSNjfregNWnyEqyBW1LjwYGf
 vsBICz3LV+Z/tOcI6gbbiGQ7wHu1+oCgV+iTNhLW7FjiZip+0+5c76Zds8/EMCA7Pm9o
 PCP5pgerNF5AtvHDKm3VL/CSfzoN8dkRFv0OaFBYWWc+l0ubt+e+52NtajOSclPPGR8Z
 HShUq8U9W2f86VigEj5Qg9wh6AEhhjHGeBmuhUhDHVDwEkQcKxYVIOpou4+oE/4n7rBB
 ufF6KASAf281kwNo4wvLJgf1Y6Wd1qBsRKA3yd+Q9jcih9Jwyf0z8CDWXWccxkBl8amS
 f2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=bFEruGA+OweHptuTvlA9tj0ExJ4k/aBLOidZg/Cqzu4=;
 b=FyH6Bv9VMOs1YxPn/TWmztHuVzYTBli1ld8BIf7omyPrSBV4j6yo7AXNX3us7bj9ib
 jMUMxWPIlL9FHfULLloNNjdUsVx/9cR3E8tx+1ZKTpLWArPPRaqWKmG8G3ZV1+tDgFEM
 EjmSD9QBWT4FOj9zvOW3l0lVqjIrcB2av13YiXl1uLTlNUOBa15YuOPg+vRx89ApjMjZ
 1P5UsPk38ybc7zhWXkjCFmwusGh64soAj9e1wJOWgdNL/eYQrx86j61wp9HoiLgVHQQm
 03+K/d+MojFC9OZDjBhthQ0ZvjwOgz7JGJzbGWYXBrllWbVd5exu0zGaEBEdJc6FMZPc
 c6kA==
X-Gm-Message-State: AOAM53139rF63Nq9KPUfR3QYQaK5lxvSP5+MoyBvjgRSZ//YgrtnpkdG
 jXi3NKvNPYCajoku2q1i6g==
X-Google-Smtp-Source: ABdhPJwGlxHUFd/vixMY3mbNRcd2ZXM4PXtbRSOX62TS0ZOE01O6loBFh2pkXz2mwO+rvdDf1rGKVQ==
X-Received: by 2002:ac8:428b:0:b0:2cc:a832:e8ec with SMTP id
 o11-20020ac8428b000000b002cca832e8ecmr3803654qtl.352.1645730016054; 
 Thu, 24 Feb 2022 11:13:36 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a05620a221700b00649555cd27bsm203476qkh.79.2022.02.24.11.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:13:35 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:3518:b60e:d7bc:889a])
 by serve.minyard.net (Postfix) with ESMTPSA id 5C7881800BC;
 Thu, 24 Feb 2022 19:13:34 +0000 (UTC)
Date: Thu, 24 Feb 2022 13:13:33 -0600
From: Corey Minyard <minyard@acm.org>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH 0/5] Fixups for PMBus and new sensors
Message-ID: <20220224191333.GA3457@minyard.net>
References: <20220106230936.417020-1-titusr@google.com>
 <CAO=notwF3TYULgZn_w_1g-4Tq=7Fros8-jvwvm4XKaODu30ZEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notwF3TYULgZn_w_1g-4Tq=7Fros8-jvwvm4XKaODu30ZEw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Reply-To: minyard@acm.org
Cc: Titus Rwantare <titusr@google.com>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 10:58:52AM -0800, Patrick Venture wrote:
> On Thu, Jan 6, 2022 at 3:09 PM Titus Rwantare <titusr@google.com> wrote:
> 
> > This patch series contains updates to PMBus in QEMU along with some PMBus
> > device models for Renesas regulators.
> > I have also added myself to MAINTAINERS as this code is in use daily,
> > where I am responsible for it.
> >
> > Shengtan Mao (1):
> >   hw/i2c: Added linear mode translation for pmbus devices
> >
> > Titus Rwantare (4):
> >   hw/i2c: pmbus updates
> >   hw/sensor: add Intersil ISL69260 device model
> >   hw/sensor: add Renesas raa229004 PMBus device
> >   hw/misc: add Renesas raa228000 device
> >
> >  MAINTAINERS                   |  15 +-
> >  hw/arm/Kconfig                |   1 +
> >  hw/i2c/pmbus_device.c         | 106 +++++++-
> >  hw/sensor/Kconfig             |   5 +
> >  hw/sensor/isl_pmbus.c         | 278 ++++++++++++++++++++
> >  hw/sensor/meson.build         |   1 +
> >  include/hw/i2c/pmbus_device.h |  23 +-
> >  include/hw/sensor/isl_pmbus.h |  52 ++++
> >  tests/qtest/isl_pmbus-test.c  | 460 ++++++++++++++++++++++++++++++++++
> >  tests/qtest/meson.build       |   1 +
> >  10 files changed, 930 insertions(+), 12 deletions(-)
> >  create mode 100644 hw/sensor/isl_pmbus.c
> >  create mode 100644 include/hw/sensor/isl_pmbus.h
> >  create mode 100644 tests/qtest/isl_pmbus-test.c
> >
> >
> Friendly ping - I believe I saw some of these have picked up Reviewer tags,
> but ideally this will get into 7.0 before next month's soft-freeze.

Did you split up patch 1 as Peter requested?

-corey

> 
> 
> > --
> > 2.34.1.448.ga2b2bfdf31-goog
> >
> >

