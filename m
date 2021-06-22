Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDBB3B018E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:38:28 +0200 (CEST)
Received: from localhost ([::1]:39802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdnX-0001eK-5n
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvdWg-0008TB-MM
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:21:02 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvdWe-0008CN-Tr
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:21:02 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b3so12717550wrm.6
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s/+mEomlgWYGuvN5QEl7I/hpCMR9TEv9RYA0X4qRq9A=;
 b=bMCkunhNpQKtye5uidP9/5yUYHvG6xar3dT0PS3BMxSUxPa67ZqBuOLJlRcUMcDaSx
 tFqDyzZ20Ev3AMzy2XKv94MOUy5UMPBzKpkBfCR+xWFHrmr+JZjQRYMZLg3h+tm9JILA
 GL66CSxvqXntfblQCYNEGdQEXGOkhacO1uIRMAHpjTG7n8BMNJA8XSDSfJSv0gbB7pty
 p+85X3uBA8q9pS9g8RBqlCSnhzR+T35aUcsxVcYiO95eSmxu3US8z6GaYad2mtrWl3pA
 ahsDjN8bN+iyylq33yBOIW90AbgylR8PnxGAISCgVDV32VXSWxMSNLrnaC++NZerpO72
 gyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s/+mEomlgWYGuvN5QEl7I/hpCMR9TEv9RYA0X4qRq9A=;
 b=K1OLdKQSf11xjjVjvcaJtQ3AUFjeromWObkburp3WY0l3EXNBNf90HYDAa2Yfsz/Vi
 VSSU0rC2HbRFAm4HFKnYffkU38bL8VX3cgA7p4w0YqVgC8m89P2taC4jCtBUZP7fqxq1
 RgnK7pDcAmet94oQOqg6MJNBXJnnUZ0H2j5O+F++Sig1zFW9GsQ20fhGchP/QilZCmFq
 zI0YVDVnb//S4xyR5vSWC7O7o1PB4Xu95xKZGhTVlANhrNtGu2gJ746jAALJqS1tfd/7
 NWRSD4uui3ZOc0Fyfl+FdQtpBSgpijwv5o0759IXwyvQqbUXh5ik5kQ0ucpNNkz3XEDf
 zwmg==
X-Gm-Message-State: AOAM531zNxPy7hNP+tFFUD1oLqOPqsOOSYdZITCM7O2AxwkRNAvKuXWK
 /kNy0woS1/DILDEZcxA2+ICti4wEGcdsrw==
X-Google-Smtp-Source: ABdhPJzfkoc6iRj51v9lyphUdKbpNKGXtSxSfM8EJJ5aD9EBGxuUMhCvYZe/QBk8AU4riP7iZVY1CQ==
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr3807481wru.199.1624357258581; 
 Tue, 22 Jun 2021 03:20:58 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e2sm1564717wrt.29.2021.06.22.03.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 03:20:57 -0700 (PDT)
Subject: Re: [PATCH 17/28] tcg: Add flags argument to tcg_gen_bswap16_*,
 tcg_gen_bswap32_i64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-18-richard.henderson@linaro.org>
 <f01808cb-0bd1-aa4d-f289-a59a4c281203@amsat.org>
 <a9972b30-7f01-5600-c942-9058f78fca2e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ad351945-da73-39b0-eb5f-3a66fb25109a@amsat.org>
Date: Tue, 22 Jun 2021 12:20:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a9972b30-7f01-5600-c942-9058f78fca2e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 5:58 PM, Richard Henderson wrote:
> On 6/14/21 2:41 AM, Philippe Mathieu-Daudé wrote:
>> On 6/14/21 10:37 AM, Richard Henderson wrote:
>>> Implement the new semantics in the fallback expansion.
>>> Change all callers to supply the flags that keep the
>>> semantics unchanged locally.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   include/tcg/tcg-op.h            |   8 +--
>>>   target/arm/translate-a64.c      |  12 ++--
>>>   target/arm/translate.c          |   2 +-
>>>   target/i386/tcg/translate.c     |   2 +-
>>>   target/mips/tcg/mxu_translate.c |   2 +-
>>>   target/s390x/translate.c        |   4 +-
>>>   target/sh4/translate.c          |   2 +-
>>
>> Various REV 16/32, would it be useful to have it as a TCG opcode?
> 
> Which operation are you proposing as tcg opcode?  The per-halfword swap
> akin to mips wsbh?  Yes, that operation also appears in arm (rev16) and
> ppc (brh).  So it's a reasonable thing to do.

and REV32 for PPC BRW?

Another I noticed is popcnt.

