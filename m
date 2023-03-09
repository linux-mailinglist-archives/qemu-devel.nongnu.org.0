Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD1F6B2AB5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJ7T-0003tU-2V; Thu, 09 Mar 2023 11:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paJ7Q-0003sC-HI
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:27:52 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paJ7O-0002Ag-6m
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:27:51 -0500
Received: by mail-pl1-x62d.google.com with SMTP id y11so2589383plg.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678379269;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+dz8Zkhp10i9gHGlyoh4wGtRbFz6km/a+n3dwEB4jXk=;
 b=dIl+MxYC7SwtEFqoyD0Ol60PHyG3cao1/fDs8yQ8ufQ3Rvti6IunBOLR3Eh1lj0Cq1
 5Dz+A9KucRJE0SfK3+b9nfnjHWMS0xSNjWd3QFilb0dO5Rs+pATQFszZpJlc5Pk3oVJY
 DHZOK2wmONKniONsB7WtbLMXLygDWVliE7F0yEKc3WSegZP7hgwMECVfk7p7EVOYmtv1
 NnEWt32jG+NY1f3pz2nFIzB4Qn6H4eaI3pwn3de39GcV8scK0+XkMN0z06EcF5Flb+HZ
 Zb2t1EqOVB/u2QR7dhThCnaw37GsM2ASfToh2zhJXWR05JsASvk9a7igjeX8QA2mJ3+W
 tMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678379269;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+dz8Zkhp10i9gHGlyoh4wGtRbFz6km/a+n3dwEB4jXk=;
 b=yyeMwueN0lrroXu5uM4W6KWiJszgx+zBcOXA2/LulBYykgiOoYLy8KJkkcydeSqpfC
 qTveY4lImdDisySjrGFrFdRxbrs0xIOq98J8LIU+BFfPLBBXryWhHYv36SspcNqATrom
 AmQuC3Fn7NpyfXMpbQbBoI5AnUfdYpu5FzE1oDKOeU16hKIOXJxf+Xm7z3MeoiJ+jhez
 77tB4JaKazK/uv5PcMi1bOv8cHMO0b7wB0MpwWlnKPS9/sYOrB4cYkD5q5iPA+u+WKyH
 WCiMUnwukkZyppiR6bwto44tv6dRiKDitazgeRqzn1zlOcQUOzDCrotNd6VVyL7Q447x
 kQLQ==
X-Gm-Message-State: AO0yUKWlstk90gIrsHkMtJrqMKE+ucjsUCruyp7RGy93kFS1F/0YVsTB
 KDVMcjR/lER0qAXUxun3aEnzBw==
X-Google-Smtp-Source: AK7set/BepayMgLaaWusFeKJoV8wYZoy+m/6hgKOGFDw2xipkbx48aRBCOVJ9U3CCaTdI3ZctleTxA==
X-Received: by 2002:a05:6a20:7fa8:b0:cd:1a05:f4f4 with SMTP id
 d40-20020a056a207fa800b000cd1a05f4f4mr27314927pzj.19.1678379268596; 
 Thu, 09 Mar 2023 08:27:48 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:bf7f:79a0:a976:bdaf?
 ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 y20-20020aa78554000000b00593a1f7c3dbsm11756204pfn.10.2023.03.09.08.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 08:27:48 -0800 (PST)
Message-ID: <9e6b9f5c-452b-2c0a-d9fa-9f1e100b8542@linaro.org>
Date: Thu, 9 Mar 2023 08:27:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 12/25] target/m68k: Reject immediate as destination in
 gen_ea_mode
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-13-richard.henderson@linaro.org>
 <20edcf58-d5f0-4b11-06a6-7b811d30586d@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20edcf58-d5f0-4b11-06a6-7b811d30586d@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 3/9/23 04:32, Laurent Vivier wrote:
> Le 07/03/2023 à 19:34, Richard Henderson a écrit :
>> In theory this should never happen, as all such instructions
>> are illegal.  This is checked in e.g. gen_lea_mode and
>> gen_ea_mode_fp but not here.  In case something higher up
>> isn't checking modes properly, return NULL_QREG.  This will
>> result in an illegal instruction exception being raised.
> 
> NULL_QREG generates an address exception, not illegal instruction.
> 
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> Cc: Laurent Vivier <laurent@vivier.eu>
>> ---
>>   target/m68k/translate.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>> index 44c3ac0bc3..fc65dad190 100644
>> --- a/target/m68k/translate.c
>> +++ b/target/m68k/translate.c
>> @@ -894,6 +894,10 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int 
>> mode, int reg0,
>>           case 3: /* pc index+displacement.  */
>>               goto do_indirect;
>>           case 4: /* Immediate.  */
>> +            /* Should never be used for an output or RMW input. */
>> +            if (what == EA_STORE || addrp) {
> 
> Why do you check addrp?
> 
> What happens for an instruction that provides addrp to SRC_EA() when it is used with 
> immediate mode?
> In this case addrp is unused, but it should not trigger an exception.

Because addrp is *not* unused with SRC_EA.  It is a signal for a read-modify-write operand 
and addrp will be passed to DEST_EA.


r~

