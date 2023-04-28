Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B386F248C
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:16:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjU1-0002vb-Ic; Sat, 29 Apr 2023 08:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTz-0002vJ-Ih
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:15:19 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psjTl-0004P4-53
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:15:19 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so6666615e9.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682770503; x=1685362503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VO1BNbGTkEMTdoVzghKhSmB8ZcUGBxRmRckP4ykUKLM=;
 b=dtubBjlEALm2bN47K1q6xKpAcpFdeMCqy9GMSSLG2vHV5S1rpo03dckgoJODveJnl4
 fn1cyLpI0OkN7HMDtoScspAQJfaijvIQsutdRMCCScsBwRkOGPm7AxqPnftN8DXdtmdh
 K6bkWmzg3sRyMS+g9EJcN6OrCwQ+z/rgXriykey48WGQ7lYpcYicezW2wVt9+8ZYxcA9
 b/gzJZD6V/gSLckolsuVtodBdJ4189NXPNx8dSl+EeZhunzhs5K1O+LY6Q25v65Tk+Wi
 KHS+A5LF+LVnDyi1ilX6qZkQkXjEdRWguDQOvlZOuTIYsLpOS8TbLtOnCdSkTnSsTsRG
 lOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770503; x=1685362503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VO1BNbGTkEMTdoVzghKhSmB8ZcUGBxRmRckP4ykUKLM=;
 b=TpLYkmAZuJHgGEtrQnMkpD2zN1b0Vcknaw4KOBo9s1CE9Y7rqULyHWJzmuDrS33iuh
 uK5x/ZA/JAEZkRG/JS2TiXKmeeZZXStOAHgerpW2mGE130llgXxWwcBP+N3bCniyvklT
 4NsLAtZ8RrB5eWeFlLGvKr4z7zzleU3MX6h9ofMxRKHt5SgAjE5945/PS9EvL+BBTuYK
 Rw0SqByMxOatB3KuabGPO/2OclKwlP26ZObvDYliVUOGdI6ns9gWKVsHPfj9HGWzpeEh
 nsoZqmrg2LyNoNJdl6Tt2H1fjM1qB5YSD0N8pvNpeKodO07/BxtXEEDxiBQok/0F3uMM
 CPCQ==
X-Gm-Message-State: AC+VfDwqfpigdKsykLWlWbHQOuOShJtwhxowm+zEsOuIarX6wZWsu9FA
 SXqw8UttRjnBP7x2dNhEduCTUw==
X-Google-Smtp-Source: ACHHUZ7lArOTaUkITxAKW8OJ58vv7YPXXgIiDrklhSZXhonFYj0XaYnV/OOoUf+VM93m3BLXNPHxIQ==
X-Received: by 2002:a05:600c:2155:b0:3f1:733b:8aba with SMTP id
 v21-20020a05600c215500b003f1733b8abamr6085246wml.35.1682770503744; 
 Sat, 29 Apr 2023 05:15:03 -0700 (PDT)
Received: from [192.168.212.175] (7.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.7]) by smtp.gmail.com with ESMTPSA id
 d2-20020adffbc2000000b003060c7b5ed6sm1039609wrs.26.2023.04.29.05.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:15:03 -0700 (PDT)
Message-ID: <936d403f-1ebd-7239-609f-77ba22647d8b@linaro.org>
Date: Sat, 29 Apr 2023 00:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 06/21] Hexagon (target/hexagon) Remove log_reg_write from
 op_helper.[ch]
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, 
 quic_mathbern@quicinc.com
References: <20230426004145.1319112-1-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426004145.1319112-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/4/23 02:41, Taylor Simpson wrote:
> With the overrides added in prior commits, this function is not used
> Remove references in macros.h
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h    | 14 --------------
>   target/hexagon/op_helper.h |  4 ----
>   target/hexagon/op_helper.c | 17 -----------------
>   3 files changed, 35 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


