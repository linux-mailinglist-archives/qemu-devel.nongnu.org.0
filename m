Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BF44117F7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:15:45 +0200 (CEST)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSL1E-0004Z3-E8
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKaM-0005Ff-RN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:47:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKaK-0006v2-Vl
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:47:58 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n2so8621799plk.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=u6tfzvjSi9DN/yAX68GL5aZ0ldwcsJXquq3OY0oxfRo=;
 b=Thy2opcKJuGvbupG9v8aX+cV3Uh7xBn+GTl+SfRKQ/pXqYm8kxKKIAr9Uvg+X41iCG
 N1xFtEaX1LlBS/FuufSIh0SKEtPYW+HrF08HGbmWpxEjbbOCGXa9ymIw6m9wiyKGsQv1
 K0EDjMM4RNsCo9+AdDYCtIzmlNN5cznpC3KDS2Lc9xJ9vAAgYEBm1AQbJfpWjmxw9X0z
 dimHWSc9XoNTIRRP4SPr49iXtTDaz3Be2iBFkveBcJY14qbbfzPyNdntNB2GA/kJ02Vy
 g0nzBUIjN1U17oWTHg0VUHgTqCDmiRl0Rn8f6vOaoNTQ+x3H4eM+JaKhWpfQgRoKkpyk
 fg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u6tfzvjSi9DN/yAX68GL5aZ0ldwcsJXquq3OY0oxfRo=;
 b=FHrUgmVY2fulyXg/5vU0TuOhokAqgLSD7UcAGs6fGWg5tMtaYRdBJEQqM6lrDp6zOs
 Bjm42iHXuB7BK2UacidmqNEWV2UYtFBYd4KHsNLUgT21b0Uy5Fpwwzk2HMJ9GSt14Y6j
 S/phcBSUCdDsu6ORHYkv0aP9gQPpERfImQOyBxZibfo6k5riW3WP9P5LNx0ivdP1Jl27
 ARVhhDyIrNt7JwCaIEOH6+3BX/lu0pYWvgOOcpumT26MAIweHpivnDpifciZ6NJLWn4z
 E/ol7CUyjRGsjYo0h3HIuXptVV+gALdkG4YL4pZWWon8Weckd6nwwDf+Aic+/VQizVW4
 rYKQ==
X-Gm-Message-State: AOAM532h0YVhnBpILSkzapr2+6CMISPSsEHXcLQqHFWAIGXEjsH561gW
 sxSpFviRIMjJgJB7/64IexY1eXraAP1lLg==
X-Google-Smtp-Source: ABdhPJwFS1r9Lz0+UyN1w5qf0mr8KoZZhBiUw+cYg3NBtTuMyKyYZNn417dEJGxwQATIFpiHGUyuyQ==
X-Received: by 2002:a17:90b:250e:: with SMTP id
 ns14mr29601158pjb.84.1632149275042; 
 Mon, 20 Sep 2021 07:47:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm18416588pjb.8.2021.09.20.07.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:47:54 -0700 (PDT)
Subject: Re: [PATCH 09/30] tcg/loongarch: Implement tcg_out_mov and
 tcg_out_movi
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-10-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bfb06305-ef95-24da-8c06-903173a4baeb@linaro.org>
Date: Mon, 20 Sep 2021 07:47:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-10-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
> +                         tcg_target_long val)
> +{
> +    tcg_target_long low, upper, higher, top;
> +
> +    if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
> +        val = (int32_t)val;
> +    }
> +
> +    /* Single-instruction cases.  */
> +    low = sextreg(val, 0, 12);
> +    if (low == val) {
> +        /* val fits in simm12: addi.w rd, zero, val */
> +        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
> +        return;
> +    }
> +    if (0x800 <= val && val <= 0xfff) {
> +        /* val fits in uimm12: ori rd, zero, val */
> +        tcg_out_opc_ori(s, rd, TCG_REG_ZERO, val);
> +        return;
> +    }
> +
> +    /* Chop upper bits into 3 immediate-field-sized segments respectively.  */
> +    upper = (val >> 12) & 0xfffff;
> +    higher = (val >> 32) & 0xfffff;
> +    top = val >> 52;
> +
> +    tcg_out_opc_lu12i_w(s, rd, upper);
> +    if (low != 0) {
> +        tcg_out_opc_ori(s, rd, rd, low);
> +    }
> +
> +    if (sextreg(val, 0, 32) == val) {
> +        /*
> +         * Fits in 32-bits, upper bits are already properly sign-extended by
> +         * lu12i.w.
> +         */
> +        return;
> +    }
> +    tcg_out_opc_cu32i_d(s, rd, higher);
> +
> +    if (sextreg(val, 0, 52) == val) {
> +        /*
> +         * Fits in 52-bits, upper bits are already properly sign-extended by
> +         * cu32i.d.
> +         */
> +        return;
> +    }
> +    tcg_out_opc_cu52i_d(s, rd, rd, top);

Looks ok.

You'll want to check for small to medium pc-relative addresses.  Almost every TB will load 
the address of TB+C (0 <= C <= 3) at the end, and the TB structure immediately precedes 
the code.  Because of the odd values, you'll sometimes need two instructions. But that 
will still be less than the 3-4 for a 52/64-bit address constant.


r~

