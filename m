Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C74418D3F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 02:14:00 +0200 (CEST)
Received: from localhost ([::1]:40012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUeHP-000743-VE
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 20:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUeGP-0006Nz-Of
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:12:57 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:38662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUeGL-0003Yq-22
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 20:12:57 -0400
Received: by mail-qk1-x733.google.com with SMTP id q81so31282644qke.5
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DaiHaMfIr00cvzJYx5KHkDAxg0rZDIDr5zsa3N1/kzs=;
 b=cBZ93hydIKCvXgQWfZXMMF8mItN6/3dtn8tEz51tALgQn551O6bJu8PEARz3s3r0xl
 XelV3ztmu8pa/uUQ7Dpos2Urn0XI65pM03ertJjLjpg+jwDqLhcMphWvG44K9x0batxA
 He2LjsH0iwhMdRz8THMI1wUp3MAbCFHBaKyi613ljJhAUhbrsotCAKqtCv8YS4G+gfZl
 kJ25NXmjQIkfahJMzPK4wIadZfDhA8ST8EZ4tMUjB8ehnTR9IOAAJdk4F0fnODkmL8A3
 /XKpfaqjeSwF9G5lgItz9GkjU2XpmTYQ6swAbxV8P8ru/UK8kuEaAer4IpcViYg7h+59
 3ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DaiHaMfIr00cvzJYx5KHkDAxg0rZDIDr5zsa3N1/kzs=;
 b=QfCLreg/CmkmnCz41UXLW6hVRUQ9qu9LefDu/lVRF1WwVubhh8WvJ+2H3G8kUwpv3C
 /1dEUhwkYinaj0NL4MndeTPxIIdiYOGrWWDwr9Q4sUws0qCyCNv0qJz+Tz0sVxRhCal+
 4GIQviwvgLmAOQJ6R3ZI/pgxozYNs9hO9LE7L32jVM/NV6bcIXfCTLyZrHpLCFngiGF4
 UN37Sgn6PRfK6cdwzcpYxmrFampY0kOKoiEpkuD2H0r/jxsdQ5wofDmw7sWwFfIUmYde
 2ixQASrnr0ohLQegJTNAeAgG9IYuuUDcUrN1Rf2nvN4b0JG6avO0+Igs3uFH4SDMETcM
 mxsw==
X-Gm-Message-State: AOAM531Mhi1aolYYH4ApePvQchjo2fLbI2JRiaRuWCeNpCtHkA9Fj6De
 0FfaB47aEO9cFsRPvzLTlhkN3fI/TwehmA==
X-Google-Smtp-Source: ABdhPJw6MWMjMZLn5OBS4MPiOARO+jt6a0iOZKuNEhoPXTAAUOH6uKh5fNcS6jVwa0nCb3g9vUyFyA==
X-Received: by 2002:a37:464a:: with SMTP id t71mr21904693qka.361.1632701571878; 
 Sun, 26 Sep 2021 17:12:51 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id j16sm8043695qko.15.2021.09.26.17.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 17:12:51 -0700 (PDT)
Subject: Re: [PATCH v8 13/40] accel/tcg: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86834955-b2c7-5a94-eec0-47686eb40690@linaro.org>
Date: Sun, 26 Sep 2021 20:12:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926222716.1732932-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/26/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> All accelerators but TCG implement their AccelOpsClass::has_work()
> handler, meaning all the remaining CPUClass::has_work() ones are
> only reachable from TCG accelerator; and these has_work() handlers
> belong to TCGCPUOps.
> 
> We will gradually move each target CPUClass::has_work() to
> TCGCPUOps in the following commits.
> For now, move the CPUClass::has_work() call to tcg_cpu_has_work(),
> the TCG AccelOpsClass::has_work() implementation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h     |  2 +-
>   accel/tcg/tcg-accel-ops.c | 11 +++++++++++
>   softmmu/cpus.c            |  5 -----
>   3 files changed, 12 insertions(+), 6 deletions(-)

Are we really really really sure this works?

Device emulation raises e.g. CPU_INTERRUPT_HARD.  We certainly test that bit in 
target/i386/kvm/kvm.c.  But we don't check that bit in your kvm_cpu_has_work.  We're 
currently checking that via cc->has_work(), in x86_cpu_pending_interrupt, but after this 
change we won't test it at all for kvm.


r~

