Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864445AC1E1
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 02:41:46 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUdhp-0004FV-6I
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 20:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oUdg0-0002an-6q
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 20:39:52 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oUdfx-0007LX-47
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 20:39:51 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so5774213wme.1
 for <qemu-devel@nongnu.org>; Sat, 03 Sep 2022 17:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=o1Vg7TQJ95Up5jUWVK8I8+58+ZGPUAc9qHDWCLLto2M=;
 b=hjIHagjOBWaKe4Gzo/WTQc/LvdMecV4IaxjFToB8zAX2xYtydbwrdkWYEgLaPczR8i
 IbYPXpVXfhC0bkaNSnV9RS2J/3ykuenqmYvhE2a6wyFeUKLZQJE+jkZ9ZD0YlCXM3K8D
 akeBE0LGITfG6KdKl6yJfCpnHP2anbwtAekHMv2IG2jG0J4C2q5XkxXT+fpc7Drq/KAB
 ntbcmItDTeqr7BHCNq7F4Y3+6g5KK56qGUwAD3duyZgxOQvfDyL9i0hyyPFiXL9wIonr
 eIeqtnEVhatowcmwBSa5Eth8L7U8r29BsBJpW9dIkeJqJY9wSThlj7u+Im0OSdtrDfaA
 KoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=o1Vg7TQJ95Up5jUWVK8I8+58+ZGPUAc9qHDWCLLto2M=;
 b=enSlVP3LFTIfDOsP8IQ315z5fZrXskuDFnWFyIsCaYvcxypadwjVOg8LK8XAClqZyj
 1dG+VcpI8rsYPK3dFBJcGae9KjKICEp12O7jNklMe1ADRW3Z/K9BzlfmJ4uyIaoIps8C
 vQbE57Rm6XqmRjtbdkHjPARbsLEe1UQOzDqG4YF+8QMa8dOAOMn/aO+WZOyAO30Wo6Nr
 Cou1ABMmalvXB2N0FV+EYC3NM3bA3xpXnLsj6fRZLSp8IbVqswxAA/V2TF1sOT7cwFRe
 HdRUT19ys7Zucd+da012FNeGdsLOCMDN0xJf6HdgwHOr45enlmKx7FyaV00llCSz9nad
 bTYw==
X-Gm-Message-State: ACgBeo20Nm6N/ykU592fCU7BrjExSpv+Au8B//GYEKi2jeTnfbcv4vlV
 1ypaElda+DD5Rn1Fo4L4bk8Gbg==
X-Google-Smtp-Source: AA6agR4cKXchTqHpgNdBsoMH+PKHb3EfhWPpWNcc5R5Fek1pBWy3PXNrh6f4qizGbPekDrZe6UMG+w==
X-Received: by 2002:a05:600c:3ac6:b0:3a5:c03f:510d with SMTP id
 d6-20020a05600c3ac600b003a5c03f510dmr7012199wms.120.1662251986895; 
 Sat, 03 Sep 2022 17:39:46 -0700 (PDT)
Received: from [192.168.10.136] ([78.19.130.69])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003a31fd05e0fsm25817408wms.2.2022.09.03.17.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Sep 2022 17:39:46 -0700 (PDT)
Message-ID: <65465b46-5423-9c94-7ae9-f2379bcb829c@linaro.org>
Date: Sun, 4 Sep 2022 01:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Content-Language: en-US
To: Brian Cain <bcain@quicinc.com>, qemu-devel@nongnu.org, tsimpson@quicinc.com
References: <20220901212931.27310-1-bcain@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220901212931.27310-1-bcain@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/22 22:29, Brian Cain wrote:
> +void gen_masked_reg_write(TCGv cur_val, TCGv in_val, TCGv out_val,
> +    target_ulong reg_mask) {
> +    TCGv set_bits = tcg_temp_new();
> +    TCGv cleared_bits = tcg_temp_new();
> +
> +    /*
> +     * set_bits = in_val & reg_mask
> +     * cleared_bits = (~in_val) & reg_mask
> +     */
> +    tcg_gen_andi_tl(set_bits, in_val, reg_mask);
> +    tcg_gen_not_tl(cleared_bits, in_val);
> +    tcg_gen_andi_tl(cleared_bits, cleared_bits, reg_mask);
> +
> +    /*
> +     * result = (reg_cur | set_bits) & (~cleared_bits)
> +     */
> +    tcg_gen_not_tl(cleared_bits, cleared_bits);
> +    tcg_gen_or_tl(set_bits, set_bits, cur_val);
> +    tcg_gen_and_tl(out_val, set_bits, cleared_bits);

This is overly complicated.  It should be

     out = (in & mask) | (cur & ~mask)

which is only 3 operations instead of 6:

     tcg_gen_andi_tl(t1, in_val, reg_mask);
     tcg_gen_andi_tl(t2, cur_val, ~reg_mask);
     tcg_gen_or_tl(out_val, t1, t2);


I'm surprised about new files for this simple operation.  Surely a subroutine within 
genptr.c would be sufficient.


> +static const hexagon_mut_entry gpr_mut_masks[HEX_REG_LAST_VALUE] = {
> +    [HEX_REG_PC] = {true, 0x00000000},
> +    [HEX_REG_GP] = {true, 0xffffffc0},
> +    [HEX_REG_USR] = {true, 0x3ecfff3f},
> +    [HEX_REG_UTIMERLO] = {true, 0x00000000},
> +    [HEX_REG_UTIMERHI] = {true, 0x00000000},
> +};
...
>   static inline void gen_log_reg_write(int rnum, TCGv val)
>   {
> -    tcg_gen_mov_tl(hex_new_value[rnum], val);
> +    const hexagon_mut_entry entry = gpr_mut_masks[rnum];
> +    if (entry.present) {
> +        gen_masked_reg_write(hex_gpr[rnum], val, hex_new_value[rnum],
> +            entry.mask);
> +    } else {
> +        tcg_gen_mov_tl(hex_new_value[rnum], val);
> +    }

You could avoid the structure and .present flag by initializing all other entries to 
UINT32_MAX.  E.g.

static const target_ulong gpr_mut_masks[HEX_REG_LAST_VALUE] = {
     [0 ... HEX_REG_LAST_VALUE - 1] = UINT32_MAX,
     [HEX_REG_PC] = 0
     ...
};

It might be clearer, and easier to initialize, if you invert the sense of the mask: only 
set bits that are immutable, so that you get

static const target_ulong gpr_immutable_masks[HEX_REG_LAST_VALUE] = {
     [HEX_REG_PC] = UINT32_MAX,
     [HEX_REG_GP] = 0x3f,
     ...
};


r~

