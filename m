Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300096A1235
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJL6-0006wM-Hs; Thu, 23 Feb 2023 16:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJL5-0006vr-11
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:41:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJL2-0004a2-T8
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:41:18 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so455088wmc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=orvUdl7Yoqh+l75M4NGCyCqx8juccnOLmhhHtFnUiYQ=;
 b=eWcLb6SkbwuVAk3nlRCT7+sVoFPaOwGyQS+KUlKChAHsjd3fEvM5ygLU7CtCtxq4uK
 hDIEuBFX0hq6xAXi6yofKfsdvIfdQnn5lejV7W7lQKRhk39wieN8Hgzbbk6hq3xqzuB3
 WTcnLfPp1SnUYngzOOp90qMYJi1IYMtk9xERNC9R7OvgMSvA/7Pj+lg4MQ4HiLJfNdKt
 xxruo4BZGRiuCTL2IEOs6EXP3pDteg+YW9lwLa8Pj/xZfXjrE50v5iZ/Hs3LBdWUUHwH
 vye8i3IdvSnQ2qcbi5QnqEhwRxgrzUWDmwFW6EOA2lOMWu/+8PNjn+qEKjESqCszz8MU
 QaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=orvUdl7Yoqh+l75M4NGCyCqx8juccnOLmhhHtFnUiYQ=;
 b=B03y6HvKpH8fcj4XtGJB6TPwjeg4QoxGXSde1gVVIwaAFFGsecydmd6JRk2NQHeX9b
 GkRJi+YUTTj7pGGWjoVpihgXc3zykA3GITi4u0yF+nizaiyFfe0nQZFD96k5o092CEmn
 v0Y4ZMvoG7qsrK4CmXjjnAIr0ffYT4cbhQEPgQu7nw10HjiHeV7Jwa44Dz4dr2LBkv24
 jzo1haEBW+6+z2r+2buAl7Ku4lMD5cDMKfVA3z6k8d4LoBnYDwqH5PzRwNo/7IcohcIz
 LpBPb98aa2PqX2Y5/smhGwwRu8MJzLQ/7UD8Mi4QPV4UDeSdRFviLMFfHHDX4jMEoWO/
 8QOQ==
X-Gm-Message-State: AO0yUKX7Ic4nhdTq7kIfKuPY900/7C0riBLIszYic+NpeBbqevJ23G83
 gV6dLlsNqf+Ani88bwdXcZE1xWcUZgiOjXqv
X-Google-Smtp-Source: AK7set/iU3xnFbO88lZzTdOI62CjP63hHfkiiVRio1rV1x759XZr6woYto2iTL2ij6Ff3DQ+TqQhdA==
X-Received: by 2002:a05:600c:2e86:b0:3dc:55e6:fffd with SMTP id
 p6-20020a05600c2e8600b003dc55e6fffdmr9276724wmn.15.1677188475099; 
 Thu, 23 Feb 2023 13:41:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fm16-20020a05600c0c1000b003dd1bd0b915sm568678wmb.22.2023.02.23.13.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:41:14 -0800 (PST)
Message-ID: <fe9297e2-3f0e-2f25-1185-2b2f50d963d1@linaro.org>
Date: Thu, 23 Feb 2023 22:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] MAINTAINERS: Cover RCU documentation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20230119102620.5669-1-philmd@linaro.org>
 <120f942f-a460-cc69-545e-f99fd033501e@linaro.org>
In-Reply-To: <120f942f-a460-cc69-545e-f99fd033501e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ping^2

On 7/2/23 10:11, Philippe Mathieu-Daudé wrote:
> Ping?
> 
> On 19/1/23 11:26, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   MAINTAINERS | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0fe50d01e3..73e9cb33f5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2812,6 +2812,8 @@ F: qapi/run-state.json
>>   Read, Copy, Update (RCU)
>>   M: Paolo Bonzini <pbonzini@redhat.com>
>>   S: Maintained
>> +F: docs/devel/lockcnt.txt
>> +F: docs/devel/rcu.txt
>>   F: include/qemu/rcu*.h
>>   F: tests/unit/rcutorture.c
>>   F: tests/unit/test-rcu-*.c
> 


