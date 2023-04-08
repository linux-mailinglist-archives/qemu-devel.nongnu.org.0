Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147FF6DBBBF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 17:12:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plAD7-0003Mi-Hc; Sat, 08 Apr 2023 11:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plAD5-0003MM-Tk
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 11:10:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plAD4-000563-CX
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 11:10:35 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 60-20020a17090a09c200b0023fcc8ce113so3551102pjo.4
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680966632;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/i5tVwta6k/eKukialX3f/m2MgHvEMBlUMZ17oSWClU=;
 b=dDynZon4vcVnPrXTw+7EGmdF1hvQP+E5TOcBZQs7SVMOoG3BNUJm4z7Ejjbhsq2r1O
 raThZpqp1TvKc8NOHhbL69DGQj8eEX1ygKHMsgD18iJdqQHW9tyJRtEet6XKyRMPedYE
 BJ+uFn7aoha8pb+b3HXnMqdeOJ4GED12l6qSMWw5S1wxtNmE2e5QEL+L24i27Z21ESh+
 VPFswuvCzFvFxtQa6MkxGhGSJaIcwNi9KiE0xRIZwBi8XpUvfNU+on3IWWZfDyJ0BqrS
 ct2GyeJkpM7xjxa1oyIU8b9T/A/k1T72hVh7TkV4Yy0I/0wT9IufGn3LY4SKFX84yZjr
 uvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680966632;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/i5tVwta6k/eKukialX3f/m2MgHvEMBlUMZ17oSWClU=;
 b=J0DdNLzI8a7Cpklw6OOrE7dhBt6BQuphkQ4cZTSJd8nUobMHaHBfiojIU+x4IyrFub
 T8JDWuz8Apr1B7On2VGRrVSfA8oBXyeNuXqJw4a2Hb6JcJQI3ChaOPuBlW5A2mqus2+q
 6osoQpXxzUYKrh93Isk7cy+92hmVgDea6Qi/L3oeJVERsO3cqu1GxarcCUzP6giqpkef
 /+vuwcieOblPkPewarqAqosYHufLSbiqH1vm52o7V3f8UL6l50AIh6TJa7VrKpq4lRDn
 HDujrvUwI51WJBFnzqPYmHuYhQAElmKmokTr0N1ooVJ7SbwX7iLCCFYSdojWViD1IBbC
 ShnQ==
X-Gm-Message-State: AAQBX9cU+lfjaQWH5twEz4rU3N7Ym5pA7OPr1IhnHwBHfqUyameUGjIh
 PX/2de1DvEAFp1cGR8QSSq+xNQ==
X-Google-Smtp-Source: AKy350YjeiUl+DWqyhaKAX1z50gKGyc5C22gwA2wE9nQCBsHhIxeNu63KpR+Aql6I90zw2L7qQza7g==
X-Received: by 2002:a17:903:2291:b0:1a2:1042:cadc with SMTP id
 b17-20020a170903229100b001a21042cadcmr2622045plh.18.1680966632340; 
 Sat, 08 Apr 2023 08:10:32 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a170902b58a00b0019edc1b9eb2sm4656208pls.238.2023.04.08.08.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 08:10:31 -0700 (PDT)
Message-ID: <f5c7761b-2398-92fd-0ce7-d03b3315ce45@linaro.org>
Date: Sat, 8 Apr 2023 08:10:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] Hexagon (target/hexagon) Remove unused slot variable in
 helpers
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230407204521.357244-1-tsimpson@quicinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230407204521.357244-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
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

On 4/7/23 13:45, Taylor Simpson wrote:
> The slot variable in helpers was only passed to log_reg_write function
> where the argument is unused.
> - Remove declaration from generated helper functions
> - Remove slot argument from log_reg_write
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h            | 2 +-
>   target/hexagon/op_helper.h         | 2 +-
>   target/hexagon/op_helper.c         | 2 +-
>   target/hexagon/gen_helper_funcs.py | 2 --
>   4 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

