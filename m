Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCDC39C534
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 04:45:32 +0200 (CEST)
Received: from localhost ([::1]:48158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpMJX-0000yT-2Q
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 22:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faraz.shahbazker@gmail.com>)
 id 1lpJcX-0003mN-T7
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 19:52:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faraz.shahbazker@gmail.com>)
 id 1lpJcU-0007F9-2w
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 19:52:57 -0400
Received: by mail-pl1-x62e.google.com with SMTP id u7so5461152plq.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 16:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EVUfBPinzr9Ka2CgQjyF1O2tCkyLWojg9G0kyR1uAuM=;
 b=TFIDkyhzcuY57iTXrh9UUV9X49PXFCZbkCLqr7M3B12gyU0lCgL5w+5TGviFjWhmfF
 idL+lt1GFn1d4TT3Pqyqd5GvaMvIpIN9vTvM/RF/2QIPOr4wFvsLNYqIBiDN/eM8cEM6
 iglZbqHP+lmL7ZTr/UzH1vRg/KkpiQdQvWQOs9A4atCdgwK4/Ni+SiKHZGaJZOj12mbA
 KxsfIA3dIB3ZhdTZnoJCUWHheerlCoFaXLyjyjejVRx4Xl2reatuC0Nt9W5a0LqaavZB
 dNddYbtQQuuypccndzX1xWRWq/EpnZG6xB0PmZx/fOqbFRGffxqezURpR0tQYLRIEZGh
 N39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EVUfBPinzr9Ka2CgQjyF1O2tCkyLWojg9G0kyR1uAuM=;
 b=DwIbbv3pzn2MkIeDUs89KgDv6gi0hMpkwjkzEQV9vZWlsCzzih9jq/APY/maop/dUf
 WyHk8PZwQ8+91x3RDbuMPZIwNqxvhYZuJwsv7w6Nrui1bABYtx9OGYApL6ffeBR2KlA9
 YmvdyUjiKLZb/g7IQco5D/VPVZb4p9HW+9u8Y7zor9+cgHbUjqVG+QU9tgR4+t9DtC/5
 NoNFzyuTBZ4+SnGoGxlpwH5F7Kkh75hAfob63ioiVv9xDQZxawPIJFW7gE0YzEyAYzo0
 gCg9X1eVgFYDiMW/JV49QaewgPQq7JZWYdC43vmMfhSb3I6EbLwp8MrpaU9+R+6VO7FZ
 3Jng==
X-Gm-Message-State: AOAM530Nujzwj1E1oFu12imZdi+hULYHrk0IG2+meiuJTaHjd1Ynyjqo
 ywo8abePh+8J/DfvoyD6YO4=
X-Google-Smtp-Source: ABdhPJwhWishoyH2HWYwPKn6nMw1X4EWaD2BsdZkV49p4QALeL5kU/wMz68ZyIfNJ9jcbu3jvODo2Q==
X-Received: by 2002:a17:90b:4d82:: with SMTP id
 oj2mr7378912pjb.61.1622850772440; 
 Fri, 04 Jun 2021 16:52:52 -0700 (PDT)
Received: from [192.168.43.9] ([123.201.54.87])
 by smtp.gmail.com with ESMTPSA id ei10sm593602pjb.8.2021.06.04.16.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 16:52:52 -0700 (PDT)
Subject: Re: [PATCH v11 08/46] target/mips: Add emulation of nanoMIPS 16-bit
 branch instructions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
References: <1534789014-8310-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1534789014-8310-9-git-send-email-aleksandar.markovic@rt-rk.com>
 <CAAdtpL7jGOxhaqA-gLSRX_6FktEm89AMW-xkV=n+mEjWd-O1iA@mail.gmail.com>
From: Faraz Shahbazker <faraz.shahbazker@gmail.com>
Message-ID: <fb33be73-743f-65a0-7803-9e62f659f889@gmail.com>
Date: Sat, 5 Jun 2021 05:22:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL7jGOxhaqA-gLSRX_6FktEm89AMW-xkV=n+mEjWd-O1iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=faraz.shahbazker@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Jun 2021 22:43:21 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dimitrije Nikolic <dnikolic@wavecomp.com>,
 Stefan Markovic <smarkovic@wavecomp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, faraz.shahbazker@mediatek.com,
 Petar Jovanovic <pjovanovic@wavecomp.com>, Paul Burton <pburton@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/21 7:22 PM, Philippe Mathieu-Daudé wrote:
> On Mon, Aug 20, 2018 at 8:17 PM Aleksandar Markovic
> <aleksandar.markovic@rt-rk.com> wrote:
>>
>> From: Stefan Markovic <smarkovic@wavecomp.com>
>>
>> Add emulation of nanoMIPS 16-bit branch instructions.
>> ...
>> +        /* Compare two registers */
>> +        case OPC_BPOSGE32:
>> +            tcg_gen_setcondi_tl(TCG_COND_GE, bcond, t0, 32);
> 
> This opcode implementation seems incomplete, per the ISA manual:
> 
> If a control transfer instruction (CTI) is executed in the forbidden
> slot of a branch or jump, Release 6 implementations are required to
> signal a Reserved Instruction Exception. A CTI is considered to be one
> of the following instructions: branch, jump, NAL (Release 6), ERET,
> ERETNC (Release 5), DERET, WAIT, or PAUSE (Release 2). An instruction
> is in the forbidden slot if it is the instruction following the
> branch.
> 

This also stems from mistakes in the DSP instruction manual. The 
description text for BPOSGE32C in the nanoMIPS32 DSP manual has been 
blindly copy pasted from microMIPS32 DSP manual. As per the nanoMIPS32 
Instruction Set Technical Reference Manual, Revision 1.01, Chapter 1, 
Introduction, p12 [1] :

"branch delay slots and forbidden slots have been removed."

[1] 
https://s3-eu-west-1.amazonaws.com/downloads-mips/I7200/I7200+product+launch/MIPS_nanomips32_ISA_TRM_01_01_MD01247.pdf

The nanoMIPS architecture is not a revision of MIPS release 6, but an 
entirely new architecture that happens to have a lot in common with MIPS 
release 6. Using the same target sources to implement both means we get 
quite a bit of code reuse, but also that we have to be cognizant of such 
differences.

- farazS

