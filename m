Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCFB41967C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:36:02 +0200 (CEST)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrjc-0006Zl-PD
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUreZ-0002hd-2S
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:30:47 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUreV-0003Sd-DR
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:30:45 -0400
Received: by mail-qt1-x831.google.com with SMTP id e16so14213527qts.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gTMMEFmNRGexpFmf92JgIo8KZxDSkPpak7x4SNV4/Ls=;
 b=Cbls8BZmd4PyRxEjJ8a0RiOf3DPUzJ+PC0xBRYgO7QY7PTzLJKFWQudtq7mumEveU0
 CmTiJUzCdjGH+rzehvhqyAKwd6JFOs0BJf2TRwscrMErm5a7nzXijgRrQdXOeZ2FtjMB
 90uQKhl1/emOU30f8aoUYf6d2DQWDE1KrAPWVUivjkhBzMMM78puDO1TC/NcZCAm3lBW
 lmUc8eWA9MZAJQ68MMb+VlBjaEHvso5+APDASWE5LvFt17i0kKRa121IRMjAsKEGu5Qu
 QlLjZ5+sJXrEcc9s97BenR8APM+FCTGUfolUw/cmEFJmR4lC38GF/kH7noR3PmOiC8Py
 gH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gTMMEFmNRGexpFmf92JgIo8KZxDSkPpak7x4SNV4/Ls=;
 b=I0gk2vdj/xoI5sldyLWftjpOcVms51ss656E2E1VvaF8/8R+INHzjYL4hvT5NzLAw+
 jZ0WATs9ZP10ekgMNS6OtzF+QG5lJgOcKRJ4f9Uy8qPCPwJlocuJAdss5gzxF9Ubuv1k
 V8Y1wNM4zl2fCU/xxL+mm0dQY/InzatAgAkWZT3o1w333epPFu8S/WUKZinReRgze78j
 /kjTGKsbewe34LEBluirZ2+dtBVR5ya2XGTFsWT4TWKAfiui0M1wgwKqd49ca5vTm5Bn
 eiPTYT+yaij8NeFYbBWymdJ/fRAuHhKQ/LrLpDibSW3O5zwQrm8cmiLrOcUggvkgwQ7L
 sxTg==
X-Gm-Message-State: AOAM533GzCO3K0/KAa89g8Je3rTNqP19XrdGI7Rksjfn02KL5nh6OVYW
 99MqHwDRVHiiZtSLknNBcWiJEU/F3pw4yQ==
X-Google-Smtp-Source: ABdhPJxX7upDNEUWAVjYaXp61dJ8iw27po5PM2t26KB/WHZNLWbUZmo14Awd8LIw1EsvIvmJh+Sb0g==
X-Received: by 2002:ac8:4312:: with SMTP id z18mr171254qtm.20.1632753041684;
 Mon, 27 Sep 2021 07:30:41 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id a22sm1443171qtx.7.2021.09.27.07.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:30:41 -0700 (PDT)
Subject: Re: [PATCH v3 16/27] linux-user/nios2: Properly emulate EXCP_TRAP
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-17-richard.henderson@linaro.org>
 <CAFEAcA_=DA267T6BAz+yxbtCjVEUkZ-YpjQCbnXCt0UntD4EYQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <655fa487-6003-92a1-d8ac-8c8f4c8b39e6@linaro.org>
Date: Mon, 27 Sep 2021 10:30:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_=DA267T6BAz+yxbtCjVEUkZ-YpjQCbnXCt0UntD4EYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.136,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 9:23 AM, Peter Maydell wrote:
> Loading the insn and fishing out the imm5 field is about 2
> lines of code, isn't it?
> It's how we handle similar cases for other targets.

And we actively get it wrong, e.g. mips.
So I have patches to move that code *out* of linux-user.

We have macros in target/nios2/ to do the field decode, and not in linux-user/.

> I think I prefer that over putting
> linux-user specific fields and handling into the target/nios2
> code.

Would you prefer a generic-y named field like error_code, which we include in other targets?

> The kernel also defines:
>   * trap 31 ("breakpoint"), which should wind PC back by 4 and
>     send a SIGTRAP/TRAP_BRKPT
>   * trap 30 ("KGDB breakpoint"), which we should treat the same
>     as the "default" case since we should be acting like "kernel
>     with CONFIG_KGDB not defined"

Dang it, how did I miss those?


r~

