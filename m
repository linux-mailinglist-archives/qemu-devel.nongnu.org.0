Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D96B3FCCB5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 20:00:43 +0200 (CEST)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL83m-0006l5-RI
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 14:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL82b-0005xQ-B5
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:59:21 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL82Y-0002qs-GX
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:59:21 -0400
Received: by mail-pl1-x62e.google.com with SMTP id e1so11106005plt.11
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wRq0Fl1YyruBIK4fJFAjeub9a9NOH5XuBoYeySWY8iI=;
 b=O2nZQ/DJmPpYryrn+gygx8Dd+Hsj41+2nPyS0Rp8M6i7aoCVucSlcLCg8Nfr7OkrAG
 p28tHGVgbBeX4ECbbVeFdO7JFjv6lHChRsTDZrNFw5DXSv8HZ6WPo9w26n8cYUqeiLw7
 yjJr1t0ncb2DB4iFliiJiqv/DdbRa5wnCKEOgm/oDzfN8N5+w4HihXBM6FHwKy8JfWCH
 UUunEPTGrAnHNMQGn67yujNVadX1UlSh2GdQcdo6DrCOldkmANxxi90X3DC2HmCcZWyh
 VSWXQeE+x5QDFUcwkJN9ecsGVsckwGW3qQJgnV2PEobvLSpz90tb8KoE/fJZbCP5RkH0
 S8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wRq0Fl1YyruBIK4fJFAjeub9a9NOH5XuBoYeySWY8iI=;
 b=Y3NwBv19Pm23a2Y03s3pGlyZgkTfmt7zvTbe5rXefnamDh/asvB2L8ss7p3KVBX2Lv
 n3/rOw8vavzdx7muhsI5pum9p4NsPYU9Y2MtBJT1yPjK7IWPthyzOnIBxQz5J3Xwv5vw
 TwmMfMIDpjpaAZDyaGThSKqcMpT6VEH+Ly2OwyYPwNI5hPyugM6ih/JAZBhKHByLwq5k
 ypSd6fOpmfAJHFD3O0RxZSJqr8xlPncgnQ71nkqXqzHx+rWd7Ghc1wA2ZEI4FOBx6bfQ
 LD2U13sCWS5P0bg61lW7ICSeE8bBYjIVuHBK94tDPR9zkJs4QpMJ0yvtFxKSkv0Y9hbR
 T/qw==
X-Gm-Message-State: AOAM532gjRH+a+4QwUmXrcbdZObgtKULnXiqPiB7gNajfEo4j08wttAH
 urZumRqNhA+Du14u6G7qasv9ig==
X-Google-Smtp-Source: ABdhPJwxHd5UkIAbI7w5Eqgoxu4pUzdwg5Mo6HSpO/9zZQXmvmlyAdKXGkXsM8PU29nqgLXzNGwlmQ==
X-Received: by 2002:a17:90b:120a:: with SMTP id
 gl10mr6785468pjb.234.1630432756720; 
 Tue, 31 Aug 2021 10:59:16 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id a10sm14065691pfg.20.2021.08.31.10.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 10:59:16 -0700 (PDT)
Subject: Re: [PATCH v2 04/19] host-utils: add 128-bit quotient support to
 divu128/divs128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-5-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6a29b77-1187-a06b-6c2e-ede5dc8a1037@linaro.org>
Date: Tue, 31 Aug 2021 10:59:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-5-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 9:39 AM, Luis Pires wrote:
> These will be used to implement new decimal floating point
> instructions from Power ISA 3.1.
> 
> A new argument, prem, was added to divu128/divs128 to receive the
> remainder, freeing up phigh to receive the high 64 bits of the
> quotient.
> 
> For scenarios supported by the previous implementation
> (<= 64-bit quotient) with large (> 64-bit) dividends, testing showed
> that:
> - when dividend >> divisor, the performance of the new implementation
> is equivalent to the old one.
> - as the dividend and the divisor get closer (e.g. 65-bit dividend and
> 64-bit divisor), the performance is significantly improved, due to the
> smaller number of shift-subtract iterations.

Hmm.  I'll note that we have a better divmod primitive in tree, but we aren't using it 
here: udiv_qrnnd in include/fpu/softfloat-macros.h.

Given that none of the existing uses require the high part, should we be creating a new 
interface?  The bug you highlight wrt truncation could be fixed separately.

> -void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
> +void divs128(uint64_t *plow, int64_t *phigh, int64_t *prem, int64_t divisor)
>   {
> -    int sgn_dvdnd = *phigh < 0;
> -    int sgn_divsr = divisor < 0;
> +    int neg_quotient = 0, neg_remainder = 0;

You might as well use bool.


r~

