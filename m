Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA6A61A653
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 01:14:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or6oN-0008Qa-UF; Fri, 04 Nov 2022 20:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6o1-0008Nv-O3
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:13:04 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6o0-00061P-6D
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:13:01 -0400
Received: by mail-oi1-x22d.google.com with SMTP id m204so6785720oib.6
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 17:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ENYMzdljk24uaWIfnbLrBcjdpolvjgLsFMobKtagfAU=;
 b=mUubtF7sMH3Gk1bCyv8O1mfErF1d9zCTx3A6jRCr29+3nvDlTRoW9T9qKx7wGLqswH
 crpoVBgvHSTK0Ui450s4bOu0sh/lCIkerLDDfWwI9VO41w17S0NXf8l4b435ey0wk/ik
 RGNDFZpWVYk5uPi3VNlcLsN2soAwKUS08jgC3Gxl+sHjfhR06YqD2keJAXSAdaiZyH1d
 KNY6KSWOGDYlfh8xjoaUwk+204boaq1B2QsLVgXXvhcxNndl3u8GdOmSe3lt7kQ4L9ui
 axHWogKJot/3Ng03KrciRwWWY9uNYDK6RvvRRyf/JPoDBjNHUx3++iFiPQa/jyRkcaFj
 15Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ENYMzdljk24uaWIfnbLrBcjdpolvjgLsFMobKtagfAU=;
 b=o8aWsVEGCFI/2T8QiVUIKqXyznuEPCSWAJsdzuvr9I7SW11XCqepu2a46P9vWKVYDU
 NpfM5FXPoczXBRvrb7f0aUz8MVC2/SN5Gwwbd3AnTVWTB7Jw42ZEORaLeb8hEQxvqI3b
 4oARZi6XbOTtECsBc7EP48ekEzR9n0fXklMQbNqCcdSlMC5EI0zfBj1vKN+oY3/G8n0c
 adEPEZLh93ety4a3WJZlQ43w5Y8DqKlUEkxTDJOWWrw4T8+NpF6Cn1GLGrckcGF4G9+p
 0l28RXbUCsz+xFDwlL9I5PCIsSheP7YZuWuCXRGf1nQWF4oBWX+y7nIFmYX6VmRuHXOj
 TMyQ==
X-Gm-Message-State: ACrzQf2Hktz9+UhEhUNtjgGQK7EpUmTVATLnimsldpqgWClagA470Uha
 YsVlA34gPeoaBUP33wWehPfLpw==
X-Google-Smtp-Source: AMsMyM7he1ID82KFpeBG8ko3gQ1C+B1PoTvoR54F0d79mu3yJP+RE6cl04L+RI5WO6eLF+82ogouJQ==
X-Received: by 2002:a05:6808:a09:b0:35a:1bdf:3db1 with SMTP id
 n9-20020a0568080a0900b0035a1bdf3db1mr273709oij.18.1667607178167; 
 Fri, 04 Nov 2022 17:12:58 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 a36-20020a9d2627000000b00661a16f14a1sm325036otb.15.2022.11.04.17.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 17:12:57 -0700 (PDT)
Message-ID: <c74d4719-7b19-1731-a3a1-c044cc8e452a@linaro.org>
Date: Sat, 5 Nov 2022 11:12:46 +1100
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> Add overrides for
>      J2_call
>      J2_callt
>      J2_callf
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h |  8 ++++++
>   target/hexagon/genptr.c  | 55 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 63 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

