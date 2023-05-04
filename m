Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282896F66B8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:03:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTvC-000563-JB; Thu, 04 May 2023 04:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puTvA-00055W-Bm
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:02:36 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puTv8-0005mA-QX
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:02:36 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc075d6b2so249914a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683187352; x=1685779352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pQcCwXd/8abMNv/MlFtmypGjKUer1ODHN4y9tWWGwY8=;
 b=oDqcrsYebrzgl0pRhV94qZAwzEU3FS91vPytGPQHgEZNTNJ1kiu+4e58/wjrp94JRz
 L/2AetTqvGjxrUQ/bmInKSuLF4nXdYnkTE4lB5s61TNYbCTmnRZWrsfZIi7yZwzsdyNK
 /DseK3rl/LV1eifAGJzU1L5ncedtnkfUYlIdb44kZuGtIXyIOlrPjaOjk2Mih/1h0uvv
 L4zKGuxZYeBoRLghm09fKMySPMTTVrgJlxrTflXMZ8ZZjk11186AtBzVrnsFfpEH2jRl
 vCqT58BMWRMKxgOgnBIadx45TbVfB8LKTocxz9lFadwCPWcF6QAQ6rwZlb49KDf6zKyq
 beeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683187352; x=1685779352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pQcCwXd/8abMNv/MlFtmypGjKUer1ODHN4y9tWWGwY8=;
 b=BX58TlezWIkQilrh/KYkXQyh0GTCCPuamYl5z1BtVVaXIOlBZUT7LTzD8kahzQkpmi
 2TbHmQhrh0ZOMN7sv5WcUXMv+cqE4tJhL2tIoWQfXHJjinQPwdqo2GXd/oOiOgZ6MVzI
 x7xmZHyzuS17xU4mc5fTP6KXfCmvLED16XYoGDyHilQJgOLIfQ87vtljE6pJ/LWLd6QC
 YOSI8rR4fBgDzsZ3urAvZcTA505I8nVW718HYQJo1AQoMbG8HeeSNWCweIV6aN3FGbxf
 mrCvH7SE7vC3Mu5+LpKXeZ2tVXghUNEv15Rq6gxtJ0x3dNCry9Z6vD3OqVbopY/inTRU
 sPbw==
X-Gm-Message-State: AC+VfDzOOj1FFW+52/7OnrDfhandkxyTi1fKj3Vu9JGR8FFLzEkHtD9R
 jI+nrP/Fa0E9XJUZidb8zz5zjw==
X-Google-Smtp-Source: ACHHUZ5JlwY9oudIrDG6t8d+eLByO6OQ9efsTzIPfzfNjZ5W1DFGnPoOJ3RwlQ05C5y96nVmn2lgUw==
X-Received: by 2002:a17:907:608b:b0:88f:a236:69e6 with SMTP id
 ht11-20020a170907608b00b0088fa23669e6mr5960149ejc.7.1683187352574; 
 Thu, 04 May 2023 01:02:32 -0700 (PDT)
Received: from [192.168.0.57] ([82.152.154.96])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a170906230300b0094e7d196aa4sm18219573eja.160.2023.05.04.01.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 01:02:32 -0700 (PDT)
Message-ID: <f8c09f9d-eab3-1b6e-ef5f-73d2f3867395@linaro.org>
Date: Thu, 4 May 2023 09:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/9] target/m68k: Finish conversion to
 tcg_gen_qemu_{ld,st}_*
Content-Language: en-US
To: anjo@rev.ng, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, laurent@vivier.eu, philmd@linaro.org, jiaxun.yang@flygoat.com,
 david@redhat.com, iii@linux.ibm.com, thuth@redhat.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com, jcmvbkbc@gmail.com
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-5-richard.henderson@linaro.org>
 <b93063d6-3162-db59-5a16-3613cceadec0@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b93063d6-3162-db59-5a16-3613cceadec0@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 14:08, Anton Johansson wrote:
>> @@ -971,23 +958,16 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, 
>> TCGv_ptr fp,
>>       tmp = tcg_temp_new();
>>       switch (opsize) {
>>       case OS_BYTE:
>> -        tcg_gen_qemu_ld8s(tmp, addr, index);
>> -        gen_helper_exts32(cpu_env, fp, tmp);
>> -        break;
>>       case OS_WORD:
>> -        tcg_gen_qemu_ld16s(tmp, addr, index);
>> -        gen_helper_exts32(cpu_env, fp, tmp);
>> -        break;
>> -    case OS_LONG:
> 
> Accidental label removal?

Whoops, yes indeed.

r~

