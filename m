Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E42D18A2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:37:49 +0100 (CET)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmLOO-0007XE-Lr
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmLEj-0001fd-8K
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:27:49 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:39356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmLEf-0001XF-7a
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:27:47 -0500
Received: by mail-ej1-x642.google.com with SMTP id n26so20877471eju.6
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 10:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0dGXT0I11mx+iLOOQfS18KAlwfqTzNBPlMJtf3/8VXk=;
 b=tEmsJoG0UxxB1Bh4kO3ngn2pQQoJwrtirkayzcTTuTGo90omUgvKxyAhxOhoWuZ8ka
 hzKAbYcEnBIvpssvtmcxMyXwQEgEjfHvXv3hvNFL+XawW92mw3qaoFY5/ZvV1oQDi3mo
 vqfd1IPT1ZSkvtxTjiYsXg1fZN30buhe40VvGaqYCgUbh3O2ypRxra0dBNbQWKaWAilx
 yJuUW0TWTXwGH+ds0u9LiQ/3D4ZLVNFCeyFmzuQNdiND77mK/8wXaQeCoQkY5yCEJ/Ug
 uqtRK0ucd7ONupy5Eb2H7K+GzhzA1H/lq3uO5s77ZD+viiNvOOqOH0qdR3B9ru96OuDx
 XGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0dGXT0I11mx+iLOOQfS18KAlwfqTzNBPlMJtf3/8VXk=;
 b=KdKYfYyapzjKnUma2vZZjf7W0v33kzXG12pWz1huwA1NUpD2CiTlyTfebrL0gaFsKK
 sqfyleORR/dQojdG+s0L2ugX/4z+7nY/hwc6ZPoACNEQw54254Igq1SRz0AfydOX3yTZ
 qm9CY0KkKYD6W4hsbltgxbdUoblttwMHnPFVuZev57iUe2qQliEOEd7yJM2nQ9GMMaHf
 bvkVjb4XmyaylsuFr8a5bO+nTcRF57IEIgPwh0f2nx++DcIKOV1+k4O483e7CKukjHmE
 zbHbU6vOvyARNfKA4VdtgqgVm7B7uQU0Az/m2MhultLsjsUCMYfZGk4fgRJDQERJglL3
 fmVA==
X-Gm-Message-State: AOAM533Vrssi/2NwqNGSTssbch7XAnmMaZFC5z7pVMxXC3qhp8RZ49n5
 jsxuu7CpU6KsSGfNbfNYo4E=
X-Google-Smtp-Source: ABdhPJxqC31tSILQnLvmzFAlC1P7ANTdZknr9eYINNMsUdZSzQwXgUpH55q6gW6VUzkcTkMDJb36Hg==
X-Received: by 2002:a17:906:518a:: with SMTP id
 y10mr20411024ejk.323.1607365662893; 
 Mon, 07 Dec 2020 10:27:42 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f13sm13116495ejf.42.2020.12.07.10.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 10:27:41 -0800 (PST)
Subject: Re: [PATCH 1/5] hw/mips: Add a bootloader helper
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
 <20201207050231.2712-2-jiaxun.yang@flygoat.com>
 <bcf3aad7-7ff9-fbd5-be99-9f7d20cd614a@amsat.org>
Message-ID: <6d26e6ba-27ee-aacb-2724-9d6b0d194e9e@amsat.org>
Date: Mon, 7 Dec 2020 19:27:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <bcf3aad7-7ff9-fbd5-be99-9f7d20cd614a@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 7:14 PM, Philippe Mathieu-Daudé wrote:
> Hi Jiaxun,
> 
> On 12/7/20 6:02 AM, Jiaxun Yang wrote:
>> Add a bootloader helper to generate simple bootloaders for kernel.
>> It can help us reduce inline hex hack and also keep MIPS release 6
>> compatibility easier.
> 
> Great idea :)
> 
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  hw/mips/bootloader.c      | 150 ++++++++++++++++++++++++++++++++++++++
>>  hw/mips/meson.build       |   2 +-
>>  include/hw/mips/cpudevs.h |   8 ++
>>  3 files changed, 159 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/mips/bootloader.c
...
>> +void bl_gen_writeq(uint32_t **p, uint64_t val, uint32_t addr)
> 
> Well, addr has to be uint64_t... else you wrap KSEG1 on 64-bit.

Oops I misread addr/val.

> 
> bl_gen_write_u64?
> 
>> +{
>> +    /* 64 Only */
> 
>        if (!cpu_supports_isa(cpu, ISA_MIPS64)) {
>            g_assert_not_reached(); /* unsupported */
>        }
> 
>> +    bl_gen_dli(p, 26, val);
>> +    bl_gen_li(p, 27, addr);
>> +    bl_gen_sd(p, 26, 27, 0x0);
>> +}

