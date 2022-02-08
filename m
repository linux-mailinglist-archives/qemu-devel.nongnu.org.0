Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD394ADD69
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:48:57 +0100 (CET)
Received: from localhost ([::1]:39872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSjf-0002Ac-Iu
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:48:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHRcD-0003uI-Px
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:37:10 -0500
Received: from [2a00:1450:4864:20::334] (port=46700
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHRc7-0008Ti-6n
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:37:09 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so1812744wml.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 06:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YGfCX8v7fTh3GisZPNvDk3SROq82HKbmfnFE9drJiNw=;
 b=cLuxSPwsiT4HzXMjLgMBqi++TeBBlgcpWgFJLL+2llB2SD93+fUGjtzcCYH8IEHkiV
 Yj5DKzwhHuOANj/Z6TVydLGNoF/N7pvlioXmG3evCeecwl54iI+/1ggnuOasBnu9TWRN
 JqobHkIsUkmJ35Q0k8bipN+CK1etLsophjCQdEEY5Um9vgZ0LruJyT39R78fC47QOBr/
 rbId3cu16F1Q5BJl4+Oub1BUGeJQ9eILUPAw7n0nljQ6rpn1hqCOV2/gc2OVGztQV1IR
 bNfCdjr8vAhFikakS8okXy1cKl+cB6XvS5IFHt7C2DowhQ/t+y8VviG+V44RD7q3b9mG
 UxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YGfCX8v7fTh3GisZPNvDk3SROq82HKbmfnFE9drJiNw=;
 b=KC58mf8WTRFCLS3Ph3GAvbS4noZUOCCwSwnLAl/DZoFy9f9+fEP1ONBw8fIKCfLLUc
 M3ot1nlR6SC7oXbW4Yof2QNy0HgQ+7dVNeKDftyu0yxinxoNErP8HwHR7/ANssuVDrdk
 Gw8diBXp7ixZQmQ+HOGT0xJGvrpUj5WDe7xkJAyxRnAXdHggrZD0PME7XV7IOn7mdnDJ
 ZzDYfSKM9mKK5dviniYFsXFR1oKUELASP/dhOHugAo1Ib/eFqYfJYs199lU0/tSQMDQb
 OSHmh6FCevCMqwRunoVULOwaHFcZKfsWHvkqukImKUTWOM6YHG72B5O5dE386BLu/rz/
 xHmw==
X-Gm-Message-State: AOAM530pBMmzn3I7IedVhQWEiHXd2bDhtnLnl1R2lL6sCPpM4PLlAD/w
 tKpwJEO9iFEAQ0JO8QrZgmkuwBpx3PtqNijPG/ELOA==
X-Google-Smtp-Source: ABdhPJwZCD7gTCWT4XLfIbFh1fdSjwsj1ee/tHr01z1+ylP3AfnUVGEw4Z+/UCspq8DL8P9k3XIo53gws4abWTo5e7w=
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr1366180wmf.133.1644330994485; 
 Tue, 08 Feb 2022 06:36:34 -0800 (PST)
MIME-Version: 1.0
References: <20220208102724.34451-1-agraf@csgraf.de>
In-Reply-To: <20220208102724.34451-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 14:36:23 +0000
Message-ID: <CAFEAcA-0DvRJRaxWNKxPGEkJn+wBUDJ-MaV5ysqoq1nCFiLP3Q@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: Handle unknown ID registers as RES0
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: qemu-stable@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 10:27, Alexander Graf <agraf@csgraf.de> wrote:
>
> Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
> those reads trap into QEMU which handles them as faults.
>
> However, AArch64 ID registers should always read as RES0. Let's
> handle them accordingly.
>
> This fixes booting Linux 5.17 guests.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Ivan Babrou <ivan@cloudflare.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/hvf/hvf.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 92ad0d29c4..39c3e0d85f 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -729,6 +729,17 @@ static bool hvf_handle_psci_call(CPUState *cpu)
>      return true;
>  }
>
> +static bool is_id_sysreg(uint32_t reg)
> +{
> +    uint32_t op0 = (reg >> 20) & 0x3;
> +    uint32_t op1 = (reg >> 14) & 0x7;
> +    uint32_t crn = (reg >> 10) & 0xf;
> +    uint32_t crm = (reg >> 1) & 0xf;
> +    uint32_t op2 = (reg >> 7) & 0x7;

This is now the fifth place where we unpack the fields
of a bad-sysreg syndrome register value (we already do
it in the tracing for handled and unhandled sysreg reads
and writes). Seems like a good time to define some
abstractions for it rather than using a lot of hard-coded
constant values.

To demonstrate the value of this, you have the shift value
for op2 wrong -- it starts at bit 17, not 7.

> +
> +    return op0 == 3 && op1 == 0 && crn == 0 && crm >= 1 && crm < 8 && op2 < 8;

The last clause in this condition can never be false,
because op2 is only a 3 bit field.


thanks
-- PMM

