Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF675905EA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:35:46 +0200 (CEST)
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMC5x-00070K-UG
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBoV-0001Sl-8K
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:17:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBoT-00017l-Dr
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:17:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id pm17so18256556pjb.3
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Z19BcLcolNTRDZBvQTSx41uMxInp89c1VRu20T56pEA=;
 b=WgOkae1Hu3/UrPDRTTXLKkl//BbdF7xTAHTPaUb8RJT1JUFZG51VOHaVXn5WVToRM3
 kC4sqv88X5vXeJ2R4MqR5T8RjEV4ty/h3Ajc1vV8HPEjNPJTPcMdo5A9ivnO5TJ3MagJ
 UGlLzJ+9zajolQHRqhBRFn0Y9VtnOCFKZxSxguLDNQr9lmtsi68BRRhQtXozxnMcg4kS
 /ULgVaUL1eqUeoq1koGI1mAo70g8NN62E+Pl45VCf+Nq9ZFWYe6TQm9xciY3F9rkkTgV
 UCPo46gsryHGcjqmb8Nbo5306NYZM762yr2WulWdV3mYqhvtQ5k8LbqQA0pZKkLPtbTQ
 7o4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Z19BcLcolNTRDZBvQTSx41uMxInp89c1VRu20T56pEA=;
 b=5IH4IbDKaw2A5B2t7sEhyL9SeJ8cy3UW9gCt5C9JTAxTseLz67/82zpPA8w6NOwnX+
 T0oi/LOCBEkgsfWTutjtD5uxtmqAlAGgYb/2SmXyZwdXIayEm0tpoKQhAC0g4Itq+DA6
 ucP+lM9e2bZ0YNJ+GrB0v3I++eMZKtZyZ8iqdkrZoNPF9DRPTOyZ+rnVcTvukbAkFaTb
 VuPoZqRvXQDwqh/T8ZZcwIsgyxcofrO7Se5Sj3lbT/R/qLRHlHCowqmFKnJlGsoJ2puH
 kOGnQPjrtGIf7Aj4N/7EeRRKcpdxDFc/0kDlHIumoz3bWtmjvdcM6Nrl3YqzpXpmP0yz
 XFig==
X-Gm-Message-State: ACgBeo2RFIiuaZPo5hsXWEdNyPYs/euJcwtX10m5u3SevO9N5zHjiMNi
 zAtUVcyKyX9OuqOQXM5sBmvypA==
X-Google-Smtp-Source: AA6agR5u6vec4wYspN12vhJl7+HoKjXApoBZZR0DvOA3Vjwyfg5cj1WKJeQPCMDyPR6rv0bV8E2Cpw==
X-Received: by 2002:a17:90b:354c:b0:1f7:aea5:a915 with SMTP id
 lt12-20020a17090b354c00b001f7aea5a915mr9878404pjb.159.1660238259340; 
 Thu, 11 Aug 2022 10:17:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a170902f54e00b0016db441edd7sm15375287plf.40.2022.08.11.10.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:17:38 -0700 (PDT)
Message-ID: <258ec37a-98d0-8051-3117-031b9257f771@linaro.org>
Date: Thu, 11 Aug 2022 10:17:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/8] cpu: cache CPUClass in CPUState for hot code paths
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811151413.3350684-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/22 08:14, Alex Bennée wrote:
> The class cast checkers are quite expensive and always on (unlike the
> dynamic case who's checks are gated by CONFIG_QOM_CAST_DEBUG). To
> avoid the overhead of repeatedly checking something which should never
> change we cache the CPUClass reference for use in the hot code paths.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/hw/core/cpu.h | 9 +++++++++
>   cpu.c                 | 9 ++++-----
>   2 files changed, 13 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

