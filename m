Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0265FB809
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 18:12:39 +0200 (CEST)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiHrx-0003k3-LY
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 12:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiHYf-0002vb-Ca
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:52:46 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiHYc-0006QU-Nn
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:52:41 -0400
Received: by mail-pg1-x531.google.com with SMTP id u71so5633466pgd.2
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 08:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6nFglZ8MgjP+W6rdlMRQtongSGxE69d7vg8Hx3SmH3A=;
 b=wNpKYeO2BvpIMPUyKA0oddPYX8AZ6n9b+sqEbmGW4BahHqLGKb1rshzajXr6gt+bhH
 aujRN3s3E5QOvOSUi8dBfB743+LX4HerK6wiCuezCjPVxDJJ6stJO0uCZufU2V4p2C5W
 DqLD6X3VZufM53iJrkO8g27qeFWtJ1A+d5H9KEizDWdI4OCLmejEfZqj5x1xYcK9+8Zv
 1ZWw6sEIP1MeDS3F1j+Fke0xSBuGZysE6qy8KtnHY7jouG0+aErOeXx1UZGHk+G2hIzv
 rtCNbM3q3nBvx9BQJNd8ypvu04cmranGwXgllfQG5Z1dR6r6+K8MRvfw/m/1931tg/cS
 MXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6nFglZ8MgjP+W6rdlMRQtongSGxE69d7vg8Hx3SmH3A=;
 b=6LNg9aQ4rLXNxNZ+5IGzTk8diAoP5MgXZ2Wc0XpSPOpzSWcnMAqowBSqkCqagnu+1v
 lQV0WKapnkfe3qo7Au2k2jsyt+HN7pla1vHsRCrjDkUStEZgia6sObj4KgHmJFYSWs+n
 0rU7SsMiXxfHl7fTyLvxzCDKbSARdgXsZ+JEud54GyRqhf+DQrDYhWiJsxwiKirmPSrL
 7retVAkQGF0GOtwX8In+A+H3SNZV4JLdEZ4igO6+8Mjt3UMVL6DiNgp6uipt7yIyBxsz
 P9A4NqUIhZtwIG2eQwLRSYz6t9d11FVF0V0kzsGkkkVxVO9JNfDpZ5IPDMlJYUNOyR47
 ipZA==
X-Gm-Message-State: ACrzQf1lJ3IIr3t1/Ns+YjLBB2E6yq8X3WEGsT9LB6lcpHRH5/wA95k4
 pbV1e2HPqQhl05780+pHgn/ZFw==
X-Google-Smtp-Source: AMsMyM7hmPqeka7JLoz/0u4PxTshkvqDGo2l4A1dqnkO19xsNR0VU/nhTkmTzDmG/N0T4Uda/eT2kA==
X-Received: by 2002:a63:5243:0:b0:43c:96a:8528 with SMTP id
 s3-20020a635243000000b0043c096a8528mr21350905pgl.47.1665503557071; 
 Tue, 11 Oct 2022 08:52:37 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:67e1:640e:ccb8:1a4a?
 ([2602:47:d49d:ec01:67e1:640e:ccb8:1a4a])
 by smtp.gmail.com with ESMTPSA id
 jm5-20020a17090304c500b0016be834d54asm8754025plb.306.2022.10.11.08.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 08:52:36 -0700 (PDT)
Message-ID: <3dd4aa84-8921-2b84-6cc1-c3a3b2bdd6ac@linaro.org>
Date: Tue, 11 Oct 2022 08:52:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-9-richard.henderson@linaro.org>
 <CAFEAcA_0ZbNpZKyWdQWhh80dc+Y2R08UH9RWWzBOVOsDdWPi1g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_0ZbNpZKyWdQWhh80dc+Y2R08UH9RWWzBOVOsDdWPi1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.934,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/11/22 07:51, Peter Maydell wrote:
> On Fri, 30 Sept 2022 at 23:05, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate.c | 29 ++++++++++++++++++-----------
>>   1 file changed, 18 insertions(+), 11 deletions(-)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index fd35db8c8c..050da9e740 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -276,11 +276,16 @@ static target_long jmp_diff(DisasContext *s, target_long diff)
>>       return diff + (s->thumb ? 4 : 8);
>>   }
>>
>> +static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
>> +{
>> +    tcg_gen_movi_i32(var, s->pc_curr + diff);
>> +}
>> +
>>   /* Set a variable to the value of a CPU register.  */
>>   void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
>>   {
>>       if (reg == 15) {
>> -        tcg_gen_movi_i32(var, read_pc(s));
>> +        gen_pc_plus_diff(s, var, jmp_diff(s, 0));
>>       } else {
>>           tcg_gen_mov_i32(var, cpu_R[reg]);
>>       }
>> @@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
>>       TCGv_i32 tmp = tcg_temp_new_i32();
>>
>>       if (reg == 15) {
>> -        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
>> +        /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
>> +        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);
> 
> We could rephrase this one also to not do the "pc_curr - pc_curr" thing,
> the way we did for BLX in patch 6, right ?

Ah yes.  I missed that in revision.


r~


