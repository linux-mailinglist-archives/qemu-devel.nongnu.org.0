Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330312CA5E4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:43:31 +0100 (CET)
Received: from localhost ([::1]:33056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6sM-0007Ej-0F
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6r2-0006Z0-Rk
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:42:09 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6qt-0007A5-Hv
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:42:07 -0500
Received: by mail-ot1-x344.google.com with SMTP id 11so1818020oty.9
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MZHaH5p6WjfbOiTGVytpyzPSawrwNzKmISo0qV1o6tc=;
 b=odsiFXpRYLiM5tf89HKvKd61QzDjU/XAjnBK5fRf+PDrE26u5qDpVlJtarI2fTJKNc
 f++XxhbjzTV2UhfSz23Qynoit/boSTgw/857edLcdzP8U1mNV/UncYwWfGXxRCLQc/E1
 fp5wD18O7Deimn4kswF1Wk0pQp4G0hzrpmOOyLJIaxeSAOaO6OiQECL7E4zkKe+9X+5d
 o/wzffC5pOF4QkX3yAgI91ibeVOYiOnjk5Zw2bQY1+QncWoLEPlCZvxGOstjs9tQxKLR
 JnGjX21M1W+DL6LNVV1DnFkH1Ud96cE1gN50VQBkggcIAstpxDnvwnP6bzKMGdN4mMS2
 c+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MZHaH5p6WjfbOiTGVytpyzPSawrwNzKmISo0qV1o6tc=;
 b=EIW0pNTwNV67xkAsYQ+sH8RedRJgb+oxhy8/3drbyyMUWyJLe5igePMkXaIvH1a0S8
 sA+li1GjTb8sFWk576MpS67PPEint83TdjlsH51fgDGv8R/a5OWDlcwOvnChADscM2rp
 f9SgScFeInMGSNC4mVZEvxLgwXwXScp3mXm1/8E+srLq0jYH4Kk/2O21JHEbEfqFxQ5r
 IPHF4YMKUWPnfdwxtR5YTvMMUDYC+pGWr7AGbLMlDNhCUazwC2g++1sr3QFIlI5icdmy
 pHIGbLY6Z2Dwh6vYp5q2d7XxHdCIGA1jDOlQMJt2Q0VcIgTBkeLQo8fV88LN+ufyxzda
 Nh0A==
X-Gm-Message-State: AOAM533QtN+4Tk4beenfFPYbei7jArSd9crB1dY9TfDjqU8daRaAeWTH
 NTUS6Fj0PMcErm5LhcyzuY+BcZEyMaahY76e
X-Google-Smtp-Source: ABdhPJzOA1tHUrMKn4Tcj0YeQ45GSdTWcqWgeFMTGNGEjmj78SFlmVrBMqcv1q26wHasoHhqU6QIOw==
X-Received: by 2002:a9d:d4a:: with SMTP id 68mr2027634oti.101.1606833715786;
 Tue, 01 Dec 2020 06:41:55 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id v12sm407841ooi.46.2020.12.01.06.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:41:55 -0800 (PST)
Subject: Re: [PATCH v2 17/28] target/arm: In v8.1M, don't set HFSR.FORCED on
 vector table fetch failures
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12c36021-d874-aff1-4e31-bc6c565ae4a1@linaro.org>
Date: Tue, 1 Dec 2020 08:41:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/19/20 3:56 PM, Peter Maydell wrote:
> In v8.1M, vector table fetch failures don't set HFSR.FORCED (see rule
> R_LLRP).  (In previous versions of the architecture this was either
> required or IMPDEF.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


