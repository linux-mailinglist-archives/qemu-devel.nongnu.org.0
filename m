Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C546A3C50
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:22:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWSX-00045i-SQ; Mon, 27 Feb 2023 00:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWSU-0003u1-QO
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:53:58 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWSS-000131-UQ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:53:58 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8888666pjb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WoawLEov3xoeeg9kToNn0OU1Xeq/+/MiyUu4bS2iotU=;
 b=SBr+t/MALQZ9qnmufvObgWPOsubZRVYbs55S8BhRjxJPUXj2JXghvMa0RfEX2WhLeD
 dEwapMF24ICG+D83wvrNu9uFqzvOeoSb/+QxGdFrPW0galCcScKlQEDS2ZcAayRBuqBT
 D10CZv8lfoOiNnI6FurP+zFKlY+dEkpDa3YVLtT5zctA3pJhcyvR/mu87hEaNDTQqfPP
 jpYD9r1oTx5T0M/Zh3dJOKkwHOwaNpgV7NnTZFucPGwFun5Vr/Lng/0iYnWOp0y1Yjxx
 lKDecEs6ClW7gDeTks9goLA26ivXtvrcx/21Dk7e1u0yf1Hi17A+neYRDdk6BHqI4y3o
 xdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WoawLEov3xoeeg9kToNn0OU1Xeq/+/MiyUu4bS2iotU=;
 b=x3gPhzr9A2g/oOubbQip30Dw2OYXRpTo8qacK/3eWear4iIKdrrzU3p6OYsZnKp0tk
 jkWnBQp9za+BXVS12q9/Kv28b2wxIsu5kfn2kLBwb4McJ6kcqe3UtNAFmkGr1kipgUb5
 OpWT4Y4t9HyaxC03inDzljmI+JvTlIuQJGDjws6zv+gZgun3Wzz9ZY/7eF59kWaWeact
 7kuM5+LI6Yt4K2lb0pUXpmKu4VWkmAZPHGl+XQPVo74LQbj97BD1rR0FkAFXnQGgBvPr
 8tTLUigwlxDGgkgd7E6e/jnr1lc/nsSUuH0e8f3rxESL3TmYm+FAR0bGWKVxiMn0LYQn
 SRqA==
X-Gm-Message-State: AO0yUKXU6UNlqSA7SQ7GBrQzGohkBNwXVdAHPX7qMhKy1rbYrVgpQazw
 37ri9nIss+bhllM6eXLlao6AeDmqwMz6CRH0y0I=
X-Google-Smtp-Source: AK7set9CnWO/YrhRWzjKat4AzWTwb6/AbkZwxOXnCkrBCGbhDX1ExGH2t+61EExLTdqqqERzu0IWEw==
X-Received: by 2002:a05:6a20:440e:b0:cd:1e80:587d with SMTP id
 ce14-20020a056a20440e00b000cd1e80587dmr4665175pzb.23.1677477235401; 
 Sun, 26 Feb 2023 21:53:55 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f23-20020aa782d7000000b005dea362ed18sm3392389pfn.27.2023.02.26.21.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 21:53:54 -0800 (PST)
Message-ID: <10161680-21d9-3ac0-aa02-d62cab63cc20@linaro.org>
Date: Sun, 26 Feb 2023 19:53:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 58/70] target/tricore: Use min/max for saturate
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-59-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230227054233.390271-59-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/26/23 19:42, Richard Henderson wrote:
>   static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
>   {
> -    TCGv temp = tcg_const_i32(up);
> -    /* sat_neg = (arg > up ) ? up : arg; */
> -    tcg_gen_movcond_tl(TCG_COND_GTU, ret, arg, temp, temp, arg);
> +    tcg_gen_umin_tl(ret, ret, tcg_constant_i32(up));

Second argument must be 'arg'.


r~


