Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9FF559FB8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 19:48:35 +0200 (CEST)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4nQ2-0006sl-C4
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 13:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4nKY-0003By-DV
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:42:54 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4nKW-0003XK-MQ
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:42:54 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso6465636pjg.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sjjPdoko8sxpn3p9mtA9otESRm2IoKbyb1xR6mhm0b4=;
 b=Nfth8KxAbfbEDIAgcSDVA2zE/+fXWeNA5C7tCucmpqVT6TJKZzoaiWZ17hRFfXh9cO
 DMUFxpaSRkaTtyCQ/TT6VusSaMdLeKpKrZkus0HIk0TxnGFaCAx50Cv0cjTMvozILBCx
 z+eiDCFRntfG/MXIlnwJZfTlKGRP7BmLAMKl22tIJjk8+Ap9SD7dC4vElh86yMh0daNr
 5XFxenEZ5pNrZgpY6FbpyWD94qlHk+taeCHPm1Rlua4K588+0jEnUT3ujnkG2iSQoXBu
 YwSXFuhLOUAXFukJ9P7y1h+VL37yrGwMtkzmZyjW+KX/ZQMf1ixUxvuFX2cZJYl8nkX1
 2Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sjjPdoko8sxpn3p9mtA9otESRm2IoKbyb1xR6mhm0b4=;
 b=olLGU8/9LHP8IGXS5ROYIS/Dq3LCODxWQpEn0hpqjKiTpX5xHGdrAC0MgKSPRUQxxu
 mqZBTU6SV8mjuKq+ybgYxPEuifLqa7RMA7NledSROQTnBRWf+lNd7snQMSMtNJy7sKpV
 5KgPlclN/Uwcgn3pH/udKeLOZUV59U6u5+2OclgIvxWMHR5FjoOLX1uV5uOkLdbx/iA8
 0tF2p7byS6eeWVYY/kk9Ftx6uMrUi9pgDMsVdjzUJLFwcBaSDNSa+vdiiIuoA4CclisC
 PsE8AcZL9JGrWMrYyGeOd97j2tpti7R0ttyDhIKWddaEfsEQaShk8JdVSj5FKCxHPMGy
 2mew==
X-Gm-Message-State: AJIora/3pgmqsx8t2zmFXSUbvlq+U3XxWGGlmTwAlq9oebCYKZPqmhjl
 cOUbOr/0b9gHC4FlqIX+XreGqg==
X-Google-Smtp-Source: AGRyM1vIMvcaaoQfvRmx3dB74egbZnTUhr/LtyZB8NyS7dYkv+5YuvOeXrlZmtX25267vpyL3TV3ag==
X-Received: by 2002:a17:902:7c09:b0:16a:370a:e960 with SMTP id
 x9-20020a1709027c0900b0016a370ae960mr213103pll.92.1656092571083; 
 Fri, 24 Jun 2022 10:42:51 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170902c64100b0016392bd5060sm2084151pls.142.2022.06.24.10.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 10:42:50 -0700 (PDT)
Message-ID: <758aba2d-bf7c-8356-aaa4-5104cde8c54c@linaro.org>
Date: Fri, 24 Jun 2022 10:42:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] target/arm: Check V7VE as well as LPAE in arm_pamax
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220619001541.131672-1-richard.henderson@linaro.org>
 <20220619001541.131672-3-richard.henderson@linaro.org>
 <CAFEAcA-zUJV2FdFWM2UdS1BDrh_3Tw1p+vHkMoEn7g1G5kArMg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-zUJV2FdFWM2UdS1BDrh_3Tw1p+vHkMoEn7g1G5kArMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/22 09:27, Peter Maydell wrote:
>> +    /*
>> +     * In machvirt_init, we call arm_pamax on a cpu that is not fully
>> +     * initialized, so we can't rely on the propagation done in realize.
>> +     */
>> +    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE) ||
>> +        arm_feature(&cpu->env, ARM_FEATURE_V7VE)) {
>>           /* v7 with LPAE */
>>           return 40;
> 
> I guess this is expedient, so on that basis
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> but as I mentioned in the gitlab issue it's kind of bogus
> that the virt board is doing stuff to a non-realized CPU object.

My first look suggested that the virt board wasn't even setting all of the cpu properties 
properly, so realization might not help.  I meant to go back again and soend more time, 
but that hasn't happened yet.


r~

