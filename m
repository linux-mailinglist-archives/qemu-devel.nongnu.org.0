Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A865121A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:41:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7L3f-00020u-Jr; Mon, 19 Dec 2022 13:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7L3Z-000208-LB
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:40:12 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7L3X-0002ln-Kk
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:40:09 -0500
Received: by mail-pf1-x429.google.com with SMTP id t18so6871734pfq.13
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 10:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3nPe+jW7ayOyUNV7a/IB+ZNOnuLbQVZIEMCLyEIXKW8=;
 b=n3UdVtyU+Xyj3UJgBOFNAHbvZOwzfn4l7xh+cfOZiU4uqic4+f8ooY8Uhz41eQD+ev
 n9HpNhNoDJVVinh0SCHEpuzqcq4w05ZJS1bO/vJzVUlIhx4uHwrVYunZfuefUvokfsOq
 kTSbseWmtGf9KSVehv5a2WToWiH4eNpPm0hLEOCSVaI6YbH4kL+r7MaVXizjTknrYQAJ
 89JZ1XIHdVcH/4DZKR9PA3+Oiu8LP0YXYKGNgGlG17Zq6H4JYOfj4GA+HNylsV2G49uI
 hwgkzQgy/Nf7MOCGLF8duCt+mvEGI7lWuc69K3Wxopbfvd8auV+Q5gc6b5Qk6HYZlmyR
 tTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3nPe+jW7ayOyUNV7a/IB+ZNOnuLbQVZIEMCLyEIXKW8=;
 b=jZSm1/d9IB9MLs8EqI05GOgUjnbxNFBxr5lGqAhKDmByYci5GX3tiiuntNU6BKykRG
 CG5CVEDKhAdzKu94tDwnt2rNwEicw8FDqXXZKd296V95LZ53XGrOw6NQApA6E/IHZn1W
 wosaH1Gy2y9TmJwD/MH5NR3EoCi4OVS0jBnj3mps20hWM5mq1rHQsLS9ea4QlfiN/p+h
 M5ZWcox/ozqv0wRahXsnTnHgYZFMH79vDUf8g9FkAqmwv4qoOV19u3eFsnaDUGiAv3nX
 vyFrYqxZSevVMAEY+6bqoY97nq+ijGxSgEmr9LvrRr7W/ATOwqrM6l3t+w1C9yWe1Dzr
 MjdA==
X-Gm-Message-State: AFqh2kr5f+BRnHyQ98UzyC5w+xrFAaP3yGku7oDQ1oSyJVYlKl43TjFu
 XtAU8b+ru5HflHig3C0GvdTQSw==
X-Google-Smtp-Source: AMrXdXtaizEMDJd3KeK3/Hxb5xeZshQsLGJXAxY/Av4Mb2fHtbZdRsiOnrXtrio00zbRRnjIb5xcFQ==
X-Received: by 2002:a05:6a00:419a:b0:57c:2ab7:2c0b with SMTP id
 ca26-20020a056a00419a00b0057c2ab72c0bmr10951342pfb.28.1671475206002; 
 Mon, 19 Dec 2022 10:40:06 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 e14-20020aa7980e000000b00577dd531b47sm6935150pfl.189.2022.12.19.10.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 10:40:05 -0800 (PST)
Message-ID: <dd7840d5-b41e-5110-e218-d24b97bf24e4@linaro.org>
Date: Mon, 19 Dec 2022 10:40:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] exec: Remove unused 'qemu/timer.h' timer
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20221219170806.60580-1-philmd@linaro.org>
 <20221219170806.60580-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219170806.60580-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/19/22 09:08, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/cpu-exec.c      | 1 -
>   accel/tcg/translate-all.c | 1 -
>   include/exec/gen-icount.h | 1 -
>   include/sysemu/cpus.h     | 1 -
>   tcg/tcg.c                 | 1 -
>   5 files changed, 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

