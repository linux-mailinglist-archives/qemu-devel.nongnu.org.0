Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26CE435888
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 04:11:53 +0200 (CEST)
Received: from localhost ([::1]:33984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdNYe-000632-2e
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 22:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdNWr-0005NJ-3k
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:10:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdNWo-0004mC-6R
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:10:00 -0400
Received: by mail-pf1-x433.google.com with SMTP id d5so4563115pfu.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 19:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lD7KPZTtmkM9kiCd0wjBuFwyQVbTZYeU68o6W+qhgQo=;
 b=E2sBhOSussYZ/PdkyQqZfJjeELmhhK30RyK2iXYy7g1rhxZwoicDSfBFprxtVSEL2P
 m2imumt5mB3f+XvteEQhCVIUE4JdqdQ10CVpz0R+WIyujc7D02f32GQRuhfUngXggTnX
 ym4w3nrBSLljePjlPsQbmIvS4egpgnKMqLLnhe9VANOAKm4yYxxMOc7PiaoDaFf/Z226
 g4UDc7/Et2Do8Kq4ZaEx0WmrZSjym/tkezRKJ519FJD1X3e6xu7vjY/XdyHPDn1kEIa+
 t7pOp58ddwfhJMNOL43oHqlnG8Z0QCrIT3oxpfFvDVM04wFXl0MPfhCxKI6jGfUKP3Na
 QPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lD7KPZTtmkM9kiCd0wjBuFwyQVbTZYeU68o6W+qhgQo=;
 b=75w41h88t3dTvKktDXRI+kDz8nTUkACy2IFX6Nb7+yiKNKttGXRDKvIgU7BKkcAg/i
 IbDoU1oeZZ9S0Lcj6NwgGGM3yW2dtqWon82gEnctO+J1XdinWHfkFWSiNG8u17lvJJxz
 WWWKwpIBODoBa/CJ2vYhpxgB0C6ZQ1fJHqJ51nWqg3U2ylTTJb5P575eagisV4sik/5r
 2ncKFJhDr3tP3qgXGdYq0hvX6PgyOlKqOcMHLtqzSXGdpxTsN3JXnesGxHiNAhp/4sN8
 u/RoHhHABk21Nfb53F/oB/B1GaXZcsCIpCEfPCzSAiJLbJTrDv+jO5bHDmpWTRWFrXtd
 2mHw==
X-Gm-Message-State: AOAM531TdjpHoJBu03lDfzd0jBZQuCR2PgCJ4tYveff621mZAnVz+PJt
 49DRNinTzAlL5um+kp8jJvZWi0vd8/zJIg==
X-Google-Smtp-Source: ABdhPJwdRLOq83Hv3o5yqKydsHssYOeeJWNnFaKtxUeRGRg0GiXvaOuQ7pmkCh8iIeXCsptLg4BHjw==
X-Received: by 2002:a63:cc08:: with SMTP id x8mr2267996pgf.166.1634782196552; 
 Wed, 20 Oct 2021 19:09:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ls7sm3823878pjb.16.2021.10.20.19.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 19:09:56 -0700 (PDT)
Subject: Re: [PATCH v2 09/48] tcg/optimize: Drop nb_oargs, nb_iargs locals
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-10-richard.henderson@linaro.org>
 <87h7dbvfc6.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2a84117-d499-57ae-d5d5-8884f71aa392@linaro.org>
Date: Wed, 20 Oct 2021 19:09:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87h7dbvfc6.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 9:17 AM, Alex Bennée wrote:
>> +            int nb_oargs = def->nb_oargs;
>>               for (i = 0; i < nb_oargs; i++) {
> 
> nit: couldn't you just do for (i = 0; i < deb->nb_oargs; i++) or is that
> too much for the compiler to wrap it's head around?'

That leaves the compiler with non-invariant loop bounds, because memory clobbering inside 
the loop.


r~

