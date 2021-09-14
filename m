Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2B040BB0E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 00:17:17 +0200 (CEST)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQGjs-00077J-0V
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 18:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQGhS-0005Fk-33
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 18:14:47 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQGhD-0002Ve-KB
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 18:14:45 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so3398608pjc.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 15:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oCR5vC/qcZsBSkgcBMiV25n2T98VVvXDU05b0C94leU=;
 b=t/EBft/Q8/DXwMq4FpC+eBFesLxm7XJialV63/id3Cn8IpoGNQoVwSUfeMqnqXZpJi
 n+0NI40gf3CKgD/Ohhrw97CLJq33n+TbdTpHdx9914ujybY3vr8pOAIirSc8D8a7Wb6y
 78wF1gQtqFe69eXWyV4c8k/k/fM3YB7bjLIdacd9IJL+OY9JMhsmBqX1uQxZli3XYsME
 bbu9NnAEmeWmFskjMMtErJgjk4JWbOkyHSYrRBNOh9Yme0/50NDuf1sVglT3fbb9RQUF
 3p4qFtQuv20TfVYkcCxv5bUSckT+D9mpS1rOmdPCjPhmQYGN7hXV9/QgnNFF71jOGKQu
 9m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oCR5vC/qcZsBSkgcBMiV25n2T98VVvXDU05b0C94leU=;
 b=6S6seCM3r6ycSAHPrrnVbBYpNDD9bOdLUi4BeImZZhgDYFFkVUoBceNGlfgapcpvm7
 x8kdHAEUURYPJwNC2FREPPTLMUCVrUdN26burAnYcQWvQnivA530d8Tt3sG+QG+gGJMW
 +CP48gyGqH1m2kyQbsohZNvAayo4IbFRqiUn1BMErFeavvELyDW/ZVuldpW7GACKTDR8
 7mqceBT6PLD1ziGvxUzpU6++I4Gt0x6NlTXt0yZQXMPNkjOxU3OQTK2XJcUScaG0TRhi
 VIGqfxI18uE5GT0K08n7shGZrohGxXiiJwz9XKnNI5DdPdDUaWO6HyE2mJ2h3h4C85bH
 4S5g==
X-Gm-Message-State: AOAM530pP2cN+aCUz9Vr3FRWJYrk0umWjxm2iXWClmZOgrTQxf7lzp5G
 slio8JCnO4ttyYE2AKeqdqnOytn8EdHjaQ==
X-Google-Smtp-Source: ABdhPJzZ8BN9K5vUD9a07dnlL7KvDuIspAAFIi5nzy2j/JICA1OHbFKJ5/VorgJU7AJkJUieJfgnrg==
X-Received: by 2002:a17:90a:514b:: with SMTP id
 k11mr4606054pjm.152.1631657669849; 
 Tue, 14 Sep 2021 15:14:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f16sm2493491pja.38.2021.09.14.15.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 15:14:29 -0700 (PDT)
Subject: Re: [PATCH v4 05/16] tcg/s390x: Implement tcg_out_ld/st for vector
 types
From: Richard Henderson <richard.henderson@linaro.org>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-6-richard.henderson@linaro.org>
 <7bd6c9a6-6b0f-5a0c-f9a2-be8a37102196@redhat.com>
 <166e6957-57a9-ea87-60d1-628fb44dfbea@linaro.org>
Message-ID: <f8937442-09dd-bea2-1f03-935f2f4283ed@linaro.org>
Date: Tue, 14 Sep 2021 15:14:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <166e6957-57a9-ea87-60d1-628fb44dfbea@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/14/21 3:03 PM, Richard Henderson wrote:
> On 9/14/21 9:46 AM, David Hildenbrand wrote:
>>> +        if (likely(data < 16)) {
>>
>> This actually maps to "if (likely(data <= TCG_REG_R15))", correct?
> 
> Sure.

I'm going to add is_general_reg and is_vector_reg predicates.


r~


