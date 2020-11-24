Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D82C2CC5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:24:56 +0100 (CET)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khb7f-00085s-BM
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khayf-0003PI-0i
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:15:44 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khayc-0000mz-L4
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:15:35 -0500
Received: by mail-wr1-x432.google.com with SMTP id g14so7703458wrm.13
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 08:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l2h5Ix+dOkLmf0XdtUJinsrcP6ddMfNxYtE7Dq+rl9s=;
 b=YUuoax1sDzN10FLabum411mLVsF2oWae8Tjl00I9aHH6/BuhFGCtrn1cV5qTrC9IRX
 3dVcTeJwDUBmd38geebMugDGVHq1gXjoGtF2gwMOs30NsZhGYkYvqP6TzGPSRYDR2A5M
 PoBlYraFRPs+I6BzajU6h6ICXOPPchsApV3H5Kggk/tlkXEOZqs497cBm79HVM2z/0xo
 0sZGHGI/Fx4Ibn/IcAhS73D6RaC01Ms22VgKDzbqz/iJvDKegvOvHXk+2QnviLRefe9y
 K1ZtRIVAK4FLG6LIdw6VCnQj12vx0I6JUioC6BoikAwxFGERgfM8S3zfcxAvb5N6vV7v
 Am4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l2h5Ix+dOkLmf0XdtUJinsrcP6ddMfNxYtE7Dq+rl9s=;
 b=XkEgGG8IlQaG0Ehn/ee9Vt4sYItWAlcpHLA+LgD8HkIsSLQ7rYyK0+hVEq7RcE7axg
 WvH6thU14AIO339P8ehRcWfMuFhWJlrNfXJaCwiIsh2lG98DzY7C8Up8/7qjdCRxAa9l
 V13Aa6OSFcM0GH2N0p8Z8sUdEX01I5Y9xcwLHJyxoNfnN2BdKSTKia5f1rOHfeMmxR6f
 r/LqMNMiJ+ZfTtG5aS3/iS3Uha0ga5K9rrfeWc3JkswhoJ4cQXnjJzGAm+oJM/dF5MEn
 n+tsYt9qPTeW1N8Co24dDzMyIegXvmD96zoFwyRL4yprxlnL1AXTzrcazZYlwcifTKsi
 fIxQ==
X-Gm-Message-State: AOAM532ak+KBMtMRkxpiQJu6s4wWZJ2yyK3E0mDEBUyxp/pYWbndrmH1
 WXZcLjwz22k8Eslnqp7XbIk=
X-Google-Smtp-Source: ABdhPJzG4xRbrEkY725g9xeXvf+tXFhzdj7/dqjOe9uDi+BIhA9r1mWXhmJQto4Wi99nqZflwjbXwQ==
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr6170239wrp.142.1606234532909; 
 Tue, 24 Nov 2020 08:15:32 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id 90sm14600702wra.95.2020.11.24.08.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 08:15:32 -0800 (PST)
Subject: Re: [PATCH-for-5.2?] target/mips/translate: Check R6 reserved
 encoding for Load Linked Word
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201124134557.569388-1-f4bug@amsat.org>
 <5bcade19-de8c-8521-f77c-599e3c9d40a0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e983c95c-5713-3b5b-0c3c-e0d6bf8244c6@amsat.org>
Date: Tue, 24 Nov 2020 17:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5bcade19-de8c-8521-f77c-599e3c9d40a0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
 Mateja Marjanovic <mateja.marjanovic@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Maciej W . Rozycki" <macro@linux-mips.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 4:59 PM, Richard Henderson wrote:
> On 11/24/20 5:45 AM, Philippe Mathieu-Daudé wrote:
>> Release 6 recoded the 'Load Linked Word' using SPECIAL3 opcode,
>> this opcode (0b110000) is now reserved.
>>
>> Ref: A.2 Instruction Bit Encoding Tables:
>>
>>   "6Rm instructions signal a Reserved Instruction exception
>>    when executed by a Release 6 implementation."
>>
>> The check was added in commit 4368b29a26e ("target-mips: move
>> LL and SC instructions") but got lost during latter refactor
>> in commit d9224450208 ("target-mips: Tighten ISA level checks").
> 
> I think git blame is confused here -- d9224450208 isn't the one that broke
> things.  The patch has:
> 
> 
> +    case OPC_LL: /* Load and stores */
> +        check_insn(ctx, ISA_MIPS2);
> +        /* Fallthrough */
> +    case OPC_LWL:
>      case OPC_LWR:
> -    case OPC_LL:
>          check_insn_opc_removed(ctx, ISA_MIPS32R6);
> +         /* Fallthrough */

Sorry I have been confused by the /* Fallthrough */ ...

The check is below.

Self-NAck then.

