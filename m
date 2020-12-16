Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9726F2DC85B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 22:31:43 +0100 (CET)
Received: from localhost ([::1]:33956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpeOc-0000Zi-5K
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 16:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpeMk-00082R-LF
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:29:46 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:37766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpeMi-0000mR-HP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:29:46 -0500
Received: by mail-oi1-x233.google.com with SMTP id l207so29484950oib.4
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 13:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=AePaXHMw0X6s/TILOy7QTjhmJSaLiCdDfo/lDa3LRV4=;
 b=DwH2s14mXgDr89KXQ5UiS4mQgx1XCrctT8YT6GcQuhCEHtwUgyZSg0DSGpOXbVw4zB
 rVTObdyMRaW2WHcgI3vvPpQs/tYHlEjV5EmCdbBRE7zuA4oxpq6QgwzYTcAxO3yShr5u
 H7QDqs00UTuBcCaKZGOaysZXTgzQGSucSpCYZFngb9DOSdWPDSonToXZGPX1CCb+FcsB
 XESZZzqSkxlkkBYiIwC0eFgGwsN1jhYCPg8Yv3e/mr+SEih9y7sZNjpFZ+HBOcC2bdqC
 Em89pud3t2rH4BMOuWiWdU1WDUcuMo5lpPRGYnF7Di4czVw2txzIe7QqFtqjyA9MzGUG
 0ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AePaXHMw0X6s/TILOy7QTjhmJSaLiCdDfo/lDa3LRV4=;
 b=Lk38HFZy8L7Z290Yd6U0LChyxgc1hrEPiMa2+Ek3gNM3SPAsZAgFrgtpWj7gL6ll83
 esAn2ZdkOXlcBUlj2+ouiHHUJ+NPwnREaHaScjdo3uDN2p3QtsC5P9jcxP6ODkJf84nq
 hg70BPKZM0HGcjNY3ZggNb7iL6D0/04mKA1g/IPFNdyzPku6TwaSbl1gI3a/GMgjSDO9
 ++ibxVhiqHOxdqTpL0VxwMs0hljB7z2gFIx6aX39i2f9Ayaq7vuGMdF50sN03HUL4/NL
 tMoiSxXWZchOfmnC3YTA6pXwZgkEaMm+1ZV91RmiYH98g6IqA27Jm7RHTwX4kGYfuDxI
 Ekhg==
X-Gm-Message-State: AOAM531vr435IRfe6YkHjkfiOTRLPTRtvUyElqYgRyC0mZSfgEb6nnV9
 Di50v08+SXr0zFFw+VE7pNdLaRtORM7J8Lg3
X-Google-Smtp-Source: ABdhPJyGOMhaY7ya4Q58vjqfGq68oS8Mwdzs9tU2qevjKIC13SgPeG/6Ukvg+rAX/zD0LAMblgpn7A==
X-Received: by 2002:aca:c492:: with SMTP id u140mr3028943oif.51.1608154182659; 
 Wed, 16 Dec 2020 13:29:42 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l6sm809643oof.3.2020.12.16.13.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 13:29:42 -0800 (PST)
Subject: Re: [PATCH v3 3/4] target/arm: Implement FPCXT_NS fp system register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201210201433.26262-1-peter.maydell@linaro.org>
 <20201210201433.26262-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8804124b-6461-bc4a-2314-a42d301e2187@linaro.org>
Date: Wed, 16 Dec 2020 15:29:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210201433.26262-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:14 PM, Peter Maydell wrote:
> Implement the v8.1M FPCXT_NS floating-point system register.  This is
> a little more complicated than FPCXT_S, because it has specific
> handling for "current FP state is inactive", and it only wants to do
> PreserveFPState(), not the full set of actions done by
> ExecuteFPCheck() which vfp_access_check() implements.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes since v2: refactored along lines suggested by RTH
> ---
>  target/arm/translate-vfp.c.inc | 102 ++++++++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

