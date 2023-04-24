Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95E6ED187
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:37:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyFr-0006HP-Ue; Mon, 24 Apr 2023 11:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyFq-0006HG-En
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:37:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyFo-0000vh-Ux
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:37:26 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so4198721f8f.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350643; x=1684942643;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WGqxLrl8nAJGc8ulh2410s62yymfJ1ZVOPsGqid+Aq0=;
 b=HG0g1crh5BSK1HLHEmrQlFm4gcZsEuO3CqP2eie9dPMSp/7mR+XEBwZtztBBB26bfS
 8lwVEZeLoXzUKS84M9NdKIQYmeGdksxMmFLXNey1tGwIABTUQB/3OEWtvO0AQKONDp32
 FieyQq0d3c+FpjWsmT3ygvF6bu2AZB97qoZ3toIuQfnRjQCMPqwWOvNWYxM6RVv/E2zM
 7fP2TGFOvXDLp7KOiwwmRb7Kb2C/lYxL99N7sEwPz8iUZ5cYF55Z2a6a0FRl/kwl3AC4
 U/6CEE+TyCEeFdyyoTh+LJ7c5U/vpO0+uQsSgJ7DQqFIOA4r4L5N1wNMuqrmOH3+pSQA
 Ej3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350643; x=1684942643;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WGqxLrl8nAJGc8ulh2410s62yymfJ1ZVOPsGqid+Aq0=;
 b=hoJz2HAQxyFJQheBtrzGBrRrYplhaF6UVovel7RL/8lglIaWFFcYUbGne84oqwzAL8
 hVtsy2xC1qUeqy2L8G/BrieKTtmrC/hS1K81q+7YS+KHFE6IH2HGu6r1GVI4ybSaxDu9
 haZ80ofjRsbi56NFAl7K0+/4Ix9XZCasJKdzJcs+6L20wx6PI+g0eT7KNUuRLIjcKvcx
 I00ADK0W8QX8ZzcO7tnUvkujxR/eDeNmH8uexZOVbs90BZ2a2jpW6WGJCG3GNO7KmIpO
 X5vLGKRn2bwfB90efA0FlGA4lkJV8aXnIqiJFoVg7ywgGq3a0mBpfNHFZUa++9LfdP6D
 IduA==
X-Gm-Message-State: AAQBX9cWWSFhoND7wIDhf173DAFp8yIM738s5MgYn4JSfgq+eJXsWmNI
 IOs1nsTFE6pytIjWpIojf9PRAx4clcuvoiGgclDe4Q==
X-Google-Smtp-Source: AKy350ZFSsewUU16raRuGTtvmfvhEQFV5WY3JBj0bvHDlE9Lp5lwMlEahfOJ22d/s+Nc05DLq71kIA==
X-Received: by 2002:a5d:5960:0:b0:2f9:9f6f:e4d with SMTP id
 e32-20020a5d5960000000b002f99f6f0e4dmr8584887wri.39.1682350643024; 
 Mon, 24 Apr 2023 08:37:23 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm11019707wrp.59.2023.04.24.08.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:37:22 -0700 (PDT)
Message-ID: <bc8c9da2-fa14-6c1e-d5fd-7af8b4ddf27a@linaro.org>
Date: Mon, 24 Apr 2023 16:37:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 31/44] target/loongarch: Implement vbitclr vbitset
 vbitrev
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-32-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-32-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/20/23 09:06, Song Gao wrote:
> This patch includes:
> - VBITCLR[I].{B/H/W/D};
> - VBITSET[I].{B/H/W/D};
> - VBITREV[I].{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  25 ++
>   target/loongarch/helper.h                   |  27 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 305 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  25 ++
>   target/loongarch/lsx_helper.c               |  55 ++++
>   5 files changed, 437 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

