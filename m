Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A449C251F40
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 20:48:43 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAdzu-0006Ru-OY
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 14:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdyf-0005BA-RE
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:47:25 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:33660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdye-0001b6-B8
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:47:25 -0400
Received: by mail-pj1-x1041.google.com with SMTP id q93so1229987pjq.0
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=INk7xhC48BJKm1t2gszLaggr3uZgqtzBv3PAF5ryLSw=;
 b=yWRqIaffm8A6teJBNl6bZ1/Vgj9EuzVYZsBfn9283kDr3Zc66TShfmG1gHcCVKwhs3
 vZTmx8M0oRYM37TOC3wpaNRAQuMRDZS9PTAVNll84D/OgNnoNNOdDl5zbN3WO4cXDLUu
 3SM2Vc6yxVFVPevgFLM+oL88NxSgfvXHA9/61G7SgYoRj9CL5M+K4IFTfuyGJWP8EYwx
 WsLZOdAXfkUGTrvpAHI5VuxF2RdmCv8E7RU6+/ckTSi2qlhiICEzyd8rE8zvl5L71I9e
 fCmjho/+hz19Dx+hB+HSarfS/b04dm086TddHlnzX5/UbU+D+SlSlisJLJLaaAhXKxv3
 PS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=INk7xhC48BJKm1t2gszLaggr3uZgqtzBv3PAF5ryLSw=;
 b=o9xjrb1nF+7NvOGa9AGMhxWN/cEPdf/YR01DPDBuaKnFfZousvIIMqZMwY1Wu4cDJl
 U0rD1x9ryC8wNA57yZ2Xe7F3mFdQhR1wWKEJWWIYUa1KCjDlPRw0VKBZGZBX36Wc4knA
 wJY5yNCO0e4pDf2t9g83+VLCSu59+4rQEC36EhJtq8N1Ue8MnSyWakxezt6EuVoEECzV
 buyLH4pOnWHwZCi+j4Q1cmCICo/5gPk3xy82766Bh6AMmvPkSirFYW9+9F91zw2JYHq2
 pqU5ohG9nGl0hAgaaL8xN8BsU2N6d7u0anc21APqAFfYthTMmrg7j9pOkaaiKgcgUvci
 w3gg==
X-Gm-Message-State: AOAM533Woh65JKEq0LkzKKCakxfQvWEkqeUm0Ghkf0212/CIq1Hqr/aU
 Zb3i4fmEjpOCu4775pawy65uMpAMatndFA==
X-Google-Smtp-Source: ABdhPJyhPN1l/zPwAfa3UMYd8j741EWh/d5XkrhVD1aNmdXCsflz3+HKmJ9cWEFrPjuyjO9GxWe7ag==
X-Received: by 2002:a17:90a:d3d4:: with SMTP id
 d20mr2601458pjw.111.1598381242505; 
 Tue, 25 Aug 2020 11:47:22 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id ga20sm3353561pjb.11.2020.08.25.11.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:47:21 -0700 (PDT)
Subject: Re: [PATCH 13/22] target/arm: Make VFP_CONV_FIX macros take separate
 float type and float size
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f441243-16a7-710f-6624-fb4cd2520f42@linaro.org>
Date: Tue, 25 Aug 2020 11:47:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Currently the VFP_CONV_FIX macros take a single fsz argument for the
> size of the float type, which is used both to select the name of
> the functions to call (eg float32_is_any_nan()) and also for the
> type to use for the float inputs and outputs (eg float32).
> 
> Separate these into fsz and ftype arguments, so that we can use them
> for fp16, which uses 'float16' in the function names but is still
> passing inputs and outputs in a 32-bit sized type.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp_helper.c | 46 ++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

