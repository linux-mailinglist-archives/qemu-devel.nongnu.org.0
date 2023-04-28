Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344086F248A
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:16:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjTj-0002rK-V1; Sat, 29 Apr 2023 08:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTg-0002qO-Vv
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:15:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTf-0004Dy-FG
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:15:00 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f196e8e2c6so6862145e9.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682770498; x=1685362498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u9ZwrAq2Hf+I60n6WR3DEY2/D6+veeHyR3VSd/yrkXM=;
 b=caJaLGU+kosA/mcsqeshHAEXP2hxM58QHunt7mUoP1JXkXImdwSQYFrImGPUWAI0KV
 uyuEmBpe36iEG26piag0Jm+8+CVv1TZaEwN3teikPB3dVo1aWhvPsHyYxBHytr8H+twW
 /H11KHM/WQNRE9F0ZviK8g+H5brut2s0D1IEfavfYXVxMRClvteIevzuf0LhKkfCbzNw
 jS7cGA2Qpvmk3BUadS4HweB7/bbuGiZRafGSj6RnZ4lNrtfHslZ1UKmBmHaqICVgliiF
 R8tLbQaMDvVZpSlXosI7ndJSS0lVpdTPstQj2W7MGqNdZBWonDlJFuZGB7OAubZSCP+V
 OmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770498; x=1685362498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9ZwrAq2Hf+I60n6WR3DEY2/D6+veeHyR3VSd/yrkXM=;
 b=AIg5rLQV/0YKj1h7T3YI7dBW3VIJ4Q+8UZ/259ZkOdzQ6LrBq5tnhyizmGnndTA+YM
 +jUBhSul8xEeggEo2vvSOZBjer5bhpSuZ1qKJrXAOHfAncnbX00LBErj31iZ/9gjEAG8
 w9IY912O6YFVOksRRGlQHHqx9fDTioT+7gjTzWGLxA2agUxCdLqwdzSdu3cxh/BfpBF9
 CKdfJYVQ3GjedGbA1O8Pz5okxx0i7mWbGO+st1ZL+nZJpBwkfI3v0V809ygqRnZewlpf
 cN088+DQK6LQoax3mGi4V9TE4Uy5jGwJ5i55N20lYMXlqDbqKi76OvqVTQsfC2AJqIH5
 bz4w==
X-Gm-Message-State: AC+VfDyk82Bz07g+82IeWIjYQLPoK/A27j7ZCKwEGW3Q4RQ2P7jQ/gmg
 97XqlSqxm3A9s3swbrSpH0+NAg==
X-Google-Smtp-Source: ACHHUZ7pesskic61rgwyYO4ojZDnY+RGDH/JaNU2X4DLWASCkmxAajsZCNWmD3MhblaxNdSxmjPacg==
X-Received: by 2002:a05:600c:2212:b0:3f1:73c1:d1ad with SMTP id
 z18-20020a05600c221200b003f173c1d1admr6086807wml.35.1682770498091; 
 Sat, 29 Apr 2023 05:14:58 -0700 (PDT)
Received: from [192.168.212.175] (7.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.7]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c22c300b003f31d44f0cbsm6228773wmg.29.2023.04.29.05.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:14:57 -0700 (PDT)
Message-ID: <67418868-d8d7-7aee-3065-08b6f6691850@linaro.org>
Date: Sat, 29 Apr 2023 00:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/nvram: Avoid unnecessary Xilinx eFuse backstore write
Content-Language: en-US
To: Tong Ho <tong.ho@amd.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, edgar.iglesias@gmail.comi, 
 frasse.iglesias@gmail.com, peter.maydell@linaro.org
References: <20230426211607.2054776-1-tong.ho@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426211607.2054776-1-tong.ho@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/4/23 23:16, Tong Ho wrote:
> Add a check in the bit-set operation to write the backstore
> only if the affected bit is 0 before.
> 
> With this in place, there will be no need for callers to
> do the checking in order to avoid unnecessary writes.
> 
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---
>   hw/nvram/xlnx-efuse.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


