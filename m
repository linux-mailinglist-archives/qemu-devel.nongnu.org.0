Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97BA46797D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:34:42 +0100 (CET)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9e5-0006fZ-P9
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt9Z2-0000g1-ND
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:29:28 -0500
Received: from [2607:f8b0:4864:20::531] (port=34496
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt9Z1-00055Y-2h
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:29:28 -0500
Received: by mail-pg1-x531.google.com with SMTP id 200so3233240pga.1
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pI8GhDhavOBv4aVL1bXwLgdklYWYoXwaPgdm34y/Mnc=;
 b=eBKvsGryUQ8RkTcQ5rZE9gQ3t2DtmM2eovwxG5tKJpLU2oVPlb1SQDf6iK2Pe8W0Nq
 iBSV35XgelalFf82fMggIsCNIlssjw7GrJxeYWzrw7+EkxIfBGPf04UBAijzgXc1S1tG
 jR0AO3mv4t0OGOtK+mMsUt7+YYp9WmUxe6m32v9cmWkidnVBHK+I4AV5VsdslR6bHpxm
 1OTVVqkkWEri1uBov5gbTz1rCk3VS+8gDxnc+kTzFmA0R0wjgBLWoIuN0PX8IGHjbBGB
 NDN3LRQsdUsmRWgx4/bEMvoZq+01XhqsobeG0BbXQnaJvkXmUChEzQXkYWg00Ad29s3O
 mWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pI8GhDhavOBv4aVL1bXwLgdklYWYoXwaPgdm34y/Mnc=;
 b=3xClyRR70EL+KzZVim5QeDEJWjGOpK3wLflwYBPxj0F8cfk71roqkB9eM/yk4bRDs4
 UG8g+7d4by5VTAhfrI9P28xn8uFOZ0t9J9RYxiNIp/+jvvE8NCAK4H1x16wkPDd34UC5
 baXI0muO65s45V3mhczkpkl+LWOegGk+gAOpgkjz9xBshRe9o3tIGVatPtXAiZERRflB
 lUixzoU7j5ULdc5T+gaWFa78Wxm2aJBKORJQq/sDdoKDh3ROgfLiBHA8RUZlcFGUYSSV
 3x/YvX0TOmnLBzQjRk4/k8OrIRQp5HDVGVf3DiIZ8L3KTnh7nbS1h3/bGhCIbrkXNGRT
 4P1g==
X-Gm-Message-State: AOAM531jEqZaBJJGsEJyz5aMkMSojlNmbQbKP00NO9/tdDsm4JCOCc53
 8Ksfvx21o4tYdm+h30B9eeUx2P9gQX5K+g==
X-Google-Smtp-Source: ABdhPJzbA+Xlkdb49AMH/uuxFicJqh0AST1AYGejOMkQPZgKPfCjsMU3DRPgu/ile4t1g7u9iNMW7A==
X-Received: by 2002:a62:e904:0:b0:4a4:b4e3:a712 with SMTP id
 j4-20020a62e904000000b004a4b4e3a712mr19534121pfh.25.1638541765233; 
 Fri, 03 Dec 2021 06:29:25 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t2sm3720121pfd.36.2021.12.03.06.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 06:29:24 -0800 (PST)
Subject: Re: [PATCH v2 06/15] target/m68k: Fix address argument for EXCP_CHK
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-7-richard.henderson@linaro.org>
 <0286cb5b-0aee-be3b-7343-e6c606b1eadc@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad52f239-1595-8631-f992-c594ae5755b3@linaro.org>
Date: Fri, 3 Dec 2021 06:29:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0286cb5b-0aee-be3b-7343-e6c606b1eadc@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/21 6:27 AM, Laurent Vivier wrote:
> Le 02/12/2021 à 21:48, Richard Henderson a écrit :
>> According to the M68040 Users Manual, section 8.4.3,
>> Six word stack frame (format 2), CHK, CHK2 (and others)
>> are supposed to record the next insn in PC and the
>> address of the trapping instruction in ADDRESS.
>>
>> Create a raise_exception_format2 function to centralize recording
>> of the trapping pc in mmu.ar, plus advancing to the next insn.
> 
> It's weird to use mmu.ar as the field is used for MMU exceptions.

Should I rename the field to "excp_addr" or something?


r~

> 
>> Update m68k_interrupt_all to pass mmu.ar to do_stack_frame.
>> Update cpu_loop to pass mmu.ar to siginfo.si_addr, as the
>> kernel does in trap_c().
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/m68k/cpu_loop.c |  2 +-
>>   target/m68k/op_helper.c    | 54 ++++++++++++++++++++------------------
>>   2 files changed, 30 insertions(+), 26 deletions(-)
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>


