Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933D2D3296
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:19:31 +0100 (CET)
Received: from localhost ([::1]:57830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiWI-0000qM-7F
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmiPc-0006oz-PL
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:12:36 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmiPb-0007Iw-5l
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:12:36 -0500
Received: by mail-ed1-x532.google.com with SMTP id q16so18703360edv.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vXhiX8+F42dDe1lb9JT0aJw3nxuWJ8le2dxYEIZywEg=;
 b=MQ/W0YRgWHQG8F5gM+xNvHh0HZQd1dUwreI+P2p0ufpCw/y2q/6ij8aHGMmXfutKDZ
 MXCACyyZBmfXC2F2Sw29hfX5oShm913JS8wMKwMMtyxDF0H2SLyg08YqQkeqQAIlJRLw
 kfG+x19NTc7WZoD4nCx/GMM2IJQjd7RH/6lVRiSgR7FYGAiY3Pdcx/Gr6hdqFNAs5GRf
 maUbjV32jOa9GKr9ph2+7KrXncU783Wrjh1/dj3Z8EMX03vCQqE8EtSXu8Y9V6Jf7S2p
 7cwq96dUTnooeZ+tPvj+u0OphDr2BCSKuSb1zgcIOgSGKS3Xy88ZOY7pzey6TmjPEOOp
 trQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vXhiX8+F42dDe1lb9JT0aJw3nxuWJ8le2dxYEIZywEg=;
 b=U93rsCuI+ZzMALkgwYStXZNHVGF7UK5d6s0wv/QPOQcYJzwMPW3DXv157NnFxl1jxm
 9Q0dG+7jvdyq8ub4LybYd2xONOhUuxZVN/gD6psyGzun0zAVN8u5ZT6+1ZXbsUC+42jK
 LyC2Si1GzItRvK5UlchPG9tFFrhJpLiNFwcYG7q57B7yGRdV1HsYTR4gSrKvbszPsxSF
 NugGtipeFmuFNlJY63Kstd5qhuyCyKXzdQoBLhjdadR4ZNJ9sSkFH4vvOvJkB3s9KOyE
 8e0xZLGIzKARKdiRg7qOX1IMGKt5ZJWQQ9fypeN6Hiukc//xlBWCp+hxygYR7QKsdLVY
 3KqQ==
X-Gm-Message-State: AOAM533b4r5egUxLiZGqpJJ8cgSRMdmEiN8ZcZYuMesZBjfV7DU4+gQd
 8sBN3sn891dyhOXier0yWls=
X-Google-Smtp-Source: ABdhPJxX343uXDWX74FAdEBkzRb3buIR+ae8aICW5ykq+ukRAUACVULLos6/iUtCUxF78fnKryaL+Q==
X-Received: by 2002:a50:f9cc:: with SMTP id a12mr11486833edq.335.1607454753476; 
 Tue, 08 Dec 2020 11:12:33 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n7sm18294205edb.34.2020.12.08.11.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 11:12:32 -0800 (PST)
Subject: Re: [PATCH-for-5.2?] target/mips/translate: Check R6 reserved
 encoding for Load Linked Word
To: "Maciej W. Rozycki" <macro@linux-mips.org>
References: <20201124134557.569388-1-f4bug@amsat.org>
 <5bcade19-de8c-8521-f77c-599e3c9d40a0@linaro.org>
 <e983c95c-5713-3b5b-0c3c-e0d6bf8244c6@amsat.org>
 <CAAdtpL7zG6Ocbv0ChjQUArGkmTEegzC5AW5O3DjiDxFK7oEMWg@mail.gmail.com>
 <alpine.LFD.2.21.2012081838061.2104409@eddie.linux-mips.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f6b6e6a4-717a-dfbb-59fb-a23d7fc6345d@amsat.org>
Date: Tue, 8 Dec 2020 20:12:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2012081838061.2104409@eddie.linux-mips.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 7:43 PM, Maciej W. Rozycki wrote:
> On Tue, 8 Dec 2020, Philippe Mathieu-Daudé wrote:
> 
>> Duh I hit that again, read the patch again, looks correct. I guess
>> I got confused myself reviewing the offending patch...
>> So I'm applying this patch to mips-next queue, using
>> Fixes: d9224450208 ("target-mips: Tighten ISA level checks")
> 
>  What's wrong with current code?  What I can see is:
> 
>     case OPC_LL: /* Load and stores */
>         check_insn(ctx, ISA_MIPS2);
>         if (ctx->insn_flags & INSN_R5900) {
>             check_insn_opc_user_only(ctx, INSN_R5900);
>         }
>         /* Fallthrough */
>     case OPC_LWL:
>     case OPC_LWR:
>         check_insn_opc_removed(ctx, ISA_MIPS32R6);
>          /* Fallthrough */
>     case OPC_LB:
>     case OPC_LH:
>     case OPC_LW:
>     case OPC_LWPC:
>     case OPC_LBU:
>     case OPC_LHU:
>          gen_ld(ctx, op, rt, rs, imm);
>          break;
> 
> which looks absolutely right to me: LL is accepted with MIPS2--MIPS32R5 
> (including R5900 in user emulation only), LWL/LWR are accepted with 
> MIPS1--MIPS32R5 and the remaining loads are accepted everywhere.  What 
> else do you need?

I am clearly bleary-eyed... Sorry. Patch dropped.

