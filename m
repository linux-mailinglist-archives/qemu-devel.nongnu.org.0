Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449736D574B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 05:47:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjXdL-0004mb-7i; Mon, 03 Apr 2023 23:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjXdJ-0004mL-LH
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 23:46:57 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjXdH-0001R7-NO
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 23:46:57 -0400
Received: by mail-pj1-x102c.google.com with SMTP id j13so29248722pjd.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 20:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680580013;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JyPQf8axC8cZf4e/Ojmb6UkEf4xGClVTuyY+wGTyT+g=;
 b=f5uf+Vs1okFM6D45ImzbNh/DHD8JmeFhvAU5WsUiqPKSP7U0OXDu3ki/qbFYn88TsY
 vdqrHikss8gsbwZKC8nbEW8l3nQo2yUGiqfvl2nG1x5k/Ive+9z1fNk47sTZ0Wtm/twz
 WPUH5Uxo12YnkyaJwyGdFEubutrzPACETfCTcFabGz/4KMGr0APR7UvM2TM/3Lcqe1IU
 snZPCQKMFYDOLJjivgPpCLnI4vmFxiFnBktvcTClNVb7u74LGl+rdcJgPS0IWysCmXH+
 GQikiTwJUWqQbuLVp2AqytHM+SyzU4Usj3YLxAsTRDwvSmUF9loZQclf/MbRrOfMQFDq
 GISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680580013;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JyPQf8axC8cZf4e/Ojmb6UkEf4xGClVTuyY+wGTyT+g=;
 b=UOuC023WYFdyl0yCAClb0fIDKFoO2FPhORq1pw3zUACvP2IMEg5gj/WWgtv6eUsjDm
 nL92b3LBRQdo9uJB1IbYEzqpvnbGl5wo2FJpr7mbAqwMF9GJ9FBwQlbKwdpXMlaUBpJC
 3pQ/KrP/PUgvkYGU1MrZaqmycFMMfojiSM71ZBqvnf+3IfcL1rdC2RbPkFqi0KM0acUH
 jT+1LcISblkIdDPPN7kXSYX7q2nlHXPFdnrkMmwldIYjPIfGX3K0WB/HEqJFng5HOXyl
 jw2GGXxMv0Qs9x3wJOAHXK6I4vBHGgAvi8EewEIfp3DRX7ovhfmwiG9ixecVSCOzpfJf
 jvcg==
X-Gm-Message-State: AAQBX9cepkOK54sJqswvQ9mQW3zupVgB9n/iq/CIuU5csQLzIQu/TAi5
 N8dQslI3NBowoL5pdYKxVujwDvjOfaUpBV016kI=
X-Google-Smtp-Source: AKy350Y1gfaPy4pajLW55Bjad75F6WJrQzKQ8QS6R6duhR9+uzqM3/q+hNdLDf2f903a/D7NlVXBdw==
X-Received: by 2002:a05:6a20:4a07:b0:d8:fd3b:f1ba with SMTP id
 fr7-20020a056a204a0700b000d8fd3bf1bamr1151440pzb.3.1680580013565; 
 Mon, 03 Apr 2023 20:46:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a631514000000b004fbb4a55b64sm6647382pgl.86.2023.04.03.20.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 20:46:53 -0700 (PDT)
Message-ID: <c4cf6018-bea9-e904-13d9-754ce25a49c3@linaro.org>
Date: Mon, 3 Apr 2023 20:46:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 18/44] target/loongarch: Implement vsat
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-19-gaosong@loongson.cn>
 <c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org>
 <8d077ca4-9f49-6a38-744e-0a7878df26c9@loongson.cn>
 <ed0c6b91-a9ea-1578-e244-c87cf8c918c4@linaro.org>
 <ac9b3807-b62c-2cd8-feb5-b9e47683cc6e@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ac9b3807-b62c-2cd8-feb5-b9e47683cc6e@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 4/3/23 19:11, gaosong wrote:
> 
> 在 2023/4/4 上午4:13, Richard Henderson 写道:
>> On 4/3/23 05:55, gaosong wrote:
>>> Hi, Richard
>>>
>>> 在 2023/4/1 下午1:03, Richard Henderson 写道:
>>>> On 3/27/23 20:06, Song Gao wrote:
>>>>> +static void gen_vsat_s(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
>>>>> +{
>>>>> +    TCGv_vec t1;
>>>>> +    int64_t max  = (1l << imm) - 1;
>>>>
>>>> This needed 1ull, but better to just use
>>>>
>>>>     max = MAKE_64BIT_MASK(0, imm - 1); 
>>> For the signed  version use ll?
>>> I think use MAKE_64BIT_MASK(0, imm -1 )  for the signed version is not suitable.
>>
>> int64_t max = MAKE_64BIT_MASK(0, imm);
>> int64_t min = ~max // or -1 - max
>>
> The same problem with imm = 0,
> MAKE_64BIT_MASK(0, 0) is always  0xffffffffffffffff. :-)

Huh.  Well that's a bug.


r~

