Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA102C2E57
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:22:30 +0100 (CET)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khc1N-0003n2-VM
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khbxN-0000oV-MB
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:18:25 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khbxK-0002Fm-7d
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:18:21 -0500
Received: by mail-pf1-x42c.google.com with SMTP id w187so4634092pfd.5
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=h4ULRzYx9lVB1wLVKdMN3eGiVeBfYwgSdGRuBYUFw8Y=;
 b=y6XPGLqqPz87PQareDMxb4E8oXIYolm0MTI/VQEljEwE/ZwClIBlmY/uBan1XI+lW9
 gtnyAO71cbFcZypIkLVgd2rvx9SQFcP1qcAvK4hQPt3D9O3K2ekPCRpQwUEmMBqMZNvd
 P0SyYehWX/Kj5wh6xrCv6zAKpVHAIRifK8EMIbDxpiIJNrr7vtLeEOVVbkadhxqzrvhJ
 /5C7TaBISoB59SeaN79FVzTeVbLiWExUbq39pwO7N4irHLJs683yucXrJT1XeMR+cF0r
 XExUU1qUtZXrlAO3d75Uxie/URb8FB4Ffsvzu4lBa4knhIvaEkKVkdh0Ylgx+Eax29PI
 stpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h4ULRzYx9lVB1wLVKdMN3eGiVeBfYwgSdGRuBYUFw8Y=;
 b=TUSEWMgTzRxxf/mgProDNwmZEwO0HnyeicTjsDh7mpm9C/wCHGZxtkmU6Ejp0KG4Rr
 RwE43wtZgeaqaW7VcPzk3dTjChrcs+aZsFaPh71iLCRO7T4ByuKorW0ArkbwKOUGaXHI
 89yKmQ40aDrfxcJlqBDV4cSQxQD9hwDbSjodWkRimf+dP0VFBuzQJ2GI/v1HqiXGue5V
 O5qIDn1DwxDApsRctsA00jxjLm9n3NDTwJFuFFgw4jqGcPmvMN4zHm44bRH9GH9o5IdC
 4wN4PkZOXJl9C3XwLOKZGho7SpKW3C4yQHu9P/tBrIF9Zt13wG72sCWefwbCXLzYVRy3
 ovJw==
X-Gm-Message-State: AOAM531hjJWaP+TOC5zcCz+phSKk90bpBpGGjRGi1poRSKFAffvTX5BX
 Wec6MTnz/8L/AVaxkOVc6tA0/A==
X-Google-Smtp-Source: ABdhPJzAhZjDk5H1rds5eaWLt/mtuq1Umdp0uDcetfpUYDtlyFaDotkPOkm0HVy8hB4qXPKx4hYDCQ==
X-Received: by 2002:a17:90a:384e:: with SMTP id
 l14mr6168410pjf.104.1606238296679; 
 Tue, 24 Nov 2020 09:18:16 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m11sm3065240pfa.24.2020.11.24.09.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 09:18:15 -0800 (PST)
Subject: Re: simple aarch64 binary can cause linux-user QEMU to segv in
 zero_bss()
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier
 <lvivier@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAFEAcA_=RGziK6H4Pip+heE3JfjTYaZgrTgkwM=tNTwsqvuLfg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e6cbc1f-82a5-1cd7-cdf3-59ab45c6d189@linaro.org>
Date: Tue, 24 Nov 2020 09:18:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_=RGziK6H4Pip+heE3JfjTYaZgrTgkwM=tNTwsqvuLfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 11:52 AM, Peter Maydell wrote:
> Somebody reported this on stackoverflow. Before I spend too
> much time thinking about how this ought to work, does anybody
> have the elfload.c intended operation in their head still?
> Bug description and analysis of what goes wrong below:
> 
> https://stackoverflow.com/questions/64956322/alignment-requirements-for-arm64-elf-executables-run-in-qemu-assembled-by-gas
> 
> Given this trivial asm:
> 
> ===begin program.s===
> // GNU Assembler, ARM64 Linux
> 
> .bss
> 
> .lcomm ARRAY, 16
> 
> .text
> 
> .global _start
> 
> _start:
>     mov x8, 93 // exit sys num
>     mov x0, 0 // success
>     svc 0
> ===endit===

...

> Should we try to get the SEGV handler working earlier in initialization
> (it's pretty hairy machinery so that could be tricky) or should
> elfload.c be mprotect()ing things appropriately itself?

elfload should be handling this.

I believe this should be fixed by

https://patchew.org/QEMU/20201118165206.2826-1-steplong@quicinc.com/


r~

