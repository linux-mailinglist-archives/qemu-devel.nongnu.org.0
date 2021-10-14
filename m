Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A35542DEC6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:58:51 +0200 (CEST)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb385-0006uy-69
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb2pW-00033d-Fj
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:39:38 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb2pU-0001Yo-Rn
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:39:38 -0400
Received: by mail-pl1-x635.google.com with SMTP id g5so4456315plg.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SgitbXgzY9ah7iLRULN8e9Eu0gKVxrlOCmd1cV+HGKI=;
 b=Z+pgTwboLcKN736RGQkOGkd6rVamT8K1fP+/4RtHWW8v+P3kvZ8z48mnnOPjyj4Yw2
 oJjtKVfyxm3cNMgELFxDWflPBXIloqMagQcytjqQjuDmstjYyLxXzVphQGh7P6BK/TKN
 CLe/uenZWGxkTZFpHUJE63W80P4BlPB8Q5/SJ0NG70ZIVmK+1ujYPVIIuxF7ktSxlO7b
 jnituNWKj7/Q07tLrkbE8P0xv9xAzxpbXbHGef8TJMy9B2xbLeoDbDYJsOnEUN2opc96
 dqRfgjXF/YlPoNB1vI0hjFRe30CTR04sL3upTwFqxq/AucUwbUUrzg5traJqzDTTLO/H
 ZbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SgitbXgzY9ah7iLRULN8e9Eu0gKVxrlOCmd1cV+HGKI=;
 b=8ONE0yI39frH5J3+kc3VnC09Cm8ZMA6v03qO3Cn17zHJuFbT+RstN+UlIEJnUO6PnG
 lZLGiEeaxe33TU/UUmakD+MVrgubpsHUFdHNje63sLgaoCs4vcJQ3xAQDOkOj8hIww5N
 cHTRf2sUv4i3TZ8OCeUMoUdc0J7IXpFdPUxmt3A+P3o/UISWMFHj6L7ttcVNZ0zPtMZC
 N5rngXhrwGQFXGm2D7DcxjkCS+JjDNhwO3yeikLhd0A95PVONVRm0P9kHqBwyL5YOARH
 0or/0ty83DjYPiU8nwege+2M6wxFGejUHXABhlzagtsDCUlQWw7ujH5gemLZ8+znVIU8
 1IKg==
X-Gm-Message-State: AOAM53107IkTVAu/L1NdLVtIAV2O83Vdw2ovRRs7/9Yfc4m83TQ01LYY
 kyXy1A6TQrukEjQu2MbdHojxwA==
X-Google-Smtp-Source: ABdhPJwL9MYtBqV/1Ks+kFra0VprgifRMV4Km3ab/gKAbpNaV9Dkk5O1h5+QQAUN95ERg/7BrhCp+A==
X-Received: by 2002:a17:902:8f90:b0:13e:a44e:2d3c with SMTP id
 z16-20020a1709028f9000b0013ea44e2d3cmr5694542plo.85.1634225975207; 
 Thu, 14 Oct 2021 08:39:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a20sm2726621pfn.136.2021.10.14.08.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 08:39:34 -0700 (PDT)
Subject: Re: [PATCH v2 09/13] target/riscv: Replace DisasContext.w with
 DisasContext.ol
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 qemu-devel@nongnu.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-10-richard.henderson@linaro.org>
 <bb08b1eb-ab48-165a-ed49-72a9bf22fd75@c-sky.com>
 <420e773b-ca49-9130-8497-971269f6929c@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4386f5cf-71f8-f90c-3cd7-14c8e12c62b2@linaro.org>
Date: Thu, 14 Oct 2021 08:39:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <420e773b-ca49-9130-8497-971269f6929c@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org,
 fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 1:57 AM, Frédéric Pétrot wrote:
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index 5724a62bb0..6ab5c6aa58 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -67,7 +67,7 @@ typedef struct DisasContext {
>>>           to any system register, which includes CSR_FRM, so we do not have
>>>           to reset this known value.  */
>>>        int frm;
>>> -    bool w;
>>> +    RISCVMXL ol;
>>
>> Why not directly use the xl?
> 
>    Hi Zhiwei,
> 
>    I am not speaking for Richard, but my understanding is that 'ol' is linked to
>    the instruction being translated, suffixed by 'w' in rv64 and 'w' and 'd' in
>    rv128, while 'xl' is the value in mstatus (or misa) depending on the register
>    size of the current execution (mxl, sxl, uxl).

Correct.


r~

