Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CAF3A1C75
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:03:31 +0200 (CEST)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2Y6-0000AT-PK
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2VO-00066y-KV
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:00:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:56262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2VM-00051F-3w
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:00:42 -0400
Received: by mail-pj1-x1030.google.com with SMTP id k7so1868393pjf.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uCbrR/ollNlfmhc0ftwjGOB1gvgU0p7m1+gu09M1djE=;
 b=LS5EOPKFXxprtFGoWmswhrB6saiLYivb1KQ3lvPya+T21V5rTjcFS6kYwh3clNQ+Bz
 3HGmP9BsJ5E2TR505OCyuyxxjJbA4fwtUwbdu2DQegIyajEzRYTbfQd3zyRhSW8M9WI7
 XpqzTUNrazoYWbEvM6LEVW/eboRTpOTkLXdTspc6hV6IzobvULhed80w97oAlua67fep
 j4KacIvvcvwzBlcOgRkVXLK11Nlvd5Qp2qlTjZXLsDub0vngNwjs8kkit2mJkFUb5/xL
 0WIiMUHoByUGcj5lzo5y9Yd8tX6/q9l2jjowwlotawSwD9taf5LMvi76TpDzKoVs+W0F
 hfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uCbrR/ollNlfmhc0ftwjGOB1gvgU0p7m1+gu09M1djE=;
 b=lH6QsKpEdHlz6IgsxkksAm8lJLhTppSzOZOwPtC9+kVwkkc7te8r17cV5/iQaTQ6uO
 63ctXCP3XgqM3v2GMKL1aOFSZA1Cm2t74zQqnWQq5Sv2hOuEEjitRV6ON1t5mfsDW+xJ
 dKDpB15HGQz/uhakL79B+2RGm1m/oWg76Wl+3MNY3fq3KpoaEt24TvodArJaVQDXMNOe
 jhwS1ItSprbU+ar77rm8XkM7V6YarjKEbU//cC0GspG4Pl8W2G0vwiVF0Yvx6x5GTWv1
 2jK4dr8v9uAIRZHK3ZmfLZEk+WG/43dcMdJ/4sscBxhtfu1029OuwQdCulNBGwpiVKXB
 mLcA==
X-Gm-Message-State: AOAM5313hNxH0iKb2Sgy+EK/FA/sNUHmV+bxmSaY8I5QYW2Y5ZrtNLBd
 LLid9EURvJRt+Np5HCVAle6ixyTSdO8tmw==
X-Google-Smtp-Source: ABdhPJx9jlmGdZCouKpukX3ZpJCyMK9LsC1hQzOrRNGw8pXRZUbfBa/GTUjYms0lTvanDLZGGALqWw==
X-Received: by 2002:a17:90a:f2d2:: with SMTP id
 gt18mr12049781pjb.139.1623261638696; 
 Wed, 09 Jun 2021 11:00:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b14sm399594pgl.52.2021.06.09.11.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 11:00:38 -0700 (PDT)
Subject: Re: [PATCH 34/55] target/arm: Implement MVE VSUB, VMUL (scalar)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ccc7ff2-be93-5a1b-274e-8015d1f6124c@linaro.org>
Date: Wed, 9 Jun 2021 11:00:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the scalar forms of the MVE VSUB and VMUL insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 8 ++++++++
>   target/arm/mve.decode      | 2 ++
>   target/arm/mve_helper.c    | 2 ++
>   target/arm/translate-mve.c | 2 ++
>   4 files changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

