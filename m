Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C831065E1B3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 01:39:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDEGK-0003LJ-Hi; Wed, 04 Jan 2023 19:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDEGJ-0003LB-1O
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 19:37:39 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDEGH-0005Ux-Gz
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 19:37:38 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 c2-20020a17090a020200b00226c762ed23so431806pjc.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 16:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EDPPEJXxpOtTWdtmtpIMrWQXrIlH03hAJWp/W8lv3nY=;
 b=ZorqMxaOuZr/LSJSu5CmwKUSwSjLDubHbH6eiNx/utWIWYmzvkIz1wPAm6u3d8Hqrs
 1Suqtx6KtfwJkMYwx+UdfTjWjbaLpgJFHdXSqB/yd7X8JyjusJjlpXWzONiCVF3u4NNI
 JcUVW11/t7lYDBe9wmaeVd3+2efRYy2PXsGsPoZikXxHUSzkOPDfm1ZATwTXXJOHAO1v
 thFhJ5oKZm1FFNhfSt1gOPkr7sdqwgrJ0IMUmIrGJupdNp4+qv2gzC6hrGNMfxMuiInu
 s7BUm57gY81a1GhYr9iPol5en9ROXOhquPexdkYjFRPJNqhyUhOmTmOGoD3WEtl7Z6Bb
 Qsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EDPPEJXxpOtTWdtmtpIMrWQXrIlH03hAJWp/W8lv3nY=;
 b=BAEK6vGirk7yPVlHwjfrJBpYOmwqZY7aYXHqGXPAyhSon1vvaFGKaK1p3w7YqGq0Ja
 lcwpw0Pey9NIHfjHFKt3r0LYBa8FjlMa3v1GmsERRR/iBIu7bbBqMBmzNbX5/1xtGZC6
 r16u9zz6r3NMjpg4stp0zJd1RnSp+UJF6LdRo4YCurDFi7K9MdNlGsFu3dTcwrLOPT3D
 M34Xv/cUjwJ881VzdSgz/+X+t/Bu6WTlodkaT5i2bWlvXIZ38zCJUGqQZdz31RSkPjqa
 xRA7lIQT8ZaOA1gHEvte7c/7xyAVF34tCREjgpsysOuOCV6ccwzCXeqNtGIzNf48zXtj
 rGKA==
X-Gm-Message-State: AFqh2kqOUkNFpdzEXWtCWJEVoZajO3XlOPCowDlQpSxesGXjRkYRY9yk
 yIkhB+mf5KEE2zTRywB+phy+R8dkG18TDsKx
X-Google-Smtp-Source: AMrXdXs88sg2TMaMsyJprIdVozyhk5O/u+iZrNjQfWwzIYJkFv0D4MZhLIUvRuyYBvlkXMJR9WnK4g==
X-Received: by 2002:a17:902:c193:b0:190:cd21:1ebe with SMTP id
 d19-20020a170902c19300b00190cd211ebemr53659695pld.1.1672879054988; 
 Wed, 04 Jan 2023 16:37:34 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:92be:ce91:1417:6686?
 ([2602:47:d48c:8101:92be:ce91:1417:6686])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1709027fce00b0019141c79b1dsm24724110plb.254.2023.01.04.16.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 16:37:34 -0800 (PST)
Message-ID: <9376b5cb-10e5-30b7-ad6f-9ff1aae9685e@linaro.org>
Date: Wed, 4 Jan 2023 16:37:32 -0800
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
In-Reply-To: <3a43a0d5-acc3-cdec-4328-57fde042cfb0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 1/4/23 16:26, Richard Henderson wrote:
>  From the failures I see on the gitlab merge job, I think I need to resubmit with this new 
> test adjusted to loop less,
> 
>> +    for (i = 0; i < 50000; i++) {
> 
> here.
> 
> The failing jobs are --enable-debug, and take about 115 seconds to run manually on our 
> aarch64 test host, exceeding the 90 second timeout.
> 
> I'll cut this down to 10000 loops and double-check times before resubmitting.

Hmm.  Even this only reduced the runtime to 98 seconds. Curiously, the test runs in 1.8 
seconds with optimization enabled (--enable-debug-tcg). I'm not sure where all that extra 
time is going...


r~

