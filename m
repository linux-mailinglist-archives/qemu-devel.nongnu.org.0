Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C112F301E7E
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 20:39:44 +0100 (CET)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3lEd-0000Nv-Ce
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 14:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3lDA-0007wT-SC
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 14:38:12 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3lD8-0004jW-Rj
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 14:38:12 -0500
Received: by mail-pg1-x531.google.com with SMTP id z21so7497044pgj.4
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5yJo7M0vz8ILAdLEyYIAgD0yTGNY6cIUACSn1Mf26us=;
 b=xmaJ+MY5sUpvFTRjm3SRaBGp4eQVVkn+FexG6fC7JREqOR86qqPmUx2F7ToAtR+rEE
 0V/07KcGjfzJoGVD6LIjFe2y/LS9DVwFJ+ZqPG76esGfRHVKilXiejJEDicJm2O7KNKR
 NiA6+CF2ekBDrsbZ+D254IrxYCU7ksZKZ+r1yFph27B1vicVbaDcio/0UxDYqofwzJ1Y
 PM3k6suOL5/KT5lZzw66cXed8Qmwr0ID1LZ0ooaWCUoj5/fhwYgooi+kiEfAsISZF7+X
 2QzoXzAVxfe8y0QsC1tdW9L4FmT3VzckqAV5/juW5qdTBqzCD4AVa8fEMmF943UXtoRh
 rF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5yJo7M0vz8ILAdLEyYIAgD0yTGNY6cIUACSn1Mf26us=;
 b=RkFKYC+iyn5P0t4L5rQlDsjOwxSwDHkDCTMtdOYeyjnTQBVYYtsAl6pCSQcyKPwcme
 Grt06xRPpxz4odYpfGgJyxFkZi3HLv2F1GufNXlF3egipxD1fT9D1/1sJgilQRUKgkHC
 kW6ld7ur0YVu9ZwOHu0rdZPF5zevD/OjMWWWO9Zyb4HyopJ/19cPQQIaaN4y43rfY6/d
 yMPqTdEmkzksQXwWOYUn1WILSKpf1aYo2sbiOcX5bt9FVZyuCVblXBsGCChl+Crmn8cq
 3yOF7Lx++nNPsKWBvxyjgkxtY91RxKfZGZRSdVbvvj1GL9VMh+rsGRqbLiJEpo0Q08zD
 BnLg==
X-Gm-Message-State: AOAM53236/XeYYywsf5QHtkC9BIdxVnRH6GctYP3IrUGZSEXGQm9ryRS
 dgKz46RJmY3sr/Q6EoJIML+ml03dtIrbqw==
X-Google-Smtp-Source: ABdhPJw5Ge4XnRFe3tIqHHVFhJAtv5/E0s7YkwjKHg1pKBfKnDSMoHZGsFsrBzVn0srH4SFUO1XvzQ==
X-Received: by 2002:a65:64ce:: with SMTP id t14mr14954128pgv.36.1611517089117; 
 Sun, 24 Jan 2021 11:38:09 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id r14sm15309434pgi.27.2021.01.24.11.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 11:38:08 -0800 (PST)
Subject: Re: [PATCH] target/ppc: Fix truncation of env->hflags
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210124032422.2113565-1-richard.henderson@linaro.org>
 <20210124044634.GA8202@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fed7279c-528c-c4d3-f305-c88ffcdf7bff@linaro.org>
Date: Sun, 24 Jan 2021 09:38:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210124044634.GA8202@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 6:46 PM, David Gibson wrote:
> On Sat, Jan 23, 2021 at 05:24:22PM -1000, Richard Henderson wrote:
>> Use the cs_base field, because it happens to be the same
>> size as hflags (and MSR, from which hflags is derived).
>>
>> In translate, extract most bits from a local hflags variable.
>> Mark several cases where code generation is *not* derived from
>> data stored within the hashed elements of the TranslationBlock.
> 
> My knowledge of TCG isn't great, so I'm pretty much prepared to accept
> this is correct on your say so.
> 
> But that commit message feels like it's following on from a
> conversation that's not here, nor linked.  It'd be great if it
> explained how said hflags truncation is happening, because it's
> certainly not obvious to someone with only a fair to middling
> understanding of TCG.

Mm, fair.

How about:

The assignment from env->hflags to tb->flags truncates
target_ulong to uint32_t.  This loses important bits from
the top of hflags, which results in incorrect tb selection.

Use the cs_base field instead, because it happens to be the
same size as hflags (and MSR fom which hflags is derived).

In translate, extract most bits from a local hflags variable.
All of the checks vs env->flags are redundant with env->msr_mask
in that msr bits cannot be set when the feature is not available.
Mark several cases where code generation is *not* derived from
data stored within hashed elements of the tb.


r~

