Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0822165E50F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 06:26:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIki-0002Pu-QO; Thu, 05 Jan 2023 00:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIkY-0002O6-CI
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:25:10 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIkV-00017w-4x
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:25:10 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so972944pjq.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 21:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ShahCVqv2n3B3yzn+xxm6IkpmjhMQnUgUR9Z9jfTFlg=;
 b=mTGlZqv2Ztz/OfKbz/uw0e8v69KpWh8MuChTjcYKxAkfqOH1WjmrfeC9TsGrPY1nxb
 ied0pr5X7UUM53Usxwt727rkgGY8VRhklsAG2YSzkCeCAjQGVIsH7ixRzCKuB0qfX2Et
 li4Rhpxs6S1oTEx7jBGiziMhuXkd6j3tBPWurl23Kru5f49lGff1k67QBDdYpMPKQlsi
 ojhJn685E7AMy1KHiq8oYw5h19V6FAqpMwnlaqNKO3j1VzuUox15I8i4zUcW9mWSZa2E
 5veUcoumpoDTQ07kPCLL34QuWwIsSxyaBhP4M9KvzCT/gRYF2p3zjGnNXhd+XecWHh2l
 yP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ShahCVqv2n3B3yzn+xxm6IkpmjhMQnUgUR9Z9jfTFlg=;
 b=KiZajpbFhCm9Jw/EdnZEmxnm9gove1oVfxAT0FOQE1a9dErF9wGuUb+cPoUCJQmPXt
 qssnRe6LHpariZjzy8pC1OvFNXSHKAxbbDYYn1cdslhzKj8piJAf3pnSw9BGEyOsxSIg
 S4HLXIWP2hS3qTnRSamj4zfGjbXvb4tRrdy78ZntOvMn9lBjF9J4um8rd5Vd9Awgo0Q4
 UPZx7pDueK/7h7qattSURwNGYLZ2lIXyVFugUo2ElNkIdtYLRyGJTMXOsYD/M1Afpa+0
 SiXn+ReS1rVqqxv7VYpb7CG24z7ScGfbLNsRbWDLNMSKaeUGvcvT59CLElJ2OoJ3ZEsj
 VQMw==
X-Gm-Message-State: AFqh2kq1s3r/F+McWXWLDefR+uEg58HE1OcO5orUfDKCCNC8dIJorJWO
 Pv02Ajf+lMc5TuMjLeVBaFvyq328ly/Kvfte
X-Google-Smtp-Source: AMrXdXtqyJJAFPeInJozDu0witi2gGExi+n2wcMd5nEX0ylXX82rJn09DpeGAGLOtrCVJjuUhjrH2g==
X-Received: by 2002:a17:902:f604:b0:192:55ab:88fe with SMTP id
 n4-20020a170902f60400b0019255ab88femr56606141plg.56.1672896299574; 
 Wed, 04 Jan 2023 21:24:59 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a17090341c300b00192f4fbdeb5sm1544457ple.102.2023.01.04.21.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 21:24:58 -0800 (PST)
Message-ID: <8ba170da-3ffa-ffe9-edae-fbfa82c116cf@linaro.org>
Date: Wed, 4 Jan 2023 21:24:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PULL 47/47] tests/tcg/multiarch: add vma-pthread.c
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
 <20221230000221.2764875-48-richard.henderson@linaro.org>
 <3a43a0d5-acc3-cdec-4328-57fde042cfb0@linaro.org>
 <9376b5cb-10e5-30b7-ad6f-9ff1aae9685e@linaro.org>
In-Reply-To: <9376b5cb-10e5-30b7-ad6f-9ff1aae9685e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 16:37, Richard Henderson wrote:
> On 1/4/23 16:26, Richard Henderson wrote:
>>  From the failures I see on the gitlab merge job, I think I need to resubmit with this 
>> new test adjusted to loop less,
>>
>>> +    for (i = 0; i < 50000; i++) {
>>
>> here.
>>
>> The failing jobs are --enable-debug, and take about 115 seconds to run manually on our 
>> aarch64 test host, exceeding the 90 second timeout.
>>
>> I'll cut this down to 10000 loops and double-check times before resubmitting.
> 
> Hmm.  Even this only reduced the runtime to 98 seconds.

Bah.  The testcase didn't rebuild as expected.  Building from clean, the 10k loop 
completes in 20 seconds with optimization disabled.

I do wonder what the build time / test time trade-off is here, and whether we should be 
doing much -O0 testing in CI...


r~

