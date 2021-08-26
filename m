Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED093F8845
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:03:38 +0200 (CEST)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJF2e-00006r-Kn
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJF0q-0007AQ-Ab
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:01:46 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJF0o-0002Jx-Eg
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:01:43 -0400
Received: by mail-ed1-x534.google.com with SMTP id dm15so4521245edb.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kHDsMw0ijjESA2TZPIA3la3msaDnpBif+c9BedbIdvc=;
 b=jyQlHsmH1AfP0hJCUszG8gMkkq2opcvfeget0LNJVaK2Ah1GkrYE0pmGCwML2eBZXB
 sr+ZU00+J4VqnWsxKF+gaWrpXxVZ78yREqg2LZk0vwPdrsMwTZsQCeSFEnL7LqRcHwp/
 OJm31tWx/b/jzGcI54aPm1SmwewxgJuz8TNAVfp+65oDAPuSJue2i2N3NxJK2yVIZanF
 ZioMWazBHmLVllyp1LH68R/FMxL0sPVErcDuH+y4tC5BEqoocKahoMlD8p2/gdcIGgpl
 eFJvARCyMrUf3AzlGNnQic6gJaucCJ37EWRltEnDSr1gY/YJ+AzS11fq/Uq335zOm9SK
 a+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kHDsMw0ijjESA2TZPIA3la3msaDnpBif+c9BedbIdvc=;
 b=YlfXMGIobC0UoCk/aMEDpsyXXrts7TX4ZPwiJkK03pbuJbjRlwg1SHysGs/4BP5DAR
 7SWvQy2mwWalrkOxH5RzXwIYSZv2jJgGHobsB6FKkPnCEUQClY3azXd6PkPedcUTAd+W
 a7xhooOlVoFxfQqgWFVIf9UCXqnBksmFwe6XTXRKGQFX94ET+1E99B/QhBi66CC2iQ10
 CgTixIVw6Ok8/4/iz7lMKGpuY2b8xRYJ9eC5RUNe321dYVYHn2Xmo6B/8OJvjvQPI998
 kuVQc6rCcP4QBab22gafGJ0Epw9/lfh1NzDaoQV/IkYKwqmtJ1DLafXwviAZ5aGaGSFt
 NT+Q==
X-Gm-Message-State: AOAM533mF96tBKw1wQtLXiuWN1IpsN336qB6BmNRxKLPrtnBNboWgSH2
 5Pl1wtJt/g8bFvi1o2eFeEib5iPbFeCgss9UsgmrdJj8w6s=
X-Google-Smtp-Source: ABdhPJxb8+n6HwD/aWqDPX6rZaaIakrA/z1lFHzw+Hf7AC8EaFrOL3eqcRKCIu7pvVd0rKWi24IJP0cF30CKFAybfwQ=
X-Received: by 2002:a05:6402:4404:: with SMTP id
 y4mr4186135eda.52.1629982900541; 
 Thu, 26 Aug 2021 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
In-Reply-To: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:00:53 +0100
Message-ID: <CAFEAcA9NEOSyCxzikhfkG81zxeW931syv5HDvYvvF7=Xvr90kA@mail.gmail.com>
Subject: Re: ensuring a machine's buses have unique names
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 12:05, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> What's the right way to ensure that when a machine has multiple
> buses of the same type (eg multiple i2c controllers, multiple
> sd card controllers) they all get assigned unique names so that
> the user can use '-device ...,bus=some-name' to put a device on a
> specific bus?
>
> For instance in hw/arm/xlnx-zynqmp.c, the SoC object creates
> a set of alias properties on the SoC for the sd-bus buses that
> its 4 SD card controllers create. The alias properties are named
> "sd-bus%d" so they are unique. This works, but it's kind of error-prone
> because you need each machine model to remember to create these
> aliases when necessary.
>
> mps3-an524 is an example of a machine that fails to do this
> for its i2c buses, and therefore the user can't usefully
> tell QEMU which bus to plug a command-line created i2c bus into.
>
> Ideally we should make buses get unique names by default
> and also assert() at startup that there aren't any duplicated
> names, I think.
>
> Side note: is there a way to mark a bus as "do not consider
> this when plugging devices where the user did not specify
> the bus themselves" ? Some of the i2c buses on that machine
> are purely internal to the board (eg there's one that has
> the touchscreen controller hanging off it and nothing else),
> and some are "this i2c bus is connected to the expansion port",
> so ideally if no bus is specified we would want to prefer
> the expansion-port i2c bus, not the ones that are internal-only.

Ping, in the hopes anybody has an answer to these...

-- PMM

