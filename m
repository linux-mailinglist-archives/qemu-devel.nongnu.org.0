Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E393903F5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:32:26 +0200 (CEST)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llY6b-0000qo-JI
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llY2r-0003bK-9Y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:28:33 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llY2p-00085h-DW
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:28:33 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 gb21-20020a17090b0615b029015d1a863a91so13353838pjb.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lv7lk7siHNvlsrrkP6v0tE7NK3VU3UzGqafpB+GqhCE=;
 b=rS60gKCdLa7Kuo2PAonZdjeZFYW2vpGgyRX7Y/xaTk8m24r0pWyg/r303O7408Y/LW
 BAfF2qk1BuykppDBCBa5cj2vcxg5yCM7VqFGo96JEVp/v+U4t9PWqZ3JAtW9fYTpEoFC
 WBAd3H6WHx0m9BOsZxqw6Rkzaj5s8PjdNGMKnxeF72zad3Q7VLI/sJvRLLYpV4U5QeDR
 SnS+fGJSZJArca3dalwHm4R1uMPnKa7j7Uc38++Lx1+u2HM4IqeHKQ3h9a3D/YJfnE+N
 RIiSZJNyUPVkXWL2RvdG+QoOoScDzNGkg+drtwuxKJArXlHnBGeL/O7iZG22ZRkwC/U/
 9idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lv7lk7siHNvlsrrkP6v0tE7NK3VU3UzGqafpB+GqhCE=;
 b=r5qqi0IN56HtPFrwj9nfV1pWl4AIujm1s2j6JMzlTQPyR7nRGKN4fSjxsKxIEZ4OMj
 m14Ia1G0XEUEz5DBWwFKnGTLjrA51qE/KSq7jXHKZqt8YJzINl9weaEWqyOOtRix33b0
 vZtZocrMXD8dxyaYoGLCpZN6lRl1pOwcy67qkPZCOvYHJxw+v1Tayf1y0Op+M7v26++i
 XzKGR5tdKNkLtO9IJxt5unT/GLSlg06qTOtR1V4B5CkjIkXyJQhwX8laAbKfe+qea/Jw
 1xYMzGLLDoWHULKqsLnkeW+WQ5bciI6dQMGMfT0HFPl4TFODZlgh/peKf85D2McHYZr6
 RS/w==
X-Gm-Message-State: AOAM531NAFf5nvQAMCzKONgB1LMM1PfQChDw//qr8PP20XjeIMREmR47
 wZr5XM3tefKqMdDGsdPmAOPv0A==
X-Google-Smtp-Source: ABdhPJxP5pkcU7nYN9eiRIc3yfQ4Y4JOoxrJwvrSB3HJSr+YJYH/NFLIsy9/k8oMSDWhffKIZhVtCQ==
X-Received: by 2002:a17:902:ee8b:b029:ef:ab33:b835 with SMTP id
 a11-20020a170902ee8bb02900efab33b835mr30531089pld.27.1621952909476; 
 Tue, 25 May 2021 07:28:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 iq16sm12743678pjb.31.2021.05.25.07.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:28:29 -0700 (PDT)
Subject: Re: [PATCH] target/nios2: fix page-fit instruction count
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <162072241046.823357.10485774346114851009.stgit@pasha-ThinkPad-X280>
 <7ff230df-8173-1dae-3750-a40b0588f13d@ispras.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa23def1-fdf1-905c-94fc-954fea420762@linaro.org>
Date: Tue, 25 May 2021 07:28:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7ff230df-8173-1dae-3750-a40b0588f13d@ispras.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: marex@denx.de, pbonzini@redhat.com, crwulff@gmail.com,
 qemu-trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent, how about through trivial?

r~

On 5/24/21 11:40 PM, Pavel Dovgalyuk wrote:
> ping
> 
> On 11.05.2021 11:40, Pavel Dovgalyuk wrote:
>> This patch fixes calculation of number of the instructions
>> that fit the current page. It prevents creation of the translation
>> blocks that cross the page boundaries. It is required for deterministic
>> exception generation in icount mode.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/nios2/translate.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
>> index 9824544eb3..399f22d938 100644
>> --- a/target/nios2/translate.c
>> +++ b/target/nios2/translate.c
>> @@ -829,7 +829,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock 
>> *tb, int max_insns)
>>       /* Set up instruction counts */
>>       num_insns = 0;
>>       if (max_insns > 1) {
>> -        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & TARGET_PAGE_MASK)) / 4;
>> +        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & ~TARGET_PAGE_MASK)) / 4;
>>           if (max_insns > page_insns) {
>>               max_insns = page_insns;
>>           }
>>
> 


