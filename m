Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334BC360F9C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:58:20 +0200 (CEST)
Received: from localhost ([::1]:48080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4Nn-0006aG-Aw
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lX4L5-0005ez-CR; Thu, 15 Apr 2021 11:55:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lX4Kz-0005ne-EP; Thu, 15 Apr 2021 11:55:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so14882301wmy.5; 
 Thu, 15 Apr 2021 08:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1iJlHk6v/UUiwwngJCIvEQtApBK1nE4RmsWgnACZLdY=;
 b=CiA6EWFazR/n0+oGCWpcZk0q82xrqft8bMsUK6WxO+P/6wyul5H14Av1buND1hEvi0
 YPuM+enAI3s8/jjadhd9sm2cIt5W5Sau96EjF30C8r04cOQ91m0wgoKzjSJrMh0gsB2J
 kNpDMfyt1n+Jun7YFPn2byfKF7HlY+twHPDNBI/5kAQE/NJpTOQttzY8SFjUZeMH+PQz
 tSp8Z+h5bmtl7uoeQ78lhvZDZChZQZLcq8Z46PBIyXk2aLGo4g5sciO2gxgJxjGpEz61
 qQsHYfcoyX7NIIhgmuPPiB4eijB0QK/Ich3mmyoQ88pYECKWc2x00vIW434Cry81uH6p
 lsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1iJlHk6v/UUiwwngJCIvEQtApBK1nE4RmsWgnACZLdY=;
 b=Y7XbJiAjTJ34dGpLpCE/IucfvUFtqkRdK/ciSVSJS6522kHygwwrEdl4bT4IH7Dfjr
 90uknZKjqpYWq1bItI211TcQNBUGYKGrTKKaBAaDInaMc862JmuhWqT102r9sTwG7BCU
 cBBbrPxmsgJJHUQH86TEXWOJA2ILtX/s3H94WOJltHqo/aH1vRwoBdKgXJuqSe5wKNH+
 ltSQh48Jyip2dl3rmxgVTDFNhQn4TTImikqWxQ+fbawv3bPJK/VLZkyII5Qf9hY9uGMY
 QvPVTSQiZ3zoj0n2uCQZ/rZuaT71a2inGqoeEpuo3T6OlDDMOkmqC2rsFKktjrggjk1E
 7AxQ==
X-Gm-Message-State: AOAM530+MR2FTOCCxR8lmoTP2duUxKO+uCFbImCB6ACK6FDr/bA+ub8k
 5FS1FHO0JPPeUActphH0FfVUfUSjQWQ=
X-Google-Smtp-Source: ABdhPJxmXHrZLcCq62I9Q3o0+wqhE+Rlk4V6aHko4Zw3jPt0RyhoT/FARIcmY2uhCkIzdZzsKLiu/Q==
X-Received: by 2002:a1c:b457:: with SMTP id d84mr3825603wmf.169.1618502119320; 
 Thu, 15 Apr 2021 08:55:19 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g132sm3565620wmg.42.2021.04.15.08.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:55:18 -0700 (PDT)
Subject: Re: [PULL 18/23] accel/tcg: re-factor non-RAM execution code
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cedric Le Goater <clg@fr.ibm.com>, qemu-arm <qemu-arm@nongnu.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
 <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
Date: Thu, 15 Apr 2021 17:55:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 4:54 PM, Peter Maydell wrote:
> On Thu, 15 Apr 2021 at 15:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>> --8<---------------cut here---------------start------------->8---
>> accel/tcg: avoid re-translating one-shot instructions
>>
>> By definition a single instruction is capable of being an IO
>> instruction. This avoids a problem of triggering a cpu_io_recompile on
>> a non-cached translation which would only do exactly this anyway.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> accel/tcg/translate-all.c | 2 +-
>>
>> modified   accel/tcg/translate-all.c
>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>
>>      if (phys_pc == -1) {
>>          /* Generate a one-shot TB with 1 insn in it */
>> -        cflags = (cflags & ~CF_COUNT_MASK) | 1;
>> +        cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>      }
>>
>>      max_insns = cflags & CF_COUNT_MASK;
>> --8<---------------cut here---------------end--------------->8---
> 
> Yes, this fixes the problem. Do we want to put this in for 6.0? My
> feeling is that executing from non-RAM is pretty niche, so maybe
> if we need an rc4 anyway, but this isn't important enough to cause an
> rc4 itself.

Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing Cédric).

