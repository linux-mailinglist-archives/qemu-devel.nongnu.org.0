Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03212FF4F1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:45:13 +0100 (CET)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ftI-00082n-AE
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fqa-00062j-Uz
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:42:24 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fqX-0003uV-IC
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:42:23 -0500
Received: by mail-pg1-x52a.google.com with SMTP id n7so2046135pgg.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eoNu+9m4hceDv/2W7c6hKIDWo1agg/U94hcnQhbeUiY=;
 b=ylOeElOgcxC9kPCgT3KS/jiumWkl3mYhL5iz0AUchgJtJQKJJ7rwpYkuRE2f/JiL4c
 k0Jfedn3Qu+eLIINporG5kgqpxOunBxHDcdj0NZfoBf25UA/OUObB5KeyBlpk19l/HGY
 VkKeXEbL9961Xd7EZNoicQFxhQ4pGoo4tVAgEb2eXS2vR+AxqtR5W6YqsSxDvonlKoWN
 s0lVXPocKE43tsBKyOao62OnZ+0xjHHFIZw9O0BRTBIIr6I0OM3yGV110Fqg2f5Jco2h
 z/+6roBLjkEtasXhkO+4miWw5DSTLBsAKhlz9+ZuxkHyWbxlMUwaLuU7jnq/PAWKm6Gg
 YcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eoNu+9m4hceDv/2W7c6hKIDWo1agg/U94hcnQhbeUiY=;
 b=dfTFD7HvzSjHG5P0wto2uT2OyFA8xXv12D3/6rlGeX9+vCeLDm3X/WpEcdpBq6Wi49
 ms7YuTG5DGEonzcUeXE5cbCwPMcHxeW822Q/LjW+tOe3HDO+bK+8A5BLqxHRKd4gt185
 /9NNYmewNcbjEVQrxZDSqTDSNDNpLnVDxLQuAQ+pNQWNSKhlNL/R/qo9a7QqisG+/eAX
 GcrIDVKB6pRMfPdhKsEXimDRc+lpR084ctHDq2hUA+SLrQ1IeOpR01p/k1+YaxbPevRE
 1cVk0apldwJ9dZxqmZiHDoUx1K9KnQSReqgGDuGQSoSgdHwhIFnk/wmN4y9fsQaJHgev
 U+Og==
X-Gm-Message-State: AOAM531L0Ad4VtG3rLZE6Gm6NA9puy4CfjDrt8JsBkFClpo2fcKuP03N
 51RazNbUMnVlZ5k5B8zE7Lr7Dw==
X-Google-Smtp-Source: ABdhPJxfLy3NXQxIyYVAOhWv/mda19i0eDQU19/GIpZXuk5MP7Vr+5A2WoFagvrRDiD1H8i9dh6atw==
X-Received: by 2002:a63:520d:: with SMTP id g13mr834512pgb.289.1611258139835; 
 Thu, 21 Jan 2021 11:42:19 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id fv12sm5831479pjb.22.2021.01.21.11.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:42:19 -0800 (PST)
Subject: Re: [PATCH v7 4/6] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Alexey Baturo <baturo.alexey@gmail.com>
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <20210110185109.29841-5-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58c2088b-10f4-2f39-bc6f-50457ed45788@linaro.org>
Date: Thu, 21 Jan 2021 09:42:14 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210110185109.29841-5-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GAPPY_SUBJECT=0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 space.monkey.delivers@gmail.com, Alistair.Francis@wdc.com,
 kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/21 8:51 AM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/insn_trans/trans_rva.c.inc |  3 +++
>  target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
>  target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
>  target/riscv/translate.c                | 14 ++++++++++++++
>  5 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



> +static void gen_pm_adjust_address(DisasContext *s,
> +                                  TCGv_i64      dst,
> +                                  TCGv_i64      src)

Don't bother aligning variables like this.  That just leads to additional
changes when code is adjusted later.


r~

