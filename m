Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6679030D1B9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:43:50 +0100 (CET)
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l788z-0001oK-GP
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l785c-0008Lv-3n
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:40:21 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l785a-0000Vh-6F
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:40:19 -0500
Received: by mail-pf1-x430.google.com with SMTP id q20so15685501pfu.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OQUXtjjBRqzQtTa2aivLBliJb+EH57HgyvLFb4ZVM0I=;
 b=xYUd0fT7dC/6xwCjSZoS5+9NSWxX/Fdbeqx49bZq6j2rXnPTl9zGW5vU/jGNbnQ8eu
 lnc69Re4OrK8ubDvxLDHhKqaZ4uvSge4Znr4+uJuAXTDnEpIKTzaYQanHa+5sPPHFTz4
 gtC7mQBN0pgjTiZt0UQYq0oSqHT8UqrBSC/kTIqUryWaqeBINT9G7TqxTxUJS7Dxfz6N
 NuHw8AszfrylPadOnVM8kiz+81t5MhieWDBYQ/Ka+FJXqj2llHxeEbkO8ACIrGPCE86v
 QA2F0Dt5YSeBvoEorn8965WRdeLoOrLyIqQLfrmq038ceov+rHWzMU5FRzBhExrV3zPk
 3Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OQUXtjjBRqzQtTa2aivLBliJb+EH57HgyvLFb4ZVM0I=;
 b=fNHGXosfmfGxKj7bdg1hipwnEgvESnny5ZnVoor6lA07S9Z2/EHP4VHiA7n60G3XP7
 U8JWFkuqVq9GbsLdUuTPiImeGYvZanrY1bu9oqX2oofw1Tby6NDj3/Br3vpREcRx69j4
 K25p5XKnP6Sw6bcsv+m1HoZJyE+GioVmH+jdctpJM4gBnyn6WDSSeO0XO55pNqOG88Ge
 Cfen7as56D5Rf2zh0P2jhRpGncDbl6QQKr3Jr00/+oFDA+2WKYgwXSTUzRQPbQk8Czfa
 ojHcWMLEvcz5X+Rz7MAl47UzLPDq2BgL8wf1khfPRxXBl8ZLYZZ/h7Feq9dOyw3+e+9B
 zCMQ==
X-Gm-Message-State: AOAM532E2CRM2o9BH24c8p7E9RUHZJdtsPcnL9/1VFNZlPeDuOk0e7WT
 eySRLOfP9nUpTE4wYNtRyO/fEQ==
X-Google-Smtp-Source: ABdhPJyG+fc/NJX1OzkpjcvzIktgLY2hlzjZDPB8ZDlYZgvozZD1EBCnPzHjsYIZW6ZOaA9mvjiMSQ==
X-Received: by 2002:aa7:99db:0:b029:1ba:5263:63c4 with SMTP id
 v27-20020aa799db0000b02901ba526363c4mr961523pfi.53.1612320016448; 
 Tue, 02 Feb 2021 18:40:16 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id a2sm272526pjm.51.2021.02.02.18.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 18:40:15 -0800 (PST)
Subject: Re: [PATCH v4 01/23] tcg: Introduce target-specific page data for
 user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-2-richard.henderson@linaro.org>
 <CAFEAcA8r5+ciCFb0kPC1bAi-kU53iJBiLf7Jiso-gr2cOBtxeQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ededd9b5-5836-b1c4-9fc8-e732bf1c2204@linaro.org>
Date: Tue, 2 Feb 2021 16:40:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8r5+ciCFb0kPC1bAi-kU53iJBiLf7Jiso-gr2cOBtxeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.155,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 4:29 AM, Peter Maydell wrote:
> On Thu, 28 Jan 2021 at 22:41, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This data can be allocated by page_alloc_target_data() and
>> released by page_set_flags(start, end, prot | PAGE_RESET).
>>
>> This data will be used to hold tag memory for AArch64 MTE.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v3: Add doc comments; tweak alloc so that the !PAGE_VALID case is clear.
>> ---
>>  include/exec/cpu-all.h    | 42 +++++++++++++++++++++++++++++++++------
>>  accel/tcg/translate-all.c | 28 ++++++++++++++++++++++++++
>>  linux-user/mmap.c         |  4 +++-
>>  linux-user/syscall.c      |  4 ++--
>>  4 files changed, 69 insertions(+), 9 deletions(-)
> 
> I reviewed this (and some of the other patches) in v3, but
> you didn't pick up the tags :-(
> 
> Here it is again:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Well, here's the thing: this appears to be v3, reposted.

All of the work I did for v4 has gone missing.  I went to go fix the single use
of current_cpu, and it wasn't where I expected it to be, and that's when I
noticed.  I'm grepping blobs now, but I must have made some horrible git error.
 :-(


r~

