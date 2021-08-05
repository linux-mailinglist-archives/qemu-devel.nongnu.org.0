Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D03E19E0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 19:01:15 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBgk6-00041n-5B
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 13:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBgiu-0002iZ-Q8
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:00:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBgis-0001Dv-FQ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 13:00:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so7424067pjn.4
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 09:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I8P05sZ5LlRbsTuxl86jvUlowOc/pYgVacJ5D9ymr68=;
 b=Mio4sjJpmmDGxo0iV3wnRYBp4jblzU2SWUaEmglpabNbqpmANcNoXbm90qSnmHwcv/
 mox7z9LO2xtEblAU3kXIHsXKBdvtE20CO1z5LFFqbQsvyEVXBPPDFZxNanrVnoWd+835
 rDqgCm5Y8ncuArmEa/mvOwcPT/QCs6wsq6T57dZojMAYpj4tDAVYMMhxe4uXAsqoUSSk
 lRGztwFoPMsckWQaB5J9QABKqXzx0WlSMgLU3Hzxpsdp4G/Z+fAL8iekthVmLyfvLadl
 PuFhZSJd8QqPPUTDAYTEf1aBUFANWHHYlmboAB2SAr8Aborsq8M472Hi5zOQTG7JejhS
 PqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I8P05sZ5LlRbsTuxl86jvUlowOc/pYgVacJ5D9ymr68=;
 b=uIgABd2lJ7LxOHaHNrVJg9WV1Ll9r3ma0unUONwzPTJzyuvuceGnN8QARQXZVyds+g
 urv6JilFlZrESRnTgrPKqz9YyKBYrVPARLmPixXbvxru6+JsP03q6pzaab5uw/w1NLEC
 HqTImGMfB0BEGIpaNyFOtUqYlGGMlExCqCcpyFbHDoTSs3ZbXIwqZUUZ7HEbRfpeJoYN
 UekoIKnbVz65qeBzp7XzUWylOA6QOUN9CNAR2k+VJb2USgdZNrwSKj/VAGyjOjaymb8r
 1eP+UarNd46Nwp7MUBhhWw4LkXzmaL4BucXDukDx7w5oB4nTzrSTlI3jHFKEtRNLk1ZR
 /Q2w==
X-Gm-Message-State: AOAM533FD2EpQuuFxiP/FRsgiuP+4n+Kh/+Tt4pNTJTl1ePFqc3v26cf
 dsGxiV2yTNUB+0pmOJWfUeMDfw==
X-Google-Smtp-Source: ABdhPJxBNBTgzXNLFMnK9xfS1BvL8jQaQuTZBWzVlakVZIewkE3FTN5upM0lyoji51l7hMmtiXHTYw==
X-Received: by 2002:a17:90a:de18:: with SMTP id
 m24mr5638254pjv.78.1628182796705; 
 Thu, 05 Aug 2021 09:59:56 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id fs21sm3915942pjb.42.2021.08.05.09.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 09:59:56 -0700 (PDT)
Subject: Re: [PATCH RFC 1/1] accel/tcg: Clear PAGE_WRITE before translation
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210804224633.154083-1-iii@linux.ibm.com>
 <20210804224633.154083-2-iii@linux.ibm.com>
 <507a0eae-6dcf-68c0-ee5f-40499788e2b4@linaro.org>
 <8481e2b62d5bf3295ffb309ce54fbdaf42fcef0b.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04de9e20-555a-f785-3dea-add345d4e64d@linaro.org>
Date: Thu, 5 Aug 2021 06:59:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8481e2b62d5bf3295ffb309ce54fbdaf42fcef0b.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/21 12:56 AM, Ilya Leoshkevich wrote:
> On Wed, 2021-08-04 at 14:30 -1000, Richard Henderson wrote:
>> I think that the translator_ld*_swap functions should be moved out of
>> include/exec/translator.h into accel/tcg/translator.c.
> 
> Do we really need this? In the end, the added code is not that large.

I suppose it's not required, but they're already larger than they need to be.

In my opinion, if you're going to swap one out-of-line function call for two out-of-line 
function calls (cpu_ld*_code + plugin_insn_append), you've probably made a bad size trade-off.

With your added code, it'll be 3 out-of-line calls.


r~

