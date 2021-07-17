Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA93CC58E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 20:43:31 +0200 (CEST)
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4pHe-0001fd-9n
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 14:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pGS-0000WU-0y
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 14:42:16 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pGP-0008OV-RE
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 14:42:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y4so12065618pfi.9
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 11:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GW6Wux1Ov6c+b0ptKpIOk0a4n++0QnaZMXDnAwK/ssE=;
 b=QFwEereLiuAlUDdrz+3UD6P5NBRQyx3KfaTUg4ZMfhrVvizNwTN9hV3rjSbHbXZlHD
 WJtcmLNBSmanJm32E/epuquqDFgtHmOHXSZ/UnWNwbIi0FBbjPSif4DdA0AtKsT+eoue
 UO9LQu/Q8fKzZB+XVqeowJwjErUC343TaJHws/kiuId4B8BZ5KHV5MYvAJYc5Tj1JLDC
 umfFU7xHnmEQXmxIltW8QAlOvS0jGCIFfUnOeK2EcEQemoDpUUmePGiUIS6pPDA9tNnR
 dI1vuhxl1OT9UedW3OchDx635Vd8jCVNPvf9ZuTNpS+9JZJKI0a2l1Iiw8jGU7qhrR8B
 3WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GW6Wux1Ov6c+b0ptKpIOk0a4n++0QnaZMXDnAwK/ssE=;
 b=E5OTU7ptgxTdoGTrZYdhLWhXPYAMCetdYrpBXizJiKf442Mng5v7q3j0xXCHsG1wEc
 xtc1DuegMfDzQol37i7oBcQM2NqOENUmbB6K7GRPdIYhjGX9vSeJfMLFRf1YfDC1BDTy
 Hw6M49ApouXmprOsDSawLaBWfw7+jfFs/kwpS8+XhUmVlX5Q5enxdNtZJM8jIGfkggDB
 eSgk7w8TqWqovoE9XawUEY/zeXGYaxHgkNkuXK2DWU8BZuL3snGBTo6AbJy1AN96tcfv
 C5up8hL7KcXbExhBSPSQksAuNuhchS14+bzEuJvPOZdtn+rWwbjN3zTPFoM/yxbhBLiP
 EEzg==
X-Gm-Message-State: AOAM531A8QeQTH9sczquApmhSuioAPPSYgMkEOm9YzAaLinJtnjD7Uuz
 rt2j0dqzFjG2aA0leoquaaJjUw==
X-Google-Smtp-Source: ABdhPJxQxd/Y7WIZaLyMSt4gE+w+N8Jap/DD5RiYBK+Kl3sbgidA4yKAVSV1pvbdUUnQgxp69Wqr/g==
X-Received: by 2002:a62:584:0:b029:32e:3b57:a1c6 with SMTP id
 126-20020a6205840000b029032e3b57a1c6mr16412572pff.13.1626547331490; 
 Sat, 17 Jul 2021 11:42:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q2sm3602609pfu.205.2021.07.17.11.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 11:42:11 -0700 (PDT)
Subject: Re: [PATCH v2 05/10] accel/tcg: Handle -singlestep in curr_cflags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-6-richard.henderson@linaro.org>
 <87a6mk3kbz.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e94c9ae0-5f50-8979-36f8-d409e3631b16@linaro.org>
Date: Sat, 17 Jul 2021 11:42:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87a6mk3kbz.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 10:42 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Exchange the test in translator_use_goto_tb for CF_NO_GOTO_TB,
>> and the test in tb_gen_code for setting CF_COUNT_MASK to 1.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/cpu-exec.c      | 8 +++++++-
>>   accel/tcg/translate-all.c | 2 +-
>>   accel/tcg/translator.c    | 2 +-
>>   3 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 70ea3c7d68..2206c463f5 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -149,7 +149,13 @@ uint32_t curr_cflags(CPUState *cpu)
>>   {
>>       uint32_t cflags = cpu->tcg_cflags;
>>   
>> -    if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>> +    /*
>> +     * For singlestep and -d nochain, suppress goto_tb so that
>> +     * we can log -d cpu,exec after every TB.
>> +     */
>> +    if (singlestep) {
> 
> Hmm we are testing a magic global here and looking at
> cpu->singlestep_enabled lower down. We have a transient singlestep which
> is turned on an off via cpu->singlestep_enabled and a global as a debug
> option. Can we rationalise it further?

Not sure what you're asking.

cpu->singlestep_enabled raises a debug exception after one insn, whereas singlestep merely 
exits the tb after one insn.

What is it that you want me to rationalize?


r~

