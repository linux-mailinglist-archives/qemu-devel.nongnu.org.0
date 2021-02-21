Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAFC320E5E
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:51:54 +0100 (CET)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDxZx-0008En-91
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxZC-0007pQ-15
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 17:51:06 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxZA-0006Xl-Jb
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 17:51:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id a132so11886468wmc.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 14:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+2Xib/L209zeQYbdM0hnWJHpSfvay2lIYvKTxCkmQ4Y=;
 b=NPcvVVuYtB5cOwuDm2HhVwkOd5NEmxXOcGEa2VYOzvgIgWXGbV1Xpw8e2hHl0m8xwO
 mJ8Fa8m0CspkwD/CREdpM4Qgbetwr9nc1M1gsDN2NR88akRGAQK1rVKAzVZbMFsi3OnE
 GR9ddm3EOwkkHwOetleYRjXKGnBxVGe0SvUH8YZ2GRAgygbWe3OkY89+nRcZ3JAT1L7c
 3HT+Ev/KnzV194jvOHcOsNKErAasUdxQ6wrR0meiO355/xmNybLThsl2mnn+ZpUcLzrt
 /A+9ug2J+wELTWb8EWtiYMbaQr4yYNA2x5P2DNuaLj5KgoARHdTlm+AH9RlaiPt2x3VF
 WaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+2Xib/L209zeQYbdM0hnWJHpSfvay2lIYvKTxCkmQ4Y=;
 b=f3gsRRiAnfFwBUO1oYk4Wd9TAdkJ6apyEs4/pJ0gM0tNScCNsAnFr88uosBu9voKAq
 uWRAt4rhTlL7BgKf9rl/wjAJf62cCcAg/6wiWla7Z45BjKX7cdRD4gcChzpl+PdsZaj/
 vbB0qZdj2lrsnMH1H9UNoUXHA8smTGwSD+jmwAbjl/EQvEG+APMjVdxWEf1WMmtKergZ
 MimttKQEUfLYVJV042qeuNybhilQunDu1JF0L7VCl3quPuElc83n5D5XRa9eCmYBkGU2
 D6gPAYs8AlOy7kzl2EQ1mJc32K+7qdj091Vp8pOK0Lm7+ydOjRLVdZxJVKturFLgcBOm
 UZCA==
X-Gm-Message-State: AOAM533P76yYL/wsOf3YKfTBWCfGzc3ludjFQ1vKhkRL+7snMYaFntuz
 15ubJsb70uSGrVu33Wrb5as=
X-Google-Smtp-Source: ABdhPJyuMqDlR0Q3oqsjMrlGmw6B8GIEuQiAQ077cq1tx7/RwNJ5sLxI0qL88URVNwvp7pp3Y9Ug7A==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr17950366wmq.159.1613947862418; 
 Sun, 21 Feb 2021 14:51:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f20sm25720348wrd.96.2021.02.21.14.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 14:51:01 -0800 (PST)
Subject: Re: [RFC PATCH] target/mips/cp0_timer: Use new clock_ns_to_ticks()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210210234334.3750022-1-f4bug@amsat.org>
 <b2c64763-f341-60ff-0467-d95a4daab968@amsat.org>
 <CAFEAcA_K0hgEi-YerHTYAJ8B-PV0t=Z_=Faiob_+9J4DDi0BtQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a873f8d4-bfbd-ea57-3144-71ba54b5cd9e@amsat.org>
Date: Sun, 21 Feb 2021 23:51:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_K0hgEi-YerHTYAJ8B-PV0t=Z_=Faiob_+9J4DDi0BtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Hao Wu <wuhaotsh@google.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 9:12 PM, Peter Maydell wrote:
> On Sun, 21 Feb 2021 at 20:07, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 2/11/21 12:43 AM, Philippe Mathieu-Daudé wrote:
>>> Use the new clock_ns_to_ticks() function in cp0_timer where
>>> appropriate. This allows us to remove CPUMIPSState::cp0_count_ns
>>> and mips_cp0_period_set().
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> Based-on: <20210209132040.5091-1-peter.maydell@linaro.org>
>>>
>>> RFC because this is just a starter patch to test Peter's series
>>> providing a handy function which "tells me how many times this
>>> clock would tick in this length of time".
>>>
>>> Also because we could rethink the MIPS CP0 timer logic to avoid
>>> too frequent divu128 calls (painful on 32-bit hosts).
>>>
>>> The style should be updated, using more variables for easier
>>> review. env_archcpu() could eventually be dropped (by passing
>>> MIPSCPU* instead of CPUMIPSState*).
>>
>> I guess it is better to wait for Peter patches to get merged
>> before posting the updated patches (not much, just one previous
>> patch MIPSCPU* instead of CPUMIPSState*).
> 
> This patch is still on my to-review queue, fwiw (though I am
> taking a week off work next week, so I probably won't get to
> it til March.)

Thanks for the update, I'll repost during the first day of March
then :) Also I'll try to rebase my "hw/char/serial: Use the Clock
API to feed the UART reference clock" too.

Regards,

Phil.

