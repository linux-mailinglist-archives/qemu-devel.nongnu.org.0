Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C532EF294
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 13:35:38 +0100 (CET)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxqzR-0002OW-6a
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 07:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqwz-0001pG-PK
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:33:05 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqwy-0005xp-6o
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:33:05 -0500
Received: by mail-ed1-x533.google.com with SMTP id dk8so11100916edb.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/b6wFjDIupbvlkZPrdivnWfIEm3/ToydQnfE+0PcQs=;
 b=sbP7y+UNhg+POmULDcnPoum1OYT/C6sh/crty3KndnYnIrliusB/PmDl/ublCagdQ1
 Wmo2B7JCeIzKWU3Db7HKIkIhyS21m5QI8WJ+I5INzP02LSInjFal28vVJW/bOGJEFwyZ
 et9finAzmVb49pzzsl4h/yh5xSIxIZghEJZ4wGKeXAPei44wD2IzDP0VndKGrbkz6Lfd
 YFxLYd15HeNN45+oBA3uZFRW7icBgXKZ80WYbJPJ2jzJyE8LvGZi9THAzZAQf/WraiLp
 hMYulIwV+XYPMruiuIiw9svoJiizbyMeq5JrmdKQeHrmXFz7gm1jIcPu4kMnKXImLYCA
 JHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/b6wFjDIupbvlkZPrdivnWfIEm3/ToydQnfE+0PcQs=;
 b=BW3X1anf8SqdS1OWqbOXvvDujuSkurTgsorbKyygrl3l2kISJBIbzurJn0HwMF2PgP
 3pq4t4+7Z6q6pTd938YYAV//ufbG/pX0AtNz+5XYW0MjIc+fmbmkANW0bYanDceNWojg
 lHhDAllX71xtJDjoSdy/rw5HUYZb9mMBQ7k9bEDiBhj4rk/2VAgLgJdT0G0OcgDUDpFj
 0H4Dhs6CbfynrE70I8KM+aT/RhWljoW9bzn5aiil8MxO9UNe6q1u3F/VR5BT1GP1Qsln
 9H8JRMQIJFo4hRK7cYEY7olLO1lxD1sEvJFasLGFiosLmhqtzEXhp0/YQuct6ZuY8qJB
 wTiQ==
X-Gm-Message-State: AOAM532knQ87e3SXKXUTjERmptTIJRvbKCtidQX5WCV2Ke86phsB9woO
 yfQIGpQD9sKV1bpD1PR9UhAssGarT9sxM22NzCEOedKjzrQ=
X-Google-Smtp-Source: ABdhPJwdiwLyWAAOJ20aWYX2VCXY1kCBN6OWt2ziwddP5UDIl3Y0FJIhLCzEVn1f8CAsNx1WJOpGwcsX180fT71QgWs=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr5037337edw.52.1610109182722;
 Fri, 08 Jan 2021 04:33:02 -0800 (PST)
MIME-Version: 1.0
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
In-Reply-To: <20210106063504.10841-1-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 12:32:51 +0000
Message-ID: <CAFEAcA_FdQBSQkr5z7PFnC7TzWkaA92w4Msy4bCrB2qUbXWLMA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] hw/arm: sabrelite: Improve emulation fidelity to
 allow booting upstream U-Boot
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Jan 2021 at 06:35, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
>
> At present the upstream U-Boot (as of today, v2021.01-rc3) does not
> boot on QEMU sabrelite machine.
>
> This fixes several issues to improve emulation fidelity of the i.MX6
> sabrelite board. With this series, upstream U-Boot can boot to U-Boot
> command shell. While we are here, add a target guide for this board
> to help people run Linux kernel and U-Boot on QEMU.
>
> Changes in v3:
> - correct 2 typos in sabrelite.rst
>
> Changes in v2:
> - new patch: add sabrelite target guide
>
> Bin Meng (4):
>   hw/misc: imx6_ccm: Update PMU_MISC0 reset value
>   hw/msic: imx6_ccm: Correct register value for silicon type
>   hw/arm: sabrelite: Connect the Ethernet PHY at address 6
>   docs/system: arm: Add sabrelite board description


Applied to target-arm.next, thanks.

-- PMM

