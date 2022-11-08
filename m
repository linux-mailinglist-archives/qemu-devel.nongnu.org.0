Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00807620A18
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 08:22:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osIvU-0001cq-T8; Tue, 08 Nov 2022 02:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osIv3-0001b4-4F
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:21:17 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osIuy-0007iH-5m
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 02:21:12 -0500
Received: by mail-pg1-x530.google.com with SMTP id 130so279961pgc.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 23:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7yRi+MauD+f+VD8O/OiD1IkNbPosQzFVJPbFKe9EpSs=;
 b=GRUOaTf5yf0go4lT+wbxjEil2LGCaHNFL1H8GP5xvj2TY9citKsswWegcVjyVz5ti1
 tSevGQuZnOQhXq00pAy163dPk4s+bAVelov6TSZ9qWhw26bf0BxdoSvyfIIXCwYNoh0k
 vIW59cCW/ppvdE25r6d2kJE+wu+NWjnKqIlTivaUvEW77ZZJX/DhiPUyLETKd+zx/fq5
 LyxCM3itaU4KdwtLme0mlvtLMFUuknt34Kc5yE0DwjuTKlfI5p734kV1Xzgzt18icYzi
 sqKeXnZMXljNnteva4t6m2Raiwoc0seFJZuNnH4gorJTZixqbAbd7OifNMdloHwfz+1w
 DV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7yRi+MauD+f+VD8O/OiD1IkNbPosQzFVJPbFKe9EpSs=;
 b=kmanR9BKIH+yKX3fv2zHAxVS96VKyu0Sm46K+Ya0dYoQ+6Ie9xUMQRBqF5RvYaVK6t
 uHfOGoyazlQse9L8N/R8sxcCbev9GAUZPr2jtGsN4X2lONeh4Frkgj+gExPyiG79565c
 +nxAECgYMAns2Gh/dBW1s4dOEkuP9ZuYMVTydUZMen2cvrUGowlefvfISnpWI5lhgUmG
 O48DK7Yx2OU1l60kjXxO1BJAowSRJ/wrU3fFJVliBCkfnxclUclg0mUmOyQ+sF6cK3ND
 fcz09y/ZIm27xnAn/9MMvC4tyMt57oExzzSxWlzS7KfmN//l6V8OgRvevK8gdM+RbYBW
 kSQw==
X-Gm-Message-State: ACrzQf1QGwdVxLE+dOWtNTem4BfdEwl+P6jhlQ5jj2bMQI47Fra3iEzh
 KIu0mZkjDi9i5yNvpSdjzL/dg9GwK9BqsiTg
X-Google-Smtp-Source: AMsMyM6TeRouTFYxN9YZLDEfjrHI/VCKuT5c5j7BFaC7NSCZVRDKSHxWkksD5aL6jkXTFzIVbRiOqw==
X-Received: by 2002:a63:fe58:0:b0:46f:dc58:b23c with SMTP id
 x24-20020a63fe58000000b0046fdc58b23cmr34696675pgj.205.1667892066618; 
 Mon, 07 Nov 2022 23:21:06 -0800 (PST)
Received: from ?IPV6:2001:8003:d918:7a00:2588:8f43:55e5:fca3?
 ([2001:8003:d918:7a00:2588:8f43:55e5:fca3])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a635c49000000b004639c772878sm5229213pgm.48.2022.11.07.23.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 23:21:05 -0800 (PST)
Message-ID: <4c6b6207-50e2-834e-b6df-c2baf7bea687@linaro.org>
Date: Tue, 8 Nov 2022 18:20:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 07/11] Hexagon (target/hexagon) Add overrides for
 direct call instructions
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221108040552.22175-1-tsimpson@quicinc.com>
 <20221108040552.22175-8-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221108040552.22175-8-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 11/8/22 15:05, Taylor Simpson wrote:
> Add overrides for
>      J2_call
>      J2_callt
>      J2_callf
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h |  8 ++++++
>   target/hexagon/genptr.c  | 55 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 63 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

