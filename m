Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1359166A0EA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGNkC-0003oA-QJ; Fri, 13 Jan 2023 12:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGNk0-0003iF-V7
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:21:25 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGNjy-0002CQ-B6
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:21:20 -0500
Received: by mail-wr1-x433.google.com with SMTP id r2so21697709wrv.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vvrQQwP/YiVngYe/yHkxoQ+tXK29VdqGSrWKX+pnEYM=;
 b=RgNIy/ff1hBbAFSyLfv38nGPGLB8YbO1ylubcPMErWtaV4E38dDcyWhOXerbOJShql
 IGy9BK+0NzI2B2twju08wdxAddQGddFeyhTHrKKmv+sxwpjsnzO2UBRBtNDR8BWDQJka
 sifsUMypzROL/ef9SIyds2jWfAAuHp9N+jZdBM/2YIS6xdQI78UA91afP6PaeOH1Q1p+
 22HM8AGpT0vgYYci/BciXrcHUAZCkbL+aOo5ZaxOsWbnQb7HkhhlZrXRH7FUkSPdKFCf
 eHvQoeJzIxtLtOGT/PA3ZPiqjOqFa7aIgCHdxKj50AYXCYpwaK/lPpNJT4e/gZPZhfFj
 iG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vvrQQwP/YiVngYe/yHkxoQ+tXK29VdqGSrWKX+pnEYM=;
 b=j2NbICVrGVfUp3CrClxo4NB50ylEm7rRTQe+z+e2wTYC/EGAYpzbnACmoHegMErXln
 37Ng8LNgoEH8/u8/Lo9G/4ea3ag3h4BqfkUF5DGC/8jlXNb983Noxo4yrAN9ViQUiXLv
 Cmc/fO0A0Fxnr3mXwZqFU3GbC06ZqOsrB2V51AmzXUfq9YOxSn5YPRk3pSNBMp3pN5Ya
 1OMoataDN34Ksl/0m9d9DdISdIYc9OL5TqzOgGk7kTlJX7LN0+BXA9L/P+CZ9BPRoHei
 5kfiLcdUh3pGC9Jqb5PlfbF5KrSHNRQRUt/APRJT5Lt7keXE8VwkqKi2MaxQJTOGt3Rn
 qWpQ==
X-Gm-Message-State: AFqh2krgSnMLTYuDQ+kpn/LH3+q1DuOHXNbkqXh3LcFZj3P4FDQ/bxFn
 4g1swD/dR7VNZF6awTNKEa8q3cXAHTMZljho
X-Google-Smtp-Source: AMrXdXtf2pOH/qvZ2NSQFUu5SV4AAGbYjZeNPYykvdmOzJJOsx8XutCyY2DdDDJOOQgYgrsBXTCn2g==
X-Received: by 2002:a5d:6385:0:b0:2bd:e217:e1d with SMTP id
 p5-20020a5d6385000000b002bde2170e1dmr2268206wru.52.1673630476593; 
 Fri, 13 Jan 2023 09:21:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q18-20020adfdfd2000000b002bdc129c8f6sm7884681wrn.43.2023.01.13.09.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 09:21:16 -0800 (PST)
Message-ID: <de1ba5eb-c430-51d1-64fe-8b5c337160bd@linaro.org>
Date: Fri, 13 Jan 2023 18:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND v2 0/5] target: Restrict 'qapi-commands-machine.h'
 to system emulation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
References: <20221220111122.8966-1-philmd@linaro.org>
 <87y1q61qrz.fsf@pond.sub.org>
 <d8f97300-561a-6958-05a3-2789d139f9c4@linaro.org>
 <1f632a48-981a-95a0-6527-e0bb65034d92@linaro.org>
In-Reply-To: <1f632a48-981a-95a0-6527-e0bb65034d92@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/1/23 15:53, Philippe Mathieu-Daudé wrote:
> On 13/1/23 15:42, Philippe Mathieu-Daudé wrote:
>> On 13/1/23 14:57, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> [resend fixing my last name typography...]
>>>>
>>>> All series reviewed, can patches be picked by corresponding
>>>> maintainers?
>>>>
>>>> The "qapi-commands-machine.h" header is not generated in user-only
>>>> emulation. This series removes its use in user-emu code by moving
>>>> the QMP code depending on this header into a separate sysemu unit.
>>>>
>>>> Since v1:
>>>> - renamed cpu-monitor.c -> monitor.c on loongarch
>>>
>>> Quick drive-by remark: we usually name C files containing just QMP
>>> commands SUBSYSTEM-qmp-cmds.c, and files containing just HMP commands
>>> SUBSYSTEM-hmp-cmds.c.  On the other hand, the existing monitor-related
>>> files seem to be named target/TARGET/monitor.c.
>>>
>>> Keeping QMP and HMP two separate is desirable, but not required.
>>> monitor.c is a fine name for a file containing both.
>>
>> $ git ls-files | fgrep qmp-cmds.c
>> block/monitor/bitmap-qmp-cmds.c
>> hw/core/machine-qmp-cmds.c
>> hw/pci/pci-qmp-cmds.c
>> monitor/qmp-cmds.c
>> qom/qom-qmp-cmds.c
>> tests/unit/test-qmp-cmds.c
>>
>> $ git ls-files | fgrep monitor.c
>> monitor/monitor.c
>> softmmu/qdev-monitor.c
>> stubs/monitor.c
>> target/arm/monitor.c
>> target/i386/monitor.c
>> target/m68k/monitor.c
>> target/mips/sysemu/monitor.c
>> target/nios2/monitor.c
>> target/ppc/monitor.c
>> target/riscv/monitor.c
>> target/sh4/monitor.c
>> target/sparc/monitor.c
>> target/xtensa/monitor.c
>> tests/unit/test-util-filemonitor.c
>>
>> Do you rather 'cpu-qmp-cmds.c'?
>>
>> Or is your SUBSYSTEM the $target here?
>> Because , target/arm/arm-qmp-cmds.c sounds redundant.
> 
> IIUC the SUBSYSTEM is "target" so maybe you meant target-qmp-cmds.c?

FTR Markus suggested ${target}-qmp-cmds.c on IRC, I'll respin renamed.

