Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9926B65121B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:41:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7L4U-0002aF-Lr; Mon, 19 Dec 2022 13:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7L4L-0002XH-I9
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:40:57 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7L4J-0002u3-B8
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:40:57 -0500
Received: by mail-pg1-x52f.google.com with SMTP id r18so6746039pgr.12
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 10:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bPyCusARd19ddWLaOh4Zir0G8pzdLeQdPMcDxYSHJ04=;
 b=witVRHiabHbqg7pIc7KyYUA8emgBTuM2/Qcb1cabqzvaV9r6goTBstr1vVzbeKWtKx
 HT9J0DX5W+rPYcNMG0MoY6mISmHMib+/O2j1ux578goUC9qUr0i3Jwf7FOppWdIkj4is
 ADEulhdSw+Cc0XRaKLsXswXh11ShpeKQ+dhgQjZXjTm6Gim3UT6XVPe9wBDc71w/d10a
 kl4k1szwzmdf9fGvLH4alUuo67hVr58i7ZhkGyva1ZWgILJa49pbytshXnwoTNbm7Jhx
 wt9q/snmkALVGMpv3f9qqRpXyYXE1fHQhcDcuoylNPMIDTAt4qwj8Dud83YTP0n7dso+
 n+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bPyCusARd19ddWLaOh4Zir0G8pzdLeQdPMcDxYSHJ04=;
 b=63ZnvJVUHLPaXrJHNqwwGErOR8I2FP1fScfufv/iEozYsVWxv1p0CU3pU+1NWanDoG
 o3Ka0X2P6JUtei3xN3ROE88IZUOc1qoWgD1sR/LqO2crkIkUDjY2PSy958Nji5Ljj85l
 quhAuW6yL5emuZytiPwr/4aDu9tLtOMEWi20R+Qz5mqYbNg2ZCo5ipRlMCjKZ1vTAHiL
 DFrXXFFrPftvDTivYB1SmwSwbUQZX4MAsUReu2qVq2jsTMVyqnoAAbT6/2vv8n+TOTXC
 aQmtDtWMKkaRYn0ReQhQAdIv4xuZffossBNBQlFkcRuP37UpDxKO45j3sxD0fMqSK/1m
 pshA==
X-Gm-Message-State: AFqh2kqXMhUYCKyIzTLD5xO8a7PRTigU1uUW20EQqADShSlkhUspCCL6
 Ht4wvCON7RvSmH8pc19kWdqD6w==
X-Google-Smtp-Source: AMrXdXse47rPB9BFRD9NHdrEiZDpTQ86WG+UXHj9I6XtfE4k/iEQo7C5dxkqS0qnbKgVkGBDjiQ3kQ==
X-Received: by 2002:a05:6a00:291a:b0:56d:465d:9fbc with SMTP id
 cg26-20020a056a00291a00b0056d465d9fbcmr9314687pfb.25.1671475253796; 
 Mon, 19 Dec 2022 10:40:53 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 e64-20020a621e43000000b005770fd365d8sm7124362pfe.97.2022.12.19.10.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 10:40:53 -0800 (PST)
Message-ID: <dd464d3c-1c38-fa97-9c5f-7a063934beb2@linaro.org>
Date: Mon, 19 Dec 2022 10:40:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] tcg/tcg-op-gvec: Remove unused "qemu/main-loop.h"
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20221219170806.60580-1-philmd@linaro.org>
 <20221219170806.60580-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219170806.60580-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/19/22 09:08, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Added in db72581598 ("Include qemu/main-loop.h less") but now
> I can't see what is requiring it.
> 
> I checked 'git diff db725815985..origin/master -- tcg/tcg-op-gvec.c'
> to see if some code was removed without removing the header;
> I haven't checked individual commits.
> ---
>   tcg/tcg-op-gvec.c | 1 -
>   1 file changed, 1 deletion(-)

I can only imagine that it was cut-and-paste.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
> index 079a761b04..aacedd3e15 100644
> --- a/tcg/tcg-op-gvec.c
> +++ b/tcg/tcg-op-gvec.c
> @@ -21,7 +21,6 @@
>   #include "tcg/tcg.h"
>   #include "tcg/tcg-op.h"
>   #include "tcg/tcg-op-gvec.h"
> -#include "qemu/main-loop.h"
>   #include "tcg/tcg-gvec-desc.h"
>   
>   #define MAX_UNROLL  4


