Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BF61A775
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 05:17:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orAbF-0007h3-PH; Sat, 05 Nov 2022 00:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orAbC-0007go-2z
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 00:16:03 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orAb9-0003MC-QI
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 00:16:01 -0400
Received: by mail-io1-xd29.google.com with SMTP id q21so2385572iod.4
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 21:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lm25FiixbBtxz8ENoD2mHKOV1lXWMxe8gAau3bVD2ZE=;
 b=v6Sh8N0qjlhgXtSIAzbST2EdpXHd47WvLC0MEZodFDZZy8xubgzyJj9ANLCgWWk0jY
 OkBjgX3KOi+xqcz1n0yRXlMSAsywybXqGA3GjmIkimu2mhAOWfQzdh829LDpi5PJ/+6/
 yShfqNUCQRj61k4BgVMz3sCAM/PxfiF6jqoWqKF2S2tISoucQIzzWbPiPjWWt5V96ov3
 ii3VQjIyo/2yeUrl+gGTjD16uvKpq0ToSuwRcFFj0+plo6Jo0o0pPAmH5Tg0AjZH8mDB
 m0MF5gMRWdz0IXPVJMLsRnuK++aUb0odAr3+TZCexGEUH0SXKIK1uj5gHke91rSnd0Lj
 fVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lm25FiixbBtxz8ENoD2mHKOV1lXWMxe8gAau3bVD2ZE=;
 b=lquVfwn/E+OFscrOXrjC4EFKBLlMzyrxi7+tKQxqsGHcXnZmxcxYyd/u4h/R5MLDVW
 jLcw2CoViUXqEoKlQUw45756nWaJvhe9cS6liZc+FvIOVm+f0WzbkXrQeDy4foQlcA3S
 tSxY/5ZmalPwCwAE5AYLpnqdqv0rbEoKVMDbsoNBMYJsdjh6M2gPrPx4dILxQN89xAgA
 nf/YqfMvcoIovrU2GbmhRPUV3QyehN80uD4tMJM3hrkTs/Qisfb8VlwOOS/O53i9x0of
 j1eKfmyef9WECLOOHqx9uX2ILJQusDbWOof3E27bLuxVyI+KnGFZEa4G0M85ps2gNP5F
 msqQ==
X-Gm-Message-State: ACrzQf3iwvdk2Cwt027M/m6rUwo/eHca8Bm1uX4Q9p54XevNcfPFlFDm
 fGbMpWrZLzQuHv5gEGuCPWmjyyjrxJ98jg==
X-Google-Smtp-Source: AMsMyM4Ck/9/DYSkjT1ZQdqSiRmmNXMNirUhck6Lyq1yYchYLAwOaSrKXAci6QGwg+91Nk3rvo92nA==
X-Received: by 2002:a05:6638:12c1:b0:342:a36a:b2b1 with SMTP id
 v1-20020a05663812c100b00342a36ab2b1mr24351440jas.275.1667621758144; 
 Fri, 04 Nov 2022 21:15:58 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.139.114])
 by smtp.gmail.com with ESMTPSA id
 ch5-20020a0566383e8500b00372f8e38931sm297035jab.111.2022.11.04.21.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 21:15:57 -0700 (PDT)
Message-ID: <08168c4c-b207-84cf-4675-fa629ebb13b1@linaro.org>
Date: Sat, 5 Nov 2022 15:15:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 1/2] target/loongarch: Adjust the layout of hardware
 flags bit fields
Content-Language: en-US
To: Rui Wang <wangrui@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 qemu-devel@nongnu.org, hev <qemu@hev.cc>
References: <20221105021022.558242-1-wangrui@loongson.cn>
 <20221105021022.558242-2-wangrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221105021022.558242-2-wangrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd29.google.com
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

On 11/5/22 13:10, Rui Wang wrote:
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Rui Wang<wangrui@loongson.cn>
> ---
>   target/loongarch/cpu.h                        | 27 ++++++++++++-------
>   .../insn_trans/trans_privileged.c.inc         |  4 +--
>   target/loongarch/tlb_helper.c                 |  4 +--
>   target/loongarch/translate.c                  |  7 ++++-
>   target/loongarch/translate.h                  |  3 ++-
>   5 files changed, 29 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

