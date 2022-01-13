Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8958B48DE8B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:01:36 +0100 (CET)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86Hv-0001Ot-II
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:01:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85rE-00015C-Uw
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:34:01 -0500
Received: from [2a00:1450:4864:20::436] (port=40616
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85qw-0005VI-UB
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:33:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id x4so12005114wru.7
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 11:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VWiFNPwMPbv9E8aMncSA2P9kyHvyJI2eq0GahQmM6TQ=;
 b=TC+Ijr3eFDjff1jj9uZl7TlvIHlGQ0sZfa5D612Ba/JTlQUQMb664tvVAgtPnARx5j
 DuI5jVxhJRhrPGWq/VIIbnCk8IFqqAhfO9Ul5/sMrVjqO7czMc51E/iub0UyW/lRtPkG
 ijQ2r/V25VbIJQvQf76A6EtiGKLsy+DED45UIyHRoS5dR8KBVPYWmq1a+gWdoCOfDKNz
 k8UW+dOQb7Y7sunHrlyV0fjRbMZ6rYSyU2QYP1+uiu6y2A9lBuevbnX9/Y+VUGH2BkrY
 LWInmQX9P5alBR2/+mGkyybpBSYcVGDLaZ89Tc413x0h3+UHxRA19YjoOQZGagwMk4wL
 Brig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VWiFNPwMPbv9E8aMncSA2P9kyHvyJI2eq0GahQmM6TQ=;
 b=69YXQY+CRLrb3ymuXEl5hk3OT6DlOFFxl3+v250chqEa+GT+E7NwnN/HvXvoV7kWzB
 k2/c3my648aVMaoNh77ms/McmRo/vY7POpW+eKw4P6pcKX2878iQ5rt2cUTsbCnT3/Co
 s0hKcA5yuDQ2OpHJikgUNobsfl1Gnu+JfYkGAFvAOz/Er7ZPAEj26lNB32FPqHeFOusk
 cIKDSUXF38olVxy5h4vQ/MBKm59B7Pblqu0PeX9vQ/mkIFBrxZv4Gf/wc/IomBAmyeTN
 4dB9etkZv2vj+syThKsT4IR/7RA7ldpTa1DJnwMyj6YK05Clk+8FfuJei4S+728MPdDd
 I7kg==
X-Gm-Message-State: AOAM533aLpa8YR5z+38CF5dB0bE2TaZ9/ERK2b3+vXusefveHzoK4EbW
 znZ7uRNytgn3NOQpuxSoOlhIONkvWUExADhX68VFOmqmRgI=
X-Google-Smtp-Source: ABdhPJz2MRh9qZBJHAqiU6f2p8Yy8w0Sb7X+ciOoarfHK7uNzDcLoktDZsxh51k5Rn6EdsHIgY4BmTZVn6JxyHeFToU=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr5124843wri.295.1642102378606; 
 Thu, 13 Jan 2022 11:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-12-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-12-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 19:32:47 +0000
Message-ID: <CAFEAcA9jUpf9r566_1Rb6FrMjyQA-B9f0dTrEoQXuTBXhoPyAA@mail.gmail.com>
Subject: Re: [PATCH 11/30] bsd-user/host/arm/host-signal.h: Implement
 host_signal_*
To: Warner Losh <imp@bsdimp.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:33, Warner Losh <imp@bsdimp.com> wrote:
>
> Implement host_signal_pc, host_signal_set_pc and host_signal_write for
> arm.
>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    /*
> +     * In the FSR, bit 11 is WnR. FreeBSD returns this as part of the
> +     * si_info.si_trapno which we don't have access to here.  We assume that uc
> +     * is part of a trapframe and reach around to get to the si_info that's in
> +     * the sigframe just before it, though this may be unwise.
> +     */

Yeah, that's pretty nasty. But this function is passed a
siginfo_t pointer -- isn't that the one you need ?

> +    siginfo_t *si;
> +    si = &((siginfo_t *)uc)[-1];
> +    uint32_t fsr = si->si_trapno;
> +
> +    return extract32(fsr, 11, 1);
> +}

thanks
-- PMM

