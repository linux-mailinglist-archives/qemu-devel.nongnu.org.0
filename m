Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAFD3494B5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:56:05 +0100 (CET)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRP2-0002jy-A4
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPRNF-0001ZP-8Q
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:54:13 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPRNC-0007m9-PF
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:54:12 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so2141800oty.12
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 07:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=es6Ie4NmPWR+dPowDco5M0xF/1M5nHp2qsrje/pCIMM=;
 b=v//5mpoEVxnmc4hAOILLbngmgxAB0uH7NFmL7iFtslgW6J6BnUnrw66epc7qxXQ7NT
 ylX53rCddOCkWGxksjLGsO1DAhoXJq16iR08pOih6TEFOf1ojQr9hk3g5+K3lc1eJBfu
 a+UhYj78muJtSpiMiwMU3Hk6PvIfsctPub8gFg4B9+tzHp3HjyhryXWgkx+3fYPWxaep
 qA5AUx+AHF4YLfnvD957Iy8sTot39SFvAqgfDrCG+pC7qUwUAjERFf2GNDrPsxdFJvgm
 GXAmdYY1YYglUR2tYuljn3G4vkZ0hHw1DizH1uriWTXWr9n6Oj3LpVe9G+cjMRDjsk8P
 ypvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=es6Ie4NmPWR+dPowDco5M0xF/1M5nHp2qsrje/pCIMM=;
 b=aHrIS2fMYOZyzGb97PWo304HKZTnPcBQe2bEOst2QcoOJi91DwY/XKGNMiwMiZCT49
 9Sie4+sGJB0UebuTq3VILu1gvHFutMf1N4Hrk9kgihPxL8Az9JN5qiJKM91neYsj+s3k
 4+esMCfRvoP2bMcbHuAA2cG1e6oMAKnDZ0Gd1miIXTpSI4x6kZwBKdN2eksvxOvCALX7
 /aBB+boitERYz5nUuiOgimZq3YfmN0WjLR8my52wFKQDAV82npOxAqJxQTSKbGjxZMub
 kNxytJ4EbapDFwvhWU2WbtfO0GXWPomZ4tD0dX+0YwrsZ9UGDj7vLO9VJbOUhTyL8she
 q7rA==
X-Gm-Message-State: AOAM530Wz3A2HAyCRuVLbQ4YdI0qbBMqhBafvUKh7pnfwRpMFsa7EVUv
 eingi0um3eJe6E7nDWoXBo9kWQ==
X-Google-Smtp-Source: ABdhPJxcvUt21HwLgx6hUu0SC9JuFx4MMMaUSedU0BM5Nn9Ljugynd4kYte4A0L75mX3BddM+sL+KQ==
X-Received: by 2002:a05:6830:1b68:: with SMTP id
 d8mr7685133ote.235.1616684049442; 
 Thu, 25 Mar 2021 07:54:09 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id a7sm1287151ooo.30.2021.03.25.07.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 07:54:09 -0700 (PDT)
Subject: Re: [PATCH 07/15] Hexagon (target/hexagon) use softfloat default NaN
 and tininess
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-8-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7371fb85-28fb-0e3e-8801-f6f529ca937d@linaro.org>
Date: Thu, 25 Mar 2021 08:54:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-8-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:50 PM, Taylor Simpson wrote:
> @@ -180,6 +183,8 @@ static FloatParts parts_silence_nan(FloatParts a, float_status *status)
>   #if defined(TARGET_HPPA)
>       a.frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
>       a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
> +#elif defined(TARGET_HEXAGON)
> +    return parts_default_nan(status);

This part is incorrect.  You should be changing no_signaling_nans above, because:

4.3.11.2 Floating-Point Representation

... The ISA does not include IEEE754 signaling NaNs ...


r~

