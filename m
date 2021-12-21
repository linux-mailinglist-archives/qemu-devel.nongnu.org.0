Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E747C849
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 21:35:18 +0100 (CET)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzlqv-0005k5-CF
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 15:35:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzlpa-0003dO-QG
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:33:54 -0500
Received: from [2607:f8b0:4864:20::436] (port=34550
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzlpZ-00035r-5s
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:33:54 -0500
Received: by mail-pf1-x436.google.com with SMTP id c2so330217pfc.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 12:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0/6piKFe7SsPUEAJm3DjL3aMoQvNjOQC/fVHc7N4I18=;
 b=YfUt/AaZIeFV/SeQmf2IgrzuP+Spzzh5QnRlIuMnQG7+7BMbAEL6yWxhUR56TN7w8c
 wq/QxydOyD60/KA7Oh77rAMKKOAbxQy8xGYBsj6jZ1yr6ARquZcFlYq/DyW1319IrzYN
 jcmFPKOc0gf2UtDTaALDs7E64vVC2paLzmdK+aRd/xPRS3nCmCD9QJApszz6D2t7T4Mg
 d/ApBYEpV4Pj4ZATr09MJZoxFovEfWwljM9UIxUlVHfgoZBEC6pYTvvtT/eSXogcGEZX
 jZM9YG6lSrKkxHrXQnLuaks/Slc+OIW0zamnhA9i1yMrKIrhrSErcFb0gfAOoIMtMAPY
 7OrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0/6piKFe7SsPUEAJm3DjL3aMoQvNjOQC/fVHc7N4I18=;
 b=bSuj6l8IxgQFTNzGxeW2nS9eKbykRUpCV2WSXC5tjG88oskojl+GrCzneByarEVQra
 e6B+YaoW7EjNng2KnXiry1BiMkTkPCvWOiANjwxILN1G5B8glY4/0idrQz5a/imICiYR
 oKT5L6VB8kW7eV8q3Qu7mt3PhWwxjAtDS11twsVAQY2h4j2bllFAqyszZZJTpKqzy1Gu
 2fIzQ/H2cEAd0tgC/5liZb8NUMhOVqSdpRbdovnC1Q1HRpz44ovApqmb1j0T/8S6rHe4
 GMoon4GSswSolQjbmzaoD+Uqfkz3IKoJrxnVpiEakmBQiE+gggI29eC41oPzWGuMy8nA
 C/JA==
X-Gm-Message-State: AOAM533HdTignN8PSO2tdUYeEvyUHDsCDWcRDkUGBjaQwbWvD9fZRoKn
 npeWo4MQWLFfeY9I2btTOh4kUw==
X-Google-Smtp-Source: ABdhPJymKAZdF8iis5V3ECqUGwqV7lVgDzKi+wWnze8hutlkx01qjIjGw3LmCMDrMSEhTqbUqvgv5A==
X-Received: by 2002:a05:6a00:1305:b0:4a2:75cd:883b with SMTP id
 j5-20020a056a00130500b004a275cd883bmr4918350pfu.44.1640118831838; 
 Tue, 21 Dec 2021 12:33:51 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id h191sm20589278pge.55.2021.12.21.12.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 12:33:51 -0800 (PST)
Subject: Re: [PATCH 1/3] meson: reuse common_user_inc when building files
 specific to user-mode emulators
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221163300.453146-1-pbonzini@redhat.com>
 <20211221163300.453146-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d1880cf-3d0f-bd8b-1e45-acf0d837ff70@linaro.org>
Date: Tue, 21 Dec 2021 12:33:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221163300.453146-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 8:32 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

