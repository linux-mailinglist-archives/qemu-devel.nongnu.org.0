Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80206C7E71
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 14:07:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfYr3-0000Lo-IF; Fri, 24 Mar 2023 00:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfYqy-0000Lb-ME
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 00:16:37 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfYqm-0007qm-5M
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 00:16:36 -0400
Received: by mail-il1-x132.google.com with SMTP id l9so395639iln.1
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 21:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679631366;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PSNM0jBmgVeUpJCMKaboFDx+TVe5Dn0eLBK/AhWlw0c=;
 b=ysjtabX5Yv7AsIZc67GtAXSDBzydrbau26NgTqBBjYKnkbZ4H+zFbPTKqMvMR/gJXW
 9Zu2/+C8hMxHZjmLuhY9+VzAK0vWFxzpejSpfSXlPOYAmzBWOquLQJr7lO55N+dyLs7w
 3CF/FhQ5LwXga6s8KqUAw7+uFEYI9is8XMwvdT2uucZAZ3y1BisL5PdRwMFpasBiaoT2
 Tjkx2S2emmt/5Pc1kHzCWqMANBRqMQobpPDIY2vCMJI1xSGkPxNKfOsdKtSUKtd6XeZ9
 9SOD2RwrHSHcWtvB9ZbYYWOVtmVdUbG9+Tc+RLMsxv7YO8qucod5rRHCALHez00q1/YB
 MEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679631366;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PSNM0jBmgVeUpJCMKaboFDx+TVe5Dn0eLBK/AhWlw0c=;
 b=LCwevjDPe7pLC/thNOB/SFXi96HzbXVprXlRGifuFdMAayLFCnFODnz238vstuwoEZ
 ib0bhhrJyjFD30+/l0IDL1OsrgnE6G5rT8aGbHMnzbZrIgGyenK9rci5xXPl18W86Omk
 zaCUTil0nQtlKZRYDsfbH5S0amcEdNHuhGWHmDBBqegBtMFMydnYHfM+gjOtlVn/u2e3
 gHjEVJSDsNG5VlrElsdMp2eoBFrDwq5PsGwePqRj2MQVpop6rgDdi4LUbbcVlscNXq7L
 NdQ3fgKSASvCINvV7IArc3563CBsJrmPuENCksf68z4vt6MZrTMqXRprxa3chmbwxj1l
 oHnA==
X-Gm-Message-State: AAQBX9de0avMjVnANdHDqmr1RnZiLRVcxWmRi+zKH8/P89jXzBWjmwju
 lxrkOD77VoPcPr+G7ftRNtx746hwenLWPiWs3PM=
X-Google-Smtp-Source: AKy350Zhgg0Iv7oOaRvI2RcelN2DBzOK+SGHcY4jhVkn+ygTVQIDGIhuziZOcY689w9kImT3SUe2GQ==
X-Received: by 2002:a17:90b:4b10:b0:23d:41:3582 with SMTP id
 lx16-20020a17090b4b1000b0023d00413582mr1119021pjb.8.1679625435196; 
 Thu, 23 Mar 2023 19:37:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:e8c0:e9ca:7e89:a462?
 ([2602:ae:1544:6601:e8c0:e9ca:7e89:a462])
 by smtp.gmail.com with ESMTPSA id
 jg11-20020a17090326cb00b0019c13d032d8sm12947609plb.253.2023.03.23.19.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 19:37:14 -0700 (PDT)
Message-ID: <4951f368-400f-9dac-524a-d3264f0b96ab@linaro.org>
Date: Thu, 23 Mar 2023 19:37:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
To: "Wu, Fei" <fei2.wu@intel.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
 <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
 <ab0db790-b577-6ffb-a424-7b243b7019f2@linaro.org>
 <61e3c81c-b2e6-90d8-0a78-24cfe646a747@intel.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <61e3c81c-b2e6-90d8-0a78-24cfe646a747@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/23/23 18:20, Wu, Fei wrote:
> I lack some background here, why should tb_flags be preferred if env has
> the same info? Then for reading from tb_flags, we need to add it to
> tb_flags first.

We read from tb_flags in translate because that proves we've added the data to tb_flags 
for the TB hash.  It avoids errors like the one for vstart.

> Correct me if I'm wrong. The only strong reason we add some flag to
> tb_flags is that it causes codegen generate different code because of
> this flag change, and it looks like priv is not one of them, neither is
> mmu_idx, the generated code does use mmu_idx, but no different code
> generated for it.

PRIV definitely affects the generated code: for a supervisor instruction, such as 
REQUIRE_PRIV_MS, we emit gen_exception_illegal() if PRIV == U.

MMU_IDX definitely affects the generated code, because that immediate value makes its way 
into the memory offsets in the softmmu lookup sequence.  Have a look at the output of -d 
op_opt,out_asm.

> I think here we have some other reasons to include more, e.g. reference
> env can be error-prone in some way. So there are minimal flags must be
> in tb_flags, but we think it's better to add more?

We add the ones required for efficiency of execution.

We had not originally added PRIV, because the (original) few instructions in 
trans_privileged.c.inc all call helpers anyway, so it was easy enough to check PRIV in the 
helper.

Since then more uses have grown.  We *could* turn those into helper functions as well, but 
every other guest arch includes the privilege level in tb_flags, and it seems natural to 
do so.  Only if you completely run out of bits would I consider working hard to eliminate 
that one.


r~

