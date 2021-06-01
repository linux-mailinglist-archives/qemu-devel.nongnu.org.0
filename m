Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA2C397D24
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:45:38 +0200 (CEST)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loE4n-0008LO-OV
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loE2T-0006xr-9p
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:43:13 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loE2R-0004j0-Mq
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:43:13 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m8-20020a17090a4148b029015fc5d36343so652759pjg.1
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 16:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rfHoa1s8Iak0y6a0bufJ2DtdJdzQPkp1GUvM5SZtUiU=;
 b=rxAerTm6ILy/D5Qgmj1RbHS7rroakDTAG+r3RBlZ/WS53eFBEvxrRsH/LW4ua+bGwb
 durOanfRezo5mpNIyylZXUl/IztCYUPmjzd78102TGkf5XZMD3+YOOCRnpeIvz6cRPEO
 QZP2ofUj4wq/MeB+yojKKHYDLrnVJ8oayDbtdZyByIEUAeCFBsssl16WpyMVO77ha1ZF
 MAW6EZmw3gBje+GlzPrQp0n4shZb3jYXPepCVaKBLHJDPAVH6CJxkFPOaG4YjRcM4aK2
 9g1sKDf3U+BK0Edm81XOS5cvHgbifkccC4Pnh4Tf+giNfd4RhTqL0IvwmUmPvRSVl9el
 Rotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rfHoa1s8Iak0y6a0bufJ2DtdJdzQPkp1GUvM5SZtUiU=;
 b=Hcm4RrJufw1xJGAag+pRNOBAvg9uV6l24fx6D3/mu7bQsyDQRpHrxnfTU82IgnEsrx
 0z2GQdSfQjGrCG635AdzLLEKsAtwTGbtd/VbIUJ6f2YEZhLb7juxzQxh0Y5WFDEoRw5R
 nv+M4krU2sl+i9S/FvoQR+zFUP9lBdNTjI9rLnYSlwido3aLUOBHDbWibBnFl4MW9iQ6
 3PAlCO/d7JWVdlv8X3Ry60R2lGVGGky8Wdb16mQHoe/hpQkvsuRl/0zf4SnQyovcF5sy
 5bhi/vqgVJH9pyZFnfPyDCqU9YfF0j/wRIgbfhRNtLAWrd+AiNNXGTQjgwIwPPcKoprP
 kaXQ==
X-Gm-Message-State: AOAM5319hoflWlLDtkAUAL+d+RW93fA4lhTYU8SqDbykFaDbiDx02lSL
 JdYmQ4BdlarC2PgCS398rRIdPg==
X-Google-Smtp-Source: ABdhPJzDgvQ3O1IcRjO7YFSyALbGC71xIfmU2yPiUKoZl3Q6sfsAofH4yj8GxY3p98bXl9OkXEvvtQ==
X-Received: by 2002:a17:90b:14cc:: with SMTP id
 jz12mr27867132pjb.210.1622590989988; 
 Tue, 01 Jun 2021 16:43:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j17sm14081601pff.77.2021.06.01.16.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 16:43:09 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] Hexagon (target/hexagon) fix l2fetch instructions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1622589584-22571-1-git-send-email-tsimpson@quicinc.com>
 <1622589584-22571-3-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d49d46a-f830-1eb2-8248-e9ccfc0f1856@linaro.org>
Date: Tue, 1 Jun 2021 16:43:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622589584-22571-3-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 4:19 PM, Taylor Simpson wrote:
> Y4_l2fetch == l2fetch(Rs32, Rt32)
> Y5_l2fetch == l2fetch(Rs32, Rtt32)
> 
> The semantics for these instructions are present, but the encodings
> are missing.
> 
> Note that these are treated as nops in qemu, so we add overrides.
> 
> Test case added to tests/tcg/hexagon/misc.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h              | 11 +++++++++++
>   tests/tcg/hexagon/misc.c              |  9 +++++++++
>   target/hexagon/imported/encode_pp.def |  3 +++
>   3 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

