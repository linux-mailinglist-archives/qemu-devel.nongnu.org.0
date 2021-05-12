Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B21B37B3B4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 03:53:42 +0200 (CEST)
Received: from localhost ([::1]:56136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lge4C-0003Me-LQ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 21:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lge3I-0002hb-K6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 21:52:44 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:40631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lge3F-0004Ei-L9
 for qemu-devel@nongnu.org; Tue, 11 May 2021 21:52:44 -0400
Received: by mail-oi1-x22b.google.com with SMTP id u16so20891286oiu.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 18:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q7RERH6CfkGlHeZ1WnwGWvtbYe1syZlneGUdCUMZLoM=;
 b=ZAs5kaI6xOngcC9r7Wd8O4TWuA4a6MckyCnyu4J+F8pXJvgRgWUMwIiKRGTdGqh3kO
 lzDMN/qAGSJAbSUdXn2luJwuNfXLlYEiXFQR9OxX4+xpDDTvEZ5G/fWPozj6njcsR8TC
 dBbd1QeSkSettKdjjAq3K/B1VHPKbjlA9bW6WoW944bwAKO2igQ9tHLMKwif6AZt+to1
 kan5W/DHh9NL50qZQfWh77LZlsOlCSYIR5vj/WTVstqo0xtancRBkNgQSJxbWCMc0dtz
 h5V6wZcNvYUtwileW/JibWCGN3J3kajEiGMExvM6BMrtdOEHVhw606B7pct5VDRTnIm3
 Objg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q7RERH6CfkGlHeZ1WnwGWvtbYe1syZlneGUdCUMZLoM=;
 b=cIiPDI2e8x8dBoRZVipbgA36DmW2R8eKIDD1mgkBxAIaaJ8CuhOrgU9RK8ZgwWbLeK
 xC6gT9GsA87S22JaDuhghD9hGnFk3ukBOrte1pCCAKMY4EkWiTOq7QmdDC/p1whajwK7
 ltyG9odKoNer9HXn05ebyaJNlQalWIqk2VVYIOswu3ZGVRbhXqWpiypVC1Lja0LDn7z+
 93WpnCTFQ7kwC6/ybLaoEwNhyDRwNWsO0QyVpQGfs/3ijR+eg9ZIesDJVjvSI3F9XRgr
 RmHh91sabvrhIuoqrOmsZpwIK+b0jyJYTGbQ7iodrPjZxLT04+HVCbEAkR1fJIm5hAib
 tK9Q==
X-Gm-Message-State: AOAM532rERfVIsp7VmzOBVJLmJJw5f2nD3lunYI9sjeA38ZtueoMsU57
 lrJUdrwwseeWZaT4wCSA/sM1gw==
X-Google-Smtp-Source: ABdhPJyzbY9LPvLO+RGENfdgb3g9XqjKRk7ZIs3/+VQhCDeKsvwlkgM5W2VJYXd0yN4cQeIPrYgSXQ==
X-Received: by 2002:a54:4682:: with SMTP id k2mr18586673oic.107.1620784360431; 
 Tue, 11 May 2021 18:52:40 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id c95sm4084516otb.80.2021.05.11.18.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 18:52:40 -0700 (PDT)
Subject: Re: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <87bl9iyahr.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <354c8418-9700-e98d-47b1-10e564fbeeaa@linaro.org>
Date: Tue, 11 May 2021 20:52:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87bl9iyahr.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 8:36 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Reorg everything using QEMU_GENERIC and multiple inclusion to
>> reduce the amount of code duplication between the formats.
>>
>> The use of QEMU_GENERIC means that we need to use pointers instead
>> of structures, which means that even the smaller float formats
>> need rearranging.
>>
>> I've carried it through to completion within fpu/, so that we don't
>> have (much) of the legacy code remaining.  There is some floatx80
>> stuff in target/m68k and target/i386 that's still hanging around.
> 
> FWIW I could enable a few more tests...

Ah, thanks for the reminder that these were disabled.
I'll add this to my patch set for v2.


> ...although extF80_lt_quiet still has some failures on equality tests:

This turns out to be a trivial typo in the tester itself:

diff --git a/tests/fp/wrap.c.inc b/tests/fp/wrap.c.inc
index cb1bb77e4c..9ff884c140 100644
--- a/tests/fp/wrap.c.inc
+++ b/tests/fp/wrap.c.inc
@@ -643,7 +643,7 @@ WRAP_CMP80(qemu_extF80M_eq, floatx80_eq_quiet)
  WRAP_CMP80(qemu_extF80M_le, floatx80_le)
  WRAP_CMP80(qemu_extF80M_lt, floatx80_lt)
  WRAP_CMP80(qemu_extF80M_le_quiet, floatx80_le_quiet)
-WRAP_CMP80(qemu_extF80M_lt_quiet, floatx80_le_quiet)
+WRAP_CMP80(qemu_extF80M_lt_quiet, floatx80_lt_quiet)
  #undef WRAP_CMP80

  #define WRAP_CMP128(name, func)


r~

