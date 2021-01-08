Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9052EF18D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 12:44:40 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxqC6-0002XP-Mr
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 06:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqAZ-0001tl-EP
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:43:03 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqAW-0007Fp-Uu
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:43:03 -0500
Received: by mail-ed1-x531.google.com with SMTP id b2so10920032edm.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 03:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/FBfmz197pDsZkIONNMlw1co5B8rbv9TMRBJbAagSJY=;
 b=xBO2E1RMgAwIB6DMxKQErqiM+LWMjrn8zjuYqvx+zRCkECoytXwxxBRIsZaO97z0YW
 SCffR9PD1Vr6Ev1LSyu2fhtBUqCBI1iccQUx8IL2yhgXa+/6/BZQsavEjzq3uMzcuiJo
 9p//HA0IXlHghRkDUayZqLBiABcpCbH6cCVVynpls2NSUmP3U38eTXVByC/sYhH+GUJf
 nabIL5L4JThgq8jTKjUOwJQOeznAu5+Ba7Ya+6X6G6bKdlCEisY1cDyWDyeAOy+k9hde
 FSaqGqIiTcn4724xlln8AOZ639CbAKTkCjDdbsKLzAwWsfEHeU2/OJUNUsx37evFfDBX
 5D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FBfmz197pDsZkIONNMlw1co5B8rbv9TMRBJbAagSJY=;
 b=fl/tvzWdR+Fdp+u35RlIPLKfhFD1Nx9cTjO1fqrxRwLIjDoenSgkfgjtYW72mLNmbT
 yIYOuukCZ/iF4UbL3IZc5sqZusc1MC/a4+iSXgePPmZAnsbZIZeETfmSgThkupqisyxO
 XPJsrNU2BwWeic5ZU7CfESdilhspn1FyKDUNG0w+DLet0ku583LZz8mUZYXzmDeZImOY
 qKZL6iGJKJl2VE4BATL1ZxNL029OavX7y5A5VGqUzTVjwEy1AAXVDGVHeAWk6HLhw2VP
 1roO0f+NeGVznkLkB62N0YSPjwb3twkeZXuLG/mmObEzbsk8agTtFWHCKJB8h43rvyV8
 VUHw==
X-Gm-Message-State: AOAM530m5PiYwd7lhxcRYE6ClySA06ZUxNV9u7zgQ5unftfNpGdd2/Cf
 HBofuokVfUqMTZ57NgbtgDix6A8FqZYxWCJ9tpDqHg==
X-Google-Smtp-Source: ABdhPJyymzjCKTPHolDGvH8tlWsqUqaJmisS1/mPf1oPGhoqG8DvMus4gIAPVh0B5bgl0L6D3dQ2DozoLM5t9do4MRs=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr4968108edr.204.1610106179256; 
 Fri, 08 Jan 2021 03:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20201217113137.121607-1-ganqixin@huawei.com>
In-Reply-To: <20201217113137.121607-1-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 11:42:47 +0000
Message-ID: <CAFEAcA9Z9VDTW5GSC=R_NYF_FOoKMXQcCy3U6pctmj0jg=0-Fg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Fix some memleaks caused by ptimer_init
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 sundeep subbaraya <sundeep.lkml@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 11:32, Gan Qixin <ganqixin@huawei.com> wrote:
>
> v1->v2:
> Changes suggested by Peter Maydell:
>     Delete the modification of unrelated whitespace.
>
> Gan Qixin (7):
>   allwinner-a10-pit: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   digic-timer: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_mct: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_pwm: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_rtc: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   mss-timer: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   musicpal: Use ptimer_free() in the finalize function to avoid memleaks

Applied to target-arm.next, thanks.

PS: something odd happened with the threading of this series --
the patch emails weren't follow-ups to the cover letter --
so the automated tools like patchew got confused and thought
the series was empty:
https://patchew.org/QEMU/20201217113137.121607-1-ganqixin@huawei.com/

You might want to look into fixing that for next time you send
a patchset.

thanks
-- PMM

