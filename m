Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030363FCB6E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:21:30 +0200 (CEST)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL6Vs-0007EJ-La
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL6UI-0005ro-FE
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:19:50 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL6UG-0006fH-S5
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 12:19:50 -0400
Received: by mail-pg1-x530.google.com with SMTP id q68so17224285pga.9
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 09:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vmlKoDxqBvo8hJSqw7CIzV4+Jgx5bSUDagxk8762k9c=;
 b=cY6DUcx7M1jw1s7GloMIuPqdsaTio01nopsGGJFofOTGizRghN3MJQENU90iZnjctG
 ASionOYEvCsISj6gCt1gB2DJOSgzPve8+5kC0fdEYTcHLoEXq5bgEdaIW/C5Bg0DRoLU
 8/1lrC28ao72Tw7Lcjiv2H2XO9P4E641O5RKUdnDSP1q0cQT19PPxUuDGYvyPlyYC0u9
 26JVqslpphs0wXFUCM2KZhpZ7MY1u1BqwESOT73aUuEK3YX+f3sAgy9lhhHd7M0R0Fe0
 qXJkUjn52juATU2IkUQUQ5llm/5oYsD33fOH/uZdgfKkhKUxUwaUwSKq/Bn9FSTVgaO4
 wiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vmlKoDxqBvo8hJSqw7CIzV4+Jgx5bSUDagxk8762k9c=;
 b=oOhtJGawUpR6KOxkQWp/5qgj/0whApRAou438BOO5sCOyPailkZkI8G1MdpQ9oCOxJ
 42nYfAvA9oMOe4zecCJG9rFfgt4fgPp3/ia4YYs2Phxli4Ep2O4DfPJJuphtNz0ly55Y
 cB8kmQB8nVVYraVwjxpypB7qAAM2hfP9MMzEUJgOXGN7AvhGomuknS1KZo4dM9OiuiRo
 BjJuZntZ0UDAgvchOvDnnw4nGJyIgc98BPu7ueOcma7HddyfEWZHUUHdEwNvJH7HCch1
 yAQKJpTRsjMRU/UD3w7ZSxLzLcNhzddqrqgTLosuxV98Y+Ud3Fck/h1ghNfY+7F+eY6X
 /h6Q==
X-Gm-Message-State: AOAM5320tHskxX10rA+te2yVn9Egr6cwTOil9yKTo/7ONEQCdvkQ1U5h
 0piX3/wjhoksv5eZ3KGH0YCbGQ==
X-Google-Smtp-Source: ABdhPJxOwomSAQiOXTKKTO5cr71tNx4QjUSSySMuzDFRgQGeFVDlfZGrUplUHKp6BzTzNKpYvYhSZQ==
X-Received: by 2002:a05:6a00:1984:b029:3cd:c2ed:cd5a with SMTP id
 d4-20020a056a001984b02903cdc2edcd5amr29024979pfl.12.1630426785631; 
 Tue, 31 Aug 2021 09:19:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id i24sm7472331pfo.13.2021.08.31.09.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 09:19:45 -0700 (PDT)
Subject: Re: [PATCH v7 09/14] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
 <20210830111511.1905048-10-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60dcad53-de32-2527-86e8-41be6219cb35@linaro.org>
Date: Tue, 31 Aug 2021 09:19:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830111511.1905048-10-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 4:15 AM, Philipp Tomsich wrote:
> +    TCGv  tmp = tcg_temp_new();
> +
> +    /* Set msb in each byte if the byte was zero. */
> +    tcg_gen_subi_tl(tmp, source1, dup_const(MO_8, 0x01));
> +    tcg_gen_andc_tl(tmp, tmp, source1);
> +    tcg_gen_andi_tl(tmp, tmp, dup_const(MO_8, 0x80));
> +
> +    /* Replicate the msb of each byte across the byte. */
> +    tcg_gen_shri_tl(tmp, tmp, 7);
> +    tcg_gen_muli_tl(tmp, tmp, 0xff);
> +
> +    /* Negate */
> +    tcg_gen_not_tl(ret, tmp);

It just occurred to me that we can swap the shift/andi and re-use the same constant, and 
we can fold in the negate with andc.

     TCGv ones = tcg_constant_tl(dup_const(MO_8, 1));
     TCGv tmp = tcg_temp_new();

     tcg_gen_sub_tl(tmp, src1, ones);
     tcg_gen_andc_tl(tmp, tmp, src1);
     tcg_gen_shri_tl(tmp, tmp, 7);
     tcg_gen_andc_tl(tmp, ones, tmp);
     tcg_gen_muli_tl(tmp, tmp, 0xff);

     tcg_temp_free(tmp);


r~

