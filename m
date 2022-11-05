Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC661A776
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 05:17:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orAbf-0007qu-BR; Sat, 05 Nov 2022 00:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orAba-0007nY-4P
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 00:16:28 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orAbY-0003NM-MD
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 00:16:25 -0400
Received: by mail-io1-xd2b.google.com with SMTP id y6so5260770iof.9
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 21:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FcZNQ/Wa0J9NnQxNlXzQSiFflIC/6iS2smYeOq4K9p0=;
 b=XgMRYaQShY85CFTgEsh832ufrit0e/3JqnDsb7aDts30fn/U3XGS9XNMw2kfpeIJXc
 +Wb1oznIgVV9PZO78QQ8CySHxxF7uPxxuHaxpfWVqPHW2BuHBRqAYQ5qjaY9z+3smlQq
 XFHvDpGbGSfB8MAI2O0yfmh+AFZWzc/2uJ0IsvEuvT78nHL026Xt2dn076jc/7XBb4xv
 BalKK4XRKRRqqCzlELvjCNBzD253JgiDJ9WK+Cdvq3YbFKJ2OS9aKB0nXxNTAeKFogLk
 2pwA8jF9ptPRxpEf59R0LPF4fzeOtyCH1Ccs6aAcSnxrX25LKc7XE+gdFEXsSBFiCfEI
 nd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FcZNQ/Wa0J9NnQxNlXzQSiFflIC/6iS2smYeOq4K9p0=;
 b=tbsr0dVhQmhaun4Mmzf8FeFcNbhILXUuWtahR+oYhEf1TIY2OzGuSrwn9746wO3EPh
 Os7ZjnJmMhL7bTst+cqMOYm2x2Vy94jjo6ruluFUK6orSVKBmPr4z0AuayzsYgLWQE9E
 hy9NNQJ7O5X0QgzDTgjVMbotL9jZUIiH0me1UZOIYj7pgStdIUycLnRBsKr57/DGz27H
 elIiPEP67SFsb0pZdmDYh7KR3t+CsKSqH+GAAXMGCijwBwFNHZsxS7KKQsU2bLTWrbvw
 6GRWX1R3x8UgWV6cc+CqLuzA78m5+7my0a7sQaBArBKoVkRsTfccJs1YMYssILPv4SOa
 KuMw==
X-Gm-Message-State: ACrzQf1PYekdytrzsYEv6mgBpb2xdhvOz7SOabGNX0xGBQ6MhrZXgL5h
 KqUkfzaDUUnf0hrxVbuEp1CHahqa8IyPEw==
X-Google-Smtp-Source: AMsMyM7eacyOzG2lmnCBHuA5s3g0oBVtxkMIbCMwBGmB27La4QRDinPjNJYYzot5dFXIl6W+V4LkzA==
X-Received: by 2002:a02:a48e:0:b0:375:49d0:a9f9 with SMTP id
 d14-20020a02a48e000000b0037549d0a9f9mr21659901jam.202.1667621783482; 
 Fri, 04 Nov 2022 21:16:23 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.139.114])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a0566022bcd00b006bbea9f45cesm387260iov.38.2022.11.04.21.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 21:16:23 -0700 (PDT)
Message-ID: <c1cd36a8-191c-38d5-547f-c978ca0ea967@linaro.org>
Date: Sat, 5 Nov 2022 15:16:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 2/2] target/loongarch: Fix emulation of float-point
 disable exception
Content-Language: en-US
To: Rui Wang <wangrui@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 qemu-devel@nongnu.org, hev <qemu@hev.cc>
References: <20221105021022.558242-1-wangrui@loongson.cn>
 <20221105021022.558242-3-wangrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221105021022.558242-3-wangrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2b.google.com
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
> We need to emulate it to generate a floating point disable exception
> when CSR.EUEN.FPE is zero.
> 
> Signed-off-by: Rui Wang<wangrui@loongson.cn>
> ---
>   target/loongarch/cpu.c                        |  2 ++
>   target/loongarch/cpu.h                        |  2 ++
>   .../loongarch/insn_trans/trans_farith.c.inc   | 30 ++++++++++++++++
>   target/loongarch/insn_trans/trans_fcmp.c.inc  | 11 ++++--
>   .../loongarch/insn_trans/trans_fmemory.c.inc  | 34 +++++++++++++++----
>   target/loongarch/insn_trans/trans_fmov.c.inc  | 29 ++++++++++++++--
>   6 files changed, 97 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

