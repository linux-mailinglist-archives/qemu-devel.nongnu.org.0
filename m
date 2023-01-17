Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D866E745
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 20:53:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHs07-0004em-Ro; Tue, 17 Jan 2023 14:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHs05-0004ea-Nj
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 14:52:05 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHs04-0002lY-2n
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 14:52:05 -0500
Received: by mail-pl1-x635.google.com with SMTP id c6so34656054pls.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 11:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z0/GPm3Nkjqx9lQe6WEbKt/MrQLcbOLjny2XnXReit8=;
 b=wWjJMIpgxOJfaUeZ95T4N3NHa4m2GXyCeALKv5n4yi18e0VagVwMWC18Z1wRvQmO8K
 g6ceN7uFRiBH+a6dYra7uEwrPCdl76OCyYrYqRGr1xNIQayUu5LoO2LmN09sFEQy1JLm
 /WtJoFxkm2DqiYyFrDFx8DH2rpgJEZ2UV+OFq8D7u/V3ba6+9FlI07PJg8HwPJQVC1nM
 zX2K0IM9xeh+FGDYJy0XxWPH3TmSlWW47tVzXF7py4dWvmMfzcWMqXo7r2e573Mwxn4D
 mGjueI2YKRVK2wTkG+xAymb7aw9lPjRfkfL26qcqGNjBIaxdhXnDiJMFh+A0cT4EeRzK
 1atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z0/GPm3Nkjqx9lQe6WEbKt/MrQLcbOLjny2XnXReit8=;
 b=YXO9TmzbjUz690VXdyJj1BQ8ZhuGeLgZk8i1iQJ4kUeMVTY7O3YxgPbod3pqEUgBLA
 k1ng/rO6oF8pT9HEsKWOyaoxrXBBx8VhlngBtvkYcPCQnQk3bXwhGCZ1WIhjw/Xz6g2q
 PNoGAWBz5ZdKNDb2AoK4AolEuP5zCa3ghXkw/or4R8QoTfFLGxmJGqHJlGBLSJsu26Uu
 etqP/nAKauSGk/Nl88dyZ+1sr0R8Seex187hlwRT0X246KGJXnR/YcTDieMDlqPb20WF
 Zv/3vIwn6+c+VxTJUl/5eNs6bZk4s3w8kJ3B/K11hYPMw3l8jG+BSUkIv4fg3b/AmK0y
 3N4A==
X-Gm-Message-State: AFqh2krQosn3oYPAuNu5eNk4yiHbt9ZhRtf/nrwQN6GLAkNb1SfZS/6X
 EiydJP+CtXwh1ZU3lclfiKXCDQ==
X-Google-Smtp-Source: AMrXdXvwYT0QpdzoiODJIaxheerHAbWDsC4lI/2lDb/4ZJFcHEsRa8IBtO/XkalZDZ2RRJyx4OqOKg==
X-Received: by 2002:a17:90a:3186:b0:229:9369:9d94 with SMTP id
 j6-20020a17090a318600b0022993699d94mr4301819pjb.30.1673985122376; 
 Tue, 17 Jan 2023 11:52:02 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 fy11-20020a17090b020b00b00219cf5c3829sm1072973pjb.57.2023.01.17.11.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 11:52:01 -0800 (PST)
Message-ID: <11e62d03-e070-90af-4aac-071e94544fe5@linaro.org>
Date: Tue, 17 Jan 2023 09:51:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 14/22] tcg: Always define tb_target_set_jmp_target
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-15-richard.henderson@linaro.org>
 <8735892fl6.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8735892fl6.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/17/23 08:14, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Install empty versions for !TCG_TARGET_HAS_direct_jump hosts.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/arm/tcg-target.c.inc   | 6 ++++++
>>   tcg/mips/tcg-target.c.inc  | 6 ++++++
>>   tcg/riscv/tcg-target.c.inc | 6 ++++++
>>   tcg/tci/tcg-target.c.inc   | 6 ++++++
>>   4 files changed, 24 insertions(+)
>>
>> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
>> index b8f3b0c634..b21dd561fa 100644
>> --- a/tcg/arm/tcg-target.c.inc
>> +++ b/tcg/arm/tcg-target.c.inc
>> @@ -1964,6 +1964,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
>>       set_jmp_reset_offset(s, which);
>>   }
>>   
>> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
>> +                              uintptr_t jmp_rx, uintptr_t jmp_rw)
>> +{
>> +    /* Always indirect, nothing to do */
> 
> Should we assert and then remove when we fill in because some targets
> never gain this ability.

The very next patch calls this function unconditionally.
So, no.


r~

