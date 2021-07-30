Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16BA3DBE95
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:58:45 +0200 (CEST)
Received: from localhost ([::1]:39204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XiW-0002OZ-7e
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xg2-00081E-7R
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:56:10 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xg0-0003rK-E2
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:56:09 -0400
Received: by mail-pj1-x102a.google.com with SMTP id mt6so16612881pjb.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wP8ylPIdv1FXFjp9eV4DWObaQYgABZJK9kyrEMZ5g24=;
 b=VSXtMYgymMNWXFlaFQ/2DmqKvD/HOuI2kBHNFLQX5qlxOvgk/9q/i+MOeo7bVW748G
 Ft+h6/9pSFVM7YsFV8GFiqdkJZRBPmMFKOq0guk68ZxC8iIrImA49m2i/Nrq9QphA8qW
 cSi01pnkoiie3pBT5tXRoVylDlELuXWkuC9YJAj6fDmzxWwrpB6ICU6JdX+mlfIBLWBz
 SC5ITXNyCDNM2zoeeuVEZUaPQqttRz1rM/CC+Gc+/ZhWT9I56laQbuTmiLs7T9VyamRI
 BC01bYfT6+MlGDywXsfaEeM6apPcWNgsPUdeOunTxqnRWfbLWA/092Zov+PeTp1GpcyM
 mS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wP8ylPIdv1FXFjp9eV4DWObaQYgABZJK9kyrEMZ5g24=;
 b=jYNjJs8DSToMwAXtpc25hb7+3vTOk3ON+iii78DTm7wnVsT2nq6fSvri6gxJzSfngq
 Tk6MR+ym+M7L/nltbF/M6vCBFfRfSRhq5zlNYegFTc6Lq04D71jE4V+T/kuhwX2H2fAP
 CQqquNhNID1bMN/isGDHsOERCok1pm+s2OJdlkMFr5R3B/QiYuEkUPwlt4nPl0sthr50
 7tBbDCH/4df2+LUsA9kNa8Rtn9SH+GDhLMKFP0ftCjzgXZk+UJaEvm+ROZ1Hw6wiWMLG
 jEVNDcj4iTPmn1zDSQE8Q2VYnQfeZO/glTZTRbBGEtdIA35GKRX7p6RtSP5qj/8e+eU/
 qAsA==
X-Gm-Message-State: AOAM530qWEhIqNBGzcvr647Poa+xRQ/AIp1b6VfP0dRzs07I+BTawsyE
 PM/fTL5nNC0r1T8Z083D51URvkDhYyvffQ==
X-Google-Smtp-Source: ABdhPJx01pqrE+n+K5C4vtmBn1sAcQdhUiR+VriHvF2pLG7kQ79b3NJTTWtqcGeMnT7D1V8PrGg4Dw==
X-Received: by 2002:a17:90a:6a47:: with SMTP id
 d7mr4633253pjm.176.1627671366836; 
 Fri, 30 Jul 2021 11:56:06 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id f7sm3030681pfc.111.2021.07.30.11.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:56:06 -0700 (PDT)
Subject: Re: [PATCH for-6.2 03/53] target/arm: Fix MVE VSLI by 0 and VSRI by
 <dt>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40a2512c-5a65-a50f-fd59-881b4110430d@linaro.org>
Date: Fri, 30 Jul 2021 08:56:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:14 AM, Peter Maydell wrote:
> In the MVE shift-and-insert insns, we special case VSLI by 0
> and VSRI by <dt>. VSRI by <dt> means "don't update the destination",
> which is what we've implemented. However VSLI by 0 is "set
> destination to the input", so we don't want to use the same
> special-casing that we do for VSRI by <dt>.
> 
> Since the generic logic gives the right answer for a shift
> by 0, just use that.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

