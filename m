Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E02DB71D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:28:45 +0100 (CET)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJkK-0003xd-RI
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJRG-0002E9-6l
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:09:02 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:35009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJRE-0005fT-FJ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:09:01 -0500
Received: by mail-ed1-x543.google.com with SMTP id u19so22865173edx.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cv9DoQEhyDpw67o621oVCxfw9rJMRuWLE9+HNRwhtuM=;
 b=sb7a/3Nyh1mmhvAhVN2xykQbK/+zeLu2bfIMTMozkI0EjzjR2oCYKOOwTN/vaqZIIR
 6Txy2gZXQz5XbdslqM75iJ88Ja9VY4dtNqZEvnTNAS33sVCo76b0oEnNd+P6YKwpq1m0
 4SMoTq5grlYhUSTr3pIak4ERUIstILNS9FpghboT6awIeOeZwqxQfCtZd9d6a2AWl1D9
 Wj0oAMk+2Tvi7t6mOhk8Suz9vNjAuUy0U6pyxtIPrpoao39sV7fZgeEDnvaB8o+V8UkZ
 58uAO7u88j6yIlPso1EOXcE+zbLOCX7CrbPUxsk2R2NHwAk7iD5JTCE4UPkm5n9jVxz+
 wWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cv9DoQEhyDpw67o621oVCxfw9rJMRuWLE9+HNRwhtuM=;
 b=hntBuscUvUR0NCFPE6CzPBCYKbguxHxjTal9ntyL7xGl2qk0gSZicV872ZYSke7cAg
 3B5KFvi7zxef2l0JMRAs4bOEAsbZJxMX48D6oVBBzQJle8acVVL2o89Et7YhQ88KCx6F
 7T73x8pkqofesE/DbWFJQojn7CEfMXxC/2f/PNUoxkoI1TOgu4+2octK9KgNb7BZ1YRC
 6nzdjehDGT6CUoi0inlTBLf42mahXlpEg8uTzGTQNPTNZ7JxJ4mU9EcVF+Q7bLQL3z8x
 mBLwYk8076T9c3OK13rTypzDV7aVvkUcM6r/lymgn1DMQSXj3GG/G5M0NgB2U+SsPQUN
 ODkA==
X-Gm-Message-State: AOAM530GENVOUt+btdYU2BK02s3/AVPQvpNiUM5zpriZdGy7lQ7DJue7
 7qhkGhfXNAL6bwyXzaHp7+A=
X-Google-Smtp-Source: ABdhPJyG8DSQYE32O+nOPN/yvOJU9Wzt56fSP1q+pz4Ik44TASwxnGN7BoR6BtYlCy1fIiCM2ttkRA==
X-Received: by 2002:a50:b282:: with SMTP id p2mr10358857edd.210.1608073737020; 
 Tue, 15 Dec 2020 15:08:57 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e19sm20258088edr.61.2020.12.15.15.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:08:55 -0800 (PST)
Subject: Re: [PATCH v2 0/4] clock: Get rid of clock_get_ns()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>
References: <20201215150929.30311-1-peter.maydell@linaro.org>
 <bad8872c-4e8a-e4f5-12d3-b70c206e5abf@amsat.org>
Message-ID: <900f2cc4-d231-e850-0414-14e3b5b9d731@amsat.org>
Date: Wed, 16 Dec 2020 00:08:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <bad8872c-4e8a-e4f5-12d3-b70c206e5abf@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:29 PM, Philippe Mathieu-Daudé wrote:
> On 12/15/20 4:09 PM, Peter Maydell wrote:
>> This patchseries makes some changes to the clock API:
>>  * Remove clock_get_ns()
>>  * Add clock_ticks_to_ns() to return number of nanoseconds
>>    it will take the clock to tick N times
>>  * clock_display_freq() to return prettily-formatted string
>>    for showing humans the approximate clock frequency
>>
...
> 
> Tested using loongson3-virt @2GHz
> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg04036.html
> 
> Without your series:
> qemu-system-mips64el: target/mips/cpu.c:385: mips_cp0_period_set:
> Assertion `env->cp0_count_ns' failed.
> Aborted (core dumped)
> 
> With: OK (cpu are not displayed in 'info qtree').
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I meant:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

But now I reviewed, so confirming:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

Phil.

