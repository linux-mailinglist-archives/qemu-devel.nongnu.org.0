Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DD24E426E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:59:50 +0100 (CET)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfzB-0006qg-8z
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:59:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWfxt-0005rJ-3W
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:58:29 -0400
Received: from [2607:f8b0:4864:20::1033] (port=37607
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWfxq-0002P6-Vw
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:58:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 mz9-20020a17090b378900b001c657559290so3059995pjb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=HLzo9QcSnalNkQ7QlQrfCuIheR8vLZRH/gf27axdlBA=;
 b=cCYWGm1HLfwwUiG2/wHPp08XdWYypJNVABtZ4dzzf0x3lY/D58BcMksBZqxE19Eic+
 sXzdLH5aPLKueXc3AG7x77UWCzl3pW8c3BNdVXmCT0M55JBcwfPznxr5J9bIY8zMdZSi
 hAHOYHEtLN0uDLB1lL7ALB38YDQ8j0jCp7+CbmpXmRJJ5NJ69MpuSbhRODOlg0vLOWyF
 pgSH/75jhFFigM0IIu3nKm7xZ4c65XVgjjjICpRzmL43VkIqQUN63gQYggpuccJMkqcK
 Aa/75TmrLqrLoIMSLWurRZLSkKaCOKKyCgWzvc1D2pzhi58K0L0tZ8/JPFiK5qXlFasV
 HeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HLzo9QcSnalNkQ7QlQrfCuIheR8vLZRH/gf27axdlBA=;
 b=cLu1mkSJFxAzF4gPbIev2tgz4EHRuznssKywHUi/hpBk+NeZMCyqRxAkRZnZd/ftqL
 +WmCv5oxMqUluBN3X02wzP6oM4AZ1i2YttuK1O6U3dQHLmBpx0aHc6/yxrg28eSI//0U
 UpSz5u9LIVCQwKymp6SLMq29FMr3c0JXt311DD99jSvvFtnY766vL8z1K9q0RpPsfoW+
 mUzt2D6fvtBr38NgtmZjj7Gj/4FT4CRi501AducSvRa1qUNS0GFG1GIYhm9QK94WWPl9
 Qp4xjh1PBukU3SOHXURuf/A7OjHDXxLGI+m+9lDurBc9n8AI9KRRQr93Q63wueOQAdtt
 HqaA==
X-Gm-Message-State: AOAM532I7/2YuSxXcbCKSgnDoZpwdjvI8xzXzWGaYnu+FTWd/tGVHR2k
 ZCkC8mG813NYETaAqEPIZUfRag==
X-Google-Smtp-Source: ABdhPJyyqHf5TtIca0jEkIiQoBdSItlXrT1YTp9DMq4OxATjwIcQJPFVA0nfwQhimDdC5ntl+7UjRw==
X-Received: by 2002:a17:903:204a:b0:153:a38b:977e with SMTP id
 q10-20020a170903204a00b00153a38b977emr18582817pla.126.1647961104782; 
 Tue, 22 Mar 2022 07:58:24 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a056a00188f00b004f7675962d5sm26276229pfh.175.2022.03.22.07.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:58:24 -0700 (PDT)
Message-ID: <dab530d9-53d2-3d7d-c9ac-44906ba9b386@linaro.org>
Date: Tue, 22 Mar 2022 07:58:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.0] hw/intc/arm_gicv3_its: Add missing newlines to
 process_mapc() logging
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220322102824.3474956-1-peter.maydell@linaro.org>
 <afdadedc-1d35-068b-ccde-12897f9bea34@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <afdadedc-1d35-068b-ccde-12897f9bea34@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/22/22 03:38, Philippe Mathieu-Daudé wrote:
> On 22/3/22 11:28, Peter Maydell wrote:
>> In commit 84d43d2e82da we rearranged the logging of errors in
>> process_mapc(), and inadvertently dropped the trailing newlines
>> from the log messages. Restore them.
>>
>> Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field")
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/intc/arm_gicv3_its.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
>> index b96b874afdf..d9c741f5fdd 100644
>> --- a/hw/intc/arm_gicv3_its.c
>> +++ b/hw/intc/arm_gicv3_its.c
>> @@ -524,12 +524,12 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t 
>> *cmdpkt)
>>       trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
>>       if (icid >= s->ct.num_entries) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
>> +        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d\n", icid);
> 
> (pre-existing: "%u" format, since icid is uint32_t)

Worse than that: 0x%d is going to be *very* misleading.
Should fix to 0x%x right away.


r~

