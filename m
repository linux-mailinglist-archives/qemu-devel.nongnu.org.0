Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E312951C79A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:36:30 +0200 (CEST)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgKz-0000A5-GE
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfti-00047U-1e
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:08:21 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:45785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmftf-0004Q1-Dq
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:08:17 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so3427976otq.12
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=z37JUE85J2/qcCVF/4qTyMtEGzFjluNmwGKhl5vTWc0=;
 b=N0t70BL2quIJIEB9KnGga6Ds4Pkhr3IqTikhNiGGikBP2SGGyF/qTW4L7u+umNRhzC
 x6ozJtTA9X3+OrHlDDUhu1xEDhP8frvL3EQ/4QxYEd3J51lk6dnKsxLqD4ab6LXqwm7R
 mxLNXU8ZHmuCKl5s65n409jFFKOT79yn8O/oLdebEn3ONp2Eb1MtOBtYxGLSRYeNshsn
 aOIQKbwtLXVhKsaLrQJIPKs9336sSb4sLSA3sUhJJpKzrxo1H12O4jesY1O/ScNeQiL0
 gY97mkpEna/37t9icyi4sEctVh9cbWWdDdVDQRQbWhQ30nUzMgA4qzIWEHk5WUoEKyZn
 NjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z37JUE85J2/qcCVF/4qTyMtEGzFjluNmwGKhl5vTWc0=;
 b=eUimKw3HGWwFwI6EKgRccfvDS7kN+0vT/X1LesX1hDJPzk2aTqn/MJXZ9qPkMSQ1IS
 lZuELi+1xX1ASfng0yGC5Mfi+7sK8fiFjXWItQy0WBjPbeIdfQyIbEvZceE72oyw0Lqo
 /Xwvt5GJyfzb4RtjAy28Hnv5LTQ6/7Ba/oaT05FF7THmvnlAj7NHCLeIRcC6darl48Vs
 07Er3yFyXnNhap5mYxA6Po1v7omTFgpkVRwcLuV/CJjmQ2S4PriCtycImGj9sa135wD+
 EZCEUjYdBpqwizxdh2BkgofAEyYQ3+l2qKU4Hg4YJp0tfZX0UATveW+r9z+4OCGfH1GQ
 nd7g==
X-Gm-Message-State: AOAM531j8Y3Az4akU0xdz7JYre4nZTwk+YZWJb2v5iaw+ZjwEA+Nncq1
 27UcFUlru7315Vw/G8gXMWlwHQ==
X-Google-Smtp-Source: ABdhPJxPMYxHNrRw2wKqESjJUYorBYCnuXKDo+MDc9/9WsN/47Kl4kTFulvlQ8oriAskzB+VpyHvRA==
X-Received: by 2002:a05:6830:442a:b0:606:5b5d:d399 with SMTP id
 q42-20020a056830442a00b006065b5dd399mr722005otv.151.1651774094115; 
 Thu, 05 May 2022 11:08:14 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a056870e98100b000e686d13890sm697724oao.42.2022.05.05.11.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 11:08:13 -0700 (PDT)
Message-ID: <a559a9e5-c256-898f-70b8-37e2cdf12455@linaro.org>
Date: Thu, 5 May 2022 13:08:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 24/50] lasi: move memory region initialisation to new
 lasi_init() function
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-25-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-25-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Create a new lasi_init() instance initialisation function and move the LASI
> memory region initialisation into it. Rename the existing lasi_init() function
> to lasi_initfn() for now.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/hppa_sys.h |  2 +-
>   hw/hppa/lasi.c     | 13 ++++++++++---
>   hw/hppa/machine.c  |  2 +-
>   3 files changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

