Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ABD6937E7
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 16:20:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRE7s-0002sx-HR; Sun, 12 Feb 2023 10:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRE7m-0002sX-Ia
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:18:43 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRE7k-0007YH-TR
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 10:18:42 -0500
Received: by mail-pf1-x431.google.com with SMTP id r3so993067pfh.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 07:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mQr+ntmI4/lwq9bLSqAKH0XQE2Ljg2VTPyjKdUOb6wI=;
 b=URtxRHSKiixIMIZ9OfDeAWt/RZ0MEjlAOGrZKd6DFq4AhPrYx0uyz26g1cIM7E9zaK
 gnuVujcLhkKzo5OjhEsDNFKxbcawu3xKd0UwnjRIHQ1dkjlmwDq6eDxX9qGD6behwC+7
 NFXDqiDxGRs5G2xGJE5s4OsylxpJ262itjeZ5Wb1AYlf3AKIvFqYFbArfVWFUoougvW5
 t1SwyUTB/bUouHBLpUr1x80iV8KbXkh0DLrD2bPxfTYtnR+hX/iP5nfnCv+NuJDPPgE+
 tRcLp1PoOrdpE6KNADZg9XXWrvlO5ZB8FtXDSUnEXEXXM6wGxcPB7dCws68Z7c87+xD9
 3Tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mQr+ntmI4/lwq9bLSqAKH0XQE2Ljg2VTPyjKdUOb6wI=;
 b=lNGnMbx0NkNjo+a//tzXE4R2/Ul8VxCvmIrx2oaifRIuY6FmZ1XLnxM3ZMJryeJwyI
 O2gaNfHrJCHo1wMqdKmE/ThpMXAeDiOREUr/JXjwZKVyD3p8rOh+M83KNYkAY2E/8nr4
 G5303z3mXYq5iK6oaO4R0DlFsjdJtzqHH+i6Y8VdjyVCWvWfrxaNC2vpAYLoz/fd89/a
 p7aG9NpzVwIqOv86co55GW/S9Cy3w1lbUTTUenfzujzhVk94pHQmO7ObGBB/xxZD9eT4
 zhF8IEP2NlrKHiPKyrPUtTUt48I9K8P37nnxR0CaQ75omjRXi8TaMHxSXyuuDF8HbKM4
 nM1A==
X-Gm-Message-State: AO0yUKUcpFlhTvZGo3/iCmmkknxTCpWvMlBE3ylE6Gu5lQjIypkJHk+f
 EBIx1Nj1fQykT4mhmc25kfz5yw==
X-Google-Smtp-Source: AK7set9cD10Ya4l7eBjFQqmO0U/YiJpBZRoX525Y4YMScaYmbMnVfNSfhJrnyYlDltJrrQzP46lwEw==
X-Received: by 2002:a62:7b4b:0:b0:5a8:ab7c:981c with SMTP id
 w72-20020a627b4b000000b005a8ab7c981cmr1942477pfc.29.1676215119222; 
 Sun, 12 Feb 2023 07:18:39 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 a9-20020aa78649000000b005a817ff3903sm917252pfo.3.2023.02.12.07.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Feb 2023 07:18:38 -0800 (PST)
Message-ID: <e920aa91-c153-0898-d2d3-da141233d60d@linaro.org>
Date: Sun, 12 Feb 2023 05:18:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230210221951.1298668-1-smostafa@google.com>
 <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
 <Y+joYrG4aKC5cje5@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y+joYrG4aKC5cje5@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
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

On 2/12/23 03:23, Mostafa Saleh wrote:
> On Sat, Feb 11, 2023 at 01:48:57PM -1000, Richard Henderson wrote:
> 
>> Just "return s->gbpa != SMMU_GBPA_RESET_VAL;".
> 
> I will update it.
> 
>>> @@ -1512,6 +1553,10 @@ static const VMStateDescription vmstate_smmuv3 = {
>>>            VMSTATE_END_OF_LIST(),
>>>        },
>>> +    .subsections = (const VMStateDescription * []) {
>>> +        &vmstate_gbpa,
>>> +        NULL
>>> +    }
>>
>> Actually, I suspect that you need a pre_load hook that resets gbpa, which
>> will then be overwritten if and only if the saved value != reset value.
>>
> 
> Please correct me if I am wrong. From what I see, the initial for value
> GBPA will be set from smmu_reset_hold which is called from context of
> qemu_system_reset from qemu_init context.
> And migration will start after that in migration_incoming_process from
> qemu_main_loop context.
> 
> I validated that also by printing the value of GBPA from vmstate_smmuv3
> pre_load at migration without GPBA, and it is the same as
> SMMU_GBPA_RESET_VAL.

Is that from -loadvm on the command-line, or the loadvm command from the monitor?  It's 
the latter that I suspect requires the pre_load.


r~


