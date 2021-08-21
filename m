Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB63F3BAA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 19:23:38 +0200 (CEST)
Received: from localhost ([::1]:50004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHUiR-0003Wt-R1
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 13:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mHUhV-0002qH-1a
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 13:22:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mHUhT-00081Q-Ik
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 13:22:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so7948403wmi.1
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 10:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xWM9ULs7TdjSzGaNoBdkyWNh0NV8m2s1osSxZ4wrX/0=;
 b=A4LkFlDrajamxNtZUO2pdMQ3CmsBm0fcqBzwNN25qnEWVNda3Q79+bcP13f3tT7ghH
 lyvV/LLcprcog/DKFEKkBxBn7A6Ddn8f6gbQzQlnT2N7DpAcijNPCr1b+vNQUcWbHzlq
 nMqDQm0nxCEi9pN5fqKt0UBZJKaPb1Np3mpDTmdiABeZ9LqIosGMqUwS1OfpVGaNhj2H
 h1GXspp2iH2LDNfs8cBCcyGJiuMulkU9s9YZGEMva1NFy3/jlXgFnv3iMwLe7niUUdeN
 6cah+L0Yo97gsyRy9IF/LWuGaHSvfvkkuWe/0gNzRfnM0uDSq+qlhAoF6wwNB3GSMZfN
 BDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xWM9ULs7TdjSzGaNoBdkyWNh0NV8m2s1osSxZ4wrX/0=;
 b=ovl6irQPDKR4jpk5BnH8eU1rp549EohGHo67wBxAbfjGimS073Z0TeLeaz3sbxBUyE
 KHbp5cpF9lnK5LQMueXAMj99vXf1txKUGYeeG4SKYgErhoU3Xsmf6zIA/MoFLPN8QVxU
 zSgDkA3BT7hdpsFI+ab6TsRieKFVWvqH+BLhxBGyaZ6fvQx/oQ8In5QBngEHaYIo7psn
 bell8tP2e4U0d34+gV/yLEzqgObx0oGObjCToSk8pFEYHgMI5pOrGvWfqxoFSmFpHsDG
 Fg7qwLF+mutIKDpoUhOFpFCSnJvTIM5L38EV85+UUQIv9yPQrgpAG66li05COlXuK6Xp
 r5ow==
X-Gm-Message-State: AOAM530Tck4How6Yic9kfooTaDGBO1nww2cE+yGvLsO2Y0o2L/WsqHST
 rvJs1LjoOiXHxSWL+SeDNT0=
X-Google-Smtp-Source: ABdhPJzE43dX+AYNufvKPN+8H/wmnMfRX4hG15RTInz/zb2Sx+tezSxdTqagCg4ThcnIaltPLLp+mQ==
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr2636660wmf.132.1629566549351; 
 Sat, 21 Aug 2021 10:22:29 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o6sm9516068wru.92.2021.08.21.10.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 10:22:28 -0700 (PDT)
Subject: Re: [PATCH 0/8] target/mips: Housekeeping in gen_helper() macros
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210816205107.2051495-1-f4bug@amsat.org>
 <95d3f194-1042-6cf6-08e6-cffd1fd87620@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <35ec8d79-712f-af74-a215-7b0fb3cfaf8d@amsat.org>
Date: Sat, 21 Aug 2021 19:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <95d3f194-1042-6cf6-08e6-cffd1fd87620@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.49,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 4:52 PM, Richard Henderson wrote:
> On 8/16/21 10:50 AM, Philippe Mathieu-Daudé wrote:
>> Trivial patches:
>> - Remove unused macros
>> - Use tcg_constant_i32()
>> - Inline the macros when few uses
>> - Move macro definitions in translate.h
>>
>> Philippe Mathieu-Daudé (8):
>>    target/mips: Remove gen_helper_0e3i()
>>    target/mips: Remove gen_helper_1e2i()
>>    target/mips: Use tcg_constant_i32() in gen_helper_0e2i()
>>    target/mips: Simplify gen_helper() macros by using tcg_constant_i32()
>>    target/mips: Inline gen_helper_1e1i() call in op_ld_INSN() macros
>>    target/mips: Inline gen_helper_0e0i()
>>    target/mips: Use tcg_constant_i32() in generate_exception_err()
>>    target/mips: Define gen_helper() macros in translate.h
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks, series applied to mips-next.

