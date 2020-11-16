Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC812B4A8C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:17:26 +0100 (CET)
Received: from localhost ([::1]:46102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehC1-00071S-Gs
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh90-00053i-LE
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:14:18 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh8w-0001E8-VD
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:14:17 -0500
Received: by mail-ed1-x543.google.com with SMTP id l5so19267302edq.11
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOa31hR2AsXknLEdBZ4reS7l+VrvWMky23fe5C0/rFc=;
 b=FE7SvMWRnurJGPrEr6ToDeyb6ni0UcfRQSOE4ppQ3+gCBnTGblRKOM9F/iPPKmWW9U
 yuewqc245yY0cai0p4kvqIGPKaO5Hy6oc5jjZWxvuxXidAwWsMeJZhHCl6aXV4dUKM/T
 f3brTkE9vCYhvMrMeoTuN2n7avxg7kCbxAbjkg5LJY8iOjrIaVdKhbvHWul0Q5S4lAMU
 esXZkodnJdd+jSptdOb86e49a5o9QSLPXh8I8MBgOQbfh1KICsQyqz6U3hMnw2sYCpPp
 MD8oFTiyQGgUjorYvI8MFNdi7r4ClrSJl76XGKb1K2Z/WwNyyMDkpDWzFRFBOIJOYiyx
 gZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOa31hR2AsXknLEdBZ4reS7l+VrvWMky23fe5C0/rFc=;
 b=cEuOCME6p4ZPmwSdjK0/h3oJKwBeV/FVD249t5hsuT6vh5/2Bs1lF0kPTVbX/9gePP
 VcVb2JwcxChgq5SLORzNQ3WPp0GC0kK85Yo8OtWctHMZWB+IOgw9hEEyMgQs9q7BMqY4
 1Opl53c2Q9bvuqgEFM9WD53jXTIpO8mqC15zYES+eRnfysHtkrXIRgH3eTaDrft7cvEN
 QPgqpa4vdY3h3HoN22e6LcoFw7CC4vMcLD9O3bV/uc5wcYghRQI/8PYtPF03vCvmaa6P
 84CzBM8NLt6N0H2vgxCqvvh/Qjgd88cTCmTw4NykMuQa7znCJ3ItkmChj/GEAzCkM4VR
 v4Hg==
X-Gm-Message-State: AOAM530IVaahgIRSdE9nzBtcqhIIj/lPho9xPDdpv3s53DEQRch+kse8
 qxgbKdY7F5CF4Y7ANJWZtBAog4gvWWhKfAvSqJ6OIQ==
X-Google-Smtp-Source: ABdhPJx8hdvoBAvaZnMsOTKcLnlOGIoaewD5DmUbUq/5eb8bQtIvrLONlP1moTjevuhi73bH1/NssdBAQAbVv5uSSOA=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr16634518edt.204.1605543253165; 
 Mon, 16 Nov 2020 08:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20201110150023.25533-1-peter.maydell@linaro.org>
In-Reply-To: <20201110150023.25533-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 16:14:01 +0000
Message-ID: <CAFEAcA9jaV6JbNzQHuV=EANrAeBzZ3E5ay5-r-FT=74cuq8K5w@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/misc/tmp105: Correct temperature limit check logic
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for code review? Might be nice to have in 5.2, though given
how old the bug is it's scarcely critical...

Ccing the ASPEED maintainers since that's the only other
machine that uses the tmp105.

thanks
-- PMM

On Tue, 10 Nov 2020 at 15:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchseries fixes bug https://bugs.launchpad.net/qemu/+bug/1734474
> which is a regression between QEMU 1.3.0 and 1.4.0 of ability to boot a
> guest image on the n800 machine.  The regression was introduced by
> commit cb5ef3fa1871522a08, which fixed a logic error in the tmp105
> device's handling of i2c writes.  That commit is correct, but it exposed
> an underlying bug in the tmp105 implementation.  Previously, we
> accidentallywrote 0 to the config register when this guest tried to
> write 0x36, which meant (among other things) that we left the device
> in "comparator mode" rather than putting it into "interrupt mode" as
> the guest wanted, and it turns out that our interrupt-mode logic was
> buggy, so we would signal an over-temperature interrupt immediately
> and continuously, and the guest would hang.
>
> Patch 1 fixes a silly omission where we weren't setting the
> reset values for the T_high and T_low limit registers.
> Patch 2 fixes the interrupt mode limit checks.
>
> With these two the n9800 image linked to in the bug report can
> boot properly again.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   hw/misc/tmp105: reset the T_low and T_High registers
>   tmp105: Correct handling of temperature limit checks
>
>  hw/misc/tmp105.c | 73 ++++++++++++++++++++++++++++++++++++++++++------
>  hw/misc/tmp105.h |  7 +++++
>  2 files changed, 71 insertions(+), 9 deletions(-)

