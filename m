Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8D2D8E22
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 16:08:36 +0100 (CET)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koSzD-0003n0-CQ
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 10:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koSxl-0002o2-8N
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 10:07:06 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koSxj-0005VL-SU
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 10:07:05 -0500
Received: by mail-wr1-x441.google.com with SMTP id i9so13880020wrc.4
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 07:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rLvCBw+TF6bGTZk/OABt+MpTvfw6/hRLB11RMre9zAU=;
 b=B7EpdiF+qVe7eGA1xBtQXN9tMxEzinAnOVWacZf8FENg1nXzottFZQExZC2+bfCav7
 pOXs/euMsw8LwPns/dC4mNXLAC49fL4q+qW5NlMoecdAnSj8FaxLxIJG0IhVTY6XmQyu
 eU+u3u2EDTWDP8wlvQaHrYLnsNnK+n0LHy1PqF+9B78nx1PpHVlZ9rNpCV/u/sd4X1/i
 GAm83PetKuetTM+3p06W4RC8R2IYLKBmAILudB1NXsVpZ2AhnI7RZqXpW/gmmnFKIhvu
 LeWgwdFN4cOUGGQRdisWiDKJc8IL88dWC/n/QGKMbUquEAOgeh50q9DXQZ0XhWFbSQyC
 q6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rLvCBw+TF6bGTZk/OABt+MpTvfw6/hRLB11RMre9zAU=;
 b=UIrY7TLrj9ZAsL97REZdhG7EprTRv++n13u1uzgHPCafmvYpP4Cnm7SKJxiOWJ5Dnn
 C9oJ5Gir82E2kpxHSvspVRh+KpNZRe8cWJWOQ6S55biAZbMaUNiYFtMOlW/N+ZQ1duaA
 cPinAPv9hNCHdoYLlZGjIj9FRf0UQkh5qhfsYaa4SLWrTueiapVhzksRjsraQprv9GFm
 V5J+1P56uy2yijVmtqYI4KXr83jVAPGt8MMooa/9GiEZgsW4/VI6dNv5+OnJef5q5cm4
 Blnsj12b2+YCZq780kA+/SA64wCF67mTkrMC1g5girFOF/8Cg1FnAgpGaECcZCYKWdvl
 n8KQ==
X-Gm-Message-State: AOAM5312OCKIKT+eyHIgLHq9XiuEMEa3z+g+2ShiBuaTQ0nLFVEoQAuq
 NmjzWcKpMh9/cQYPEyaEnaU=
X-Google-Smtp-Source: ABdhPJyFQn2fJCwJSOXnjKpDwzK0DYOfVL0QQICllQIAhUSK3W4ux/8bmHSGJt14F95TBwmUIO4PtA==
X-Received: by 2002:adf:f707:: with SMTP id r7mr25302846wrp.113.1607872022358; 
 Sun, 13 Dec 2020 07:07:02 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h16sm21157140wrq.29.2020.12.13.07.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 07:07:01 -0800 (PST)
Subject: Re: [PATCH v4 0/6] linux-user: Rework get_elf_hwcap() and support
 MIPS Loongson 2F/3A
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20201207224335.4030582-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aa2e1db8-f65b-07c9-9bcd-0420c792cc74@amsat.org>
Date: Sun, 13 Dec 2020 16:07:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207224335.4030582-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 11:43 PM, Philippe Mathieu-Daudé wrote:
> Series now fully reviewed.

Ping :)

> 
> Since v3:
> - Add CP0C0_AR_LENGTH definition (Richard)
> - Fixed 3E -> 3A, Longsoon -> Loongson typos (Huacai)
> 
> Since v2:
> - Use extract32() in GET_FEATURE_REG_EQU (rth)
> 
> Introduce the GET_FEATURE_REG_SET() and GET_FEATURE_REG_EQU()
> macros to check if an instruction set is supported by a CPU
> using CP0 read-only bits (instead of QEMU insn_flags which
> is not always coherent - we might remove it soon).
> 
> Use these macros to test for MSA ASE and Release 6.
> 
> Update the ELF HWCAP bits and set the Loongson instructions
> so we can run 2F/3A userland binaries.
> 
> Supersedes: <20201201192807.1094919-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (6):
>   linux-user/elfload: Move GET_FEATURE macro out of get_elf_hwcap() body
>   linux-user/elfload: Rename MIPS GET_FEATURE() as GET_FEATURE_INSN()
>   linux-user/elfload: Introduce MIPS GET_FEATURE_REG_SET() macro
>   linux-user/elfload: Introduce MIPS GET_FEATURE_REG_EQU() macro
>   linux-user/elfload: Update HWCAP bits from linux 5.7
>   linux-user: Add support for MIPS Loongson 2F/3A
> 
>  target/mips/cpu.h    |  1 +
>  linux-user/elfload.c | 43 ++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 37 insertions(+), 7 deletions(-)
> 

