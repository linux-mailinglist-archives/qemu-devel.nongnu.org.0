Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF13F4EF4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:04:24 +0200 (CEST)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDMw-0005Tl-Lc
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDKt-0003gj-Ff
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:02:13 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDKq-0002o5-TI
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:02:11 -0400
Received: by mail-pf1-x42b.google.com with SMTP id x16so15915971pfh.2
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sxjl9wB6CRVDC0MS6sBIiW5knqNmX1EzPNoaE5QbiH8=;
 b=x+DMn8FowlvXHmjY1O+Mr4yBhyrjYTdq2/iO2P0ZPbSSrfSqavMbGFZZj6NQy7hhfT
 ea2HcvTPk6E0SCenDpmscB1VLTA+00LIeGMG68RECDYy8sKt8N+rjVBAfIBm7KQVQ/FT
 cUKu5uKqO7sIiFZuYn8Yqb7KGJyh5nvOHYERb1ygDfAprp+kYZgyS/8x5idwrOKaxyMx
 QthEzkxlmEbOmTED50zbP9UBjefuwVf+glf4Cd1kphBU4KR5w8WE0uslmRiP3FFIRhhm
 o5FAuHeUlRZwxG5ny4n9KrcBZmaPhubItkDLXkOltiU/o9DpPxDrMIz5VEAxMug0wYBg
 YCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sxjl9wB6CRVDC0MS6sBIiW5knqNmX1EzPNoaE5QbiH8=;
 b=RbGVXvi+pZwViPaj7LAO7VhJ08HIPiQkDsY6qMRh7IFYDEU6SDN82JpNZeLfIb7QkW
 /qKWhKBq+GgCBWAZMbvxlGnl1F6AGpkEYEEgSMf1P9LnNDNqzes/nWl8wqiGS4xA32A6
 MIcdG8okdD+g4+0BT0FTg3nLOt53orOQCYtztYlVUcpzPXBMfxidm9sO8RkbU+sI0jN/
 mZSOZbWvajym4eIpc9LtQ67ke6Tw4sklVwKa9/DGIqd623mxTmGpmo3xibN7JsCcHoyO
 di8eLMqEs5X/VJiAEGiDAMgJegZlI/ZwL2Dp4jmx7nLk7k7zej+VcA9Sz/rgb015UOjw
 ypgA==
X-Gm-Message-State: AOAM531J1O2RIoYFNygmmvaF0cetkGP4m3PbeWZruNzrqtzqvHlIm+5x
 KFaAbNtr1gQtK0WKZdS8kdFBvGfY85HEUQ==
X-Google-Smtp-Source: ABdhPJzqvrWm+UburS6QmvFuJZyPQYEB1bGO8h9ju0+zyk5uZakJAXUUENkdu0leTzgnnJlp3y00ow==
X-Received: by 2002:a62:ed06:0:b029:32c:a800:ba47 with SMTP id
 u6-20020a62ed060000b029032ca800ba47mr34121055pfh.56.1629738127110; 
 Mon, 23 Aug 2021 10:02:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm18109611pgs.94.2021.08.23.10.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:02:06 -0700 (PDT)
Subject: Re: [PATCH v3 03/15] target/riscv: slli.uw is only a valid encoding
 if shamt first in 64 bits
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-4-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf1bbc29-6e93-9226-5091-9d119ece12bd@linaro.org>
Date: Mon, 23 Aug 2021 10:02:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-4-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> For RV64, the shamt field in slli.uw is 6 bits wide. While the encoding
> space currently reserves a wider shamt-field (for use is a future RV128
> ISA), setting the additional bit to 1 will not map to slli.uw for RV64
> and needs to be treated as an illegal instruction.
> 
> Note that this encoding being reserved for a future RV128 does not imply
> that no other instructions for RV64-only could be added in this encoding
> space in the future.
> 
> As the implementation is separate from the gen_shifti helpers, we keep
> it that way and add the check for the shamt-width here.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - Instead of defining a new decoding format, we treat slli.uw as if it
>    had a 7bit-wide field for shamt (the 7th bit is reserved for RV128)
>    and check for validity of the encoding in C code.
> 
>   target/riscv/insn_trans/trans_rvb.c.inc | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This would be handled by gen_shift_imm_fn if rebased upon
https://patchew.org/QEMU/20210820174257.548286-1-richard.henderson@linaro.org/


r~

