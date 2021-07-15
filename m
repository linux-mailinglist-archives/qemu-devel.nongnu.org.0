Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0EA3C95A9
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 03:39:08 +0200 (CEST)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3qLD-0002zx-K9
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 21:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3qK3-00027g-QR
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 21:37:55 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3qK0-00039O-P6
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 21:37:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id n11so2380523plc.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 18:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ce32CrITOlKgSjw4Ko4/D8Jjp1B64lj61S4vAUyJzmM=;
 b=MmErWpi0aBbK5vcbbry2VbVqQepLP5fmXtvRh6AzGAVIfyMKN3EgEscIvw3fYBBSTx
 sRhx2QVCUvSXN/+Mc5oBKU9IyhS9Bq/daZv0hDB8gEy/c6fLDUOCqOZCtgpTqfPKXsqV
 xffAYJL3/xa/MUgfp3+6lBXBTxdUVhwKF317eOFoI7W03IA4S6Vl56HfBHb22nCOKfel
 Ecpk6uVHgmFR+a80cP4GpQDXYvPSEqLyXdPxm8+Nlxo979o3NEgiPLh+Pw95cf7TO9V2
 s43yJwInBJGqyObt2KVO/nWZGwV5bVCXUdrNiyH/+fp73G3rAZf9MqMGublKUMkkFuPe
 RrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ce32CrITOlKgSjw4Ko4/D8Jjp1B64lj61S4vAUyJzmM=;
 b=rBLU7TdKWdAT4YYYGhFzZKDE4etOSVbqhMvD49GucjSEYo6qdXjBu9rtOrA08G7uXd
 duSoEzkKIFTpXRNYQ1Wir4l98IlfK/msVYAvoNEEH1gWZQW3B0piIStUAPYVsgxcY9lp
 /Y6jm2VxNLKp2CdKUp1fDc2hYswvf05ZvfYEZ0iHSE2qh09modvhAcnQJaeP8iSIKqcs
 eZBMRHAo2FN/YTOHV5ZhO9N6obCZBGSybBK0YDXWO2bJVmvht85swloPATxAtPYKcidW
 2tJPvDdB1EZtIsFvQ+VPzKTilEuKMxYTE+z0Tz6MrxuSD2sF8nyD8n8rvc7Er/1XZyFr
 Kf5g==
X-Gm-Message-State: AOAM533nbY22vRYTIVEJ0Uv5Jo+9avA5zyU7xA/QSMLXy+w0YG7hnWKO
 hx1lBD2xwhEJaOhaRQIblGBfSEHDHIKqtA==
X-Google-Smtp-Source: ABdhPJwoOsN+fuSNQndTUdZIhR/D2qZmq8KLRRkrRrgWRL8uO0Stb1KSUI+ws3pqrgWiYzT/cGX7aQ==
X-Received: by 2002:a17:902:ec86:b029:129:ab4e:9ab2 with SMTP id
 x6-20020a170902ec86b0290129ab4e9ab2mr1006197plg.12.1626313071241; 
 Wed, 14 Jul 2021 18:37:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g9sm4234512pfr.133.2021.07.14.18.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 18:37:50 -0700 (PDT)
Subject: Re: [PATCH for-6.2 04/34] target/arm: Fix signed VADDV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba6dc02b-045d-ca87-64c4-c58cead22cc2@linaro.org>
Date: Wed, 14 Jul 2021 18:37:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/13/21 6:36 AM, Peter Maydell wrote:
> A cut-and-paste error meant we handled signed VADDV like
> unsigned VADDV; fix the type used.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

