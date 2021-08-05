Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AFF3E1C2D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:09:41 +0200 (CEST)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBikO-0001PK-Jr
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBiiu-0007iB-Tc
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:08:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBiis-0008RO-F6
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:08:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so17248619pjr.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZDpMu0HbwrtF8zmXy6Y4p3TQKqn4SSliL/uCmHtbVP0=;
 b=hB+VecwMPUjJ6UtSCKkgZV0NgsMFkVzwoFfJNbZFPJ+YGkR8+sUXtsUdYbU++kzN3x
 h6TCD5DlIYJjpcd7v9kFZ8PVQ48hGdzCb5WXMbgkdJFOspaKHHunFB6oBEYfR+P+DWwa
 dnVFD6Lqz22tmvjQKNiIlziJrXi43SsXJyS/5VcDZOmHu/RfQiLWNvVpDvFGPDnK+EVg
 AYrMYe/sCxbTT6d9SaqRr8ZcX+637jfHHzK/f8O45tDctLVC7nSzdXZzIRW4hDSwLtRE
 jYiS56NSpzB5TEhCWxG5r4twZGJ9D0NNENNXgGo8GL7sV4sFuOcVZQB5p0XiJf9d7fo0
 uV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZDpMu0HbwrtF8zmXy6Y4p3TQKqn4SSliL/uCmHtbVP0=;
 b=dajE0vPgxmD9RHmemQt9/673x/OKi1YkCWkF9Wu0G1LxnhzXESXAF324TSD7aHUHjw
 gSJMINdhfirOTMqICYIxqit+Lw83VsE/FIrq234UALJ2D3XTPM83zOJxzS2geMbGgtOr
 oEp9R7e8C656FN+uTqVJWc6AF2RkBCKisIW9eIx6LC7ngNWMgjOK7rJsRJQ6NCbayM/l
 XjGvUYBSC7xt9UPldRYmLUeyhCQLEzxbqmhc/jDVa7vr/9KC13CH11MBGMOcKqwMK5C3
 ArOTGldLID/K6/szRzGIf/o7qVNZj47yop0H4Na+QsFg3HyX/Ws/HLgDBEdURbvz3W3N
 bdVw==
X-Gm-Message-State: AOAM531XSdhc4JTOyOeHEOTVLDvfZNhX4+R/Np8NKLLtLujau0e0BB0Y
 ovcFdHOR215eEK5TOdSTmlETIw==
X-Google-Smtp-Source: ABdhPJxXPELLcJ4sQik9tzwdXb6nOHdHiv9f8RFKXOHZIyYxGenCYk9PqDbXKXmrjGCNYirMyjTTqw==
X-Received: by 2002:a63:88c7:: with SMTP id l190mr1767236pgd.438.1628190485013; 
 Thu, 05 Aug 2021 12:08:05 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id d15sm7751008pfo.147.2021.08.05.12.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:08:04 -0700 (PDT)
Subject: Re: [RFC PATCH 03/13] target/riscv: Support UXL32 on 64-bit cpu for
 load/store
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f456a97-89b5-3a62-f9c8-7719bda9d2cc@linaro.org>
Date: Thu, 5 Aug 2021 09:08:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805025312.15720-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
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

On 8/4/21 4:53 PM, LIU Zhiwei wrote:
> Get the LSB 32 bits and zero-extend as the base address.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index ea41d1de2d..6823a6b3e0 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -163,7 +163,7 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
>   static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>   {
>       TCGv dest = gpr_dst(ctx, a->rd);
> -    TCGv addr = gpr_src(ctx, a->rs1);
> +    TCGv addr = gpr_src_u(ctx, a->rs1);
>       TCGv temp = NULL;
>   
>       if (a->imm) {
> @@ -207,7 +207,7 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
>   
>   static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>   {
> -    TCGv addr = gpr_src(ctx, a->rs1);
> +    TCGv addr = gpr_src_u(ctx, a->rs1);
>       TCGv data = gpr_src(ctx, a->rs2);
>       TCGv temp = NULL;

This is incorrect.  The zero-extension should happen after the addition of the immediate 
offset.

r~

