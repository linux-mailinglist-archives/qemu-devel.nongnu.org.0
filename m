Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C083A1E11
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:21:53 +0200 (CEST)
Received: from localhost ([::1]:36830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4i0-00087q-02
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4gg-0006cs-GJ
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:20:30 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4gb-0003yi-RP
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:20:30 -0400
Received: by mail-pg1-x52f.google.com with SMTP id q15so20589602pgg.12
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Vy5kRoHOzTEL2GiMfrYh+k2M8Di4bx07Nrdw/jXEu6U=;
 b=blIIVwLmh1VJivvWXVfGLtLY2YdWAR8H9mBEX9cPCbIrKYJc8Z0NOaV4WFIYf/JklI
 GOOlNfdw0WVE0Owbz+0Nz4zpx1lwfVUHBJzV6Rebi3d1AIKyvjrh8Cc8Lr8J3TmldmaV
 gJ75hOEdpZLSZW/HWk+hm6kdlkOhdRMX7aaXrtI4iQuQmVf0xsRjKsOcJrUCOkbsIfVP
 byV7KRJ+hFx4/7Gg0lARS5TxFfzHU4YRrRzIHxuXA++CNOqJO0DaGjwW9UyNEjSN+XeL
 6bv5N4e1O6oB9PrzxY6Yx9cxLEplDfLaodxPadBcrveLP7elJWOMswrATHONY/2pnhEQ
 zvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vy5kRoHOzTEL2GiMfrYh+k2M8Di4bx07Nrdw/jXEu6U=;
 b=nlOafEWchQYDyD3aac+ITjpbsF+SBSwq/pwicPYETEO6ba6kD8Wx9D/EYa6/RZPwta
 2F9I8pkGGkbq82lMbWuuS8LgqQFBTEO6hXpOQKTAXPYLeiUPTvcuc8jeISbCaVxgAjvN
 j+JWLLEg3M1TFGVuilovTTyK3pndmw2b3gHSz0aUFn/3vfWXcBpFafrzuyK1eA9PwvXy
 MgE6HFzYn8+hTLA4WXMtYSR+a2EfpEvW4SkkQXHiyXcMqWUAjAjNQ0WggBbDl5trF0TX
 ktDAtzwECEG+9dVZc/JQ6GExcsW9a8XbZOo1+Jo/URVguvr87XWagt/Hf0tiLt0Kkz1p
 HGsQ==
X-Gm-Message-State: AOAM53198I/YY5zCnlsXJHJ83eqnCyOQ9+ZNRnbJdzNoqu95D45aY89O
 KXhSieUsnVze0C3OYbCoAbSDFovIvty32A==
X-Google-Smtp-Source: ABdhPJz/K33V/txiHjDg62JdpHPMzBjmOBR1nEGQja6u6OQwMkDtdHT8d3aM6N722A4VEmU73kxJJw==
X-Received: by 2002:a65:60cc:: with SMTP id r12mr1450424pgv.164.1623270024159; 
 Wed, 09 Jun 2021 13:20:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i1sm348652pfc.206.2021.06.09.13.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 13:20:23 -0700 (PDT)
Subject: Re: [PATCH 49/55] target/arm: Implement MVE VQDMULL (vector)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-50-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b0a7b23-7e96-4d0e-abe9-5f137da131da@linaro.org>
Date: Wed, 9 Jun 2021 13:20:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-50-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +++ b/target/arm/mve.decode
> @@ -39,6 +39,8 @@
>   @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
>   @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
>   @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
> +@2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
> +     size=%size_28

Move this back to VQDMULL[BT]_scalar, I think.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

