Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD3E686F02
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNItG-0001nX-SS; Wed, 01 Feb 2023 14:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNItF-0001nE-8K
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:35:29 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNItD-0002KO-E5
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:35:28 -0500
Received: by mail-pl1-x632.google.com with SMTP id be8so19514056plb.7
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YG7zljxNybpQ9J4NLlEtVqurQKQz68wystZY4tNX1XM=;
 b=b0mbZOi0B0DUrvr9XAUTZtBNiqmGSkU2BNiHfnV4Ram0MOC6GQ+MeAGPyecBVSVV9c
 TqC+3ltQFlX7I01sDb+eFFd8K2+D3vfxifabACf68kMsP0r2W0jPPX93C2+aMIUaRGbv
 3XYqMIHLArPht5D5kGgdKqMGIackwoFXV3jYhLjGyj1jrofYzy1kTY307sYFoj5Op5L6
 gwOPbiAKNP/DnmCBC0YfQxhJo77IeSoS0ex+7m/V5xUrBJrtebYguO4MiOw+WWMZNpnh
 PbQIeeHy61c99dnp4Ru/qXPbi8imuw2Cqr5aVxcM4vNDPCkKViXby2bIc/N1p4RITDzA
 pjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YG7zljxNybpQ9J4NLlEtVqurQKQz68wystZY4tNX1XM=;
 b=iUmRMTrqy3M5Dc6eqeZsTWMfz+IWNuoqnnQJuCb7jGDgX81sCuy9TVKbeHA5fzQ2oi
 2DSP1gAa2jXxjmlcEOYOfa/r33SQI13H3Ue6YefVsYTAPldJQ05TWpDUTzgLB3/Y+TNl
 zLPl1oOGsoNcEvt4FUurMR0Sruxmcv9rs2v9xxWCAunEWujBQSlTIEKTKyhddetPKT8N
 +Y0yK/0qpYRoiQc0qvT5c9WjegsUIjcg5LBudkZNJ26zeu+jGpdFm9ACjgeXBw43Tes6
 ewZ3QNiuwt7458LbI+HdV966Bd3OIWCkPouTz0f6mene4Jit5UocvQc+Bw8MfgyUlaDZ
 BUSA==
X-Gm-Message-State: AO0yUKUzDYzM6k2QrBM6Y3N4tLqJ8bg/4yV5ofhK6wjk+zDiDLhVEwQg
 t3m5yvCRQ0iG4A6NGb3TnXOcKw==
X-Google-Smtp-Source: AK7set940a6g5MW5OMwhLqEn1Fzp0RWy2vZsbSIJfCdnMuHyfb3OzZesPIMptK2nj3nr1dI4LBqveQ==
X-Received: by 2002:a17:902:cec5:b0:197:d58c:2665 with SMTP id
 d5-20020a170902cec500b00197d58c2665mr4286224plg.17.1675280125868; 
 Wed, 01 Feb 2023 11:35:25 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 x10-20020a170902ec8a00b0019488090884sm8658741plg.273.2023.02.01.11.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 11:35:25 -0800 (PST)
Message-ID: <1a0e0852-41d2-651d-4594-f47d13a68e59@linaro.org>
Date: Wed, 1 Feb 2023 09:35:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] linux-user/microblaze: Handle privileged exception
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20230201004609.3005029-1-iii@linux.ibm.com>
 <20230201004609.3005029-3-iii@linux.ibm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230201004609.3005029-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/31/23 14:46, Ilya Leoshkevich wrote:
> Follow what kernel's full_exception() is doing.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   linux-user/microblaze/cpu_loop.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

