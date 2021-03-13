Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F428339E75
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 15:16:04 +0100 (CET)
Received: from localhost ([::1]:56092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL53j-0003V2-Af
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 09:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL51f-00028v-TI
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:13:55 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL51e-0000d1-AN
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:13:55 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 l23-20020a05683004b7b02901b529d1a2fdso2893910otd.8
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 06:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZBcPlv9EosEmbyl/xi5+e6ckykzyCQaviF387FI/xls=;
 b=aCzY4duvt+8udq60ML+arBuDBoVjOrsIl378YUXIaYZMzgbjjNtmwHRgCzQPxqhCu0
 y56ly5iH1wRz22pgnIXSHjhoLRo6PUtQOtNuWUh7+iuk0g5rXUuAY1hBH/DeE14hv2gJ
 26ajfumrJmIHg9Ng5Ch78kNpJBupefSbVsGHJJzCJRgamOGKJSofCTS/48BW78z40XE4
 6nypPurjqGo0vP5EiSCgrEafmhl5clQg99LtmIIdBwOPxOfL6HR7YcR6OxZ4TpgK7Q6I
 cY4IFskifIz6PREoGToJL9os/rnO83Pg4Ml8Lg4K/EoktwmW4kOFwbZY+FfQEgjKWPYj
 H8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZBcPlv9EosEmbyl/xi5+e6ckykzyCQaviF387FI/xls=;
 b=fnhxygwxN29wnH5EbDLyfu5BCvY1IhS3U+NwfJwQK76rqKXdyOJKF0iCBnFVZp5WmG
 ABVAavtFS010l9xzwuQMJCFfbuTkRDHCLxNrq/ctAalJZV5B41Q5WaF7FGcV2Teue/KP
 AUZsxs4YU8pyy58seT5F6yJxYRT+sF/z41SFaOGEwIcul3JxxctpCjWu8Q+3bvP/IuN4
 4tgFxLPvgEC4Fw0mRLQcdNuVtPfoMXNeE/rASzouJOwj+ZLKc7G5+sqoN0I8usnK8Qd2
 hQijXm+EEi+O34f+9Mhovs3l+JPYyZNkf5SBXZW1vc+n2yzc6+KucZN0+Zdjw8hvz/MW
 ClnQ==
X-Gm-Message-State: AOAM5317QryAiUQR/LqqhwPdSDB9l/xVZyePNuGYTzuSkBqSZ3xGQ7PU
 50R1wU6jrH30P4l05HjY83LXkA==
X-Google-Smtp-Source: ABdhPJxClGBE8L10ssLsJ04nGCqI00nDUpMRB4/AbCaEYPpbJMkwlDvkE3qtFLJlBZPdPt4k95dbiQ==
X-Received: by 2002:a9d:17e7:: with SMTP id j94mr3212279otj.41.1615644833045; 
 Sat, 13 Mar 2021 06:13:53 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v6sm3406617ook.40.2021.03.13.06.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 06:13:52 -0800 (PST)
Subject: Re: [RFC PATCH v2 17/22] target/mips/tx79: Introduce PEXE[HW] opcodes
 (Parallel Exchange Even)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
 <20210309145653.743937-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62040b8a-5313-cb8f-6c2e-d12dd4e64956@linaro.org>
Date: Sat, 13 Mar 2021 08:13:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fredrik Noring <noring@nocrew.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 8:56 AM, Philippe Mathieu-Daudé wrote:
> +    tcg_gen_mov_i64(ax, cpu_gpr[a->rt]);
> +    if (a->rd != a->rt) {
> +        tcg_gen_mov_i64(cpu_gpr[a->rd], cpu_gpr[a->rt]);
> +    }

tcg_gen_mov will perform this test.


> +    if (a->rt == 0) {
> +        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
> +        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
> +        return true;
> +    }

Why not let gen_load_gpr handle this?
It'll all fold away...


r~

