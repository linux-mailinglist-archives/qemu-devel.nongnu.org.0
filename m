Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D942EE777
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 22:11:42 +0100 (CET)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcZJ-0007T5-68
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 16:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcY2-0006ib-Ot
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:10:22 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcY0-0003aV-AO
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:10:22 -0500
Received: by mail-ed1-x52c.google.com with SMTP id y24so9074637edt.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 13:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMeoWbothf8/Ef4qD/ayPFIJQJ3UmD5fLaQFggFJsRo=;
 b=ymGFm+GaGxKYWGRArnBN2pHrJhiGfw7CJMMQGaA5dKFC/it7n5NgVkAdpj8FIWPsxO
 HmgtT104eDKYEP2hcfFCqQXQhmDeDvJDlCkFQOWTcR1a/GR68Mt/V6tNxEVaeHMaRwdB
 AR5ADhy23e5A7b827v/2bkMOGhqnSWwurKrNFQGifcaRTePcCMTVAWcIYgDA+cIhU14Q
 km0JC9zPwgtwzeCG+IKXfuB/d3h8bn54tOjWo2Z0q8DxJz5RHVq3dhlzUoniYlZQl9lk
 UDc+33Vb2/A1ZTlTvqAHvhBhadtIi8kIw+mijR2JODBa+RUqB7dp3CYGFnxL/gQSHrQh
 VJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMeoWbothf8/Ef4qD/ayPFIJQJ3UmD5fLaQFggFJsRo=;
 b=JnKL9E6XRO/F368z4v83SvR9s5eYbGW0em7PzwKxh/acKa+g4H4ARyzsJTaBybd7Ke
 qRFSPBmGOKGq7LZML9Ns6+hVgyOCImKytbHKDwkVXi89XZS/VmwLjmu8RhQcGMhwdIbB
 jnAyxZkIWsG3h3RzgktwIvcIRyn54A20IwiONL0JYbI4DjuG2iFvAOix5mXVuAbQDseQ
 mQf8rO9n+yp1C2y9xSUg4ikuYhyRVG9W5ptvSsJK/zxR1WPa1wxUFeslIjpRJspOMMt7
 gYEC0ZQckk8+x945cbTg1mT/WbM0jxfLoqAp4btEGonxtM5DQsWpWNb5txsgdwEhDY00
 sgUQ==
X-Gm-Message-State: AOAM533PTAJp7D1IBUYxfjQE3NvTiAwMwFnEDNLbb1ieHqEpWnLePF3/
 RypEZ4au7HbZXhf4KtOPR/amWiFf+r08anCpYUVOsw==
X-Google-Smtp-Source: ABdhPJxQBfXSL0HvSUCf2ZW0OZD9LRI8wRUDyxvCbyj/UdSR8P3y93fwrawS5BkcAqtjimHAHb/oiMbxfTj8pRsyaAQ=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr2951085edv.100.1610053818967; 
 Thu, 07 Jan 2021 13:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-6-wuhaotsh@google.com>
In-Reply-To: <20201217004349.3740927-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 21:10:07 +0000
Message-ID: <CAFEAcA_BTy5z5TUkGifxSkX9xgxMTfgYwQ6daPnGvtWTnV2MFA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] hw/misc: Add QTest for NPCM7XX PWM Module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> We add a qtest for the PWM in the previous patch. It proves it works as
> expected.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

