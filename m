Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423624341E9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 01:12:16 +0200 (CEST)
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcyHH-00038U-Cx
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 19:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcyFn-0002ET-Fg
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 19:10:43 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcyFi-0006o5-Bo
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 19:10:42 -0400
Received: by mail-pg1-x531.google.com with SMTP id r2so20774772pgl.10
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 16:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2vhZdTVF0a1VHjMw19RVHedj9sqnUbq+s8FhCbp7Y+I=;
 b=aL8BsX9kDpGo82J3SvyeWnFwL8P9DjuPFl9STqEJfw8Bt0goVUrPanXc68TjDWEE3t
 p81HCDWzY2gjKVaNf+JkTzWVqgnZpVihEcvVSmwn2kNI8bz2bUzI2QyzZzW4pPqkUtbi
 /JiCeJou29JHKmKi0mMO5mzEN279DM8HdueGBE5vPX23hBD5TBKD0hcjteVtAvGGB8N+
 pZgUC2duvVDbj5Wtv5iuypMbGSKu9lMPb6iwooxBpAj4IbS156FgcQrIyUPl65QFuxTy
 LmFbz25vhrNRZ8i17KRMtd5A7gENyEMQpDjyhvgcJtdtU5hG6ZCzB5P9NPMTj6JquNkp
 QmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2vhZdTVF0a1VHjMw19RVHedj9sqnUbq+s8FhCbp7Y+I=;
 b=C4XuI7ys5e7gg6nZgteDvCnztQ74h3o8eFY0ByVX/5/59cUn9rcUO4scIPxBGlQ8Vj
 TT41G3MNOeyyoyFJJTA+UA70qptAiUU7dTGPIWArstjUKMN3pCSBWafuJg67cqZbMEKZ
 1C+Tadngu0IaG7W462vLTID5DQRaKpW0eEh8EmgYsmgjutY5RAV2y2GwEsAkNwMCy4g7
 +WkOQo5KlZsYByY3J9bTxqXX59xLAN9Net5MsuE83djkc9oBnMzhQwQMHPuVRKhpnrAm
 D+UnhIqAstvil3NN4TkElhD72m64AY5TYARJk2vrhxjYv2maxUyAEqecaYH7nq25bboe
 lJyw==
X-Gm-Message-State: AOAM530F3anm4iGVdYVzLkrrlqDbhEUzmQRQbqm/VlETlShTc3OgjiSe
 rFoHUZUKa73WGEcYlW1zmm7sfg==
X-Google-Smtp-Source: ABdhPJxb+CGMkMsJsqLnlbVZR9DvqH55uiScwuIgxTq83dLS5F33dqHsjtna6za9azUCbnq+jZnswg==
X-Received: by 2002:a63:7051:: with SMTP id a17mr31081068pgn.417.1634685036399; 
 Tue, 19 Oct 2021 16:10:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm4183359pjb.2.2021.10.19.16.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 16:10:35 -0700 (PDT)
Subject: Re: [PATCH v5 14/16] target/riscv: Align gprs and fprs in cpu_dump
To: Alistair Francis <alistair23@gmail.com>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
 <20211019152438.269077-15-richard.henderson@linaro.org>
 <CAKmqyKPFnJpY8ef2NohQ1ckAJN7o=DXjWQQ2KANp_P5s+507eA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b587f74-b290-f2cb-8dbf-ce0049b90a55@linaro.org>
Date: Tue, 19 Oct 2021 16:10:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPFnJpY8ef2NohQ1ckAJN7o=DXjWQQ2KANp_P5s+507eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 liuzhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 3:10 PM, Alistair Francis wrote:
> On Wed, Oct 20, 2021 at 2:18 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Allocate 8 columns per register name.
>>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> This probably isn't required though as there is already a similar
> patch in my tree:
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Ah yes.  Just drop my version, I think.  I can rebase on your branch too, since I see a 
conflict with that patch.


r~

