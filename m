Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2E6F6769
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:28:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUKN-0003Ou-7R; Thu, 04 May 2023 04:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puUKL-0003OM-01
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:28:37 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puUKJ-00059y-AP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:28:36 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9659e9bbff5so28373166b.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 01:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683188913; x=1685780913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4gfs1X4FEMC33zoIn39f6VSePTBHWqzrY64jlC0Kmic=;
 b=tknWwAbw6l60lC9cmukjQh2Osqr1qVcOO+v9qvDCR/7LCJfwbXNLZWH8yLmHT5aHd/
 8RNQeISwsZkm5sVapY6penSHSTWiTM2GsOlTFc2FpXx3dac37cEMBiohz7XxS+QC8tVV
 I8HwsaxBO8fHzVqldf1snsK8ddKneGRKpfDa3uf29Vb3/4X4AHqI5MNqLFNe7Xv38ycz
 95kZkz1NBhzWi2nmd2Ir6kLh+Y2GUD3M8unFtsTW0DbGlMY9VWoOVDx/C2eIleq0zGeP
 053neIyvOwdey2mhkcSSRlap84F3r0U2EipKejiKjYsUjDkzaqOOuYI0WE6ufLOQM2Qm
 ng8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683188913; x=1685780913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4gfs1X4FEMC33zoIn39f6VSePTBHWqzrY64jlC0Kmic=;
 b=QYRy2dKBkYMd9LSqk0TyPcV4vOByJe0Yr5AFZMqiDjCH2iIPnJYNuoyXeVvScwVNnK
 byevLsHQSDSMD26QOFjpheaLEegthURenxegEkA9b7vVc/oZiOc+gKHwXuzbKg46XYVI
 bTMdXO3/kINLI4YyQJVYDGSgMM+zSLbrTJv2f1Nl4b/2Nf5I/kdiC58wVPwBc/pT9Nfa
 +yLJ27NCaaqXpmVned0Nr0aHYm6Q6DBUyvPKc5FIBLYM2MAdwlsbzXTNosgRCeMElIqY
 CbqHWJyeeZd61wOzy2FggvRTI+zSJVSSWY+pU4kom8o88pL00mh09WFbP9dNYxcNKLOk
 wogA==
X-Gm-Message-State: AC+VfDzfGLEIejaztg4PyKg7r17j23dZ6f+T4ddYOHystJYhAOuKAGUR
 aFogz/h/ufgj+hgYpx2IBLgqvg==
X-Google-Smtp-Source: ACHHUZ4iw76+QqpvZpM17ru9NcCSpOJp7tqyVaXXo4800bY72e8nYp1vowiBnCWzC6cc2ZJMNHn+ew==
X-Received: by 2002:a17:907:ea3:b0:949:cb6a:b6f7 with SMTP id
 ho35-20020a1709070ea300b00949cb6ab6f7mr6156029ejc.56.1683188913150; 
 Thu, 04 May 2023 01:28:33 -0700 (PDT)
Received: from [192.168.0.57] ([82.152.154.96])
 by smtp.gmail.com with ESMTPSA id
 ze12-20020a170906ef8c00b00965bb7a288dsm41787ejb.47.2023.05.04.01.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 01:28:32 -0700 (PDT)
Message-ID: <4b1639c5-de50-6b66-ed74-e95f05bea5af@linaro.org>
Date: Thu, 4 May 2023 09:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] softfloat: Fix the incorrect computation in float32_exp2()
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, vaibhav@linux.ibm.com
References: <168304110865.537992.13059030916325018670.stgit@localhost.localdomain>
 <670af6f3-003f-bbc8-4a88-4622a17b485b@linaro.org>
 <7cdaacd3-8672-5895-08d4-39c6732b44b0@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7cdaacd3-8672-5895-08d4-39c6732b44b0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
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

On 5/4/23 06:21, Shivaprasad G Bhat wrote:
> Hi Richard,
> 
> 
> On 5/3/23 01:11, Richard Henderson wrote:
>> On 5/2/23 16:25, Shivaprasad G Bhat wrote:
>>> The float32_exp2() is computing wrong exponent of 2.
>>> For example, with the following set of values {0.1, 2.0, 2.0, -1.0},
>>> the expected output would be {1.071773, 4.000000, 4.000000, 0.500000}.
>>> Instead, the function is computing {1.119102, 3.382044, 3.382044, -0.191022}
>>>
> <snip>
>>> his is because instead of the xnp which holds the numerator,
>>> parts_muladd is using the xp which is just 'x'. The commit '572c4d862ff2'
>>> refactored this function, and it seems mistakenly using xp instead of xnp.
>>>
>>> The patches fixes this possible typo.
>>>
>>> Fixes: 572c4d862ff2 "softfloat: Convert float32_exp2 to FloatParts"
>>> Partially-Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1623
>>> Reported-By: Luca Barbato (https://gitlab.com/lu-zero)
>>> Signed-off-by: Shivaprasad G Bhat<sbhat@linux.ibm.com>
>>> Signed-off-by: Vaibhav Jain<vaibhat@linux.ibm.com>
>>> ---
>>>   fpu/softfloat.c |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Whoops.  Good catch.
>>
> 
> If you are fine with the patch, could you fix the mail id for Vaibhav Jain as
> 
>   <vaibhav@linux.ibm.com> while pulling ?

Done.  Queued to tcg-next.

r~

