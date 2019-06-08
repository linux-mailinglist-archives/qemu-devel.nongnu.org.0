Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF37B3A17B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jun 2019 21:30:06 +0200 (CEST)
Received: from localhost ([::1]:60038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZh2T-0006sZ-IP
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 15:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37118)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0A-0005cL-Ef
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:27:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh09-0006FO-9j
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:27:42 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39062)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh09-0006Dm-2m
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:27:41 -0400
Received: by mail-ot1-x343.google.com with SMTP id r21so4916163otq.6
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8+qR5hrKNFyfTAUe6zUMuy3pWxXBLdmu7Z0bNi5nxMI=;
 b=moFs+xYhU4BfDqYjNp+STrrif9k/Yu2oRQgNNJAIhYj2SoOf0NkIhFFO7Lqzi0DNgU
 lyvXxDauvXDOweM1GOOtqWUKNzxpXXKGbDZkfzsjpjo9doR9o7LCtGWNl1qP5ZJ+gcAk
 zes6Ur+Gpp7MMNi+Dg5p9lfQmcerj8zokLnMotyHLw6oHr2QE/U9h1z1Yyd+hcZuKbbd
 OfjUpKre21XvYFDjFavPEe00WzVt+lwDKe/+8hNm1vINCuT+x1p3P/nhAE8zddJHL/Zn
 Lt8qC/wpsVyl8rL+8wPnAQVsF6DYVXBtSDDF9D2x/34HaCgTU1kuALMr2J/Bhph3tAfV
 HjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8+qR5hrKNFyfTAUe6zUMuy3pWxXBLdmu7Z0bNi5nxMI=;
 b=q3bEEhjs+mOn+YfXRsxgfCYMDErPe1WUov9ueczZaaPLGivpXD1ZIpDFTjsvQpikW7
 a1ez2RVSYpwp+/qhjpD2SJKdi+BcQl+327M7JpvdgusgN1IqiBGy4XdEBMWuEzp0RB5G
 DKcDXwmxmyJnI9XJnu2j1/rY9XJZxB1F5G2y+dOBRmo/OQrXRvrTJ1VTCphKTnu74mRr
 pAq4sxKDfh0rHtMsbqmDhAJ9mjwr3GT+FGILfuvKWrRImrDBinzDh3jiqvApJ70Pi6Oh
 OW5ciOzUwhf/aELqo0kXc5KFD2jwPXcLpzlsj/7fqDoasmBnO5IUvHK/65pl7EFSWSHp
 Nnbw==
X-Gm-Message-State: APjAAAV3vYE/Jhb9mtHc97Bm+wMWDFXdfhVXvK1OGKDt3SmokbwZWgNC
 PhnWbogN8ZB6eOO8q/x6C5zKscKMXS9Bog==
X-Google-Smtp-Source: APXvYqyQHSjurSAtCsUsDScWXkl6t92MQ0p6HVWnwBMm5sL/VNBOJMTmn8LwTuvnwsfaDRS5MTSCuA==
X-Received: by 2002:a9d:6b83:: with SMTP id b3mr24090129otq.82.1560022058310; 
 Sat, 08 Jun 2019 12:27:38 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id 37sm2561246oti.45.2019.06.08.12.27.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:27:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6a63b1c7-dcbf-02fd-058d-dcd8d2113cb1@linaro.org>
Date: Sat, 8 Jun 2019 13:21:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 19/42] target/arm: Convert VFP VMLS to
 decodetree
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VFP VMLS instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 38 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         |  8 +------
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 44 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



