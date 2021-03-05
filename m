Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D9B32F369
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 20:03:24 +0100 (CET)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFjO-0007z6-FH
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 14:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIFhX-0007T5-FG
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:01:27 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIFhM-0005GF-In
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:01:24 -0500
Received: by mail-pf1-x432.google.com with SMTP id a188so2813619pfb.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FyRGb36aXIiGIu9PWiRL/SRZ9zhJ+5iRXHCT46I+kjI=;
 b=Q+B9H4xeQBmEaLz3lNd/LHD+IEQDgKzOCu/oh9lOrtBbJqveTvGz3O0WpAR1NktyCn
 lZ2gTGEhdOW3Uwh7uiPfp96o8YzDUBjDZFqOMIHRypeHcwvtz3niQEILz3hppUC9nBnU
 wZa24fpjcAX3OR5DJ0xdemO4P/cLzNzM/eVCvhqKaOd4H9Lp8qtG0PNVPIGPW/8/MkDH
 5X8d05pp74ay1Rj1LKlRZrGJHa9clFBCTjTHD9/Mi9DqXAgvwVhjfgSlm+gocJnAKTWQ
 Ldu8zW/DjoM1e+CAhkQCyYciD0deOJr3ziurgHzx1ajbqrssfGRN3VNMLFMB//1kutwP
 FG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FyRGb36aXIiGIu9PWiRL/SRZ9zhJ+5iRXHCT46I+kjI=;
 b=KJ3Y9mocrnPKXvFOH8Mh9rUxM1yd8HYe2RtyrIoYTIGj5NM07ThDVbNkvw7xWh1ndZ
 GbEibwJq37Xh9ktYc7h1cJbMnLGFZejoDQ4LNDRUhhgbO6C+6eKIF8jnrz6inQ2dxGm3
 HGHI+zkPKfM0i5hVAIqzZh99h86x6liyrK+VTkqEMoxrulruM9pC1nhYP2zZ1sCCRv54
 bFdOOXI9bEBMZm5gSOqHf+UTpdbKh7fQ0Vv3+tHwFKk6lgzCdw15mAXVnb6LGJFwi1At
 FGz+TANfjO1JFRsyFd9Mt7gnQHg3EFQ6iueWFrB8Zmc2bZk0PbaFQUidTMIP0vjcxdDg
 yw4g==
X-Gm-Message-State: AOAM531ebujnssg+7S4DHZfS+etspMT47G8/rU1x5RO/Q0Fp1IO8cy1C
 iK/KNcuPmlXo8zN/wDMSTLgd/g==
X-Google-Smtp-Source: ABdhPJy8kSDJBoyEGrWAxP7FBgeZLCx9L5BusuxNrTyl+hDsaPo5V9d5wNsWsRS9OFkVFxtR83qiDg==
X-Received: by 2002:a63:905:: with SMTP id 5mr9872287pgj.337.1614970874934;
 Fri, 05 Mar 2021 11:01:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id ob6sm2804839pjb.30.2021.03.05.11.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 11:01:14 -0800 (PST)
Subject: Re: [PATCH v2] Hexagon (target/hexagon) Fix shift amount check in
 fASHIFTL/fLSHIFTR
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1614879425-9259-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d48eed46-8220-56b5-8a2f-e4f57bcd7436@linaro.org>
Date: Fri, 5 Mar 2021 11:01:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614879425-9259-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: ale@rev.ng, peter.maydell@linaro.org, philmd@redhat.com, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 9:37 AM, Taylor Simpson wrote:
> Fixes: a646e99cb90 ("Hexagon (target/hexagon) macros")
> Eliminate the following Coverity CIDs (Bad bit shift operation)
>      325227
>      325292
>      325425
>      325526
>      325561
>      325564
>      325578
>      325637
>      325736
>      325748
>      325786
>      325815
>      325837
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Queued to hexagon-next.

r~

