Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFF1349725
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:46:54 +0100 (CET)
Received: from localhost ([::1]:60926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPT8H-0007HD-3Y
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPT5f-0006MI-Cy
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:44:11 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:42998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPT5d-00026J-TG
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:44:10 -0400
Received: by mail-oi1-x233.google.com with SMTP id n140so2751298oig.9
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n0M/wXxUiLB9MO2fWaLUUsOt42N7wFHsHujuGVMvJvM=;
 b=WDdKNvWCy6YaQhqqvb8k5cbhn51NiNyLH1w0kW86NnDP3PNafqxfCOtUxNtWV6YBWF
 5/TynuBBKeOGgUl4+s6QldxLQZDAIIYtlLdEv9wvOHPqus91/lQGU8a3uh7nqteG7tGh
 lhzgqxv1URfzwiKbU5UYY50WPqmYKLrTYq4YeQLsPYJp+yhq+yEIGWJSUltgaTR4jZov
 IP0iqD9CIVhtnGvcMtGJ2Vz4LQfEFhA1KFAagOKDmmZdvkdHiIz9rzBKQMvFQ+C9s+Bi
 CXk+D7bwIQYTYpKMgQBK2UEREcZ6hbVPkUIEoUadFFPhliQCc4u5Uh48ACTbivM6ak+h
 tk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n0M/wXxUiLB9MO2fWaLUUsOt42N7wFHsHujuGVMvJvM=;
 b=TyvRc7SVbh790EsRU43ZQc2a5OAkd6AJCR/7czWQASMqtB/obLC8D6SFwj2Z+t2FkC
 Rn3amlJYNL7SvreCSOf3zRq+hqGZrSonrBoVFtXr0Db0/fcpuAsYIsMEU/iavvtAWPMx
 GwW6C14kl+LI/HUyIFDoBtlddIws9E8Af7poQGhly3njIy6hX0Vk3iwufMgw1CYi8K5/
 A8k60u+lHPW0O4n5ZJ3KLvNrhgV0Fybm9ZH+3IGaXsAXrlZMgu6hM4VMjzlkqQHKd3wz
 7L5gbVsShSoRTCRu+AuAeXzcWQZ1YIm7dMSwRpYWC4ivnaYg6nxYw0se+l56IgeSFvxx
 YsXg==
X-Gm-Message-State: AOAM531Dvh/a4huYycDenSmXxhhQ/DwlgtxBLtVCUkYzGtDz0+dzHHq9
 KSm9gWcyzPySbaEu8BAn9JM5nw==
X-Google-Smtp-Source: ABdhPJxUwC+PGvESrydmd4bYSrJg4SL2UzjQVQDEVJqIFmF+5E3RGza03HsheZt+ac+ekpiIvE9NvA==
X-Received: by 2002:aca:3286:: with SMTP id y128mr6918557oiy.145.1616690648314; 
 Thu, 25 Mar 2021 09:44:08 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id s191sm1178031oie.0.2021.03.25.09.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:44:07 -0700 (PDT)
Subject: Re: [PATCH 14/15] Hexagon (target/hexagon) load into shifted register
 instructions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-15-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <daab5d42-c469-991e-329e-c708ae78dd73@linaro.org>
Date: Thu, 25 Mar 2021 10:44:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-15-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
> +        tcg_gen_shli_i64(tmp_i64, tmp_i64, 48); \
> +        tcg_gen_shri_i64(RyyV, RyyV, 16); \
> +        tcg_gen_or_i64(RyyV, RyyV, tmp_i64); \

shr + deposit.


r~

