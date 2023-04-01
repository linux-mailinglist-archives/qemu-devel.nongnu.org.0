Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D223E6D33E3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 22:48:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pii7M-0006eu-1J; Sat, 01 Apr 2023 16:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pii7G-0006dh-U6
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 16:46:30 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pii7F-00034x-4r
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 16:46:26 -0400
Received: by mail-pl1-x634.google.com with SMTP id kq3so24603263plb.13
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 13:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680381982;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6cWxOZtks/uh5u+furLK/EcRw/7BV2wvdixm7ACnNHM=;
 b=fEApnGrr+tflp7MT8CNm3q4orOSltwuEgWwyfljhtxyuXn207E5//Cb/SMpgds36lt
 WHthfx3fwo3ANVOWS9+NQlYnWuWRNOyXxb0vwTj50z17bkYTsjgSqnOiJLowjAiYYUGf
 P3bupPhKaF8gPliVyYcaTembdHhiNIQMbeS4rYLMAKT2bc3+sfNDpmTBmVvQJ/L1xnlW
 L8dY10KfZ3orVgYMzPc6YNgYvzwMPRed+y5AfJH4biokU8ivM6MehtCqun2zG9NrLbr3
 EfFHZ5JjK8wd57mErezp0J4xl4Twmhthdl9G79L3K6YGOzNp0QStj+WaxStBSC7d1zgT
 n1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680381983;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cWxOZtks/uh5u+furLK/EcRw/7BV2wvdixm7ACnNHM=;
 b=MB5AZqAV7M7fJw1YzuLZpAUP2RwY6wh5FmfkbMQKWYWrqvxT0c1x/Isx/LeGfdR1Dw
 jDLNdzpYQ8SYaUpH/y78jUoyJiL04d3po+JbK2+D9QwJCli+eFJ5/ZKrrHk0DmN56vaC
 B6m/Ow7GKSr+Mt8911sWogh474mALbySTh0n96N5xTEPS4hyV/FGQSkQnlY2BSJpP95q
 bOltkjmDzF0YNwm49Wvi6z/cenavgnw2tWiwsfxFJ/vV3pe/a6pOud2LirxdRjP3qtmU
 3SDdSkvV6e9RcuD0T3OkqekWj2Z8OEHO0+52hGJWJ1Ssb42ORbQ4C+ypYjXu3o5gSscf
 nQTg==
X-Gm-Message-State: AO0yUKX11CVT65k3ld/BVQG5w+LvPuHD5LLDxPrSoEzUdluRXtjZY9cJ
 SFiYogr678fgltHBXp52MUjLYQ==
X-Google-Smtp-Source: AK7set/AHrN7r3cRJKQrlJOgMT+p5CcQTukh9fHLAGzl7vot3c5piSBRLzOdx15dFqPZd4IVg4NvEQ==
X-Received: by 2002:a05:6a20:50ca:b0:de:7389:9772 with SMTP id
 m10-20020a056a2050ca00b000de73899772mr25141726pza.57.1680381982634; 
 Sat, 01 Apr 2023 13:46:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a654c04000000b00513b3ea831esm3536536pgq.29.2023.04.01.13.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 13:46:22 -0700 (PDT)
Message-ID: <0bf61876-b730-6449-41e2-99869da6caee@linaro.org>
Date: Sat, 1 Apr 2023 13:46:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] accel/tcg: Fix jump cache set in cpu_exec_loop
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
 <20230401045106.3885562-4-richard.henderson@linaro.org>
 <55366094-d6bd-c692-bcbb-310f1e239ac8@iscas.ac.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <55366094-d6bd-c692-bcbb-310f1e239ac8@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 4/1/23 04:03, liweiwei wrote:
>>                   mmap_unlock();
>> +
> Blank line.

Yes, adding separation.

>>                   /*
>>                    * We add the TB in the virtual pc hash table
>>                    * for the fast lookup
>>                    */
>>                   h = tb_jmp_cache_hash_func(pc);
>> -                /* Use the pc value already stored in tb->pc. */
>> -                qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
>> +                jc = cpu->tb_jmp_cache;
>> +                if (cflags & CF_PCREL) {
>> +                    jc->array[h].pc = pc;
>> +                    /* Ensure pc is written first. */
>> +                    qatomic_store_release(&jc->array[h].tb, tb);
> 
> Whether we should add a qatomic_load_require() before this?

The load_acquire is already present in tb_lookup.


r~

