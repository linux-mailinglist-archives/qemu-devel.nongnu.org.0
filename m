Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A206E585680
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 23:32:49 +0200 (CEST)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHXbE-00037F-JP
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 17:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHXYE-0000p6-IQ
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 17:29:42 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHXYC-0006Qs-V4
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 17:29:42 -0400
Received: by mail-pl1-x635.google.com with SMTP id w7so5646069ply.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 14:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mOFuDuZJS1strw8esF9QxwK/Zp9MPZOlEJJ2ebwurpo=;
 b=nchG43yDkkJf5sEHhFYX1SuU1UNud9wG5d7PY5401lVQxuQV3p76aY6xqLgzTzGIar
 UVtHR/VRyyYAtzeRjjzM0eoRZXGg2AilvhZJzqo0ToZu9IEK1h8KeXWIW4nkPU8f7Yhx
 PONne5gdhdwc/PIqJLIuEbrD8anwfMxP2QOuKy/8YFXFsOO2/KXxYgA21Fx6mcbha+7Y
 rAi+jwIFtK0RHYlLf4k3Lm8iAgZHHSqyQpNTc9SZmqE9/RPHYjQpLi/hlCNZsiDK/XmP
 mPPCv/bUwD2dLmgPRVsUUF0ya9bKpzvGzxg9bAqMNKmjsvLvgsNva6OEYjxmMIsJWx7T
 xnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mOFuDuZJS1strw8esF9QxwK/Zp9MPZOlEJJ2ebwurpo=;
 b=eqzEwhTlt2eMBQbdX9pYs0Iafcn2imaZ8D4nxfajDnjp6RN5a4uft2Zm/iux1MT/Dg
 HwDcARB3DAaiEBMCcyUdfKG0+6HgfCs8YUjNM0CSn44C9Bj7iUl1qvETzA2UyJVwlpRl
 6Fim9OygyYWPmpW11tBYF3WEiTKN/RxCH5Y1o940Z5hfHM/RTPFcPKzbI4Tuml8r5+v5
 q2yk3K6tf6D6UHigClm/YZvbOnHWO/zbZRT4G43HzWLq6s7NVxTgnREjJ/+xIjfm42lT
 pj/EgQlYLqU8Xgl1s+pg3v+Yiq1xqZ89BCSjk5Al+9YAOEohdPLIL0/2Mq2Z2aqpGgD4
 M95Q==
X-Gm-Message-State: ACgBeo2cuo1cnPh5eOzfmwwg05pqF5mspkFc29oGVucbIYGsdMzRgtGe
 SQRtUOxJI6RRs45RMSzB7FiVYQ==
X-Google-Smtp-Source: AA6agR5gA8vmSdM1Ei7hqNc7eSTFJX0uuJRQEBpzLSqp3DkYEMICwtGPcf8u4pYY/YrU7K1+v7hP1w==
X-Received: by 2002:a17:902:6ac5:b0:16d:1664:39c9 with SMTP id
 i5-20020a1709026ac500b0016d166439c9mr5681173plt.104.1659130179318; 
 Fri, 29 Jul 2022 14:29:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:a427:660:88d4:8559?
 ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a17090aea0b00b001f10c959aa2sm3461847pjy.42.2022.07.29.14.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 14:29:38 -0700 (PDT)
Message-ID: <c351b06e-e2d2-5190-df87-c94d56cdb67a@linaro.org>
Date: Fri, 29 Jul 2022 14:29:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] linux-user: Use memfd for open syscall emulation
Content-Language: en-US
To: =?UTF-8?Q?Rainer_M=c3=bcller?= <raimue@codingfarm.de>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20220725162811.87985-1-raimue@codingfarm.de>
 <20220729154951.76268-1-raimue@codingfarm.de>
 <d03974ec-4b8b-2ba2-cfe8-5c235d937b76@linaro.org>
 <dd5df8a5-c406-43a0-7557-0c1653f70de6@codingfarm.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <dd5df8a5-c406-43a0-7557-0c1653f70de6@codingfarm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/29/22 14:19, Rainer Müller wrote:
> On 29/07/2022 18.01, Richard Henderson wrote:
>> On 7/29/22 08:49, Rainer Müller wrote:
>>> +            /* create temporary file to map stat to */
>>> +            tmpdir = getenv("TMPDIR");
>>> +            if (!tmpdir)
>>> +                tmpdir = "/tmp";
>>> +            snprintf(filename, sizeof(filename),
>>> "%s/qemu-open.XXXXXX", tmpdir);
>>> +            fd = mkstemp(filename);
>>> +            if (fd < 0) {
>>> +                return fd;
>>> +            }
>>
>> We've been using g_file_open_tmp elsewhere; probably good to follow suit
>> here.
> 
> That seemed reasonable at first, but with regards to error handling it
> gets a bit complicated.
> 
> The suggested g_file_open_tmp() would leave us with a GError only, but
> to return something meaningful to the caller we must set errno in this
> context. As far as I can see, there is no way to convert back to an
> errno from GError.
> 
> With g_file_open_tmp() we could always set the same generic errno, but
> that would hide the real cause completely. I debugged this problem with
> this message that was confusing, but at least it gave away a hint:
>    cat: can't open '/proc/self/stat': Read-only file system

That's a good reason.  Let's leave this alone then.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

