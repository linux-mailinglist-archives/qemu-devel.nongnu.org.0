Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E65A2B21
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:27:09 +0200 (CEST)
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbEi-00072z-MU
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRb2t-0001BL-Io
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:14:58 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRb2q-0005ai-EI
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:14:54 -0400
Received: by mail-pl1-x633.google.com with SMTP id x23so1823309pll.7
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 08:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=6OfCA9yZds63ILEn8mhFkSPZRCHhCVe12Nb/1A7klCQ=;
 b=Su2jHHaQrdLTR1YUYH/a8usWymLFArDFgcfNAH3L8m6UKq+tCUDF0VjrizVk3mR1z9
 VFITRKu1ds+TA/9p2s2NN9FlfX1d0WHqSiV5KJrVEat78Jybqdo6LPOhKG+dzTL1D8An
 +AAtb2ldSwHq7bv5tBvtYC8/0jiORBm1e0296FyqfkmbkqN50ENUBKRy1L6li0zdp3ok
 7YN7ck/cs4nNQjKRrwljc2Xh1x+jO5pmbWFZDbiKRLp/LURVtimgxMKIIeldB2bf1MnZ
 WSSLrUIpucZLzowD9LOMI215mb8vs5UeC7rZOuYjOoI386eviFjxVJhf/+QxvSZ/PNz7
 0O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6OfCA9yZds63ILEn8mhFkSPZRCHhCVe12Nb/1A7klCQ=;
 b=m5Uj+5e1vYCT97QyO56+HSnn2ooPAe6CU5yN5xZagcIJ9iEsrIZqj8j8OV+GtpYQQ0
 Kb7tF236wgRofBOCJ5Ff7lyu+YDEZWum0+egJl+MKJH+mJrW/la0BbSjH3/ct5WellZJ
 qzlivs9xq1IyAoDa20YqAYVPPZxM0e2gsQtr2fxhLpVKQO5U5QYOiezqtLmUtWL+5zpi
 WxpM/c+2AP8I2kg3pn1irpJM8EmSsHffpCBTW5nKqc9Uo2Ij/A/n/ljitEDjHdBQzzpt
 q6BeEhGQdrNA50jEASLMehP01/6T1m0UkpoxoMyJBPAZQZ361MOZPvpNp4eC3EMJArHr
 PeSA==
X-Gm-Message-State: ACgBeo0VAkXDazTtS436D1fLcirYW8wmwhppz6b0bf1qiHD/A77ODHNS
 lmPNOLZJOkb/+P2uD7HVNxK9x1FeY47W4g==
X-Google-Smtp-Source: AA6agR6+coeTu8Hp7NR9RLRkY/mvnkoQ3flwkNNj0rvwmTse976ZO4Ie7+QsHPK+PBwIJ8j2IKDlYw==
X-Received: by 2002:a17:90a:ee88:b0:1fa:aac3:6fb7 with SMTP id
 i8-20020a17090aee8800b001faaac36fb7mr4800345pjz.62.1661526891015; 
 Fri, 26 Aug 2022 08:14:51 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 t123-20020a625f81000000b00537ab89c66csm1895543pfb.143.2022.08.26.08.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 08:14:50 -0700 (PDT)
Message-ID: <a00df539-3392-0924-0583-495536624e9a@linaro.org>
Date: Fri, 26 Aug 2022 08:14:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/13] linux-user: Add missing signals in strace output
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <20220826141853.419564-1-deller@gmx.de>
 <20220826141853.419564-2-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826141853.419564-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 8/26/22 07:18, Helge Deller wrote:
> +    if (arg < _NSIG)
> +        signal_name = target_signal_to_host_signal_table[arg];

Oh, and _NSIG is a host thing.  Leave the array as [] and then bound the lookup with 
ARRAY_SIZE(target_signal_name).  Also, missing {}.


r~

