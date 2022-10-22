Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAB260846E
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 07:06:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om5dV-0000J0-1e; Fri, 21 Oct 2022 23:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1om5dL-0000IU-17
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 23:57:16 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1om5dJ-0000m5-77
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 23:57:14 -0400
Received: by mail-pf1-x42a.google.com with SMTP id h13so4368529pfr.7
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 20:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=866SOlLuKjRQx78lVJhMP9O/KDVDQChn2VoSNBuBa6E=;
 b=UBfmODqk9dS3OTCFla8DwojR9cweCKXwzUziIbpD6xhk/F3JDEfX5tyr3epSViNOkA
 WaswA0eAEqOiLZFqwoC+xyYb+W8kVBdCiEarwLbd2t5y9Ys9Tn3ijWFdkQ+dMDja1vdT
 pb7/8L4ReqjoHdO4cVfElRIO/tbs1u47TZDeMfRZW078BABWOd2rO1xDzDYyactqOAlO
 20ohHzqR+sJWbPPq5DaT+SFCFYjVvWzesfjT38vjkh0GmQn4EwP9TQvq4NAb+kJqmwsS
 yKWosxDod7r8GrLcQIbogvWizoBtWoSm4FUBtzfnc1azuRjApezX0Mw3RhqqW5AeOq9T
 DItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=866SOlLuKjRQx78lVJhMP9O/KDVDQChn2VoSNBuBa6E=;
 b=hcwpZjFRv/Ls7MwDi6RCrwxZw4WweEDp+R1K/SA71ovdzpxkPqdZD75w7y92wv8wqj
 k9hO9k3sH/gJ2VjhmCcxv3TXfko4arr0Cme8eeS7wezwmPdWsyOZ7BDniJ5L3Jdh6vm6
 I5Xk31U6qHysenQ5BDFLAC5N3wL4BSYAZDzqtxTGuKU7RCJ5tru3IuTRqmBzoEf1hXeZ
 FgseiojTemwLixk9fFPIpPrqMha+KnVFDYZgavxCQJ3j77N3XhhPvBguAP6b1t3+Gu1t
 70TxdT4tGFx8sJLsEPE0/kP7RT7SqOq6tWxDzgPu+akFeh9kqRz3oG3R+2EORj3aQkt0
 kY+g==
X-Gm-Message-State: ACrzQf3N0RLe5yRuM76dHN7BafnsLvSILrwj9jilqTuxRgwZiAV5QEOl
 1QigogHCVlxyKXjkzC09cp+i7w==
X-Google-Smtp-Source: AMsMyM7Y8wGRyAT4YA0dPdeSMokopO7v0+nc2LY2fwZtULSyHLioaH6WICtKRLErjIjrzl4xLPRw9A==
X-Received: by 2002:a63:942:0:b0:43c:428d:16a9 with SMTP id
 63-20020a630942000000b0043c428d16a9mr18256374pgj.423.1666411031320; 
 Fri, 21 Oct 2022 20:57:11 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a635355000000b0043c9da02729sm13901008pgl.6.2022.10.21.20.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 20:57:10 -0700 (PDT)
Message-ID: <065142dc-5cf9-0776-370b-edfbcf4c51f2@linaro.org>
Date: Sat, 22 Oct 2022 13:57:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/i386: Fix caculation of LOCK NEG eflags
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Jinyang Shen <shenjinyang@loongson.cn>,
 Xuehai Chen <chenxuehai@loongson.cn>
References: <20221021131744.337567-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221021131744.337567-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 10/21/22 23:17, Qi Hu wrote:
>                   t0 = tcg_temp_local_new();
> +                t1 = tcg_temp_local_new();
>                   label1 = gen_new_label();
>   
>                   tcg_gen_mov_tl(a0, s->A0);
>                   tcg_gen_mov_tl(t0, s->T0);
>   
>                   gen_set_label(label1);
> -                t1 = tcg_temp_new();
>                   t2 = tcg_temp_new();
>                   tcg_gen_mov_tl(t2, t0);
>                   tcg_gen_neg_tl(t1, t0);
>                   tcg_gen_atomic_cmpxchg_tl(t0, a0, t0, t1,
>                                             s->mem_index, ot | MO_LE);
> -                tcg_temp_free(t1);
>                   tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
>   
>                   tcg_temp_free(t2);
> +
> +                tcg_gen_mov_tl(s->T0, t1);
> +                tcg_temp_free(t1);
>                   tcg_temp_free(a0);
> -                tcg_gen_mov_tl(s->T0, t0);

Instead of creating another temporary stored across the branch,
simply replace this final mov with a neg.


r~

