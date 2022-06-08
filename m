Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845EA5435C5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:56:01 +0200 (CEST)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyx6G-0007Nk-J2
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyx3o-0004Qh-CH
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:53:28 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyx3l-0005sG-Dt
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:53:27 -0400
Received: by mail-pl1-x630.google.com with SMTP id i15so1081776plr.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=DXwjpO8vV9jXtL65OGmqQs8VugHcI2VtT4YQ/VENLWU=;
 b=oOPKI/Acq0z3F32veXSGBo6uFQvNK6/1l835JeOS1vLr+kSbScFpYcUTXm0jjsDq8k
 0doj2Dsclnk1xTqx/3PXo01pEASLlG7HVpHNc8xGazWGo9AbuBtoDLVhFSJBZpefitjs
 87NeEyrjfYDyFD2V7Y8LuBYKNTJ8dpvXnRSfUupsqwmxYPyig4RK1WTMvmvDouBhaqk4
 66cksMrvm8jG2xvqrXjrD0fMXGDFOUwpCVr5sDi7hTam+j93DEYQfjw7THF6gbdnFHV7
 zgq4kCyJiLXdQyckNDG/7fZ6KtZbEWlZ5q1+585To00Q+O6ycGNUhfU83Vx3l2006jFA
 sGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DXwjpO8vV9jXtL65OGmqQs8VugHcI2VtT4YQ/VENLWU=;
 b=WyXgRRxM1I09ZpFsrtsDQYbNASq6O/ONZFNO82yotKCX9uq5PvNIjdFIpLZeI4nFU/
 waw0KkefbMoOmADzhiCfcn6BiM3oFAnnNiA9TSDfEXY6BwOx0X7go+D+XNb/d2/CJSMe
 w3TCItDGSPXrwNDjB3q9C0R6mM0MioVrjhS1xbDvlQihrfPlAtvaqSJb9xNTtktJWWiI
 12kmI5phV02284Tgu/rUJBLSwC1UOOtQSoF547p8J9FemF+UjH+qZIc8FFe6XQAz1kKe
 5tP7zxndEi+IvXHf+GwaP5QuBkvXOMYd4DE9+YdkM9JFV0XEw9Gderv4OZd6FlBEcRGn
 z+dw==
X-Gm-Message-State: AOAM533YMS9q85wzLA+L5W0u3/f7GaXtrYEvPCDMW9K+BTM0kVR5WOqj
 4nwl4QbkoSssElH5GNpalvLInw==
X-Google-Smtp-Source: ABdhPJza2B+O6LhIJ/GYgq+n/MgfCqj3mX4leLt9HaSBR6R65VMKiIPqeQAQIN7NtM9BOCFiSg3J1w==
X-Received: by 2002:a17:90a:7381:b0:1e2:ff0f:df07 with SMTP id
 j1-20020a17090a738100b001e2ff0fdf07mr38482590pjg.160.1654700003255; 
 Wed, 08 Jun 2022 07:53:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6812:d08e:b22c:43d7?
 ([2602:ae:1547:e101:6812:d08e:b22c:43d7])
 by smtp.gmail.com with ESMTPSA id
 be3-20020a170902aa0300b001624b1e1a7bsm15173134plb.250.2022.06.08.07.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 07:53:22 -0700 (PDT)
Message-ID: <8f833280-b1bb-d4f4-6603-5be44ee8e9b7@linaro.org>
Date: Wed, 8 Jun 2022 07:53:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 0/3] target/m68k: semihosting cleanup
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220607222616.717435-1-richard.henderson@linaro.org>
 <56b31126-41c5-e7b6-5b32-2b64ba1cce67@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <56b31126-41c5-e7b6-5b32-2b64ba1cce67@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 6/8/22 02:36, Laurent Vivier wrote:
> Le 08/06/2022 à 00:26, Richard Henderson a écrit :
>> Based-on: <20220607204557.658541-1-richard.henderson@linaro.org>
>> ("[PATCH v4 00/53] semihosting cleanup")
>>
>> Changes for v4:
>>    * Split out of v2.
>>    * Convert host errno to gdb errno, which for m68k is guest errno.
>>
> 
> How do you test semihosting on m68k?

I have only compiled this.  I had been working on adding something to tests/tcg/m68k/, 
which is where those halt patches came from, but haven't finished.


r~

