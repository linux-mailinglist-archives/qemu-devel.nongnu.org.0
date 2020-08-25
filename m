Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA9251F3E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 20:48:00 +0200 (CEST)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAdzE-0005ST-1D
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 14:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdxB-0003R2-7Y
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:45:53 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdx8-0001S1-1z
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:45:52 -0400
Received: by mail-pf1-x444.google.com with SMTP id t9so3868101pfq.8
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GYeuTU215V4fkLhzsMXlj/DA8b/3CJKxXhtBc+sIQJY=;
 b=RMICxFeFQVW3W0NwYsHCCPBdRgjZwrHkLDezOl0/0DdIHQ1ktR8WNuliBSHXgFP3AO
 5qLmRMddftUIjx8oFKKRKl+KbQUl2C6QDKE7xPs+vNiKHXHh/OVGdnEWcuBP5End4qgo
 ZugoIaPp9V2xi2OTZxAJXV9ZNUT7ltfPxPXyFopn/1F9V5eYcYSNcaymKCatABLxo2G8
 LXgw9vL8GOUEIG5YB1are9c3ACxXqA0uOXV7rTabZtcxb/01FqM8Z+wZD+wJwa38b1vF
 LM+Vv+VGuO1+6sW3isyOQiOSwMu3QszqcML8oUnKghSTofifOaM3fUfi3VRVKbtzWFGE
 FMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GYeuTU215V4fkLhzsMXlj/DA8b/3CJKxXhtBc+sIQJY=;
 b=HQO6km8FdtayToSL9WOv8E9yKXI7uEMU5ZlV3rrO0k3jsz3P9S5Jnob1WsuTO9ICmV
 qFNsi0r0gkzU1aKz9CFd3W8lYqd4siqv70v0U+L7wVgQZc4JC9gJhqKXYoBFvntOKpMv
 nqmsq3yabCGdlrFt1DmvCww/z3GMpN2nomuLhakdKoDSfiunn4YvLm2uW22eNGnbHo78
 huzsRA4h937D4VeUTTrmJSQf+MA734FKUjBlRu4K6ycZO5X3tJMuoBUZq+QskFEGp11q
 BXQnwukCXFGAxmDcUhEuzSMe1i+mCZwZbpquCcRomxRGqYvblrxJ3mLuA9rjnX+lF1Ae
 3YLw==
X-Gm-Message-State: AOAM530PjWqpVI3RXs+px9RcVBwfq03bU6CIcbMiaWvckcjns0BrcjVr
 lN2ib+BbmGO70Z5g0XlKkKTPPrE8Hw7DzQ==
X-Google-Smtp-Source: ABdhPJx1EsAScD5K26i9AtT8v4g3a7mCHBFJiFML2i78AbTcroWly4ZOAKxgNKw/On4NCCXHIDiSbA==
X-Received: by 2002:a62:e704:: with SMTP id s4mr9249033pfh.177.1598381148227; 
 Tue, 25 Aug 2020 11:45:48 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id o9sm166708pjs.47.2020.08.25.11.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:45:47 -0700 (PDT)
Subject: Re: [PATCH 12/22] target/arm: Implement VFP fp16 VCVT between float
 and integer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7403253-be9d-0003-fcc5-878ebf26c2ff@linaro.org>
Date: Tue, 25 Aug 2020 11:45:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
> Implement the fp16 versions of the VFP VCVT instruction forms which
> convert between floating point and integer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp.decode          |  4 +++
>  target/arm/translate-vfp.c.inc | 65 ++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

