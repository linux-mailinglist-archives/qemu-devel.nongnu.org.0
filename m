Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3593666017F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 14:45:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDn12-00074b-Hd; Fri, 06 Jan 2023 08:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDn10-00073m-3N
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:44:10 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDn0y-0003tY-7Y
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:44:09 -0500
Received: by mail-pf1-x435.google.com with SMTP id k19so1065351pfg.11
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 05:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0UT6Em5fIIUlSzreBzAUOT3iBrfxYY0u0Cme1kfkGas=;
 b=i5BFK8dMUP3hEQ+yajoAvidjWadyX9oaIalJroLIScLPJUGWX6fWRejapNoY5KxYea
 srTGWx+M1qfhtIv0UWZ+TQfone7C+v+YY5P0IFOyVc8/V18vkHETAyEOK7jbqCWHWmtr
 u8GazogZehlGVUnAXSqoKBwHJ/ULzK3tg5nHLdMc6Zi/eD0gzAdOAyrw6V1XKKuQIYx7
 cP+scTycYY72j0haPcoKI74nnKEKPwvuL2UemxUIIq9NgzWSAPhGfmfa9ylqWiUySrjS
 HujuuDUeqxgq5JihcEzhMdtif/wjlwGnzL5V2dbaFY/yh9YbzQ6BEJjcIjS8CjXkm6du
 X09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0UT6Em5fIIUlSzreBzAUOT3iBrfxYY0u0Cme1kfkGas=;
 b=S5Yhex/PZVLALCkCXTl24MTBeLbHh9XUskt/upUX1CpUGKHe2kqkIfcXici84PBcmg
 NGMI25IiTHfd99f29JpcOJPC+hsArTzB0HBpD5UBb3Iq73tewLxfCDkkPxX2cpmhIjey
 yLeva5FH351zTYG1TYigpgE9AwQsjfzbhehre6PRzlYr/onQP6Q8KNNiRiWsV/Ev7BY6
 emT072I2b2AzIL8VL9iAt8K/lDnT8suhIB5x4M3g9sLDKNVH6ywyeSrzuC4cPu2zHNNU
 SHTP9hjcpkWRzcoY4Z6rKeC2Hw6FqUDhzPNk3nSTjyxzr2eGUCJtZAZEvrjqoLthJfhp
 VHKQ==
X-Gm-Message-State: AFqh2kpn+R6uYWKyYO1T5dK3+d6mCSav5Qc64W5oqi7Mn6LA5DTKnc3V
 QBP6lHBZnIi+Q7XR3pkOifYzTA559D/udQGdjMEB1A==
X-Google-Smtp-Source: AMrXdXvOjwEpU4jw45DqM+7U9sbZY0Hrf9V6cIsaM0uW1JLlBEQlRRwHmEVEGrHrlLJPHq8ETR0O9YSos5wFZWbzi/Q=
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr3641613pgq.231.1673012646591; Fri, 06
 Jan 2023 05:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20221230145733.200496-1-balbi@kernel.org>
In-Reply-To: <20221230145733.200496-1-balbi@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 13:43:55 +0000
Message-ID: <CAFEAcA_WSrJqObGYkUcBfhSYYo92_i-gpF=CbYFbWqEgp3Z5LA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm: Add support for STM32 H405 and fix
 STM32F405 memory layout
To: Felipe Balbi <balbi@kernel.org>
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 30 Dec 2022 at 14:57, Felipe Balbi <balbi@kernel.org> wrote:
>
> Hi,
>
> The following patches pass checkpatch.pl and have been tested against
> 55745005e90a.
>
> Felipe Balbi (2):
>   hw/arm/stm32f405: correctly describe the memory layout
>   hw/arm: Add Olimex H405



Applied to target-arm.next, thanks.

-- PMM

