Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEC149EB01
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 20:28:07 +0100 (CET)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDARB-00028G-Cb
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 14:28:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDA32-0007Iv-Fy
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:03:08 -0500
Received: from [2a00:1450:4864:20::330] (port=36688
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDA2z-0005IQ-TX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:03:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso6597242wma.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 11:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eck580UGDw5O6ckX7pyMAQ15pP/wG2yfZwihMK7G/xc=;
 b=NYi5LjufbubL8jiQ0GB2QjJdCK8YluXbYzyCLiqzxZJXieQ7k68lfYEqhOyZHXU84T
 IBX8Sz6zGs3VoSTr7Ckn4a3RPgs1mOze1n7AaXLk6xo5Nb9RG+5SW+QqRng4Ixy1W+0g
 oOBUVBI8Qqnonhxtv3bJeGdMwMafV5DRU00Y9BXctHF4n+CFUG99o4FdwRNQi2FVkaOT
 WGvSboTR7++co/ei3qF8+9a+EiWEqQLwd5riWG4HgklKO1YhdtMvSmaSzePfPvu4+Il2
 6k0t8+1mBBb8lWM8ZCqPfVTrSpeoRxvaQVFkjCAz+zDQNCU3IzNWxncBZg32V9vD6euF
 I+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eck580UGDw5O6ckX7pyMAQ15pP/wG2yfZwihMK7G/xc=;
 b=mX3GjZXu0xPxPgBy7z52NImmYxIoWlVi7fSmMwMf2trU6TOVvpoS5EjXXPIR1TQi28
 ioRTJgJ+mDDtQ/XsdBrSk/D4MwH0D0uoi5wYSmRgxiLb6CfT+uPhx538ynjHTcJ9MILZ
 Kf45Br9nfr8D2ud86jwoUx0qH9cWYblNUJiYHHBYa3JXh1htCPhPP4h/gvxBmSLe0odq
 wcawx5s/6i5QtkuNtaZAHQ+wsxpXccPHuU0ip6OF0p6F/OP5FXw9u1KN0eq3MJ2nEETV
 toIc+PhXecg+6OwicuL+Hu3wbTqFAxacJUH1GyqB83gPP0kIhZIQB4H56GbY7oEa+ENi
 bWtg==
X-Gm-Message-State: AOAM533/+GTBYk3Jp7PmHy2ZJjzPA/hQ9J1TXP3DGh4rDFP0fnAGIluE
 OACMjfVQhtjR6RgQpw+EDU+afiXlZXXvcLDAoygvCw==
X-Google-Smtp-Source: ABdhPJyxfmaRtaZGWGk/rhpwspAhUTXG6igtZF8bGaZxeqdRwX9JyGygZKietHeqg1dvNOnS5CWR6VrTlFvShKpy7Xk=
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr4373254wme.32.1643310167872; 
 Thu, 27 Jan 2022 11:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20220112002515.3991540-1-titusr@google.com>
 <20220112002515.3991540-3-titusr@google.com>
In-Reply-To: <20220112002515.3991540-3-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 19:02:37 +0000
Message-ID: <CAFEAcA_N7cEEEie=Vmm9ko8n6hshmJs1Ouur4dOOumvrAageNA@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm: kudo add max31790 behind bus 1 switch at 75
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: venture@google.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 minyard@acm.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 00:25, Titus Rwantare <titusr@google.com> wrote:
>
> From: Patrick Venture <venture@google.com>
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

