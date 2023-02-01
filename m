Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22D686059
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN7Dt-0004Ri-TG; Wed, 01 Feb 2023 02:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pN7Dr-0004RO-CB
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:07:59 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pN7Dn-00079F-UU
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:07:59 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 ha3-20020a17090af3c300b00230222051a6so1078275pjb.2
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HZBbicLtWPVc2CJYEuVzoA72ajzXBNYOf1dOj8mo2B4=;
 b=KLBykYrn3Ll3bVY7KhJt24aI20s+vViXznbp0ufG/taTHlQ0QL5w/Vdq0vSYqEBFqR
 FRE6U4yQUr1/DK2+zTL9V4FvEYSs6tAYmodEx3GtM5bm0udvVFbFTpTjz35rtoTsw+HE
 KlwJCiNXHDJxiJw9c+5aYhsuiMKAsa1LJUB/GVD3NR0pUwqz5XuWIlLNGB0zvku5FJ/O
 bmYUOtmDOizuBXCNjjSWfvQPA4HjhVEJUfn3vvTX6PVc8JvWlPtIJRwdD3tbvXeoV/88
 m9abWN+j63Ll/q/PQtPlNzHl03rcQQ7tvCqTT1UIbQo/KL/463PEN/kv1zHR0jlQW1If
 EWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HZBbicLtWPVc2CJYEuVzoA72ajzXBNYOf1dOj8mo2B4=;
 b=wM+URK5Yf6xQfsOsAGdfU40OgbiiZzJp7QrA9JjkGtW+PPrtXZk0Gt1WBiOkR5FtrE
 JSbaY0aGN+xoRAqS0hCOz4Xd98tMW14ltyyPE+diCcd0KDGDzfZQc1j7bFkBIhyJuxo1
 k24WGakYf1JU+YXIZ2GaudTt68eF0tVWsUCqxxbEXnKnH/ow2vsl8UPss8usQKXt0Y3J
 TyE+/v7JFtfcCZuDp/tasHRoJ+e4c9lJBbAHauBuSD3Hc603G6FZm1QrYQVP7s7cI935
 iFiNRFkZSRL5s6UqrY1/zDQ1DLdsFGrgXhdJlKJvXJFdZbAuOgCl58scj7XmDEmqfp3W
 o3nQ==
X-Gm-Message-State: AO0yUKUTxaXT51WPKkO1fwPT0Wxidg8vFj7oVpIfLDyxxRjndJVs/HqX
 ZOldS3qLhT2NUcTd8SqA05uc8w==
X-Google-Smtp-Source: AK7set9gxlSOxHhCVChPLUYrGWrrT3DURiaHj24PWaH6FmPTOj3Xn3dL5Jl8Gr1edG4euocfi83FKw==
X-Received: by 2002:a17:902:d044:b0:192:7f35:90ed with SMTP id
 l4-20020a170902d04400b001927f3590edmr811676pll.11.1675235271108; 
 Tue, 31 Jan 2023 23:07:51 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 a4-20020a170902900400b001963a178dfcsm10910081plp.244.2023.01.31.23.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 23:07:50 -0800 (PST)
Message-ID: <a1b44a66-f95c-b42f-865e-882495285fe9@linaro.org>
Date: Tue, 31 Jan 2023 21:07:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PULL 16/22] tcg/aarch64: Reorg goto_tb implementation
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, hev <r@hev.cc>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
 <20230117231051.354444-17-richard.henderson@linaro.org>
 <ffac2cd4-b1e1-53a9-8c88-367f80f1e977@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ffac2cd4-b1e1-53a9-8c88-367f80f1e977@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/31/23 15:45, Zenghui Yu wrote:
> On 2023/1/18 7:10, Richard Henderson wrote:
>> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
>> +                              uintptr_t jmp_rx, uintptr_t jmp_rw)
>> +{
>> +    uintptr_t d_addr = tb->jmp_target_addr[n];
>> +    ptrdiff_t d_offset = d_addr - jmp_rx;
>> +    tcg_insn_unit insn;
>> +
>> +    /* Either directly branch, or indirect branch load. */
>> +    if (d_offset == sextract64(d_offset, 0, 28)) {
>> +        insn = deposit32(I3206_B, 0, 26, d_offset >> 2);
>> +    } else {
>> +        uintptr_t i_addr = (uintptr_t)&tb->jmp_target_addr[n];
>> +        ptrdiff_t i_offset = i_addr - jmp_rx;
>> +
>> +        /* Note that we asserted this in range in tcg_out_goto_tb. */
>> +        insn = deposit32(I3305_LDR | TCG_REG_TMP, 0, 5, i_offset >> 2);
> 
> 'offset' should be bits [23:5] of LDR instruction, rather than [4:0].

Quite right.  Oops.


r~

