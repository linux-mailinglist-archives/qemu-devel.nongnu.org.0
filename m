Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB6666828
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:57:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlaP-0007Xu-Ro; Wed, 11 Jan 2023 19:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaO-0007Xd-Fx
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:52 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaM-0001hs-VU
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:52 -0500
Received: by mail-pl1-x629.google.com with SMTP id 17so18613145pll.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2DAt0LkBD+q2larCGML+0JPiL8WBvDDxkUPPiQG6zlM=;
 b=rTtv54VDDKuwD3HUVhwNCbU0KR20Ka+beAgVhzjaEQqyYA7xkptlnEstwDzODojk6U
 kB0cBZz8W4rgV8YYwat53cJWAAOIHuaFPUXMz6DJPwvy/3irwOOi/x5CvGlz/wEI7xG0
 onJRwhnyFSGrevYhvXEgshumklB5mrXZToNNZPrjLX346GXZGp9oVgX4oqDlFlDeBBFw
 RuoACqCKrzNLLmitFrfblr9AqdN9NFO+rKA39L9/vRohPSv0H4OAU0j7ASFhVkcFMZor
 Q2M6DREdk/VnZSphpr92GbpY9A0i+neVK9FiIxZVMYhr1wF9WCFSulh/6ErvwqUnc3vO
 Sqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2DAt0LkBD+q2larCGML+0JPiL8WBvDDxkUPPiQG6zlM=;
 b=r/5sXMlzIhyj1UNRJsemtZ8Iiiff3DyWjuPOXeZ7ceJScaxi/eLXLzmQ+oJoEdsf7A
 FrvhkO4pB+M4TEwhKtqUgw2iauc31Q9FS0IHEsXR1sSSWokS7W5KEPnAvBx5WksJxyDG
 KTpio1t+M/CLsuOb8HZIn5CMMtqdSx1GIF01JWpQa8K6kMgJ2Y6KzH47B4uCvZplAw1M
 DZfy/VMkDDiuScsTpILhjQgXc5Al72BpXAuUZ8yFuNEZ+QuWnpr3q0yuUKyQfFEL/NXG
 uf+YeilzAahlE1xSuUHPzK5fi3tupGYMP8iJN0DZrsDgzMQj9T2T/zZ5EqEWqyrN+41B
 uuIg==
X-Gm-Message-State: AFqh2kqCWXOhwdNPKfRuywMeGWVsnhAdhpdJeAmYVbeh6puTCzotCFeL
 oGVvxCfXf9K0AA6dkuU3n4htsQ==
X-Google-Smtp-Source: AMrXdXtR0swzSEiLKdwtCYQg8n/uCqRVTysJ+bIZLaHIRldk7ibVEqv2kpo/JQ2QUSuiH/y3e2MPzQ==
X-Received: by 2002:a17:90a:9111:b0:212:f14b:9c3f with SMTP id
 k17-20020a17090a911100b00212f14b9c3fmr4561400pjo.25.1673483810183; 
 Wed, 11 Jan 2023 16:36:50 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ml21-20020a17090b361500b002135de3013fsm9581017pjb.32.2023.01.11.16.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:49 -0800 (PST)
Message-ID: <0a5fa04b-5576-3350-a0c6-bfeab2e11cca@linaro.org>
Date: Wed, 11 Jan 2023 09:48:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/4] hw: Remove hardcoded tabs (code style)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111083909.42624-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 1/11/23 00:39, Philippe Mathieu-Daudé wrote:
> We are going to modify this code, fix its style first to avoid
> the following checkpatch.pl violations:
> 
>    ERROR: code indent should never use tabs
>    ERROR: space prohibited between function name and open parenthesis '('
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/dma/etraxfs_dma.c | 196 +++++++++++++++++++++----------------------
>   hw/misc/mst_fpga.c   | 162 ++++++++++++++++++-----------------
>   2 files changed, 175 insertions(+), 183 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

