Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA26CB4C2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:19:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzrL-0002fi-4u; Mon, 27 Mar 2023 23:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgzrF-0002f9-EQ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:18:49 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgzrD-00030r-PZ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:18:49 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso11118520pjb.2
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 20:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679973526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qhboic9KKcXoflAz8bpK/vyf9pXK4ufUzdNiP72G41o=;
 b=uQMBo48B5G/f8aps+a/aAClVQuoGlzjxxfDj3z6sLyT31ztpcAH90ZG2ehl+c5PKrX
 qMIG83g79BVSThWYscu1Q8yEoXcEHrWPQXTelERK2kxtFSXdDCwkMHPVz5BciOtdUXEk
 WR1g/LgBj0s3kH/1WnhPJGhruUavPHppoRjhz2iClv5o7xeo7o2811UQL4qyQWjJ00pN
 wOc1+SIgQPq3l/iWYWulwFXtGn2yQvSx6vtkiJr+o1vpS8yMWlRCiibV2oYG9RX1yFLj
 LKoh/s+w4FcZxOWM1qGsj/miTxmj1KtfWNRB3YR9l2SjdO0sPyk0o0DeW0vWjee9kNtn
 bPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679973526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qhboic9KKcXoflAz8bpK/vyf9pXK4ufUzdNiP72G41o=;
 b=TPvkzU+OgyMAR4zsnVj78o0m73VJ8kaWqIgotcsiIpUMbGeFCewpPKhkTPZbj2s2Qr
 kwg8deGvFYwppsf1X5HiIGmdZ2N/JU5JeS50tNFOH4va4eYjQtUG5SzwhIBp41EolSBS
 uzxAr9VRswAmLMnHv0yXloUacMaprrVp44Ol8yJDWiqwY4+HMHQle8tFWLsYun4WY+3A
 BDnrYQdVzYOgQw8YNNeF+Kfs3dmGuzuQXfbjk4vkFV5Fptju8LRAiMrV/xsi1i1Cqb5Q
 ixejpLD4SO93K/TgB4W8Vco3ILnU0yUN7d/XIKMpkn9Fh0U8IzBnhforyw3o3frAyOwr
 C10g==
X-Gm-Message-State: AAQBX9eZHZUi4AWY9nxARfABfCoFYqjx6U9YH+BceJ4H1u4a5jjiIG6V
 vQ1M3aJFeGp/zARhs+V18DKJsw==
X-Google-Smtp-Source: AKy350aisNr1U6MI5MQV1uDrTmnRVAZ+Ry7hca15wsNpsAeDDY/6i3K5LX9VWMifSGmpitomGPkoAA==
X-Received: by 2002:a17:90b:1b12:b0:23f:46a5:248e with SMTP id
 nu18-20020a17090b1b1200b0023f46a5248emr14656571pjb.44.1679973526049; 
 Mon, 27 Mar 2023 20:18:46 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 ay2-20020a17090b030200b002309279baf8sm5085503pjb.43.2023.03.27.20.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 20:18:45 -0700 (PDT)
Message-ID: <389e5dd1-12fc-8b71-8e6a-74db1179fa47@linaro.org>
Date: Mon, 27 Mar 2023 20:18:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/5] target/riscv: Fix effective address for pointer mask
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-2-liweiwei@iscas.ac.cn>
 <c0abfb39-56a7-a184-f134-bcb075908f57@linux.alibaba.com>
 <c1b60f5e-5bb8-5462-ae93-7813da4269bb@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c1b60f5e-5bb8-5462-ae93-7813da4269bb@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/27/23 19:48, liweiwei wrote:
> 
> On 2023/3/28 10:20, LIU Zhiwei wrote:
>>
>> On 2023/3/27 18:00, Weiwei Li wrote:
>>> Since pointer mask works on effective address, and the xl works on the
>>> generation of effective address, so xl related calculation should be done
>>> before pointer mask.
>>
>> Incorrect. It has been done.
>>
>> When updating the pm_mask,  we have already considered the env->xl.
>>
>> You can see it in riscv_cpu_update_mask
>>
>>     if (env->xl == MXL_RV32) {
>>         env->cur_pmmask = mask & UINT32_MAX;
>>         env->cur_pmbase = base & UINT32_MAX;
>>     } else {
>>         env->cur_pmmask = mask;
>>         env->cur_pmbase = base;
>>     }
>>
> Yeah, I missed this part. Then we should ensure cur_pmmask/base is updated when xl changes.

Is that even possible?  XL can change on priv level changes (SXL, UXL).


r~

