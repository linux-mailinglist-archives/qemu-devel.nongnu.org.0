Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8193A2DD4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:16:11 +0200 (CEST)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLTe-0001BS-RP
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLSC-00086b-EM
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:14:40 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLSA-0005GQ-PX
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:14:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so3821105pjz.3
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lNGtWk5iSTlEnwB7FJ7KrxxwtJSSeS2pIKYxzXJ8bc0=;
 b=MIdpE0p220gxAjjtwcJ1o05bMO8/W3tVWdbbrmor9p2iiQXG5QHKmWXwX3lIMk5X2D
 26I2VCDj39bLxC83VhpcEbSW3g+vBHEIW/f94NEFhsxunSgq4E6B6QK+JHnJECVoZAl1
 ktu6pzPwp5MSVyByIp4NX6x7CAh0F0XwzPqBtBXrQYI1ZRh81YoXm23a1/L+9muzlPy6
 mUTXiSpKQp3seUM/wRYCgd4Ehcwt8/zJemP3TwDZktsG/GdmIutbBDtLbZS1Kw7txQ8v
 jtyOzaPDyy1cOkTK/NBdVNDXJiH2f9yRKrO7y/cHsKyQHIbiqXTRgoMcSBjksc9Z3kL/
 764Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lNGtWk5iSTlEnwB7FJ7KrxxwtJSSeS2pIKYxzXJ8bc0=;
 b=LTTTLXqFT05SJjvEFcKK8p3HMW6aqJ1/FdV/1O+TGCDs2LNIJ5fOBzvVJokLjX7Boo
 76EY9Gjc/THQZgyphKLjRdp+nFl7W2iQOVjyKUXJElq5I6G+PUigoUkZoBtfwJbATAzD
 Yx60W0UDqyf4jZFefKLYew6Av097iYPO58vZ8HeSL13sl33wD+/dpbkQ7Ly8QSk3qKzH
 4d3lceaB2G7mAXtQDYZBYyANc5TF1K+2TRm/E+1lh4llXVcX3yJ5TIAVxsBhJaCAPd03
 TLbNLkv8LBt5VjU/2rqDSB8e73TTS+6Dwg3oTmV/BmrxpyDZpMIRRTW1uW8grRvFFLyI
 AX6w==
X-Gm-Message-State: AOAM5300QtKmEqbBn6PSwqKVZZWs7yaGGz950YXSwhcNLHylenAc0UwJ
 6YBDAUvdNOSAv5th70ptZBq9j0GQnF6m7w==
X-Google-Smtp-Source: ABdhPJxvKMF7RNXOBB1aWmay45ErQQzDlDy3ppmgsLA0V1GfIfAIk9+f5U3RWpzlMQ13/1Rv+8PHSw==
X-Received: by 2002:a17:902:c951:b029:106:513f:58ff with SMTP id
 i17-20020a170902c951b0290106513f58ffmr5116650pla.37.1623334477125; 
 Thu, 10 Jun 2021 07:14:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c3sm2636861pfl.42.2021.06.10.07.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:14:36 -0700 (PDT)
Subject: Re: [PATCH 55/55] target/arm: Make VMOV scalar <-> gpreg beatwise for
 MVE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-56-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12ecc670-c726-75d4-7bf3-29ea705a7626@linaro.org>
Date: Thu, 10 Jun 2021 07:14:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-56-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +    if (dc_isar_feature(aa32_mve, s)) {
> +        TCGv_i32 eci;
> +
> +        mve_update_eci(s);
> +        eci = tcg_const_i32(s->eci << 4);
> +        store_cpu_field(eci, condexec_bits);
> +    }

I think it would be handy to package this up into an mve_update_and_store_eci 
function.  There are 3 copies, including the previous in VPST.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

