Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7245861A660
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 01:20:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or6ub-00028d-3I; Fri, 04 Nov 2022 20:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6uY-00028W-PA
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:19:46 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6uJ-0006we-QX
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:19:46 -0400
Received: by mail-oi1-x22a.google.com with SMTP id p127so6777789oih.9
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 17:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HO8hUGptfHZ7baQb4oEqw6VUzOXPekRgzzVa2Dwxf0I=;
 b=Qa0qtsn2XrMEL4Chlpc3yB4XINasSUmPHv1Yja2umOW532u0wX/nfyxdMAswNEKXZR
 qKGHO0AYUGeRWSrUmfYMFgR7+Zt0kiBWhet0aZDC1cH9CaF41iCn756C0mYdt4Z1y+5W
 93USFSjEUY6a18x0gZiAkNl0aEM+vUj0mIRHSkK1qfj8oucNcWYBIqYllX66P2WWzdUp
 mQ2Trj21Hy9c8RmbmKwP5pCEp0sXs0A2hxjxr7O7rdXWWfRnWMC5XP5/nDwUqdSMe1PH
 Bu2o4/qHtDWFYymXRAbBwrvS0KMCbtVLwEnQSfIiUq96SH27cTDX5nJ09CjtGNh3zU0A
 JW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HO8hUGptfHZ7baQb4oEqw6VUzOXPekRgzzVa2Dwxf0I=;
 b=Tk6EsHxL14xPtV5PACM+Ua8Mu/E2TYAoi9E83fw3UckzXd+2EZzTvWYMwsNMY/ClcN
 rRELB8EU1plifHeqxc6K6WZRFCwPpyU6KTBPslmRAtZsbZ4Of6ZBWo23LyOoevPUK6gc
 GnbCIsrAHDq4Fy0WuSFbVnhbCtroWr9HKpEjFYlEG+b9BkCvtTDfjRjtmw0CT4+fHr85
 fsmBU4+1BFSYKlmB0O9zehSNNkMaVpDTCyyI8wzBhX/JgGkGCoiA5ihFXfcaJEJmFIVr
 m2D2hrYy4jvXksgj0o8S0hZjUiu3MvjzdFxDZR2D0VqqUjvhZE/YQmfUcAAuxofk2B9C
 0WdQ==
X-Gm-Message-State: ACrzQf29sJzkJzXJejxKBYacqJKeEJxcikrF11VThY3/L3DTfGRWgHVf
 I8PX4TEKOm3u29pqIvR3vrh9uw==
X-Google-Smtp-Source: AMsMyM5KpF6cMUUNaxUKI4wr2086uxKWi8hax/Sv8sc1OwoIIf3T29kzvo4BZZxQ7zD/mcHH1uoIsQ==
X-Received: by 2002:aca:a996:0:b0:35a:c23:238f with SMTP id
 s144-20020acaa996000000b0035a0c23238fmr16390423oie.27.1667607570653; 
 Fri, 04 Nov 2022 17:19:30 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a9d62d4000000b0066c34486aa7sm304297otk.73.2022.11.04.17.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 17:19:30 -0700 (PDT)
Message-ID: <5188b67a-8403-b468-e121-5990476dd5a0@linaro.org>
Date: Sat, 5 Nov 2022 11:19:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 07/11] Hexagon (target/hexagon) Add overrides for
 direct call instructions
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-8-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-8-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> +    tcg_gen_andi_tl(lsb, pred, 1);
> +    if (!sense) {
> +        tcg_gen_xori_tl(lsb, lsb, 1);
> +    }
> +    gen_write_new_pc_pcrel(ctx, pc_off, lsb);
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, lsb, 0, skip);

Better to change the branch condition than invert the lsb.


r~

