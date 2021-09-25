Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CA418284
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:11:47 +0200 (CEST)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU8P2-0007az-Rm
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU8NC-0006s2-1g
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:09:50 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:42540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mU8NA-0004Oy-3j
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:09:49 -0400
Received: by mail-qt1-x82f.google.com with SMTP id u32so5193003qtc.9
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=af99PK/h7B85T6hGoEZbVKoFh/b2L4pwWl5b80H2lUU=;
 b=oCrx8PGE6RsKvxEaHdOCW38UGdJp+wcXIvbo+7bWAoch2ylL3yyyQJ0r2SzX1m1h7A
 gdt9HWU+C2Umfh8HDH5ZaqXPm6L6p74zYefxrbfQKvpCa3TCodgyd4eA53QvzHu5aZ10
 /M1hxyBD3zr97zbNhlgaJy9T7nDT3UEW2Wj3T8n66Z5skYiE4NYN2RI2sgDKZUpjYdui
 UOyBjqR0bDX+cP+VkB8d1cBuLT92/LMivpOp01LLhUmbxqPnea4yiAafaWtd7Mkmjoaj
 NciEDi4QtTYM5dkTfvBxq6mCsJPaIRo2zQwx4LWBCC9Y7ceDGRZG7SX5stDcHvOIvT+S
 s77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=af99PK/h7B85T6hGoEZbVKoFh/b2L4pwWl5b80H2lUU=;
 b=DhCS7aXkm5uJbHhYuP0gfYnRrko+cnw+ARJtOyY5ucTe2n+rkPqPRHHbFCNf4Z0av8
 PDkg6EZQegpzktxIlG0lXnptK/AA5M9qZsna4HG9yv9OwXzyMHe796Z7fIectlxWD7pz
 JY75Vqq5iKVzRVjHn/H4bPfWbkE6wKadtdu/NTa5aIgcqUmBTCHsy76IGAD+dO7Xq1NI
 D6aNw+mSFxevzRJK+k7tUUoYBGa8zROdZtrF/AU3VeW/QbUvGD6nHn+C0GZl+uhgxyp/
 i1hjgCGccioKGODaonVAEYmWvRMhOMnfDJ53dU31rw9dpQ4E25kja50D74BSILUJWQ3Z
 fy/g==
X-Gm-Message-State: AOAM530jT5LOErOzD/QsOrd1vC0Tp5dLaZhAGfJXZHTfby2ACKQh/oap
 gZun0ebbQQIlHZ4oKAYPsU119g==
X-Google-Smtp-Source: ABdhPJzJWD/GRh3h0Xy2w2xh5KZman7w1tcJi02zId4cp9KMot6y8rE3kF6HbvX+BqwLMpFr3mTopA==
X-Received: by 2002:ac8:4e30:: with SMTP id d16mr9806287qtw.309.1632578986870; 
 Sat, 25 Sep 2021 07:09:46 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id l13sm8762165qkj.130.2021.09.25.07.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 07:09:46 -0700 (PDT)
Subject: Re: [PATCH v5 16/30] tcg/loongarch64: Implement shl/shr/sar/rotl/rotr
 ops
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-17-git@xen0n.name>
 <f9afab7f-5c45-121c-42cb-a032cc341d8c@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <403754f2-b313-8350-23a4-f21d806a9da1@linaro.org>
Date: Sat, 25 Sep 2021 10:09:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f9afab7f-5c45-121c-42cb-a032cc341d8c@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 6:05 AM, Philippe Mathieu-Daudé wrote:
>> +    case INDEX_op_shl_i32:
>> +        if (c2) {
> 
> Why can't we use:
> 
>                 tcg_debug_assert(a2 <= 0x1f);
>                 tcg_out_opc_slli_w(s, a0, a1, a2);
> 
> ?

Because tcg/optimize.c can produce out-of-range values.
We have this same masking in tcg/sparc/ starting as far back as 1fd95946657.

Officially, the tcg backend generator must accept this, with UNSPECIFIED behaviour. 
Generally, such out-of-range shifts will be followed by a conditional move that overwrites 
the undefined result.  The tcg backend is not allowed to trap or assert.


r~

