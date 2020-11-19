Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5B12B9DB6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:38:54 +0100 (CET)
Received: from localhost ([::1]:54486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsZp-0000X8-0X
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsYh-0008Ff-RH
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:37:43 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsYf-0001Vu-Q3
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:37:43 -0500
Received: by mail-pf1-x444.google.com with SMTP id v5so1879456pff.10
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 14:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q+IDYurMPfHEiOpBSneypI1nBCycXNGXQAjRtkYHeG0=;
 b=gzfPDrrNo+stnB2cm7l+sXs+zI709TI5KictoacxJljAyWeW0XCaRX6CMQIDhNzvw3
 eIBkoLeTR/n/NJA6Om1HaDfuTn/ZMUQB5NC3UAmmtB07CyyxNMxxk0A3FBNAvFB6whz5
 t+faGYdQis1KlWKRXAYcgJl0KUm1ox23DvT700g0ymL7mCo3WTcogd+N6vcU0XvhEeIs
 mRvzoQAA6IkxZhsqjO+hFVAR9shA+XjuNHVLo47SmuLMaJIYm1ctjdWnzaNUaUKK1yZI
 PLR8cjILp1zdRS2EWNY4XVf7Txb91UacAmmwZkppyi35Xd6BwS2wpImCogbjfO3v/kvh
 0Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q+IDYurMPfHEiOpBSneypI1nBCycXNGXQAjRtkYHeG0=;
 b=aaRtKYa9wz2vh5w8fiW3UUBx3ZxSLJlga3Foo0KHF5S0zSMc0+Ynk3+Uw0quZpFgcO
 9BfIwTRs4000XIs+j8PTIG1sftj8CIYGBsJ2Guw7ymd2uWkUUIFB506fJumSV76Rlpub
 SW6j3RwgapAOjpmp+NR41ksjb6c8WlaToBKdRHPQj810xlXnS/ewvCwpXJFEQaax8g9l
 ksetIrbpP8KqtiG6bF3v42An07llJSIxTTKNbUlxg9RcPuJadoj5m6ojk5S+OizfMUuS
 MPtbLZIZ552wWShaG60J1gjLmIAjViDnXltLxl4IDTipLLZJwXK84v4ANKYxLlgJW+fu
 7Dfg==
X-Gm-Message-State: AOAM530SCYlgXSrp3j5dgdVuHwZxS1i6f7AuPnci2qk1wJiPaxS5XPuD
 Zitdqq9XP7Ci86JJJDSHRyw5Jg==
X-Google-Smtp-Source: ABdhPJzAuvcOKEsOZX8SY3nU5F3rWPGRT5KmGv1sUMyJ4h6AXN+nbssAMLspQDb+uYlgZGclb7k3ow==
X-Received: by 2002:a17:90a:2c46:: with SMTP id
 p6mr6898062pjm.166.1605825460229; 
 Thu, 19 Nov 2020 14:37:40 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x4sm699756pgg.94.2020.11.19.14.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:37:39 -0800 (PST)
Subject: Re: [PATCH for-5.2?] target/arm: fix stage 2 page-walks in 32-bit
 emulation
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <20201118150414.18360-1-remi@remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcebc069-43b7-0a82-809c-55d6b090fff9@linaro.org>
Date: Thu, 19 Nov 2020 14:37:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118150414.18360-1-remi@remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 7:04 AM, Rémi Denis-Courmont wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Using a target unsigned long would limit the Input Address to a LPAE
> page-walk to 32 bits on AArch32 and 64 bits on AArch64. This is okay
> for stage 1 or on AArch64, but it is insufficient for stage 2 on
> AArch32. In that later case, the Input Address can have up to 40 bits.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Peter, bug fix for 5.2 or postpone?


r~

