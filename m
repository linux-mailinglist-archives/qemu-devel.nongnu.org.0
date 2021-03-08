Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFCB330CDF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:59:09 +0100 (CET)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEXU-0005UB-FF
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJEVj-00043O-RU
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:57:19 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJEVi-0003pv-FR
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:57:19 -0500
Received: by mail-ed1-x531.google.com with SMTP id l12so14337227edt.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v8xfz3K5IP3moSWfOYtuYGN0mGRfWAooo7wRwIW9KQE=;
 b=JSBTnH5EU5Ql9XI67wveAj87FKLOFcOW6vV7MB+q/YYSA21NETSEepLdaZPbQgrDRR
 FTIKTJRDd4/TkKb+MM4Jbf9nh52ZGJVuJAE8vadtvdAcA9Ax1DofCIAeCbuOfbgs+lxR
 vstDFan1l0nGjgsQnoc1qU9fz7eorQ6gSz7MzxUcDiB8Lj5ym6GCGVAUfW749kkmFigJ
 buP23ZWkjtJhdB6fR6QRSdrmlaxoMx6N970mSFNceRuvZSZECS3i1Oe8+zgfW5LAaEih
 3zdQaVEutqXAT34cAbXsypAGJNBEsHtC8gaA70CKyocR+OntPcuMj5ru4PPUGB80NL04
 f/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v8xfz3K5IP3moSWfOYtuYGN0mGRfWAooo7wRwIW9KQE=;
 b=R32UgcY0h6gDDq3omZyHNoyi8wLOyhYIA96cMyM39i7aaeeJqJDj6tF5IfASewIRQ+
 148ywR2vjtBnyHJZ6mKwhVuFu6AznUJ6qfQmSHRZ9vjvsfUXhS/EqNQL4LxTH+Ljs/dB
 kySdtRXhixDqIqXJ/Mm3S4EwYKufjFeAt6u3CZE4jkDZ85PBVQrmAEcOM7bZTjPM/UMh
 TlWZXtTOmBD84V/CafgESCYrCI1sCYiEQzp+5ySr3Q0JdJ862JnGHnMYkJSsfDY4ZqOR
 tIs77kI8PAIALkB95qW9RY53EkhBDqLk0tpP65wFjDxiw4h9kQzh/7AYkr9LA/4hEeOO
 Jwxw==
X-Gm-Message-State: AOAM531q5Zvop/9lBR4YUOd4y9Y0Njvmfvm68YqcgIF3EGH3ojb4kEzp
 DYguvNRJ7nKxG40hWyI56iseslVU3Xg=
X-Google-Smtp-Source: ABdhPJyQQEkiJPzWd7U52U5z3ggWfpl+ec3CiQTA58FPRDvxKQzqNjesmete7E9WqTdsMorDQO7vhw==
X-Received: by 2002:aa7:c441:: with SMTP id n1mr20969405edr.203.1615204637061; 
 Mon, 08 Mar 2021 03:57:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b21sm6550922ejv.13.2021.03.08.03.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 03:57:16 -0800 (PST)
Subject: Re: [RFC PATCH 11/42] target/mips/tx79: Move PCPYH opcode to
 decodetree
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-12-f4bug@amsat.org>
 <fdb4b0c2-f2f7-4355-c3ce-7729f108f87e@linaro.org>
 <ea4efce2-3f14-60e9-e4dc-13c9c07b6180@amsat.org>
Message-ID: <f965bcf5-511e-b950-1474-93c24f931886@amsat.org>
Date: Mon, 8 Mar 2021 12:57:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ea4efce2-3f14-60e9-e4dc-13c9c07b6180@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 11:48 AM, Philippe Mathieu-Daudé wrote:
> On 2/15/21 5:26 PM, Richard Henderson wrote:
>> On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
>>> +    if (a->rt == 0) {
>>> +        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
>>> +        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
>>> +        return true;
>>> +    }
>>
>> Is there a good reason not to use gen_load_gpr?
> 
> I suppose you meant gen_store_gpr*().

Double checking, we check for $rt, not $rd, right?

> 
> We need to check $rt anyway to not do the deposit calls
> if it is non-zero.
> 
> As it is mostly code movement, I prefer to keep it as it
> for now, we might improve it later.
> 
>>
>> Otherwise,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Thanks!
> 

