Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFB26D8A42
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 00:07:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkBGy-0002nx-9H; Wed, 05 Apr 2023 18:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkBGw-0002ni-TM
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:06:30 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkBGv-0002cQ-99
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:06:30 -0400
Received: by mail-pl1-x631.google.com with SMTP id kq3so35708807plb.13
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 15:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680732387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7JvVUj41FM9yqQNBhoUa/XewsevSyL6fsaIuCj+Vv38=;
 b=QMiD/dw6gORZddwX7mCho4LNkB2EQqjDXAzTeHXXGvY2zCMdI6F2myR6ct8FCxVedw
 ypQLeDfH1JAtFkXx974GnVTdxSGCfUbQxd6kxPT7aX2mA1l4gOvfIKI+j8+xp/j4FdT1
 P49R5LTLFUdWmDTbryt4L4cWhZ3ZXh2umyyL/9b8KJieU+gfV+o4mUJTAMgRo7NUr1HP
 wEiXrTnsGPdW2e7laKYywEu3jJ/2q+ISQgVZon72N7Hc/VrNOhvdvyDu9H8AgllDqUXY
 QUSt6b6+vwGiEBbqwiT7gyav/81J4+lejn27QcU/fe35VRTwh2IitB1KtZsjDUZJwcq1
 Oq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680732387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7JvVUj41FM9yqQNBhoUa/XewsevSyL6fsaIuCj+Vv38=;
 b=exDA5+VazXAcsHdeCee1p0pAW9yiBJwkq3NCa8U0V3B6Va4XpnvbdIPWA8pzDE1mHg
 hJpjfGCA3Y4N5eKzC30gcd451qAsKQZKrrwaed6tOWnniAfWaaWMDCy24wYedZI1/uls
 rF562olQl3Y2c4fNlyHSLjM5cRoINd3fXlo6lu+BahVlEW5iBKef6IvglhFWuu544URs
 FXpsO/+xeAhOYik+XTHAB3aiQmE4pgWLh0lMtFN2iJwFvyRrkmjMqtYC/ohztma9D1aE
 m5zgrPjoig1lh4akaIR8RSex5Uj8vTsAlgukeIVrq710ZqP8fY9ZQs1P6nVNWqx8Q8HH
 XjOQ==
X-Gm-Message-State: AAQBX9dRMOPDD/B09i/DVKMHP/Foa+aBjBBpFMlbZ51qJWRQHt0DAbYp
 t3B4PqsJ+JppHxGbjlGlzFE9YQ==
X-Google-Smtp-Source: AKy350a3jd+YtqUTGBuWzAD/I/YLuZIljN8RlTAttaNyXiBSYHEmXJKNFi8w6Ykq9JQV121yyUxZwg==
X-Received: by 2002:a17:902:e843:b0:1a1:8860:70e5 with SMTP id
 t3-20020a170902e84300b001a1886070e5mr9754214plg.57.1680732387278; 
 Wed, 05 Apr 2023 15:06:27 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:ce11:4532:7f18:7c59?
 ([2602:ae:1541:f901:ce11:4532:7f18:7c59])
 by smtp.gmail.com with ESMTPSA id
 jb22-20020a170903259600b001a190baea88sm14891plb.97.2023.04.05.15.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 15:06:26 -0700 (PDT)
Message-ID: <42d004e7-efa8-cd94-950b-525eac0d7ee1@linaro.org>
Date: Wed, 5 Apr 2023 15:06:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] target/arm: KVM Aarch32 spring cleaning
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230405100848.76145-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405100848.76145-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
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

On 4/5/23 03:08, Philippe Mathieu-Daudé wrote:
> Remove unused KVM/Aarch32 definitions.
> 
> Philippe Mathieu-Daudé (2):
>    target/arm: Remove KVM AArch32 CPU definitions
>    hw/arm/virt: Restrict Cortex-A7 check to TCG
> 
>   target/arm/kvm-consts.h | 9 +++------
>   hw/arm/virt.c           | 2 ++
>   target/arm/cpu_tcg.c    | 2 --
>   3 files changed, 5 insertions(+), 8 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

