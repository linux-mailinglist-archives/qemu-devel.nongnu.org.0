Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D4686F45
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:50:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNJ6i-0007MD-0w; Wed, 01 Feb 2023 14:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNJ6g-0007Lw-59
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:49:22 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNJ6e-0004HG-KV
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:49:21 -0500
Received: by mail-pl1-x635.google.com with SMTP id z1so12024743plg.6
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aSmAgTYdJT7Kj20DsbnlLZ58cLNoLiU9Grf5aU0nnOk=;
 b=oRWXQWiMaPpemNesM+R8QaMtNqGQ+wGzwgSd0PFXa0O5euTJYidYOHOkMLP0QBoRfo
 0jYnBerwG8us2TOqxwrHdpUIPxLzXdB14omA1DkrKVwoAsJ4zewY1iSOsCrcnCpwycf6
 ue5jGyIx1rUQmLBRi0z5Fxc7r3685QCyZkbj+S/vv15OIfjNpFCiHYglhfExVmemz21f
 zzB1vBoSKBXxuhvKX60+YbleyTDbJpxNAYJbeKzaYr08CAtcKCy/4f0BZTX5wzK6KwfK
 o5aE/w9xruweL3igY3+vedoAMLjobIEqparfs/zD6kkQUNXb4njSplS3gd7s5Rjt3hd2
 u1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aSmAgTYdJT7Kj20DsbnlLZ58cLNoLiU9Grf5aU0nnOk=;
 b=p3Cj9wLALEC1ltAdVEr+QLRib2YWWH7yNEht4xfAq/6yaiu8ARrUxwPJHQs6UigQqg
 lvGi8B8o1dqCOWlHG21S2yZDaJKgd3ULD0YWp1b2rvK665HnQWNOTmsGGbTEQBCqLyzz
 nOBRorg08XU48u3Mrh5y4l2PW8X7DwCzlKX6F9wcVHG3QBlhhdA7RwaIlIFC0iRSNQ5k
 PBfadfXS7LOm/g9vUk8CzDFdbR1DvmkKY0hgsp2jn4Z9DzRuD9fxaU+Dj3jPldDiRQZI
 ubx8QgqplDgP3OtMRId2UlX6ZXZDwsXB1/LciSLILA/eWXxe0QdRBJfJl7m/2pwgYW2M
 /tXw==
X-Gm-Message-State: AO0yUKWXXeQ5DVK1aqU5Nyn+D/5KVC03D3oc9UQCfJIq7NRvWbJ15vvA
 bYRijlozOOcJUBEfKxsud/Km7g==
X-Google-Smtp-Source: AK7set9KFDrdcQbvTHgba4dTf31bTJFULT9/26zjakQpw9deCENJJSicdzyCMq8VfmlQqV+fPx7SWA==
X-Received: by 2002:a17:902:da8c:b0:196:897b:cded with SMTP id
 j12-20020a170902da8c00b00196897bcdedmr5282323plx.28.1675280958729; 
 Wed, 01 Feb 2023 11:49:18 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 d16-20020a170902aa9000b00189b2b8dbedsm12167115plr.228.2023.02.01.11.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 11:49:18 -0800 (PST)
Message-ID: <48a2f056-618b-c5d6-0f1c-18886e5da51f@linaro.org>
Date: Wed, 1 Feb 2023 09:49:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] linux-user/sparc: Handle "ta 5"
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20230201004609.3005029-1-iii@linux.ibm.com>
 <20230201004609.3005029-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230201004609.3005029-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/31/23 14:46, Ilya Leoshkevich wrote:
> GCC lowers __builtin_trap() to "ta 5", which in turn generates trap
> 0x105. Follow what kernel's bad_trap() is doing there.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/sparc/cpu_loop.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
> index 434c90a55f8..fa36d452a51 100644
> --- a/linux-user/sparc/cpu_loop.c
> +++ b/linux-user/sparc/cpu_loop.c
> @@ -225,6 +225,9 @@ void cpu_loop (CPUSPARCState *env)
>               restore_window(env);
>               break;
>   #ifndef TARGET_ABI32
> +        case 0x105:
> +            force_sig_fault(TARGET_SIGILL, ILL_ILLTRP, env->pc);
> +            break;
>           case 0x16e:
>               flush_windows(env);
>               sparc64_get_context(env);

Quite a lot of ttable{32,64}.S is missing here.  We should certainly make use of TT_TRAP, 
instead of hard-coding 0x100 vs 0x80.


r~

