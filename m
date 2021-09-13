Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBF3409392
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:22:57 +0200 (CEST)
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmrJ-0007S1-03
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmBF-0006it-NA
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:39:29 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmBD-0001rX-K9
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:39:29 -0400
Received: by mail-pf1-x42e.google.com with SMTP id v123so8845697pfb.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oBGlz/XZ0g2AF1bkdUcJt8PrhgnflsQV7r4zoJ62DjU=;
 b=yh+ChAK/xrRnDjFYFlhYJYCMkWF5W+aP40hWjz4YyILltCFEa5PMeDYEAgiGF+ist6
 Hcad8QLq3iOt9/pg0hpUeH96/UUqqhIK4s1Iu2sHlNV7EMD7tc9YDM65IYltbw+/j+x1
 1R467BMwGBwRPx2zxzxR8iDCJU1GvrXjypcv3bkKmyU99Bi8gFfZCIxaikOMd8koxR25
 JPwaVRo1rLcNB4krGkZ8XsI289yheY69pTy9hmwXm1D9CNeWon4UZ6LbCXDqN5ReF+lG
 j+ghtuNSBF3W5J71MOB3naYJjcxQAy8wysKR+GZ2h4l5PynqeHCfntkk8/RqZJpoE4qD
 4X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oBGlz/XZ0g2AF1bkdUcJt8PrhgnflsQV7r4zoJ62DjU=;
 b=2tu1Otw5NFS7On65E9PikUH4qXhKIhS8Zjxv+l3Iw2JH/dBRCaNLhLduva7FfPseJp
 TTvkA+nibsFV+BnzD3/V1eFHSJ4AGYvgThsOHT4yPmNbuiu/PTJ/GAKboD5OD4CJwyT0
 roVZqF3iumO2LJDAeen9Ac6w0O2ZvEV+fIKtD1eMmlkXizl/2LxDEooh/sUCmFTyAP5L
 MmxhwlC8f8PFN+KtKVKmYConA0aTmY+1D7ZiVw9KP5Q+85mMeRVMy0D3ILyI9n87EshC
 xkcX0JFGH2K9MuFy4OwDZ3I4QAxS3i8Lmh4w/YJKH3vMkbl93oRN6TOfb69IkFtCNKQH
 wodg==
X-Gm-Message-State: AOAM531K6g9Fk87lkg+BbdR0cFUzlBItWT1W4Mrn1M/tuwDZC08alCB1
 9yB2lPxKoFzPSEssCL2tfPypyA==
X-Google-Smtp-Source: ABdhPJwyb3UzJE3H2o+5MOjuYowb5FnYpDelI1Vh3iim6/zAHLXWl/6c2whZIPh1H1ByKhWAw2P6cw==
X-Received: by 2002:a63:f513:: with SMTP id w19mr11000300pgh.231.1631540366015; 
 Mon, 13 Sep 2021 06:39:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q2sm7074502pjo.27.2021.09.13.06.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 06:39:25 -0700 (PDT)
Subject: Re: [PATCH v2 02/12] target/arm: Enforce that FPDSCR.LTPSIZE is 4 on
 inbound migration
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cec80a41-9cd5-46f2-3fe5-9d1d74d5883e@linaro.org>
Date: Mon, 13 Sep 2021 06:39:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Architecturally, for an M-profile CPU with the LOB feature the
> LTPSIZE field in FPDSCR is always constant 4.  QEMU's implementation
> enforces this everywhere, except that we don't check that it is true
> in incoming migration data.
> 
> We're going to add come in gen_update_fp_context() which relies on

"code"

> the "always 4" property.  Since this is TCG-only, we don't actually
> need to be robust to bogus incoming migration data, and the effect of
> it being wrong would be wrong code generation rather than a QEMU
> crash; but if it did ever happen somehow it would be very difficult
> to track down the cause.  Add a check so that we fail the inbound
> migration if the FPDSCR.LTPSIZE value is incorrect.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

