Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33E6FD904
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:13:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwex8-0001d1-RI; Wed, 10 May 2023 04:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwewt-0001U2-BK
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:13:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwewq-0006BE-Gq
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:13:22 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30796c0cbcaso3212342f8f.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683706398; x=1686298398;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sJrRn2kQJXGMYmKWYRaxVLT0GnHxrShI3s82sc3/lZE=;
 b=x+3QaSXQ09nfYLGB/H+6MZWjvnOUndv33f+QQQ+Xa5yY6RjMJtQthntdk2pmeZcTwl
 SYY7KGS5UPjni/q+to+W7nsK3e4y+8xrddVl06ma+zIwUUUKdzGxGfcA9ybqpBabFp+X
 AxO8o6KnKicNg+r0QoTgUqmYhHS00WMlI8DEIjG01dRpNHi75pNb+c8igUGwaw2Fk+lt
 ev4I36SlNFCV28xC+tXZgK3T/d8aaaxkMuqB67xy7M5JJvKBhGRxWz1qsxX5DOsY8MdP
 pMP8p3wd7MRs3duSf2UD3xc4kPluTNMPVg7CSlvy67eKB/A4pgHTtG4jUuzyUxMAxCUo
 essg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683706398; x=1686298398;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sJrRn2kQJXGMYmKWYRaxVLT0GnHxrShI3s82sc3/lZE=;
 b=XjwWMHiWX+yLN/4gz3Mqfa9yw4bn2xqvpBTLLpKd5c6rjbMPXngjbcBIEq8aZS31iQ
 AST9QfGSCShzGw7+Ks0+gCJxOTWo4Pp6POblGX4NsVPBxWDywYuYjWp5HIF98L1yR1C/
 x4L/fRp2EH/4CmTtnPUxD6nZHwdBWpNltUsMfvsLaMa6SwwbmiBUqbax46yymbQAmDMu
 6pwYy6OrWEMcYUiIF5fwzyCM69iOjxKaxLIgTWZpOaAeaC3DcSalIscjmj8xu1qVUYel
 jFFrmYPlGds72nzPgSlcLp8C+lri4gNEyWxqMC44QtvH3pwY4wbRQSrj2Qxrn0mKsFvx
 aH0Q==
X-Gm-Message-State: AC+VfDwoNWF5L9wCR+a4+T+Eb/O/ulubuZxkJ2OYGplO49o6ZOAMhLcw
 zhVV85T7Zcp5/P5LSKBvmdKNUQ==
X-Google-Smtp-Source: ACHHUZ5DPscc79PpIREzEBJhSJPqDXBpeFT+/BNVijr+sZzR25JX+lTi02ZmqxpmEvJi4ZW/8s0A6A==
X-Received: by 2002:a5d:42ca:0:b0:306:3b78:fe31 with SMTP id
 t10-20020a5d42ca000000b003063b78fe31mr10365226wrr.69.1683706398287; 
 Wed, 10 May 2023 01:13:18 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a5d6308000000b003079ed1f0a0sm5605193wru.44.2023.05.10.01.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 01:13:18 -0700 (PDT)
Message-ID: <0d880358-4472-ca4e-edce-ada7b397ef94@linaro.org>
Date: Wed, 10 May 2023 09:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/5] disas: Move disas.c into the target-independent
 source set
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, philmd@linaro.org
References: <20230509163326.121090-1-richard.henderson@linaro.org>
 <20230509163326.121090-6-richard.henderson@linaro.org>
 <b62ab9a2-fad5-313f-518c-29626b0d57c3@redhat.com>
 <48f35197-1890-cfce-3535-9a8522f50523@linaro.org>
 <3d4e0154-99bf-da36-0d71-efe99d24ab72@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3d4e0154-99bf-da36-0d71-efe99d24ab72@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 5/10/23 09:10, Thomas Huth wrote:
> On 10/05/2023 09.46, Richard Henderson wrote:
>> On 5/10/23 07:53, Thomas Huth wrote:
>>> On 09/05/2023 18.33, Richard Henderson wrote:
>>>> From: Thomas Huth <thuth@redhat.com>
>>>>
>>>> By using target_words_bigendian() instead of an ifdef,
>>>> we can build this code once.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> [rth: Type change done in a separate patch]
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>> ...
>>>> diff --git a/disas/meson.build b/disas/meson.build
>>>> index f40230c58f..2ae44691fa 100644
>>>> --- a/disas/meson.build
>>>> +++ b/disas/meson.build
>>>> @@ -13,4 +13,5 @@ common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
>>>>   common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
>>>>   softmmu_ss.add(files('disas-mon.c'))
>>>> -specific_ss.add(files('disas.c'), capstone)
>>>> +common_ss.add(files('disas.c'), capstone)
>>>
>>> I guess you could drop the "capstone" here now since it is already added to common_ss 
>>> now three lines earlier.
>>
>> I have a memory that it's required to get the include path for <capstone.h> for 
>> "disas/capstone.h", for use by the target's cpu_set_disas_info. Otherwise only common_ss 
>> files have access to the include path.
> 
> I only meant to remove it from the new "common_ss.add(files('disas.c')" line since it is 
> already there in the "common_ss.add(when: capstone, if_true: [files('capstone.c'), 
> capstone])" line ... I think you have to keep the "specific_ss.add(capstone)" line.

Oh, yes, duplicate within common_ss.  Removed.


r~


