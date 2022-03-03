Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658834CC232
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:05:36 +0100 (CET)
Received: from localhost ([::1]:46340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnxP-0006Z4-Fw
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:05:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPncD-000232-Ug
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:43:41 -0500
Received: from [2607:f8b0:4864:20::1032] (port=45700
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPncC-00021x-5N
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:43:41 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so5180804pjl.4
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EyIqXAGFoJLFeA9HgRdXXHXge/dqMXvrPvMTec7519M=;
 b=qFvLbyrL/eCSsSuvHSb3eFR7O0wiYuQHEGdCJPZdZYkARlP3xFnltbg6pSO+Fi5ZDg
 CZvajy/pPqRmc70LTXR5ns8qp8nV8x3CCmvHGO/Tc7lDKl7NdaKt5Jc0dwNbIIYc5faT
 SsbRsVBo9KOvatYl8pXtm7Sog2OtLtuAhrg1ju7mThJ55Smkji7MXy53gVLryB8zvPJo
 aKm0bptm/mhTXvKsoFi08U5JOO6LgjTH0yI3uycOENn1DKrFtxIY9H8pXKZUU5XS122k
 BTao9Xe0GMhPj0XTZwZz6Pq5rReN0AbVAp5lwZd7JtIK0GE/4nV3C5PGMAT3WNUOdVtw
 9LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EyIqXAGFoJLFeA9HgRdXXHXge/dqMXvrPvMTec7519M=;
 b=HRK6nztKx00yTOvREsN6O58zhrwEnCzcqFVzMt5Eo1pi5lYCuxiUau5uLFHt6/ey7u
 MwKC0pzzgyp06j047oYEh/xksuKJwGgVG6Td1CHGcC4BCaUmHavYG9+ggJYQAb6g/6JR
 v0TTjF71c2cJBs/H64kRt2vL8BTqds+bQ3TYWRD6TR79Y2QZGRxmOWZy2F9ffafOF6A+
 6jfUq5bz8Xp4GmWRpRl+XAeA/7NpELxj5pgyFz4Xp3cWO3bhQIoJHqlxZ20CLdTSAk9C
 dZf58M+LHZFrRUQzhXf1c8P7QvpLGdATwC8ticDQxvdWkJFBP/ox4uy2qcoa8tfTBzhU
 AbUA==
X-Gm-Message-State: AOAM531dZFGEb2u+nFCxOxI2bn3TKn85ATanvjA1yJuJL6O5EjupVTU8
 c6JbejMRk6AjW9sMqOPqm9Eemg==
X-Google-Smtp-Source: ABdhPJxXYwxpVx1e+X/NYk9fb1BbO5gAvE66WBQi0gOAimGLJwMqM4+/1JilqImjdfutpX9+vfct2Q==
X-Received: by 2002:a17:902:7048:b0:151:6d4b:6118 with SMTP id
 h8-20020a170902704800b001516d4b6118mr20674875plt.50.1646322214109; 
 Thu, 03 Mar 2022 07:43:34 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:e819:4400:f268:c391?
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 g28-20020a63111c000000b00374646abc42sm2311410pgl.36.2022.03.03.07.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 07:43:33 -0800 (PST)
Message-ID: <59dcee91-aec2-50b8-28a6-cbebfc9fb7ee@linaro.org>
Date: Thu, 3 Mar 2022 05:43:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/9] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220227020413.11741-1-richard.henderson@linaro.org>
 <20220227020413.11741-7-richard.henderson@linaro.org>
 <CAFEAcA_wCDP=-=FFp_hKE9r-5Vz7RMxpQV2BkH63cpv1oZRjbw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_wCDP=-=FFp_hKE9r-5Vz7RMxpQV2BkH63cpv1oZRjbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 05:04, Peter Maydell wrote:
>>       if (USE_GUEST_BASE) {
>>           tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
>> -                               TCG_REG_GUEST_BASE, otype, addr_reg);
>> +                               TCG_REG_GUEST_BASE, option, addr_reg);
>>       } else {
>>           tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
>> -                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
>> +                               addr_reg, option, TCG_REG_XZR);
> 
> This doesn't look right. 'option' specifies how we extend the offset
> register, but here that is XZR, which is 0 no matter how we choose
> to extend it, whereas we aren't going to be extending the base
> register 'addr_reg' which is what we do need to either zero or
> sign extend. Unfortunately we can't just flip addr_reg and XZR
> around, because XZR isn't valid as the base reg.
> 
> Is this a pre-existing bug? If addr_reg needs zero extending
> we won't be doing that.

It's just confusing, because stuff is hidden in macros:

#define USE_GUEST_BASE     (guest_base != 0 || TARGET_LONG_BITS == 32)

We *always* use TCG_REG_GUEST_BASE when we require an extension, so the else case you 
point out will always have option == 3 /* LSL #0 */.

Previously I had a named constant I could use here, but I didn't create names for the full 
'option' field being filled, so I thought it clearer to just pass along the variable. 
Would it be clearer as

     3 /* LSL #0 */

or with some LDST_OPTION_LSL0?


r~

