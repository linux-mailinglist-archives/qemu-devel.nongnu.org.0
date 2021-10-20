Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC75D4355D3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:19:30 +0200 (CEST)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdJvl-0000OK-EZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJuV-0007JI-Ug
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:18:12 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJuQ-00036l-If
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:18:11 -0400
Received: by mail-pf1-x42c.google.com with SMTP id o133so4143931pfg.7
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 15:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fXNThvzPrYnFVK6/6dbhEPnNz2qGdT7dOzCzZllsqjk=;
 b=SO2n+4GWr25eLmzOusy+QyKRABMFJHoRg1kr8ALvzBVnR60XKxMdN9fKDVPFcGK9P1
 HKSHvVuV/qXku3t6RR0DxNx1vBQXlDPR57NHisl1l3yq0xv5Wj0gp5tVhMw26SrjqMA1
 oFuO6otMwfrB4fdyBeMIVxrnEIiETtPtSv9SqBlq9ghqC1sFoURRPKH4nbnqlDOHe00C
 RDBvQRlpQ2jNPJZlNGEXpyaRNBVxCuoep/myOCRXn72/JYG+uOwLoJW1X+M/r4v/meoj
 ySVS3hG/BP8QMkWs7o17dgKAy9jQt9p4hy8oRAP6awkSszNQ66zkUD9JUJci4tlz51MA
 gdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fXNThvzPrYnFVK6/6dbhEPnNz2qGdT7dOzCzZllsqjk=;
 b=ODW1CDPdNtIsYusrgXTS76F4/exPGJe86C7RCSXZdRHkmImpHeYzmlOF8Zg6VwRRWO
 hGoe6FcYOPRnlt8ygTT/nF6ugPrHzSr8E08FnfQxwVMkVFey64PILtVO2mWnO5QM05FL
 El2yfx7F25a0lsJf9rdBWmD2khQag6yHU1e6FmeeAcUmFqnuqAtMeW2/XCVfrFeWxWZo
 VfTmV7jgs+cQDSsL9+TRSDR/C8wcyM1LxywCU0HpyB5CgYoDsXZl218v4ug9rNY51dbd
 hQYNXHRlBpr8Pmz1p7tiDixYFOxlxTS+/n2V9HBGr4LfiHEjphBHre0OpKkmy2su+tse
 foOA==
X-Gm-Message-State: AOAM530L9b0jzy+PfH1XwWCqEZSpjCIHebrwhvFM/1J/Vj/l7GWrXsPa
 1lDbwG0s9sKGRjz1joFjsbchrA==
X-Google-Smtp-Source: ABdhPJxbFJ8YQDKP8Gwwk/+eY44VX5sPTEvQTfJd137V0Rk50NkcTrIMq4LXX3C7jVFV1gDf7yY8Yg==
X-Received: by 2002:a05:6a00:1950:b0:44d:9402:3396 with SMTP id
 s16-20020a056a00195000b0044d94023396mr1950361pfk.70.1634768284897; 
 Wed, 20 Oct 2021 15:18:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id lw14sm3672756pjb.34.2021.10.20.15.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 15:18:03 -0700 (PDT)
Subject: Re: [PATCH v3 19/21] target/riscv: actual functions to realize crs
 128-bit insns
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-20-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a067717a-756b-661e-106f-8dd2084765f8@linaro.org>
Date: Wed, 20 Oct 2021 15:18:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-20-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> The csrs are accessed through function pointers: we set-up the table
> for the 128-bit accesses, make the stub a function that does what it
> should, and implement basic accesses on read-only csrs.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/cpu.h |  16 +++++
>   target/riscv/csr.c | 152 ++++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 165 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index eb4f63fcbf..253e87cd92 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -474,6 +474,15 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
>                                   Int128 *ret_value,
>                                   Int128 new_value, Int128 write_mask);
>   
> +typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, int csrno,
> +                                               Int128 *ret_value);
> +typedef RISCVException (*riscv_csr_write128_fn)(CPURISCVState *env, int csrno,
> +                                             Int128 new_value);
> +typedef RISCVException (*riscv_csr_op128_fn)(CPURISCVState *env, int csrno,
> +                                             Int128 *ret_value,
> +                                             Int128 new_value,
> +                                             Int128 write_mask);

Do we really want all 3, or just the single rmw function?
Although I guess it's clearest to match the existing code...

> +
>   typedef struct {
>       const char *name;
>       riscv_csr_predicate_fn predicate;
> @@ -482,6 +491,12 @@ typedef struct {
>       riscv_csr_op_fn op;
>   } riscv_csr_operations;
>   
> +typedef struct {
> +    riscv_csr_read128_fn read128;
> +    riscv_csr_write128_fn write128;
> +    riscv_csr_op128_fn op128;
> +} riscv_csr_operations128;

Eh.  I think better to extend the one riscv_csr_operations structure.

> +static inline RISCVException riscv_csrrw_check_i128(CPURISCVState *env,
> +                                                    int csrno,
> +                                                    Int128 write_mask,
> +                                                    RISCVCPU *cpu)

Change "Int128 write_mask" to "bool write" and you can share this entire function with 
riscv_csrrw.

Indeed, you could split them like so:

riscv_csrrw(...)
{
     ret = csrrw_check(...);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
     return csrrw_do64(...);
}

riscv_csrrw_128(...)
{
     ret = csrrw_check(...);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
     if (csr128) {
         return csrrw_do128(...);
     }
     ret = csrrw_do64(..., old64, ...);
     if (ret == RISCV_EXCP_NONE) {
         *old_val = int128_make64(old64);
     }
     return ret;
}

> +    RISCVException ret = csr_ops[csrno].predicate(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    return RISCV_EXCP_NONE;

BTW, just

     return csr_ops[csrno].predicate(env, csrno);


r~

