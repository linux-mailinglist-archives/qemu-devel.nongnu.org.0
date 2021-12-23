Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A907B47E928
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:38:17 +0100 (CET)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vmy-0007YR-El
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:38:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Vjx-0002hT-ES
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:35:09 -0500
Received: from [2607:f8b0:4864:20::1031] (port=47023
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Vjv-00033p-HX
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:35:09 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so6696821pjb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ERe0Ypfii31jlyiCQOnBFhns9UabBwHpTZampFpM6BA=;
 b=QwO43glgvqNmzeJ1eNGzQPPtCea9HbYipZp67wTBUAkNbi0AKwmRUmMeL7ODSkDwBj
 qNy+W4nhcmCFIWFYZd02K73HVZ07CW4qwb/3QlPp5ExaMuY7lwrhoYfdka2Wz/SuIBsO
 5SvhF35TGfN7/22K5aU/pdwTC5yIWJgg0aktJ76JGsYNuPwMvIPsJPGyoj25qX9ipwgc
 +XukiI/WU34H+K34jEKT7gEYKsO3nm4PZiFz9OD6qQ8rOTRnwXKdJI7+CcqVlYmd6gUB
 YNrGandcWaAsuoKPZgnMrBVbcAOfSSARjhjexyRAHx9VPkRuy7PgeMIYQ1+qZK4oH3jC
 zLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ERe0Ypfii31jlyiCQOnBFhns9UabBwHpTZampFpM6BA=;
 b=wCrYpvE7CGpV9hsw12SG0Y5tfOwqHJZcDsRxMgB9c4dRehs9CywoViTQKWY6GXtWL6
 15f6cTD/mPI07e2TzV5U6MDGkJXGLnfv6+C9ytD4N2Nqg++/F7Ke9EbYoeHgybqnMXW5
 cfAfYrNS0jWUBxlfd5uEEVTrKIdjeE98rD5lEa2CSbIjwAJ/sUM1x2Fchf+1bIfYBAp1
 ty3aCk4AvZAUeyMLW6dnRWQG/K3OKLX636XV7bl0GubWBMSeCXAWK4CUpQFNrOjkv0Bz
 +wT+740+02biTGA1VGe+S+ZsxcFI8Azu7d/EWdaoFJFFdggh6VNG1MFUOy+WgDlGUS/W
 sQBw==
X-Gm-Message-State: AOAM531MBElkM03rf/7qCqrNvEbppFbuhF1jYwlwnZt60+hdlmXCyLvs
 6QV7CA4DbG6/6zv+bov6I2hAHg==
X-Google-Smtp-Source: ABdhPJyuFQJoXR8LMiBWTasHWRk1rDFS8Lv3djqDMWKrp34YUYcbJiNeVz2mCm4KR5za9jWArob+3Q==
X-Received: by 2002:a17:902:684b:b0:143:84c4:6561 with SMTP id
 f11-20020a170902684b00b0014384c46561mr3965579pln.33.1640295306181; 
 Thu, 23 Dec 2021 13:35:06 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id g16sm3838876pfv.159.2021.12.23.13.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:35:05 -0800 (PST)
Subject: Re: [PATCH 3/8] ppc/ppc405: Activate MMU logs
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-4-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e2fa6b4-16cd-4c84-0969-a8de82820059@linaro.org>
Date: Thu, 23 Dec 2021 13:34:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222064025.1541490-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 10:40 PM, Cédric Le Goater wrote:
> There is no need to deactivate MMU logging at compile time.
> 
> Signed-off-by: Cédric Le Goater<clg@kaod.org>
> ---
>   target/ppc/mmu_common.c | 4 ++--
>   target/ppc/mmu_helper.c | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)

There's also no need to use #defines.
You should just remove these and the ifdefs.


r~

