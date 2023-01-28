Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21BA67F3B1
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 02:26:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLZx8-0007Cg-Mm; Fri, 27 Jan 2023 20:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZx7-0007CI-Bd
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:24:21 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZx5-0001iW-LU
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:24:21 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 m7-20020a17090a71c700b0022c0c070f2eso9631413pjs.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 17:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PkJTh+3yRof+qOfNr7I3LAaNy8dJZdNWWm/f/Go7hgA=;
 b=RDSMqOsAS/9s0C+cLBMWODvf5HjnC+bifZxtaouzxWgLUQxpmdBiPMLtw5TObbmY2R
 izuoVd8ba0TnaQl7jiiJLGvfLJJGdNLiruNxMbR1qsSr0+60VyiHo4TH44oX5ZwyNwUH
 0dNZXqjy6mmOomaqEiDLtjBph+DuZl3uE5uvFWFbmaPz8QuOTSW/B0Cf/ikQme8pbiTI
 5zcz60wnwRtZdBozJKk14+Bom2GK10R+Ttfjbcl35/WVwAXrN6T7harXfopEtbhwN1Us
 q86hYUQwm1jIg0nlapbtt0y/WK6nRzQ6sToQpzr86bLIPSt6ptOIwX3KtzOcMIo7IgxC
 p3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PkJTh+3yRof+qOfNr7I3LAaNy8dJZdNWWm/f/Go7hgA=;
 b=D5b1U5ddaXg0f1uEA4a0RuzpZq34eLI6oHvIjdJ845UHsnjKhBuO3SuDUtqvkLmyh3
 zO7jzb92iz3g7o5+fOn6f/Re81ORpu0+9TyRO8bTNz8gfyfrH9SvzgzPYk9ItN89ETUe
 Tshx2IW9YOi44AK6a1e23nlF0jVUEKUPclZjl+0eKMaunq+CBTKFQw/FaVtOis6SqMG2
 iYxJFu7Ul6Dko0HTRLyCMLF80FF28DkSxjooCYkwxbEXrQTQOVdkyS4LXw04V6CcqSd2
 D+9KxIDrLpbnsgUAc+fJsZKJ5CQZ2WI+jLx/T/WYSkKm2nnuIXco6Gk7XAj1/+Ec26kD
 vYUA==
X-Gm-Message-State: AFqh2krJ6QPn3e1ApDryxhYQUjy3MllnePzSmIedX2R3UgmNMkjVyLtC
 Qq+nlRox5fftCWrnlyh9KhRdtA==
X-Google-Smtp-Source: AMrXdXtjWP5OoaciJmn66xlkEbLJk8txjwAmC9UqOuxOPaPUz7azsx+KuKDDrG+pXqdZYDMvwNEnow==
X-Received: by 2002:a17:902:ba8b:b0:194:7227:84db with SMTP id
 k11-20020a170902ba8b00b00194722784dbmr39771730pls.37.1674869058052; 
 Fri, 27 Jan 2023 17:24:18 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 f11-20020a170902860b00b001946119c22esm3454486plo.146.2023.01.27.17.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:24:17 -0800 (PST)
Message-ID: <358331ce-ee3e-4355-5982-bf4e0b5aa444@linaro.org>
Date: Fri, 27 Jan 2023 15:24:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/23] target/arm: All UNDEF-at-EL0 traps take priority
 over HSTR_EL2 traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:54, Peter Maydell wrote:
> The HSTR_EL2 register has a collection of trap bits which allow
> trapping to EL2 for AArch32 EL0 or EL1 accesses to coprocessor
> registers.  The specification of these bits is that when the bit is
> set we should trap
>   * EL1 accesses
>   * EL0 accesses, if the access is not UNDEFINED when the
>     trap bit is 0
> 
> In other words, all UNDEF traps from EL0 to EL1 take precedence over
> the HSTR_EL2 trap to EL2.  (Since this is all AArch32, the only kind
> of trap-to-EL1 is the UNDEF.)
> 
> Our implementation doesn't quite get this right -- we check for traps
> in the order:
>   * no such register
>   * ARMCPRegInfo::access bits
>   * HSTR_EL2 trap bits
>   * ARMCPRegInfo::accessfn
> 
> So UNDEFs that happen because of the access bits or because the
> register doesn't exist at all correctly take priority over the
> HSTR_EL2 trap, but where a register can UNDEF at EL0 because of the
> accessfn we are incorrectly always taking the HSTR_EL2 trap.  There
> aren't many of these, but one example is the PMCR; if you look at the
> access pseudocode for this register you can see that UNDEFs taken
> because of the value of PMUSERENR.EN are checked before the HSTR_EL2
> bit.
> 
> Rearrange helper_access_check_cp_reg() so that we always call the
> accessfn, and use its return value if it indicates that the access
> traps to EL0 rather than continuing to do the HSTR_EL2 check.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/op_helper.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

