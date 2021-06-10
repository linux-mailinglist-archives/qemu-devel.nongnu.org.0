Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CFC3A32A5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 20:02:10 +0200 (CEST)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrP0L-0003wz-0U
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 14:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrOyh-0002yL-Nb
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:00:27 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrOyd-0001FE-E0
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:00:27 -0400
Received: by mail-pg1-x532.google.com with SMTP id n12so360358pgs.13
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5RH9vdKFNFu7YPjTmEk2mHnjMgzfjMPrL+cEFwR/2uQ=;
 b=vgG7evhQW4cRB26cIA68fG2Cdmwh94qK/dEokXmqZgFdPXmY3yABXSdgDTp56D366C
 ft4n5RcymLBOQ5FZHCjsp/lNDYNmyx8GRzuR5hsBJaQZGwiixko/Skab5TKXORzJjMAN
 oPBgcGx27g7B2ltWaPGXuHfx4lw8h1grQ5NADENSquDnN+ax8zSngShcjTSJV1AAj8CV
 IEy3Q64h2O2EAMSBhXGTM7NXiwXO+sKR7ubMPG0y3ASx5blKSM453FDWtX93BOKEjDN5
 /1b2NDm8dFL2vjDeHQvGv8iwWEbzaBKqIjav6Npn9MlVyLxKUKyunkX2QfuQ5Oko4eIF
 y5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5RH9vdKFNFu7YPjTmEk2mHnjMgzfjMPrL+cEFwR/2uQ=;
 b=f9LgfPQJ4cknTVnbuCoL89M9zdfH9Wa9aVjjW+JCpuCFk4rSSYdzob4ml3gj/5WhQm
 0uVWcVrjYxAUoRu6J2fRXvJnaD/IfDeVLadwW9hKlHNh0XuszW7hv0MtiA4a6qSzQijP
 EyTObHnEDrJw/frkfw5qzrwzEKY2HWe/8cY/e74KRoLZDJu10MHrMH+OmVb5sU+29z06
 ZTYbjaux9/9xreeqgeFFjqFwQdul2byVA+Fgnb13i8E2GRn5hRKqIQGdatEvNUOlT2Sb
 jlyLke2tZq4WX6F5RrbkQr/wZOogvAgew3WYxPNMKp/iXJBC06lME4qMKBXcqL8Nb9BR
 iQYA==
X-Gm-Message-State: AOAM532QfrOOOIb2lTJMmPRhtaH7TojE0a9aI2wleaSiuT5vOKWS7rG7
 YDNTJgYqBckkQQT2G0LS+UoPew==
X-Google-Smtp-Source: ABdhPJyCnh6fuJ3j5ev8WOPOJ8KUT1pE9Y7se6j3if5x9/46T79XbXIcEp9Jx7s7yCT73XhXxzomSA==
X-Received: by 2002:a63:4e41:: with SMTP id o1mr5966754pgl.313.1623348021260; 
 Thu, 10 Jun 2021 11:00:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m1sm2759046pfc.63.2021.06.10.11.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 11:00:20 -0700 (PDT)
Subject: Re: [PATCH v2 03/37] target/riscv: 16-bit Addition & Subtraction
 Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
 <20210610075908.3305506-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <954a39cb-31e6-1714-a09b-74d00b7e76d0@linaro.org>
Date: Thu, 10 Jun 2021 11:00:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610075908.3305506-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 12:58 AM, LIU Zhiwei wrote:
> Include 5 groups: Wrap-around (dropping overflow), Signed Halving,
> Unsigned Halving, Signed Saturation, and Unsigned Saturation.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   include/tcg/tcg-op-gvec.h               |  10 +
>   target/riscv/helper.h                   |  30 ++
>   target/riscv/insn32.decode              |  32 +++
>   target/riscv/insn_trans/trans_rvp.c.inc | 117 ++++++++
>   target/riscv/meson.build                |   1 +
>   target/riscv/packed_helper.c            | 354 ++++++++++++++++++++++++
>   target/riscv/translate.c                |   1 +
>   tcg/tcg-op-gvec.c                       |  28 ++

The tcg part needs to be split out, and I'm happy to give a

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

on that.


r~

