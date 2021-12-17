Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69C4796FD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 23:21:26 +0100 (CET)
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myLbQ-0007ms-OZ
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 17:21:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLZd-0006sp-Tp
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:19:33 -0500
Received: from [2607:f8b0:4864:20::62f] (port=34376
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLZc-0002iR-9w
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:19:33 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x15so2620247plg.1
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 14:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cvd4B7eDK5SwZPR94/4jVaZJa4s3t3KyGC4s8ZbrZyY=;
 b=WssWTGOgoDwS2mEOfZoxQZZjvFgkvIAPEYq/DCthWlxnmmS4Oo2MhglAahwCCUTjQW
 Cj5TiMKWFANmkPd5EyKfS/iog82J+xVMeHbFNCdATkQ5ZCyt3lA79Vo3MQ57wQZQOh3v
 I67YlLFT8MZdrlQbX4p1IBgPIDDf5ZqtvVKVdPtKbI8V+THQFDT4ZwLYpOaHOu+rabhv
 /UbPECJRcUKwyfnHuSU5LkfZWREZ8nhIaWJfCMvYnCw0rSMhyIIJ2+fzwmzcWkuaELuM
 gjfa21eQJEe70CX1q9DJPMUzwpk6ydwri/7YlQEFsTuxNLKbGKZKM+661XSzVxs9lxqo
 l44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cvd4B7eDK5SwZPR94/4jVaZJa4s3t3KyGC4s8ZbrZyY=;
 b=KatGnN9o79M7i2FD1pRE1bbDDUMFUzaGj/tLXa4tj2yHNkW8LYLRIN1bnuPyYaKORM
 ZpuTRCjS/YgenEZAQhoWyh94MdNSHNKyDnz2iiaRIyuB+rOxcJFYaVCdAgvVoFx3XVkJ
 LIEx/udS8X1Gi6EjHeC84arrq+sOmFgYN9dw6OSGNR9yNHYlEZbWWrEt6fsX3/iH3rT/
 XikZKKhwjS1yxk3j0xmK5KxNfv6VT2n9T3ox0VHmHRaY1NmMpKxN95xG3MbsgDsIeuqb
 q0LoPWS8QCyvW0vja3PVGpflNFYIS2LCzeMPNF5KMot1mHDpnmNKZ0CPv1XstLCmIngf
 CiuA==
X-Gm-Message-State: AOAM530/FNh3YLEI9OD3CyQ7Eh1F5P6Sf0rib2PIPVHzUC3NBcfjMO9R
 YL5QA9jmND7bZzKOWuRj7oZbVA==
X-Google-Smtp-Source: ABdhPJwcwaiu9qSPGDMNYZ9k9JFMJSEcMF53EcnYD+rO3JOYNWOxGV+Wab1D9wVDSKs7spPBsz/GmA==
X-Received: by 2002:a17:903:32c8:b0:148:f00b:9c9f with SMTP id
 i8-20020a17090332c800b00148f00b9c9fmr654602plr.122.1639779570846; 
 Fri, 17 Dec 2021 14:19:30 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id c7sm5398358pjs.17.2021.12.17.14.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 14:19:30 -0800 (PST)
Subject: Re: [PATCH v2 1/2] hw/arm/musicpal: Fix coding style of code related
 to MV88W8618 device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211216125647.805544-1-f4bug@amsat.org>
 <20211216125647.805544-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb3bdfd6-3f71-21c7-703c-fdc6a5c9ecbe@linaro.org>
Date: Fri, 17 Dec 2021 14:19:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216125647.805544-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 4:56 AM, Philippe Mathieu-Daudé wrote:
> We are going to move this code, so fix its style first to avoid:
> 
>    ERROR: spaces required around that '/' (ctx:VxV)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/musicpal.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

