Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5422B9919
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:16:06 +0100 (CET)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnXP-0005Rk-Be
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfnUs-0004SW-CR
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:13:26 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfnUq-0001s0-PV
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:13:26 -0500
Received: by mail-wr1-x441.google.com with SMTP id p8so7257234wrx.5
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 09:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pangeNLr62c/CcYQ6jUJlHOnW9VWItL36K0m2X9JjAs=;
 b=hKWB3J8ccZV6BcDFj7Qw6rSH1+FVSg6q0gbDIbzwsCa5qGAPg/L1qCq3tyqAdg1PuS
 Pk+suq5nf++7AWooX/KMH0C2MMzsS6S6niuXaDyue1wlzN4GIcjWWU8qLgRrgCoOGGP2
 JBTe73RzVet+jpvnUaitEZKePp62e9RDrA2AU0IEFpC6OLa1uVNXRMD2O74DXalUpWWv
 GcHsQH72AV+kjxYdqVBct0zvPjC9xhkvw3BqNSl8Z94W2NYmnmRP86Ylp5Esu7W4qvBA
 F9KW7QRPODaCh7LqL+CmK8/05k9rllKzc6Y+YuHhNLGT9JZ8NDbhpieewPRhmvxspHWM
 RaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pangeNLr62c/CcYQ6jUJlHOnW9VWItL36K0m2X9JjAs=;
 b=XGOr9zu4Gg9OOqX1GA3Mj3QFwMPaGj9bLXMqhKXefbvndntYMg7utR9u8iVHhPcgjZ
 j5qiA8/KILijuaNWPHSDAoE6pYWAbeY2lLpPAYoWhkEYxTp5z2RS1+kLnQ+dcfPOR6zg
 nFZwOc85LUUTNYGEqEldivRxI/8p/JLO9pGOwRBvh744N+xo/JIA/t6mb/e4qjfX8s/O
 7jza7XfoGmsq8cwyp1EowivJryz/BsCbgeBSuqbSTm90P/1GLhUf8M9UWCuvviom8Zfr
 dyPqJXUX1HOOcm+blCoEofkGoW+5T+Hxl2lgS7gjzIMLl80dEORe8ff0nM3ASzbwuWvc
 XjCw==
X-Gm-Message-State: AOAM532jmPXXuNdg0FqpoKUsqrlRCiplxJ6ujhH/C52yuiFd7bBgQK82
 7rqvUnYJRq7suT6PKo15rRU=
X-Google-Smtp-Source: ABdhPJxsFnEkCUAW+6f+GoYpbgiiL+3HJrLKSfGyLvpOMDCvNH3u2op94GaotDCGCzH8FIvktcQZGg==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr11471577wrv.306.1605806002977; 
 Thu, 19 Nov 2020 09:13:22 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id b14sm699344wrq.47.2020.11.19.09.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 09:13:21 -0800 (PST)
Subject: Re: [PATCH 3/4] default-configs: Support o32 ABI with 64-bit MIPS CPUs
To: "Maciej W. Rozycki" <macro@linux-mips.org>
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-4-f4bug@amsat.org>
 <alpine.LFD.2.21.2011191634540.656242@eddie.linux-mips.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <85288d49-70a1-a213-0390-d9cfd428f0be@amsat.org>
Date: Thu, 19 Nov 2020 18:13:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2011191634540.656242@eddie.linux-mips.org>
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
Cc: Fredrik Noring <noring@nocrew.org>, Mathieu Malaterre <malat@debian.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, YunQiang Su <wzssyqa@gmail.com>,
 James Cowgill <james410@cowgill.org.uk>, David Daney <ddaney.cavm@gmail.com>,
 =?UTF-8?Q?J=c3=bcrgen_Urban?= <JuergenUrban@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Maciej,

On 11/19/20 5:45 PM, Maciej W. Rozycki wrote:
> On Thu, 19 Nov 2020, Philippe Mathieu-Daudé wrote:
> 
>> MIPS o32 ABI on 64-bit CPUs looks like a ILP32-on-64bit data
>> model, allowing 64-bit arithmetic and data movement instructions.
>>
>> This is the default ABI used by the "Sony Linux Toolkit for
>> Playstation 2".
> 
>  Please don't, not at least with a generic configuration (i.e. make it 
> unambiguous that this is R5900-specific).  This only works with R5900 
> because it does not implement the MIPS ISA correctly (e.g. see what $ra is 
> set to with JAL/JALR/etc. in the kernel mode), and it is not supported by 
> the standard Linux ABI.  Use n32 instead, which has the same functionality 
> and is standard (and is also a better ABI in terms of performance).

I think there are 2 different interests with the R5900. Fredrik sent a
series to run recent userland/kernel on a PS2. For QEMU, it would be
easier if these uses the n32 ABI indeed.

This series allows me to run unmodified binaries from the PS2 (built
maybe 20 years ago, apparently for a kernel 2.2).

>  You'd probably need to implement all the R5900 addressing quirks for your 
> proposed hack to match hardware, or otherwise you'll end up with emulation 
> that creates its own reality.

QEMU doesn't model well non-MIPS32 ISA, so the R5900 needs work indeed.

Laurent, maybe instead of 'mips64o32el-linux-user' we can call this
target 'r5900o32-linux-user', 'ps2-linux-user' or even 'r5900-ps2-user'
as Maciej said "it is not supported by the standard Linux ABI."

Also I'll see to mark it deprecated so it isn't built by default.

Thanks Maciej for your interest,

Phil.

