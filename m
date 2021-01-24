Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2AC301EA0
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:09:29 +0100 (CET)
Received: from localhost ([::1]:57982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3lhQ-0000ZH-Ej
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3lfY-0007gJ-Iv
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 15:07:32 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:56036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3lfW-0006Mf-Pl
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 15:07:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id j12so7034412pjy.5
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 12:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=buuncHhvXkjg55mixz6pLAcHgHfdagT9+zwvgiU4FJ4=;
 b=WiwfhXjmsj01a2PJIA+nmJQ56oR4dxPM5YjeTCjUeOYP0Au+8fQ7RzPMdJLwC2BY4L
 uM+ap23fKNuJHwnpuPBBnkW1tHhc9PnJq2+g6AwPc4R0bs1HNr9i5FdOaAdskbZjygWP
 HqMTQn+PSIGmBk7dHzFIe0jtalcBrDCIbKGhyX97wM9PTlvQmzo6fl7IOmqCN4vAjR2N
 r5edveBjbnR9CSdWRQLoHQPQmKNfNwkHBmyFVYGYsVjrZWMfa6illhoBza7MQNGlV+gg
 dWqOKP4kZdHPa9e55TA5FEvhHDD7CjqC2V5eNkGSf4LHcfyTgZWhAvFVIw3ONN404Szz
 ZH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=buuncHhvXkjg55mixz6pLAcHgHfdagT9+zwvgiU4FJ4=;
 b=CyAcFzjra0y4jYFAiuKPgdAvmO4yZJKHfB04key3BBd5BrCusKutbiL/9vqC1tpnaD
 yLZL72aKvgkSKYZNawvtwcBeI7w4CDFD1t9RhA8pQDqTTRhOzy5SHMrkDV9w9JLexp9y
 cLkGFQQAB4u6nC0T9+XJwFcuA1B6FZpaKnYzuahvCiVVeE0FsRWG6PADsD1IuXQqd9se
 2Y5eU1U9V/N+ZHnWmKpWsQLlEJ1W/C+ew2d1p++uH9rsoJQsKaxcDGBI1AlzvzTizVLp
 7k7oqunKbPsK6x4qlcSENDfUkF4IiHWHT/+hB4pfZvgiOE3BFRKNJQveMyBeqk2PgVly
 Ycfg==
X-Gm-Message-State: AOAM532Kg3yS+MgoQrcs8gyfelgOsr/pROJw4KULKNLyEEprVQofGZej
 XiCC+cxNmkg2Vhu5MKaFufwk4g==
X-Google-Smtp-Source: ABdhPJw9KVymYNgzOoGgbv+BAOFZ+b0nMz5O4Zbe8TV40wtVulm3xkTWQXiJgzni20KQ92AMOA5Rgg==
X-Received: by 2002:a17:90a:e28c:: with SMTP id
 d12mr62861pjz.236.1611518849275; 
 Sun, 24 Jan 2021 12:07:29 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id i62sm14262868pfc.150.2021.01.24.12.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 12:07:28 -0800 (PST)
Subject: Re: [PATCH v2 06/25] util: Add CRC16 (CCITT) calculation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-7-bmeng.cn@gmail.com>
 <b9c150df-00e4-c785-1e89-dc135a51f4ac@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2927f234-a9d0-8fd8-c99e-b858aed1287c@linaro.org>
Date: Sun, 24 Jan 2021 10:07:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b9c150df-00e4-c785-1e89-dc135a51f4ac@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/21 8:59 AM, Philippe Mathieu-Daudé wrote:
> On 1/23/21 11:39 AM, Bin Meng wrote:
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Import CRC16 calculation routines from Linux kernel v5.10:
>>
>>   include/linux/crc-ccitt.h
>>   lib/crc-ccitt.c
>>
>> to QEMU:
>>
>>   include/qemu/crc-ccitt.h
>>   util/crc-ccitt.c
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>
>> (no changes since v1)
>>
>>  include/qemu/crc-ccitt.h |  33 ++++++++++
>>  util/crc-ccitt.c         | 127 +++++++++++++++++++++++++++++++++++++++
>>  util/meson.build         |   1 +
>>  3 files changed, 161 insertions(+)
>>  create mode 100644 include/qemu/crc-ccitt.h
>>  create mode 100644 util/crc-ccitt.c
> ...
> 
>> diff --git a/util/meson.build b/util/meson.build
>> index 540a605b78..05a376ae02 100644
>> --- a/util/meson.build
>> +++ b/util/meson.build
>> @@ -29,6 +29,7 @@ util_ss.add(files('qemu-config.c', 'notify.c'))
>>  util_ss.add(files('qemu-option.c', 'qemu-progress.c'))
>>  util_ss.add(files('keyval.c'))
>>  util_ss.add(files('crc32c.c'))
>> +util_ss.add(files('crc-ccitt.c'))
> 
> OK but we can restrict this to system-mode emulation, as user-mode
> and tools don't require it.

Doesn't this get put in libutil, where it is only pulled from the archive when
needed?  Also, libutil is built once, not per-target.

r~


