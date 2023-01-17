Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23A66E228
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHntF-0001TR-Sn; Tue, 17 Jan 2023 10:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHntE-0001TH-Hc
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:28:44 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHntD-0004da-01
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:28:44 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so19321336pjl.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pV8YubRvfs1LvZ0+nMt8Z3+EuTLnUS8a2NXL4iGk4ls=;
 b=AknyrSZ5rfvtKM4LnvBhMad3hca5GjZC6eKizUEe3BQn3siC1cLhquyuf7IFAuoE9o
 4bE/n8nNvofVOBMbbmbijhEKaxlk55KA/HQFr0H9l+mWehMWgNH1ExHnnjNmUo7Wdt0F
 KlNzbdc4EPx7ucQbxlBX9IfJza9gI7UquHldqcDzfZ5j59wRdZhMJwdSBaEd9//rtj7g
 t/Lr/TiAI6HsbwlgyrI+MOLrtQPOdEgIB1gp1e3Vk+oDWM+1vru3/7whqk0fNvalWpQa
 KarBHho/LbgE8UGyBjYKpmQD9J//ocS5c6sDhG18Km7o6efxXjwplGe3KiW2/MG5kT+D
 l8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pV8YubRvfs1LvZ0+nMt8Z3+EuTLnUS8a2NXL4iGk4ls=;
 b=4pnSEu1Q3J6ngehUv2vjpZHakiOAciQ7tTw+ojRlZRHVW3gNT3W1CNiWgV4xvt9o0Y
 sUBq7MqRcJhnWHrWOOhwIUAIj6OQnqzYwi77cJaBO+X6YQXwNaiIxzb4w58eq9bwi+UX
 ZEASK3WYOfo6l7KQ7VShnb5VW7GzrIWAGcFaCGp2Nj8Q4CdPZmSdzrRY7b97kwMTnAyH
 YbLpkaSRhW9dyf17/G9jtGuOpVQQd6s1RnKhLzhY7P02VP7tul842Mt/dfughBNLshdh
 Y0gz3DrvQgvTUMVJBPY9XV3dBlRIRzXB95OaMrRsTmV0b+dwa9H0UpxNu25lb6iFWhDT
 bfiQ==
X-Gm-Message-State: AFqh2kqorh7SClXffcC2qzQFLyb9F/B8x5bQe1SkpK8DEVZRUyiKilVy
 Qut6zPUvqXnq1Uh3n0SXsR9BYg==
X-Google-Smtp-Source: AMrXdXsKFdJDpqNeeDTuTSIDpuRoKaig/Vm/N/BL3dssbdAzuobGGMNIAY5+1ZiHChqMACIIoaB+ug==
X-Received: by 2002:a17:902:f312:b0:193:678:df13 with SMTP id
 c18-20020a170902f31200b001930678df13mr2259193ple.36.1673969321535; 
 Tue, 17 Jan 2023 07:28:41 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u9-20020a170903124900b00174c1855cd9sm21292075plh.267.2023.01.17.07.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 07:28:41 -0800 (PST)
Message-ID: <4194ead4-3768-5f79-d5ba-a30db64cf638@linaro.org>
Date: Tue, 17 Jan 2023 05:28:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] tests/tcg: Use SIGKILL for timeout
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230117035701.168514-1-richard.henderson@linaro.org>
 <20230117035701.168514-2-richard.henderson@linaro.org>
 <87y1q1cxir.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87y1q1cxir.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 1/16/23 23:36, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> There are some tests for which SIGTERM appears insufficient.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tests/tcg/Makefile.target | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
>> index 14bc013181..a3b0aaf8af 100644
>> --- a/tests/tcg/Makefile.target
>> +++ b/tests/tcg/Makefile.target
>> @@ -54,10 +54,10 @@ cc-option = if $(call cc-test, $1); then \
>>   
>>   # $1 = test name, $2 = cmd, $3 = desc
>>   ifeq ($(filter %-softmmu, $(TARGET)),)
>> -run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
>> +run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2 > $1.out, \
>>   	TEST,$(or $3, $*, $<) on $(TARGET_NAME))
>>   else
>> -run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2, \
>> +run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2, \
>>           TEST,$(or $3, $*, $<) on $(TARGET_NAME))
>>   endif
> 
> I'll queue this directly into testing/next, thanks. Is this to deal with
> the hanging tests on the s390x box?

No, I saw this hang on x86_64 host, nios2 guest.

Perhaps copy the text from the cover letter, about process_pending_signals blocking all 
signals, and remaining blocked while dump_core_and_abort deadlocked.


r~

